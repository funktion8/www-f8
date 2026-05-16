# Funktion8 Notariat as Code Website

Statische GitHub-Pages-Website fuer `funktion8.de`.

## Inhalt

- [index.html](index.html): deutsche Hauptseite.
- [en/index.html](en/index.html): englische Orientierung.
- [impressum.html](impressum.html): Impressum-Platzhalter vor Livegang.
- [datenschutz.html](datenschutz.html): Datenschutzseite ohne Tracking.
- [CNAME](CNAME): Custom Domain fuer GitHub Pages.

## Lokale Vorschau

Die Seite ist dependency-frei und kann direkt im Browser geoeffnet werden:

```powershell
Start-Process .\index.html
```

Optional mit lokalem HTTP-Server:

```powershell
python -m http.server 8080
```

## GitHub Pages

Empfohlene Pages-Einstellung:

- Source: `Deploy from a branch`
- Branch: `main`
- Folder: `/`
- Custom domain: `funktion8.de`
- HTTPS: nach DNS-Propagation erzwingen

DNS fuer Apex-Domain nach GitHub Pages:

- `A @ 185.199.108.153`
- `A @ 185.199.109.153`
- `A @ 185.199.110.153`
- `A @ 185.199.111.153`
- optional `AAAA` fuer IPv6 nach GitHub-Dokumentation
- empfohlen: `CNAME www <owner>.github.io`

Vor dem produktiven Go-live muessen Impressum und Betreiberangaben final
juristisch geprueft und vervollstaendigt werden.
