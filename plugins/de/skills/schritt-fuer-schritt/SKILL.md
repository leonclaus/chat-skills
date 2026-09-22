---
name: schritt-fuer-schritt
description: Zerlegt eine große, mehrstufige Aufgabe in Teilschritte und arbeitet sie nacheinander ab — mit Abstimmung und Review an den Stellen, an denen es zählt. Nutze bei großen oder unklaren mehrstufigen Vorhaben oder wenn ein großes Ergebnis in einem einzigen Prompt verlangt wird, das besser in Etappen entsteht. Für eine einmalige Klärung vor einer einzelnen, kleineren Aufgabe nutze den Skill `frag-nach`.
---

# schritt-fuer-schritt

**Ziel:** eine große, mehrstufige Aufgabe, die sonst in einen einzigen Prompt gequetscht würde, in Teilschritte zerlegen — abgestimmt und reviewt an den Stellen, an denen es zählt — damit die Kontrolle und der Überblick bei der Person bleiben.

## Ablauf

### 1. In Teilschritte zerlegen

Zerlege die Aufgabe **knapp** in Teilschritte — von der Informationsbeschaffung über offene Entscheidungen bis zur Produktion — und streue regelmäßig **Review-Schritte** ein, wo ein falsches Ergebnis teuer rückabzuwickeln wäre und um Misalignment über einen langen Prozess zu vermeiden. Behalte dabei den mentalen Aufwand im Blick, den ein Review verursacht. Eine Checkbox pro Schritt; keine Ausformulierung je Schritt, keine Freigabe für die Zerlegung selbst:

```text
⬜ 1. …
⬜ 2. … (Review mit der Person)
⬜ 3. …
```

Führe diese Liste in **jeder** Antwort mit und markiere den Fortschritt: ✅ erledigt, 👉 aktuell, ⬜ offen. Passe sie an, wenn Fragen oder neue Erkenntnisse die Arbeit verändern (ergänzen, streichen, umsortieren) — und sag immer dazu, was sich geändert hat und warum.

### 2. Schritt für Schritt arbeiten

Immer nur ein Schritt:

- **Informationen sammeln & entscheiden.** Recherchiere selbst, was du kannst (Memories, Tools, frühere Chats, Web usw.), und teile deine Ergebnisse mit. Nenne Annahmen und lass sie bestätigen; erfinde nie Substanz — markiere als offenen Punkt, was du nicht wissen kannst, statt zu raten. Hängt ein Schritt an einer Entscheidung, die nur die Person treffen kann, kläre das vorher: eine Frage nach der anderen, jeweils mit deiner empfohlenen Antwort, und warte ab (nutze den Skill `frag-nach`, falls verfügbar; er stimmt ab, setzt aber nicht um — die Umsetzung machst du danach).
- **Umsetzen**, sobald Informationen und Entscheidungen stehen.
- **Fortschritt markieren, an Review-Punkten anhalten.** Aktualisiere nach jedem Schritt die Liste (✅ erledigt, 👉 aktuell) und zeige kurz, was sich geändert hat. Hol dir das Go an den geplanten Review-Punkten — nicht nach jedem Schritt. Behalte auch hier den Review-Aufwand im Blick: zeige, was nötig ist, um Misalignment zu vermeiden, und lass weg, was das nicht ist. Große Reviews zerlegst du.

### 3. Abschluss

Gib einen zusammengefassten Überblick — was gemacht, was zusammengetragen und was entschieden wurde.

## Abbruch

Will die Person raus aus dem Loop („mach den Rest einfach", „das reicht"), hör mit den Checkpoints auf und zieh es eigenständig zu Ende.
