# www

Dieses Repository ist das zentrale Web-Repository fuer mehrere getrennte
Websites. Jede Website liegt in einem eigenen Top-Level-Ordner und kann
unabhaengig gepflegt, geprueft und deployed werden.

## Struktur

```text
funktion8/
  site.json
  README.md
  index.html
  assets/
```

## Regeln

- Eine Website ist ein eigener Top-Level-Ordner, zum Beispiel `funktion8/`.
- Jede Website hat eine eigene `site.json` mit Name, Domains und Status.
- Site-spezifische Assets bleiben im jeweiligen Site-Ordner.
- Gemeinsame Assets werden nur eingefuehrt, wenn mehrere Sites sie wirklich
  gemeinsam brauchen.
- Rechtliche Seiten wie Impressum und Datenschutz werden pro Site gepflegt.

## Aktuelle Sites

| Site | Ordner | Primaere Domain | Status |
| --- | --- | --- | --- |
| Funktion8 | [funktion8/](funktion8) | `funktion8.de` | vorbereitet |

## Validierung

```powershell
pwsh ./scripts/validate-www.ps1
```

Der Check prueft [sites.json](sites.json), die jeweilige `site.json`, die
`index.html` jeder Site und ob Domains nicht mehrfach vergeben sind.

## Hosting-Modell

GitHub Pages kann pro Repository nur eine native Pages-Site mit einer Custom
Domain bereitstellen. Dieses Repo ist deshalb als Multi-Site-Quellrepo
strukturiert. Fuer mehrere echte Domains gibt es zwei saubere Betriebswege:

- Eine Primaer-Site aus diesem Repo ueber GitHub Pages deployen.
- Fuer mehrere Domains je Site ein separates Deployment-Ziel verwenden, zum
  Beispiel je Site ein eigenes Pages-Repo oder einen Host mit Monorepo-Support.

Details stehen in [docs/hosting-model.md](docs/hosting-model.md).
