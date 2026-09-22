# CLAUDE.md

Authoring conventions for this repository. This file guides any agent (or human)
adding to or editing the collection. It is about **how skills are built here** —
nothing else.

## What this repo is

A collection of portable [Agent Skills](https://code.claude.com/docs/en/skills)
for working deliberately with AI chat assistants. Skills are authored once and
run natively in both **Claude** and **ChatGPT** (both consume the open Agent
Skills `SKILL.md` format).

One marketplace ships **two plugins** — the same skills in two language
editions: `leonclaus-skills` (English, the default) and `leonclaus-skills-de`
(German). A user installs one, not both.

## Layout

```text
chat-skills/
├── .claude-plugin/
│   └── marketplace.json       # lists BOTH plugins; read by Claude and by Codex
├── plugins/
│   ├── en/                    # plugin "leonclaus-skills" (English, default)
│   │   ├── .claude-plugin/
│   │   │   └── plugin.json    # Claude plugin manifest
│   │   ├── .codex-plugin/
│   │   │   └── plugin.json    # Codex manifest (skills: "./skills/")
│   │   └── skills/            # SHIPPABLE only — every folder here is published
│   │       └── <skill-name>/
│   │           └── SKILL.md
│   └── de/                    # plugin "leonclaus-skills-de" (German)
│       └── …                  # same shape as en/
├── drafts/                    # work in progress — outside plugins/, ships nowhere
├── README.md
├── LICENSE                    # MIT
└── CLAUDE.md
```

## Versioning and releases

The repo ships **one version number**, shared by `package.json` (canonical) and
every plugin manifest. Bump one, bump all — even the edition that didn't change.
The language editions are required to stay content-identical anyway, so they move
together in practice; one number keeps the manifests, the git tags and the GitHub
release in agreement. `scripts/check-plugin-version-bump.sh` enforces both halves
of this (all files agree; a changed plugin surface must bump).

Release tags stay **per plugin**, in the format Claude Code's tooling expects —
it validates the manifest against the marketplace entry before tagging:

```sh
claude plugin tag ./plugins/en --push   # -> leonclaus-skills--v<version>
claude plugin tag ./plugins/de --push   # -> leonclaus-skills-de--v<version>
```

Then cut the GitHub release against those tags.

### Offering a release (agents)

Tagging and releasing is **outward-facing and hard to undo** — a pushed tag and a
published release are visible immediately.

- After a version bump is committed **and merged**, **offer** to cut the release
  and stop there.
- **Never tag, push a tag, or publish a release without explicit confirmation
  for that specific release.** Approval for one release does not carry to the
  next; ask every time.
- Don't offer before the merge — a release must point at the merged commit on
  the default branch, not at a branch head.

## Adding a skill

1. Create `plugins/<lang>/skills/<skill-name>/SKILL.md` with frontmatter
   (`name`, `description`) and a body. The folder name and frontmatter `name`
   must match.
2. Both platform manifests pick it up automatically:
   - Claude scans the plugin's `skills/` by default (no manifest edit needed).
   - Codex/ChatGPT reads the single path `skills: "./skills/"`, relative to the
     plugin root.
3. Ship the counterpart in the other language edition in the same change.
4. Bump `version` in `package.json` **and every plugin manifest** to the same
   number (see [Versioning and releases](#versioning-and-releases)).
5. Verify: `claude plugin validate ./plugins/<lang> --strict` and
   `claude plugin validate . --strict` for the marketplace.

## Hard rules

- **A plugin's `skills/` holds shippable skills only.** The Codex/ChatGPT manifest
  can point at exactly one path (`./skills/`) — it cannot cherry-pick — so anything
  unfinished must live in `drafts/`, never under `plugins/`, or it will ship.
- **The language editions stay in lockstep.** Every skill exists in both plugins,
  with identical behaviour; only the language differs. Slugs are localized
  (`ask-me` ↔ `frag-nach`), so a cross-reference inside a body must name the slug
  of **its own** edition — never point a German body at `step-by-step`.
- **No symlinks in the skill tree.** Codex drops symlinks on install; a symlinked
  skill silently disappears for ChatGPT users. Use real files and folders. This
  is why the German edition is a real copy, not a link to the English one.
- **Neutral wording inside skill bodies.** Write "the assistant" / "the model"
  (German: "das Modell", or just address it in the imperative), never "Claude" —
  the skills run in ChatGPT too. Claude-forward language belongs in the README,
  not in `SKILL.md` bodies.
- **No employer- or client-specific content.** No internal tool names, no private
  conventions, no company references. These are public, standalone skills.

## Skill-writing philosophy

Default assumption: the assistant is already smart — only add what it does not
already know. Challenge every line: "does this justify its token cost?" If not,
cut it.

- **Description = what + when, keywords first.** It is metadata for *selection*,
  loaded always. It says what the skill does and when to trigger it — never the
  internal steps or the reasoning. State the capability with a verb.
- **Body instructs, it does not lecture.** Cut background, definitions and
  justifications the model already knows. Keep a *why* only when it changes what
  the model does (a non-obvious constraint or footgun) — one clause, not a paragraph.
