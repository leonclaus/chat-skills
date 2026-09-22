---
name: frag-nach
description: Sorgt für ein gemeinsames Verständnis einer Aufgabe durch gezieltes Fragen, um Ziele, Scope und Erwartungen abzustimmen, bevor es an die Umsetzung geht. Nutze, wenn eine Anfrage mehrdeutig ist oder die Person vor der Umsetzung Einigkeit herstellen möchte („frag vorher nach", „lass uns das erst abstimmen", „stell mir Fragen"). Für die Steuerung einer großen Aufgabe über viele Schritte nutze stattdessen den Skill `schritt-fuer-schritt`. Nicht für klare Anfragen, die man einfach erledigen kann.
---

# frag-nach

**Ziel:** vor dem ersten Arbeitsschritt Einigkeit über Ziel, Scope und Erwartungen herstellen.

## Was gefragt wird

Frage, was du **nicht wissen kannst**; recherchiere, was du **herausfinden kannst**; frage **so wenig wie möglich**.

- **Erst selbst klären:** Recherchiere alles, was in Memories, angebundenen Tools, früheren Chats oder im Web auffindbar ist, bevor du fragst — frage nie nach einem Fakt, den du nachschlagen kannst. Nenne, was du geklärt hast, damit es korrigiert werden kann.
- **Nur fragen, was der Person gehört:** Ziel, Absicht, Präferenzen, Prioritäten, Zielgruppe, Abwägungen — Entscheidungen, keine Fakten.
- **Weglassen, was nichts ändert:** Würde die Antwort dein Vorgehen nicht ändern, frag nicht — das hier ist kein Vollständigkeitsfragebogen.

## Ablauf

1. **Recherchiere**, was auffindbar ist, und lege deine Annahmen offen, damit sie bestätigt werden können.
2. **Stelle eine Frage nach der anderen**, die wirkungsvollste zuerst, und warte jede Antwort ab — spätere Fragen hängen oft an früheren. Jede Frage trägt deine empfohlene Antwort, begründet aus der Recherche; die Entscheidung der Person zählt.
   - Geschlossene Frage (wenige, sich gegenseitig ausschließende Optionen) → nutze das Tool `AskUserQuestion`, falls verfügbar, sonst liste die Optionen inline; deine Empfehlung zuerst, markiert mit „(Empfehlung)".
   - Offene oder explorative Frage → im Fließtext stellen, mit Empfehlung. Erfinde nie Optionen, nur um das Tool nutzen zu können.
3. **Hör auf zu fragen**, sobald Ziel, Scope, Erwartungen und Abwägungen klar sind.
4. **Fasse das Vereinbarte zusammen** — Ziel, Scope, Entscheidungen — und frage einmal ausdrücklich, ob das so stimmt.
5. **Erst nach diesem „Ja" umsetzen.** Beiläufige Zustimmung zwischendurch ist keine Freigabe.

**Delegierter Aufruf.** Ruft dich ein anderer Skill (z. B. `schritt-fuer-schritt`) nur zur Klärung eines Teilschritts auf, stoppe nach der Zusammenfassung und gib zurück — setze nicht um; die Umsetzung übernimmt der aufrufende Skill an seinem Checkpoint.

## Abbruch

Will die Person raus aus dem Fragen („mach einfach", „das reicht"), hör auf zu fragen und erledige die Aufgabe mit dem, was du hast.
