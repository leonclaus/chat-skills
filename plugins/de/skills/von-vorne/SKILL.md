---
name: von-vorne
description: Fasst einen langen oder erratischen Chat in einem einzigen kopierbaren Prompt-Block für einen sauberen Neustart in einem frischen Chat zusammen — mitgenommen wird nur der aktuelle Stand, ohne Sackgassen und überholtes Hin und Her.
disable-model-invocation: true
---

# von-vorne

Fasse den Chat zu einem einzigen kopierbaren Prompt zusammen, der einen frischen, unbelasteten Chat startet — frei von möglicher Context-Verschmutzung. Der neue Chat soll genau so viel bekommen, dass er weiterarbeiten kann — ohne Sackgassen, überholte Zwischenstände und das Hin und Her mitzuschleppen.

Das ist kein vollständiges Protokoll — nur das, was ein neuer Chat _zum Weiterarbeiten braucht_.

## Kernprinzip: filtern, nicht bloß kürzen

Der Wert liegt darin, **wegzulassen, was falsch ist**, nicht darin, zu verkürzen.

- **Nur der aktuelle Stand zählt.** Wurde etwas später korrigiert oder verworfen, nimm nur die aktuelle Fassung auf — nicht den Weg dorthin.
- **Mühsam Erarbeitetes behalten.** Rechercheergebnisse, Tool-Ausgaben und unterwegs gesammelte Fakten, die der neue Chat sonst neu herausfinden müsste, gehören nach „Bisher geklärt" — damit der Neustart die Arbeit nicht wiederholt.
- **Vorschlag ≠ Entscheidung.** Halte eine Entscheidung fest, wenn die Person sie getroffen oder ihr zugestimmt hat — auch knappe Zustimmung zählt; die Absicherung richtet sich dagegen, eigene Vorschläge ohne Reaktion der Person zu gesetzten Entscheidungen zu machen. Einen Fakt nimmst du auf, sobald er im Chat belegt ist (Aussage der Person, Tool-Ausgabe, Recherche). Im Zweifel als offen markieren statt als gesetzt darstellen.
- **Prozessrauschen und Erfindungen raus.** Keine Meta-Diskussion, kein Formulierungs-Pingpong; ergänze nichts, was nicht im Chat vorkam. Gibt es keinen klaren nächsten Schritt, sag das schlicht, statt einen zu erfinden.

## Ablauf

1. **Wähle das aktive Thema.** Bei mehreren Strängen nimm den zuletzt laufenden als Basis für den Block; andere relevante Stränge erwähnst du in einem Satz, statt sie zu streichen oder stillschweigend mitzunehmen.
2. **Filtere nach dem Kernprinzip.**
3. **Gib den Block aus**, exakt in diesem Format:

   ```markdown
   ## Kontext

   [1–3 Sätze: worum es geht, das übergeordnete Ziel]

   ## Bisher geklärt

   - [Entscheidung, gesicherter Fakt oder Rechercheergebnis]
   - [Entscheidung, gesicherter Fakt oder Rechercheergebnis]

   ## Nächster Schritt

   [Konkrete Anweisung — was der neue Chat als Erstes tun soll]
   ```

   In der Sprache des Chats, als ein einziger Markdown-Codeblock (mit einem Klick kopierbar), ohne Meta-Kommentare — er soll sich lesen, als hätte die Person ihn selbst als ersten Prompt geschrieben.

4. **Außerhalb des Blocks:** Ließ sich etwas nicht sauber als Fakt oder Vorschlag einordnen oder hast du einen Strang bewusst weggelassen, benenne das in einem Satz.
