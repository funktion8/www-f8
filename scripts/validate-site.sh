#!/usr/bin/env bash
set -euo pipefail

assert_absent() {
  local pattern="$1"
  shift

  if grep -R "$pattern" "$@"; then
    exit 1
  fi
}

assert_absent_extended() {
  local pattern="$1"
  shift

  if grep -RE "$pattern" "$@"; then
    exit 1
  fi
}

test -f index.html
test -f CNAME
test -f robots.txt
test -f sitemap.xml
test -f impressum.html
test -f datenschutz.html
test -f kontakt.html
test -f transparenz.html
test -f gemeinnuetzigkeit.html
test -f foerderung.html
test -f en/index.html
test -f en/imprint.html
test -f en/privacy.html
test -f assets/site.css
test -f assets/site.js
test -f assets/funktion8-field.svg
test -f styleguide/README.md
test -f styleguide/tokens.css
test ! -e assets/favicon.svg

f8_brand_icon_url='https://bild8.de/assets/8/svg/f8.svg'
for html_file in \
  index.html \
  impressum.html \
  datenschutz.html \
  kontakt.html \
  transparenz.html \
  gemeinnuetzigkeit.html \
  foerderung.html \
  404.html \
  en/index.html \
  en/imprint.html \
  en/privacy.html
do
  grep -q "<link rel=\"icon\" href=\"${f8_brand_icon_url}\" type=\"image/svg+xml\">" "$html_file"
done
assert_absent 'assets/favicon.svg' index.html impressum.html datenschutz.html kontakt.html transparenz.html gemeinnuetzigkeit.html foerderung.html 404.html en/index.html en/imprint.html en/privacy.html
assert_absent '<span class="brand-mark"' index.html impressum.html datenschutz.html kontakt.html transparenz.html gemeinnuetzigkeit.html foerderung.html en/index.html en/imprint.html en/privacy.html
grep -q "<img class=\"brand-mark\" src=\"${f8_brand_icon_url}\" alt=\"\" width=\"44\" height=\"44\" aria-hidden=\"true\">" index.html
grep -q "<img class=\"brand-mark\" src=\"${f8_brand_icon_url}\" alt=\"\" width=\"44\" height=\"44\" aria-hidden=\"true\">" en/index.html

grep -qx 'funktion8.de' CNAME
grep -q '<link rel="canonical" href="https://funktion8.de/">' index.html
grep -q '<link rel="alternate" hreflang="en" href="https://funktion8.de/en/">' index.html

grep -q 'Organisation as Code' index.html
grep -q 'gemeinnütz' index.html
grep -q 'notariat8.de' index.html
grep -q 'Eine gemeinnützige Marke' index.html
grep -q 'CI-Quelle' index.html
grep -q 'funktion8-field.svg' index.html
grep -q 'funktion8-field.svg' en/index.html
assert_absent '>F8</text>' assets/funktion8-field.svg
grep -q 'Organisation as Code' en/index.html
grep -q 'Funktion8 gGmbH in Gründung' impressum.html
grep -q 'Oliver Funk' impressum.html
grep -q 'Mühltalstraße 55' impressum.html
grep -q '64297 Darmstadt' impressum.html
grep -q 'ofunk@funktion8.de' impressum.html
grep -q 'GitHub Pages' datenschutz.html
grep -q 'ofunk@funktion8.de' datenschutz.html
grep -q 'https://www.linkedin.com/in/ofunk/' datenschutz.html
grep -q 'Funktion8 gGmbH in formation' en/imprint.html
grep -q 'GitHub Pages' en/privacy.html
grep -q 'ofunk@funktion8.de' kontakt.html
grep -q 'gGmbH in Gründung' gemeinnuetzigkeit.html
grep -q 'keine veröffentlichte Spendenabwicklung' foerderung.html
grep -q 'Öffentliches Repository' transparenz.html

grep -q -- '--f8-ink' styleguide/tokens.css
grep -q 'verbindliche CI-Quelle' styleguide/README.md
grep -q '@import url("../styleguide/tokens.css")' assets/site.css
test ! -e assets/nac-control-plane.png
assert_absent 'nac-control-plane' assets/site.css
assert_absent 'Blog\|blog\|Dokumentation\|Doku' index.html en/index.html
assert_absent '\bNoC\b' index.html en/index.html README.md styleguide/README.md assets/site.css
assert_absent 'github.com/ofunk/NaC\|github.com/ofunk' index.html en/index.html
assert_absent_extended 'fuer|Fuer|ueber|Ueber|pruef|Pruef|Oberflaeche|Aender|aender|Ausfuehr|fuehrt|Fuehr|Arbeitsflaechen|Naechster|geprueft|Begruendung|Zurueck|ergaenz|muessen|enthaelt|vollstaendigt|Veroeffentlichung|ladungsfaehige|zusaetzlichen|veroeffentlichen|Primaer|Geschaeft|verfueg|duerf|gehoer|Flaechen|Abstaende|Spaeter|koennen|moeglich|Steuerbuero|Traeger|Gruendung|schuetz|loesung|Qualitaet' index.html impressum.html datenschutz.html kontakt.html transparenz.html gemeinnuetzigkeit.html foerderung.html 404.html README.md styleguide/README.md