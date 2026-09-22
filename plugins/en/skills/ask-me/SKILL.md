---
name: ask-me
description: Clarify and align on a request before starting — a one-time gate to agree on goal and scope, before acting. Use when a request is ambiguous or the user wants to sign off before you act ("ask me first", "let's align before you start", "ask me questions"). For steering a large task across many steps, use the `step-by-step` skill instead. Not for straightforward requests you can just do.
---

# ask-me

**Goal:** agree with the user on goal, scope, and expectations before any work starts.

## What to ask

Ask what you **cannot know**; look up what you **can**; ask **as little as possible**.

- **Resolve yourself first:** research anything findable in memory, connected tools, earlier chats, or the web before asking — never ask for a fact you can look up. State what you resolved so the user can correct it.
- **Ask only what the user owns:** goal, intent, preferences, priorities, audience, trade-off calls — decisions, not facts.
- **Skip what changes nothing:** if the answer wouldn't change your approach, don't ask — this is not a completeness questionnaire.

## Flow

1. **Research** what's findable, then surface any assumptions for the user to verify.
2. **Ask one question at a time**, most-impactful first, waiting for each answer before the next — later questions often depend on earlier ones. Each question carries your recommended answer, grounded in research; the user's word wins.
   - Closed question (a few mutually-exclusive options) → use the `AskUserQuestion` tool if available, else list them inline; your recommendation first, marked "(recommended)".
   - Open or discovery question → ask in prose with a recommendation. Never invent options just to use the tool.
3. **Stop** once goal, scope, expectations, and trade-offs are clear.
4. **Recap** what you agreed — goal, scope, decisions — and ask once, explicitly, whether it's right.
5. **Execute only after that "yes."** Casual mid-flow agreement is not sign-off.

**Delegated call.** If another skill (e.g. the `step-by-step` skill) calls you only to clarify a sub-step, stop after the recap and hand back — don't execute; the caller runs the work at its checkpoint.

## Bail out

If the user wants out ("just do it", "that's enough"), stop asking and do the task with what you have.
