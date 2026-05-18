# Hosting-Modell

Dieses Repository ist als Multi-Site-Quellrepo aufgebaut. Die Trennung der
Websites passiert im Repository durch getrennte Top-Level-Ordner, zum Beispiel
[funktion8/](../funktion8).

## Warum nicht alles direkt ueber eine GitHub-Pages-Site geht

GitHub Pages stellt pro Repository genau eine native Pages-Site bereit. Diese
Site kann eine Custom Domain haben. Mehrere voneinander unabhaengige Websites
mit mehreren Domains sind damit nicht nativ aus einem einzigen Repo als separate
Pages-Sites abbildbar.

## Empfohlene Loesung

`ofunk/www` bleibt das gemeinsame Pflege- und Quellrepo. Jede Website liegt
unter `<site-id>/` und kann daraus separat veroeffentlicht werden.

Fuer das Deployment gibt es je nach Zielbild drei praktikable Varianten:

1. Eine Primaer-Site ueber GitHub Pages aus diesem Repo deployen.
2. Pro Domain ein separates GitHub-Pages-Zielrepo verwenden und aus `ofunk/www`
   per Workflow nur den jeweiligen Site-Ordner dorthin spiegeln.
3. Einen Host mit Monorepo-Support verwenden, bei dem jede Site einen eigenen
   Projektpfad und eine eigene Domain bekommt.

## Aktuelle Site

Funktion8 liegt unter [funktion8/](../funktion8) und enthaelt eine eigene
[CNAME](../funktion8/CNAME) fuer `funktion8.de`.

## Neue Site anlegen

1. Ordner `<site-id>/` anlegen.
2. `<site-id>/site.json` ausfuellen.
3. `<site-id>/README.md` mit Pflegehinweisen ergaenzen.
4. Neue Site in [sites.json](../sites.json) eintragen.
5. `pwsh ./scripts/validate-www.ps1` ausfuehren.
6. Deployment-Ziel festlegen.
