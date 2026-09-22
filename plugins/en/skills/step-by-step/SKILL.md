---
name: step-by-step
description: Break a large, multi-stage task into subtasks and work through them incrementally, aligning and reviewing with the user at the points that matter. Use for big or unclear multi-step work, or when a large deliverable is requested in one prompt that's better done in stages. For a one-time clarification before a single task, use the `ask-me` skill.
---

# step-by-step

**Goal:** turn a big, multi-stage task the user might otherwise cram into one prompt into decomposed subtasks — aligned and reviewed at the points that matter — so they keep oversight and control.

## Flow

### 1. Break into subtasks

Split the task **briefly** into subtasks — from gathering info through open decisions to production — and regularly interleave **review/check steps** where a wrong result would be costly to unwind and to avoid misalignment in a long process. Keep mental load from reviewing in mind. One checkbox per step; no per-step write-up, no approval needed for the breakdown itself:

```text
⬜ 1. …
⬜ 2. … (review with the user)
⬜ 3. …
```

Carry this list in **every** reply, marking progress: ✅ done, 👉 current, ⬜ open. Adjust it when questions or new info reshape the work (add, drop, reorder) — and always tell the user what changed and why.

### 2. Work step by step

One step at a time:

- **Gather info & decide.** Research what you can yourself (memory, tools, past chats, web etc.) and tell the user about your findings. State assumptions and have them confirmed; never invent substance — mark what you can't know as an open item rather than guessing. Where a step hinges on a decision only the user can make, clarify before proceeding: ask one question at a time, each with your recommended answer, and wait for the reply (use the `ask-me` skill if available; it aligns with the user but does not execute; you carry out the step afterward).
- **Execute** once info and decisions are in place.
- **Mark progress; pause at review points.** After each step, update the list (✅ done, 👉 current) and briefly show what changed. Get the user's go-ahead at the planned review points — not after every step. Keep mental load in mind when structuring review steps: show what is necessary to avoid misalignment, omit what isn't. For large reviews, break them down.

### 3. Wrap up

Give a consolidated overview — what was done, what was gathered, what was decided.

## Bail out

If the user wants out of the loop ("just do the rest", "that's enough"), stop checkpointing and finish autonomously.
