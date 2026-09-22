---
name: fresh-start
description: Condense a long or messy chat into one copyable prompt block for a clean restart in a fresh chat — carrying only the net state, without dead ends or outdated back-and-forth.
disable-model-invocation: true
---

# fresh-start

Summarize the chat into a single copyable prompt that starts a fresh, unburdened chat, free from potential context pollution. The new chat should get just enough to continue — without dragging along dead ends, superseded intermediate states, or the back-and-forth.

This is not a full transcript — only what a new chat _needs to keep going_.

## Core principle: filter, don't just compress

The value is in **leaving out what's wrong**, not in shortening.

- **Only the net state counts.** If something was later corrected or dropped, include only the current version — not the path to it.
- **Keep hard-won context.** Research findings, tool outputs, and facts gathered along the way that the new chat would otherwise have to rediscover — carry them into "Settled so far" so the restart doesn't repeat the work.
- **Proposal ≠ decision.** Record a decision when the user made or agreed to it — brief agreement still counts; the guard is against promoting your own proposals the user never engaged with to settled decisions. Include a fact once it's evidenced in the chat (user statement, tool output, research). When unsure, mark it open rather than stating it as settled.
- **Process noise and inventions out.** No meta-discussion, no wording ping-pong; add nothing that didn't appear in the chat. If there's no clear next step, say so plainly instead of inventing one.

## Flow

1. **Pick the active topic.** With several threads, base the block on the one running most recently; mention other relevant threads in one sentence rather than dropping or silently carrying them.
2. **Filter by the core principle.**
3. **Output the block**, exactly in this format:

   ```markdown
   ## Context

   [1–3 sentences: what this is about, the overarching goal]

   ## Settled so far

   - [decision, established fact, or research finding]
   - [decision, established fact, or research finding]

   ## Next step

   [Concrete instruction — what the new chat should do first]
   ```

   In the same language as the chat, as a single markdown code block (copyable in one click), with no meta-comments — it should read as if the user wrote it themselves as the first prompt.

4. **Outside the block:** if something couldn't be cleanly classified as fact vs. proposal, or a thread was deliberately left out, name it in one sentence.
