# Funktion8 Styleguide

Dieses Verzeichnis ist die verbindliche CI-Quelle für Funktion8 und alle
abgeleiteten Vertical-Seiten wie `notariat8.de`.

## Zweck

Funktion8 stellt die Dachmarke, die Idee von Organisation as Code und den
gemeinsamen visuellen Rahmen. Vertical-Projekte dürfen fachlich und inhaltlich
eigene Schwerpunkte setzen, sollen aber sichtbar zur Funktion8-Familie gehören.

## Verbindliche Grundlagen

- `tokens.css` definiert Farben, Flächen, Typografie, Radien, Schatten und
  Abstände.
- Neue Landingpages sollen diese Tokens direkt importieren oder synchron daraus
  erzeugte Werte verwenden.
- Lokale Abweichungen sind erlaubt, wenn sie ein Vertical klarer machen; sie
  dürfen die Familienzugehörigkeit nicht aufheben.

## Nutzung

Eine statische Vertical-Seite kann die Tokens so importieren:

```css
@import url("https://funktion8.de/styleguide/tokens.css");
```

Innerhalb dieses Repos nutzt `assets/site.css` den relativen Import:

```css
@import url("../styleguide/tokens.css");
```

## Nächste Ausbaustufe

Später sollen hier gemeinsame Layout-Templates, Komponentenregeln und
Beispiele für Vertical-Landingpages liegen. `www-f8` bleibt dabei der
kanonische Ort für CI-Entscheidungen.
