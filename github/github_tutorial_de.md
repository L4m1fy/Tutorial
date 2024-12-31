# GitHub Tutorial für Entwickler
Ein umfassender Leitfaden zur Verwendung von GitHub für Versionskontrolle und Teamarbeit

## Inhaltsverzeichnis
Schnelle Navigation durch die Tutorialabschnitte

1. [Erste Schritte mit GitHub](#erste-schritte)
2. [Grundlegende Git-Befehle](#grundlegende-befehle)
3. [Arbeiten mit Repositories](#arbeiten-mit-repositories)
4. [Kollaborations-Workflow](#kollaborations-workflow)
5. [Best Practices](#best-practices)
6. [Fortgeschrittene Themen](#fortgeschrittene-themen)
7. [Fortgeschrittene Git-Techniken](#fortgeschrittene-git-techniken)
8. [Erweiterte GitHub-Funktionen](#erweiterte-github-funktionen)
9. [Teamarbeit und Code-Review](#teamarbeit-und-code-review)
10. [Sicherheit und Best Practices](#sicherheit-und-best-practices)
11. [Fehlerbehandlung und Wiederherstellung](#fehlerbehandlung-und-wiederherstellung)
12. [Git für spezielle Anwendungsfälle](#git-für-spezielle-anwendungsfälle)

## Erste Schritte
Grundlegende Einrichtung und Konfiguration für den Einstieg in GitHub

### Git und GitHub einrichten
1. Installieren Sie Git von [git-scm.com](https://git-scm.com/)
2. Erstellen Sie ein GitHub-Konto auf [github.com](https://github.com)
3. Konfigurieren Sie Git mit Ihren Anmeldedaten:
```bash
git config --global user.name "Ihr Name"
# Setzt Ihren Namen für alle Git-Repositories auf Ihrem Computer
# Die Option --global macht diese Einstellung für alle Repositories gültig
# Ersetzen Sie "Ihr Name" durch Ihren tatsächlichen Namen

git config --global user.email "ihre.email@beispiel.com"
# Setzt Ihre E-Mail für alle Git-Repositories
# Sollte mit Ihrer GitHub-Account-E-Mail übereinstimmen
# Wird verwendet, um Commits mit Ihrem GitHub-Account zu verknüpfen
```

### Grundlegende Befehle
Wichtige Git-Befehle für den täglichen Gebrauch:
```bash
git init                    # Neues Repository initialisieren
git clone [url]            # Repository klonen
git add [datei]           # Dateien zum Staging hinzufügen
git commit -m "nachricht"  # Änderungen committen
git push                   # Änderungen hochladen
git pull                   # Änderungen herunterladen
```

## Arbeiten mit Repositories
### Neues Repository erstellen
1. Klicken Sie auf "New" auf GitHub
2. Füllen Sie die Repository-Details aus
3. Bei Bedarf mit README initialisieren
4. Auf lokalen Rechner klonen:
```bash
git clone https://github.com/benutzername/repository.git
```

### Bestehendes Projekt hochladen
```bash
cd ihr-projekt
git init
git add .
git commit -m "Erster Commit"
git remote add origin https://github.com/benutzername/repository.git
git push -u origin main
```

## Kollaborations-Workflow
### Branch-Strategie
```bash
git checkout -b feature/neue-funktion    # Neuen Branch erstellen
git push -u origin feature/neue-funktion # Branch hochladen
```

### Pull Requests
1. Branch erstellen
2. Änderungen vornehmen
3. Änderungen hochladen
4. Pull Request auf GitHub öffnen
5. Review anfordern
6. Nach Genehmigung zusammenführen

### Code-Review-Prozess
- Code-Änderungen überprüfen
- Konstruktive Kommentare hinterlassen
- Bei Bedarf Änderungen anfordern
- Genehmigen wenn bereit
- Pull Request zusammenführen

## Best Practices
1. Klare Commit-Nachrichten schreiben
2. Commits atomar und fokussiert halten
3. Regelmäßig pullen um aktuell zu bleiben
4. Aussagekräftige Branch-Namen verwenden
5. Code-Änderungen dokumentieren
6. Vor dem Zusammenführen überprüfen

## Fortgeschrittene Themen
### Git Flow
- main/master Branch für Produktion
- develop Branch für Entwicklung
- feature Branches für neue Funktionen
- hotfix Branches für dringende Fixes

### Konflikte lösen
```bash
git pull origin main
# Konflikte in Dateien beheben
git add .
git commit -m "Konflikte gelöst"
git push
```

### GitHub Actions
- Automatisierte Workflows
- Kontinuierliche Integration
- Automatisierte Tests
- Deployment-Pipelines

### Sicherheit
- SSH-Schlüssel verwenden
- 2FA aktivieren
- Zugriffsberechtigungen überprüfen
- Abhängigkeiten aktuell halten

## Fortgeschrittene Git-Techniken
### Interaktives Rebase
Ein leistungsstarkes Werkzeug zur Überarbeitung der Commit-Historie:
```bash
# Letzten 3 Commits interaktiv bearbeiten
git rebase -i HEAD~3

# Rebase auf einen bestimmten Branch
git rebase -i main
```

Häufige Rebase-Befehle:
- `pick`: Commit beibehalten
- `reword`: Commit-Nachricht ändern
- `edit`: Commit zum Bearbeiten anhalten
- `squash`: Mit vorherigem Commit zusammenführen
- `drop`: Commit entfernen

### Git Hooks
Automatisierte Skripte für verschiedene Git-Events:

```bash
# Pre-commit Hook Beispiel (.git/hooks/pre-commit)
#!/bin/sh
npm run lint
npm test

# Bei Fehler, Commit verhindern
if [ $? -ne 0 ]; then
    echo "Tests fehlgeschlagen. Commit abgebrochen."
    exit 1
fi
```

### Submodule und Subtrees
Verwaltung von Projekt-Abhängigkeiten:
```bash
# Submodule hinzufügen
git submodule add https://github.com/user/repo extern/modul

# Submodule aktualisieren
git submodule update --init --recursive

# Subtree hinzufügen
git subtree add --prefix extern/lib https://github.com/user/lib main --squash
```

## Erweiterte GitHub-Funktionen
### GitHub CLI
Arbeiten mit GitHub über die Kommandozeile:
```bash
# Installation
winget install GitHub.cli

# Authentifizierung
gh auth login

# PR erstellen
gh pr create --title "Neue Funktion" --body "Beschreibung"

# Issues verwalten
gh issue list
gh issue create
```

### GitHub Actions Workflow-Beispiele

#### Continuous Integration
```yaml
name: CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v2
    
    - name: Setup Node.js
      uses: actions/setup-node@v2
      with:
        node-version: '16'
        
    - name: Install Dependencies
      run: npm ci
      
    - name: Run Tests
      run: npm test
```

#### Automatische Release-Erstellung
```yaml
name: Release

on:
  push:
    tags:
      - 'v*'

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    
    - name: Create Release
      uses: actions/create-release@v1
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      with:
        tag_name: ${{ github.ref }}
        release_name: Release ${{ github.ref }}
        draft: false
        prerelease: false
```

## Teamarbeit und Code-Review
### Code-Review-Checkliste
1. **Architektur**
   - Passt die Änderung zur Gesamtarchitektur?
   - Sind die Abhängigkeiten sinnvoll?

2. **Code-Qualität**
   - Ist der Code DRY (Don't Repeat Yourself)?
   - Folgt er den Projektstandards?
   - Sind Variablen und Funktionen aussagekräftig benannt?

3. **Tests**
   - Gibt es ausreichend Tests?
   - Sind Edge Cases abgedeckt?
   - Sind die Tests lesbar und wartbar?

4. **Dokumentation**
   - Sind Änderungen dokumentiert?
   - Sind komplexe Algorithmen erklärt?
   - Ist die API-Dokumentation aktuell?

### Branch-Schutzregeln
Einrichtung von Branch-Schutz:
1. Repository-Einstellungen öffnen
2. "Branches" auswählen
3. "Add rule" für den main Branch
4. Empfohlene Einstellungen:
   - Require pull request reviews
   - Dismiss stale pull request approvals
   - Require status checks to pass
   - Require branches to be up to date
   - Include administrators

## Sicherheit und Best Practices
### Sichere Geheimnisse
```bash
# .gitignore Beispiel
.env
secrets/
*.key
config.private.json

# Verwendung von GitHub Secrets
secrets.API_KEY
secrets.DATABASE_URL
```

### Git-LFS für große Dateien
```bash
# Git LFS installieren
git lfs install

# Dateitypen für LFS markieren
git lfs track "*.psd"
git lfs track "*.zip"

# LFS-Status überprüfen
git lfs status
```

### Repository-Wartung
```bash
# Repository optimieren
git gc --aggressive

# Große Objekte finden
git rev-list --objects --all | grep -f <(git verify-pack -v .git/objects/pack/*.idx | sort -k 3 -n | tail -10 | awk '{print $1}')

# Remote-Branches aufräumen
git remote prune origin
```

## Fehlerbehandlung und Wiederherstellung
### Commit-Wiederherstellung
```bash
# Gelöschten Commit finden
git reflog

# Commit wiederherstellen
git cherry-pick [commit-hash]

# Branch zu bestimmtem Zeitpunkt
git checkout -b wiederherstellung master@{1.day.ago}
```

### Datei-Wiederherstellung
```bash
# Einzelne Datei aus Commit
git checkout [commit-hash] -- pfad/zur/datei

# Alle Dateien aus Commit
git checkout [commit-hash] .

# Datei aus anderem Branch
git checkout andere-branch -- pfad/zur/datei
```

### Notfall-Kommandos
```bash
# Änderungen temporär speichern
git stash save "WIP: Beschreibung"

# Letzten Commit rückgängig machen (behält Änderungen)
git reset --soft HEAD^

# Alle lokalen Änderungen verwerfen
git reset --hard HEAD

# Branch zurücksetzen auf Remote
git reset --hard origin/main
```

## Git für spezielle Anwendungsfälle
### Monorepo-Verwaltung
```bash
# Selective Checkout
git sparse-checkout set pfad/zu/unterordner

# Shallow Clone
git clone --depth 1 repository-url

# Partial Clone
git clone --filter=blob:none repository-url
```

### Git für CI/CD
```bash
# Version Tags
git tag -a v1.0.0 -m "Release Version 1.0.0"
git push origin v1.0.0

# Release Branch erstellen
git checkout -b release/1.0.0 main
git push -u origin release/1.0.0
```

Denken Sie immer daran, Ihre Arbeit zu sichern und seien Sie vorsichtig mit Force-Befehlen!