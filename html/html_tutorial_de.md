# HTML Tutorial

## Inhaltsverzeichnis
1. [Einführung](#einführung)
2. [Grundlegende Struktur](#grundlegende-struktur)
3. [Textelemente](#textelemente)
4. [Links und Bilder](#links-und-bilder)
5. [Listen](#listen)
6. [Tabellen](#tabellen)
7. [Formulare](#formulare)
8. [Semantische Elemente](#semantische-elemente)
9. [HTML5-Funktionen](#html5-funktionen)
10. [Beste Praktiken](#beste-praktiken)

## Einführung
HTML (HyperText Markup Language) ist die Standardauszeichnungssprache für die Erstellung von Webseiten. Dieses Tutorial behandelt alle wesentlichen HTML-Konzepte und -Elemente.

### Einrichtung
1. Wählen Sie einen Texteditor (VS Code, Sublime Text, etc.)
2. Erstellen Sie eine neue Datei mit der Erweiterung `.html`
3. Beginnen Sie mit der grundlegenden HTML-Struktur

## Grundlegende Struktur

### HTML-Dokumentvorlage
```html
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meine erste HTML-Seite</title>
</head>
<body>
    <!-- Inhalt kommt hier -->
</body>
</html>
```

### Head-Bereich Elemente
```html
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Seitenbeschreibung">
    <meta name="keywords" content="HTML, Tutorial, Web">
    <meta name="author" content="Ihr Name">
    <link rel="stylesheet" href="styles.css">
    <script src="script.js"></script>
</head>
```

## Textelemente

### Überschriften
```html
<h1>Hauptüberschrift</h1>
<h2>Unterüberschrift</h2>
<h3>Überschrift Ebene 3</h3>
<h4>Überschrift Ebene 4</h4>
<h5>Überschrift Ebene 5</h5>
<h6>Überschrift Ebene 6</h6>
```

### Absätze und Textformatierung
```html
<p>Dies ist ein Absatz.</p>
<p>Dies ist ein weiterer Absatz mit <strong>fettem Text</strong> und <em>kursivem Text</em>.</p>
<p>Sie können auch <b>fett</b> und <i>kursiv</i> Tags verwenden.</p>
<p>Dieser Text enthält einen <br>Zeilenumbruch.</p>
<hr>
<p>Horizontale Linie darüber.</p>
```

## Links und Bilder

### Links
```html
<!-- Externer Link -->
<a href="https://www.beispiel.de">Besuchen Sie Beispiel.de</a>

<!-- Interner Link -->
<a href="/ueber-uns.html">Über uns</a>

<!-- Link mit Ziel -->
<a href="https://www.beispiel.de" target="_blank">In neuem Tab öffnen</a>

<!-- E-Mail-Link -->
<a href="mailto:beispiel@email.de">E-Mail senden</a>

<!-- Telefon-Link -->
<a href="tel:+49123456789">Rufen Sie uns an</a>
```

### Bilder
```html
<!-- Einfaches Bild -->
<img src="bild.jpg" alt="Beschreibung">

<!-- Bild mit Größe -->
<img src="bild.jpg" alt="Beschreibung" width="300" height="200">

<!-- Bild als Link -->
<a href="seite.html">
    <img src="bild.jpg" alt="Klicken Sie hier">
</a>
```

## Listen

### Ungeordnete Listen
```html
<ul>
    <li>Erster Punkt</li>
    <li>Zweiter Punkt</li>
    <li>Dritter Punkt</li>
</ul>
```

### Geordnete Listen
```html
<ol>
    <li>Erster Punkt</li>
    <li>Zweiter Punkt</li>
    <li>Dritter Punkt</li>
</ol>
```

### Definitionslisten
```html
<dl>
    <dt>Begriff 1</dt>
    <dd>Definition 1</dd>
    <dt>Begriff 2</dt>
    <dd>Definition 2</dd>
</dl>
```

## Tabellen

### Grundlegende Tabellenstruktur
```html
<table>
    <thead>
        <tr>
            <th>Überschrift 1</th>
            <th>Überschrift 2</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Zeile 1, Zelle 1</td>
            <td>Zeile 1, Zelle 2</td>
        </tr>
        <tr>
            <td>Zeile 2, Zelle 1</td>
            <td>Zeile 2, Zelle 2</td>
        </tr>
    </tbody>
</table>
```

### Tabelle mit Colspan und Rowspan
```html
<table>
    <tr>
        <td colspan="2">Zelle über 2 Spalten</td>
    </tr>
    <tr>
        <td rowspan="2">Zelle über 2 Zeilen</td>
        <td>Normale Zelle</td>
    </tr>
    <tr>
        <td>Normale Zelle</td>
    </tr>
</table>
```

## Formulare

### Grundlegende Formularstruktur
```html
<form action="/absenden" method="post">
    <!-- Formularelemente kommen hier -->
</form>
```

### Eingabetypen
```html
<!-- Texteingabe -->
<input type="text" name="benutzername" placeholder="Benutzername eingeben">

<!-- Passworteingabe -->
<input type="password" name="passwort" placeholder="Passwort eingeben">

<!-- E-Mail-Eingabe -->
<input type="email" name="email" placeholder="E-Mail eingeben">

<!-- Zahleneingabe -->
<input type="number" name="alter" min="0" max="120">

<!-- Datumseingabe -->
<input type="date" name="geburtsdatum">

<!-- Checkbox -->
<input type="checkbox" name="newsletter" id="newsletter">
<label for="newsletter">Newsletter abonnieren</label>

<!-- Radiobuttons -->
<input type="radio" name="geschlecht" value="maennlich" id="maennlich">
<label for="maennlich">Männlich</label>
<input type="radio" name="geschlecht" value="weiblich" id="weiblich">
<label for="weiblich">Weiblich</label>

<!-- Auswahlfeld -->
<select name="land">
    <option value="">Land auswählen</option>
    <option value="de">Deutschland</option>
    <option value="at">Österreich</option>
    <option value="ch">Schweiz</option>
</select>

<!-- Textbereich -->
<textarea name="nachricht" rows="4" cols="50"></textarea>

<!-- Datei-Upload -->
<input type="file" name="dokument">

<!-- Absenden-Button -->
<input type="submit" value="Absenden">
```

## Semantische Elemente

### Seitenstruktur
```html
<header>
    <nav>
        <!-- Navigationsinhalt -->
    </nav>
</header>

<main>
    <article>
        <section>
            <!-- Artikelbereich -->
        </section>
    </article>
    
    <aside>
        <!-- Seitenleisteninhalt -->
    </aside>
</main>

<footer>
    <!-- Fußzeileninhalt -->
</footer>
```

### Inhaltselemente
```html
<figure>
    <img src="bild.jpg" alt="Beschreibung">
    <figcaption>Bildunterschrift</figcaption>
</figure>

<time datetime="2024-12-25">25. Dezember 2024</time>

<mark>Hervorgehobener Text</mark>

<details>
    <summary>Zum Erweitern klicken</summary>
    <p>Detaillierter Inhalt hier</p>
</details>
```

## HTML5-Funktionen

### Audio und Video
```html
<!-- Audio -->
<audio controls>
    <source src="audio.mp3" type="audio/mpeg">
    Ihr Browser unterstützt kein Audio.
</audio>

<!-- Video -->
<video width="320" height="240" controls>
    <source src="video.mp4" type="video/mp4">
    Ihr Browser unterstützt kein Video.
</video>
```

### Canvas
```html
<canvas id="meinCanvas" width="200" height="100"></canvas>
```

### SVG
```html
<svg width="100" height="100">
    <circle cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red" />
</svg>
```

## Beste Praktiken

1. Immer DOCTYPE deklarieren
2. Semantische HTML-Elemente verwenden
3. Alt-Attribute für Bilder einbinden
4. Korrekte Einrückung verwenden
5. HTML-Code validieren
6. Website barrierefrei gestalten
7. Aussagekräftige Klassen- und ID-Namen verwenden
8. Code sauber und organisiert halten
9. In verschiedenen Browsern testen
10. HTML-Standards befolgen

## Zusätzliche Ressourcen

1. [MDN Web Docs (Deutsch)](https://developer.mozilla.org/de/docs/Web/HTML)
2. [W3Schools HTML Tutorial](https://www.w3schools.com/html/)
3. [HTML5-Spezifikation](https://html.spec.whatwg.org/)
4. [Can I Use](https://caniuse.com/)

## Übungsprojekte

1. Erstellen Sie ein persönliches Portfolio
2. Bauen Sie ein Blog-Layout
3. Gestalten Sie ein Kontaktformular
4. Erstellen Sie eine Produkt-Landingpage
5. Bauen Sie eine Restaurant-Menüseite

Denken Sie daran, regelmäßig zu üben und mit verschiedenen HTML-Elementen und -Attributen zu experimentieren, um Ihre Fähigkeiten zu verbessern!
