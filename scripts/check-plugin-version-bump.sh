#!/usr/bin/env sh
# Enforce the repo's single-version rule.
#
# This repo ships ONE version number, shared by every version-bearing file:
#   package.json                          (canonical — what the GitHub release tags)
#   plugins/<name>/.claude-plugin/plugin.json
#   plugins/<name>/.codex-plugin/plugin.json
#
# Two rules:
#   1. All of those files always carry the identical version.
#   2. If any published plugin surface changed (a plugin's skills/ or either of
#      its manifests), that shared version must be bumped.
#
# Why lockstep rather than per-plugin versions: the language editions are
# required to stay content-identical (see CLAUDE.md), so they bump together in
# practice anyway. One number keeps the manifests, the git tags and the GitHub
# release in agreement. The cost is that a German-only fix also ships a no-op
# English update.
#
# Release tags stay per-plugin, in the format Claude Code's tooling expects:
#   claude plugin tag ./plugins/en --push   ->  leonclaus-skills--v<version>
#   claude plugin tag ./plugins/de --push   ->  leonclaus-skills-de--v<version>
#
# Docs/CI/tooling (README, CLAUDE.md, .github, scripts, config) and the
# marketplace listing do NOT require a bump — they don't change what an
# installed plugin runs.
#
# Usage:
#   check-plugin-version-bump.sh              # local (pre-commit): staged vs merge-base with default branch (HEAD fallback)
#   check-plugin-version-bump.sh <base-ref>   # CI: <base>...HEAD, emits GitHub annotations

set -eu

if ! command -v jq >/dev/null 2>&1; then
  echo "ERROR: jq is required but not installed. Install it (e.g. 'brew install jq') and retry." >&2
  exit 1
fi

CANONICAL="package.json"

base="${1:-}"
fail=0

# Resolve the local comparison baseline once (invariant, like the CI check):
# compare against the version at the merge-base with the default branch so a bump
# made earlier on the branch already satisfies later commits. Fall back to HEAD
# when the base can't be resolved (e.g. no remote yet), keeping the strict check
# rather than failing open.
if [ -z "$base" ]; then
  default_ref=$(git symbolic-ref --quiet --short refs/remotes/origin/HEAD 2>/dev/null || echo "origin/main")
  base_commit=$(git merge-base HEAD "$default_ref" 2>/dev/null || echo "")
  [ -n "$base_commit" ] || base_commit="HEAD"
fi

# Report an error in the format the caller understands (CI annotation vs. plain).
report() {
  if [ -n "$base" ]; then
    echo "::error file=$1::$2"
  else
    echo "ERROR: $2"
  fi
  fail=1
}

# Read a file's .version as of the comparison baseline ("" if absent).
version_at_base() {
  if [ -n "$base" ]; then
    git show "$base:$1" 2>/dev/null | jq -r '.version // empty' || echo ""
  else
    git show "$base_commit:$1" 2>/dev/null | jq -r '.version // empty' || echo ""
  fi
}

# Read a file's .version as it will be committed ("" if absent).
version_now() {
  if [ -n "$base" ]; then
    jq -r '.version // empty' "$1"
  else
    git show ":$1" 2>/dev/null | jq -r '.version // empty' || echo ""
  fi
}

canonical_old=$(version_at_base "$CANONICAL")
canonical_new=$(version_now "$CANONICAL")

if [ -z "$canonical_new" ]; then
  echo "ERROR: no \"version\" found in $CANONICAL."
  exit 1
fi

# --- Rule 1: every version-bearing file agrees with the canonical version -----

manifests=""
found_plugin=0

for plugin_dir in plugins/*/; do
  plugin_dir=${plugin_dir%/}
  claude_manifest="$plugin_dir/.claude-plugin/plugin.json"
  codex_manifest="$plugin_dir/.codex-plugin/plugin.json"

  # Skip stray directories that aren't plugins at all.
  [ -f "$claude_manifest" ] || continue
  found_plugin=1

  if [ ! -f "$codex_manifest" ]; then
    report "$claude_manifest" "$plugin_dir has $claude_manifest but no $codex_manifest. Every plugin ships both platform manifests."
    continue
  fi

  manifests="$manifests $claude_manifest $codex_manifest"
done

if [ "$found_plugin" -eq 0 ]; then
  echo "ERROR: no plugins found under plugins/. Expected at least one <plugin>/.claude-plugin/plugin.json."
  exit 1
fi

for manifest in $manifests; do
  manifest_version=$(version_now "$manifest")
  if [ "$manifest_version" != "$canonical_new" ]; then
    report "$manifest" "Version mismatch: $manifest is '$manifest_version' but $CANONICAL is '$canonical_new'. This repo ships one version everywhere — bump them together."
  fi
done

# --- Rule 2: a changed plugin surface requires a bump ------------------------

watch=""
for plugin_dir in plugins/*/; do
  plugin_dir=${plugin_dir%/}
  [ -f "$plugin_dir/.claude-plugin/plugin.json" ] || continue
  watch="$watch $plugin_dir/skills"
done
watch="$watch $manifests"

if [ -n "$base" ]; then
  changed=$(git diff --name-only "$base...HEAD" -- $watch)
else
  changed=$(git diff --cached --name-only -- $watch)
fi

if [ -n "$changed" ]; then
  if [ "$canonical_old" = "$canonical_new" ]; then
    if [ -n "$base" ]; then
      report "$CANONICAL" "Plugin surface changed but version is still '$canonical_new'. Bump \"version\" in $CANONICAL and every plugin manifest so installed plugins pull the update."
    else
      report "$CANONICAL" "Plugin surface has staged changes but version is still '$canonical_new'. Bump \"version\" in $CANONICAL and every plugin manifest before committing."
    fi
  elif [ "$fail" -eq 0 ]; then
    echo "OK: version ${canonical_old:-none} -> $canonical_new across $CANONICAL and every plugin manifest."
  fi
elif [ "$fail" -eq 0 ]; then
  echo "OK: no changes to a published plugin surface; no version bump required."
fi

exit $fail
