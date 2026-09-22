# Leon Claus Skills

> Most disappointing AI output isn't a model failure — it's an unstated assumption.

You hold one assumption, the model holds another, or nobody has formed one yet.
Fire the whole task off in a single prompt and the gap stays hidden until the
output disappoints — at which point people conclude the AI isn't good, and stop
using it.

Three skills close the gap instead: ask before assuming, break big work into
visible steps, and start clean when the context is spent. They run natively in
**Claude** and **ChatGPT**.

## The skills

Two plugins ship the same three skills, one per language. Install **one** of
them — the English edition or the German one.

| English         | Deutsch                 | How it fires  | What it does                                         |
| --------------- | ----------------------- | ------------- | ---------------------------------------------------- |
| `/ask-me`       | `/frag-nach`            | ⚡ Automatic  | Agrees on goal and scope before any work starts      |
| `/step-by-step` | `/schritt-fuer-schritt` | ⚡ Automatic  | Breaks big work into visible, reviewed steps         |
| `/fresh-start`  | `/von-vorne`            | 🖐 On request | Condenses a spent chat into one clean restart prompt |

⚡ means you don't have to type the command. Plenty of people do — it's the
fastest way to reach for one deliberately — but the skill also fires on an
ordinary request that is vague or large. So you and your team get the benefit
without anyone having to learn a syntax first.

## Why these exist

Most complaints about AI output are really complaints about _(mis)alignment_.

**The assumption gap.** A request carries assumptions nobody said out loud —
sometimes the user's, sometimes the model's, and often ones the user hasn't
worked out yet and has no answer to either.

> Help me create the briefing for a slide deck for a BFCM marketing campaign

Reasonable prompt. It also leaves every load-bearing decision unstated: who the
briefing is _for_ (an agency, a designer, leadership sign-off), whether the offer
and discount structure are already settled or part of what's being briefed, which
channels are in scope, which products and segments, what last year's numbers
were, and whether there's a campaign framework to follow. The model will quietly
answer most of that and return a plausible, generic briefing that fits nobody's
actual situation. The count is the part people underestimate: a request this
ordinary hides more decisions than it looks like it does, and some of them the
user has never considered. You can't put an answer in a better prompt when you
don't yet know there was a question.

`ask-me` turns that into a short exchange up front: research whatever is
findable, then ask only what the user actually owns — goals, priorities,
trade-offs.

**Big work dumped in whole.** People hand over a project and expect it finished
in two messages.

> Create slides for a BFCM marketing campaign

Between that sentence and a deck worth presenting sit a dozen steps: pin down
the audience and what the deck has to achieve, settle the offer and the channel
mix, pull last year's results as a baseline, agree the narrative arc, outline it
slide by slide, write each slide, then review and lay it out. Skipping straight
to finished slides doesn't remove that work — it just hides it, and it resurfaces
as rework once someone reads the deck properly.

This approach usually also leads to heavy _context poisoning_. Run a large task
without giving the option to review at each step, and each wrong turn stays in
the thread, quietly shaping everything that comes after it — so a
misunderstanding in step two is still steering the output at step nine.

`step-by-step` works on all three. It decomposes the task and keeps the plan on
screen, so the process is something you can see rather than something you hope
went well. It reviews where a wrong result would be expensive to unwind, so a
mistake gets caught while it is still one step. And where a step hinges on a
decision only you can make, it asks before proceeding instead of assuming — the
same misalignment `ask-me` heads off at the start, handled again at every stage
that needs it.

**Spent context.** Long chats accumulate dead ends, corrections and superseded
decisions, and the model keeps reading all of it. `fresh-start` filters a
conversation down to its net state — what was decided, what was learned — as one
prompt you can paste into a clean chat.

None of the three requires a well-engineered prompt. That's the point: you type
a normal request, and the skill works out what it still needs by asking, rather
than expecting you to have anticipated everything in advance.

## Built for rollout

These skills were built privately and have since been adopted into production
at multiple companies, shipped as internal plugins and iterated across
releases.

That shaped them more than any design goal:

- **No training.** People type what they were going to type anyway. There is no
  syntax to teach and no prompt patterns to memorize.
- **Automatic where it counts.** The two skills that prevent a bad outcome fire
  on their own; the one that discards context waits to be asked.
- **Install once.** One plugin, deployed centrally, available to everyone — not
  a document of best practices that people are asked to remember.
- **Language-native.** German speakers get German trigger phrases and German
  commands, not an English skill with translated docs.

## Install

### Claude

Settings → **Plugins** → **Add** → **Add marketplace** → **Add from repository**,
then paste the repository URL:

```text
https://github.com/leonclaus/chat-skills
```

Then enable **one** of the two plugins: `leonclaus-skills` for the English
edition, `leonclaus-skills-de` for the German one.

Installing from the repository keeps the link to it, so improvements reach you
automatically.

In Claude Code, the same thing from the CLI:

```text
/plugin marketplace add leonclaus/chat-skills
/plugin install leonclaus-skills@leonclaus
```

### ChatGPT and other agents

A skill is just a `SKILL.md` folder in the open Agent Skills format, so it is
portable. Download a skill folder from `plugins/en/skills/` (or
`plugins/de/skills/`) and add it in your assistant's UI.

## Compatibility

Built on the open [Agent Skills](https://code.claude.com/docs/en/skills)
standard. A skill is just a `SKILL.md` folder, so it runs natively in Claude and
ChatGPT and is portable to other agent tools that adopt the standard.

## About

Built by Leon Claus, who works on making AI genuinely usable inside
organizations — the gap between "we have access to a model" and "people actually
get value from it."

[leonclaus.com](https://leonclaus.com)

`ask-me` is inspired by Matt Pocock's
[`/grill-me`](https://www.aihero.dev/skills-grill-me) skill.

## License

MIT — see [LICENSE](./LICENSE).
