#!/usr/bin/env bash
set -euo pipefail

test -f index.html
test -f CNAME
test -f robots.txt
test -f sitemap.xml
test -f impressum.html
test -f datenschutz.html
test -f en/index.html
test -f assets/site.css
test -f assets/site.js
test -f styleguide/README.md
test -f styleguide/tokens.css

grep -qx 'funktion8.de' CNAME
grep -q '<link rel="canonical" href="https://funktion8.de/">' index.html
grep -q '<link rel="alternate" hreflang="en" href="https://funktion8.de/en/">' index.html

grep -q 'Organisation as Code' index.html
grep -q 'gemeinnütz' index.html
grep -q 'notariat8.de' index.html
grep -q 'Funktion8 Styleguide' index.html
grep -q 'Organisation as Code' en/index.html

grep -q -- '--f8-ink' styleguide/tokens.css
grep -q 'verbindliche CI-Quelle' styleguide/README.md
grep -q '@import url("../styleguide/tokens.css")' assets/site.css
! grep -q 'nac-control-plane' assets/site.css
! grep -R '\bNoC\b' index.html en/index.html README.md styleguide/README.md assets/site.css
! grep -R 'github.com/ofunk/NaC\|github.com/ofunk' index.html en/index.html
! grep -RE 'fuer|Fuer|ueber|Ueber|pruef|Pruef|Oberflaeche|Aender|aender|Ausfuehr|fuehrt|Fuehr|Arbeitsflaechen|Naechster|geprueft|Begruendung|Zurueck|ergaenz|muessen|enthaelt|vollstaendigt|Veroeffentlichung|ladungsfaehige|zusaetzlichen|veroeffentlichen|Primaer|Geschaeft|verfueg|duerf|gehoer|Flaechen|Abstaende|Spaeter|koennen|moeglich|Steuerbuero|Traeger|Gruendung|schuetz|loesung|Qualitaet' index.html impressum.html datenschutz.html 404.html README.md styleguide/README.md
