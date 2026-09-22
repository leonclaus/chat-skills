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

| What it does                                         | How it fires | English         | Deutsch                 |
| ---------------------------------------------------- | ------------ | --------------- | ----------------------- |
| Agrees on goal and scope before any work starts      | ⚡ Automatic  | `/ask-me`       | `/frag-nach`            |
| Breaks big work into visible, reviewed steps         | ⚡ Automatic  | `/step-by-step` | `/schritt-fuer-schritt` |
| Condenses a spent chat into one clean restart prompt | 🖐 On request | `/fresh-start`  | `/von-vorne`            |

⚡ means you never type the command. The skill fires on an ordinary request —
a vague one, or a large one — so nobody has to learn a syntax to benefit from it.

🖐 is deliberate. `fresh-start` throws away your conversation and hands you a
condensed prompt to begin again; an assistant deciding on its own that your chat
is spent would be a bug, not a feature. You ask for that one.

The German edition is a full localization, not a translated wrapper: the
descriptions carry German trigger phrases, so the skills fire on German prompts,
and the commands read natively (`/frag-nach`).

## Why these exist

Most complaints about AI output are really complaints about alignment.

**The assumption gap.** A request carries assumptions nobody said out loud —
sometimes the user's, sometimes the model's, and often ones the user hasn't
worked out yet and has no answer to either. One prompt in, a wall of output back,
and the mismatch only becomes visible once the work is already wrong. `ask-me`
turns that into a short exchange up front: research whatever is findable, then
ask only what the user actually owns — goals, priorities, trade-offs.

**Big work dumped in whole.** People hand over a project and expect it finished
in two messages. The complexity doesn't disappear because it went unmentioned;
it just becomes invisible, and shows up later as rework. `step-by-step`
decomposes the task and keeps the plan on screen, so the process is something
you can see and correct rather than something you hope went well.

**Spent context.** Long chats accumulate dead ends, corrections and superseded
decisions, and the model keeps reading all of it. `fresh-start` filters a
conversation down to its net state — what was decided, what was learned — as one
prompt you can paste into a clean chat.

None of the three requires a well-engineered prompt. That's the point: you type
a normal request, and the skill works out what it still needs by asking, rather
than expecting you to have anticipated everything in advance.

## Built for rollout

These skills were built privately and have since been adopted company-wide,
shipped as an internal plugin and iterated across releases.

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

```text
/plugin marketplace add leonclaus/chat-skills
/plugin install leonclaus-skills@leonclaus
```

For the German edition, swap the second line:

```text
/plugin install leonclaus-skills-de@leonclaus
```

Installing via the marketplace keeps a link to this repo, so improvements reach
you automatically.

### ChatGPT and other agents

A skill is just a `SKILL.md` folder in the open Agent Skills format, so it is
portable. Download a skill folder from `plugins/en/skills/` (or
`plugins/de/skills/`) and add it in your assistant's UI.

Or via the CLI:

```sh
npx skills add leonclaus/chat-skills
```

## Auf Deutsch

Schlechte KI-Ergebnisse liegen selten am Modell. Meist liegt es an einer
Annahme, die nie ausgesprochen wurde — deine, die des Modells, oder eine, die
noch niemand zu Ende gedacht hat. In einem einzigen Prompt bleibt diese Lücke
unsichtbar, bis das Ergebnis enttäuscht. Dann heißt es, die KI könne das nicht,
und die Nutzung schläft ein.

Diese drei Skills setzen davor an: erst klären, dann arbeiten — in sichtbaren
Schritten, mit sauberem Kontext.

| Was er macht                                                      | Wie er startet | Befehl                  |
| ----------------------------------------------------------------- | -------------- | ----------------------- |
| Klärt Ziel und Scope, bevor die Arbeit beginnt                    | ⚡ Automatisch  | `/frag-nach`            |
| Zerlegt große Aufgaben in sichtbare, reviewte Schritte            | ⚡ Automatisch  | `/schritt-fuer-schritt` |
| Fasst einen verbrauchten Chat zu einem sauberen Neustart zusammen | 🖐 Auf Zuruf    | `/von-vorne`            |

Die deutschsprachige Ausgabe installierst du in Claude so:

```text
/plugin marketplace add leonclaus/chat-skills
/plugin install leonclaus-skills-de@leonclaus
```

Die Skills greifen auch ohne Befehl, wenn du auf Deutsch darum bittest — einen
komplexen Prompt brauchst du dafür nicht.

## Compatibility

Built on the open [Agent Skills](https://code.claude.com/docs/en/skills)
standard. A skill is just a `SKILL.md` folder, so it runs natively in Claude and
ChatGPT and is portable to other agent tools that adopt the standard.

## About

Built by Leon Claus, who works on making AI genuinely usable inside
organizations — the gap between "we have access to a model" and "people actually
get value from it."

These started as personal tooling and were adopted company-wide.
[leonclaus.com](https://leonclaus.com)

`ask-me` is inspired by Matt Pocock's
[`/grill-me`](https://www.aihero.dev/skills-grill-me) skill.

## License

MIT — see [LICENSE](./LICENSE).
