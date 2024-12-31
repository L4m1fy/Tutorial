# CSS Tutorial

## Inhaltsverzeichnis
1. [Einführung](#einführung)
2. [Selektoren](#selektoren)
3. [Box-Modell](#box-modell)
4. [Typografie](#typografie)
5. [Layout](#layout)
6. [Flexbox](#flexbox)
7. [Grid](#grid)
8. [Responsives Design](#responsives-design)
9. [Animationen](#animationen)
10. [Beste Praktiken](#beste-praktiken)

## Einführung
CSS (Cascading Style Sheets) ist eine Stylesheet-Sprache, die zur Beschreibung der Darstellung eines in HTML geschriebenen Dokuments verwendet wird. Dieses Tutorial behandelt alle wichtigen CSS-Konzepte und -Techniken.

### Erste Schritte
1. Wählen Sie, wie Sie CSS einbinden möchten:
   ```html
   <!-- Externes CSS -->
   <link rel="stylesheet" href="styles.css">
   
   <!-- Internes CSS -->
   <style>
     /* CSS-Regeln hier */
   </style>
   
   <!-- Inline CSS -->
   <div style="color: blue;">Inhalt</div>
   ```

## Selektoren

### Grundlegende Selektoren
```css
/* Element-Selektor */
p {
    color: blue;
}

/* Klassen-Selektor */
.highlight {
    background-color: yellow;
}

/* ID-Selektor */
#header {
    font-size: 24px;
}

/* Universal-Selektor */
* {
    margin: 0;
    padding: 0;
}
```

### Kombinatoren
```css
/* Nachfahren-Selektor */
div p {
    margin: 10px;
}

/* Kind-Selektor */
div > p {
    padding: 5px;
}

/* Nachbar-Selektor */
h1 + p {
    font-weight: bold;
}

/* Geschwister-Selektor */
h1 ~ p {
    color: gray;
}
```

### Pseudo-Klassen und Pseudo-Elemente
```css
/* Pseudo-Klassen */
a:hover {
    text-decoration: underline;
}

button:active {
    background-color: #ddd;
}

input:focus {
    border-color: blue;
}

/* Pseudo-Elemente */
p::first-line {
    font-weight: bold;
}

p::before {
    content: "→";
}

p::after {
    content: "←";
}
```

## Box-Modell

### Box-Modell-Komponenten
```css
.box {
    /* Inhalt */
    width: 200px;
    height: 100px;
    
    /* Innenabstand */
    padding: 20px;
    padding-top: 10px;
    padding-right: 15px;
    padding-bottom: 10px;
    padding-left: 15px;
    
    /* Rahmen */
    border: 1px solid black;
    border-width: 2px;
    border-style: solid;
    border-color: #000;
    border-radius: 5px;
    
    /* Außenabstand */
    margin: 10px;
    margin-top: 20px;
    margin-right: 15px;
    margin-bottom: 20px;
    margin-left: 15px;
}
```

### Box-Sizing
```css
/* Border-box schließt Padding und Border in die Gesamtbreite und -höhe ein */
* {
    box-sizing: border-box;
}

/* Content-box (Standard) schließt Padding und Border aus */
.content-box {
    box-sizing: content-box;
}
```

## Typografie

### Schrift-Eigenschaften
```css
.text {
    /* Schriftfamilie */
    font-family: Arial, sans-serif;
    
    /* Schriftgröße */
    font-size: 16px;
    font-size: 1.2em;
    font-size: 1.2rem;
    
    /* Schriftstärke */
    font-weight: bold;
    font-weight: 700;
    
    /* Schriftstil */
    font-style: italic;
    
    /* Zeilenhöhe */
    line-height: 1.5;
    
    /* Buchstabenabstand */
    letter-spacing: 1px;
    
    /* Wortabstand */
    word-spacing: 2px;
    
    /* Textausrichtung */
    text-align: center;
    
    /* Textdekoration */
    text-decoration: underline;
    
    /* Texttransformation */
    text-transform: uppercase;
}
```

### Webschriften
```css
/* Google Fonts */
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

/* Benutzerdefinierte Schriftart */
@font-face {
    font-family: 'CustomFont';
    src: url('pfad/zur/schrift.woff2') format('woff2'),
         url('pfad/zur/schrift.woff') format('woff');
}
```

## Layout

### Display-Eigenschaft
```css
.element {
    /* Häufige Display-Werte */
    display: block;
    display: inline;
    display: inline-block;
    display: none;
    
    /* Flexbox */
    display: flex;
    
    /* Grid */
    display: grid;
}
```

### Positionierung
```css
.positioned {
    /* Positionierungswerte */
    position: static;      /* Standard */
    position: relative;    /* Relativ zur normalen Position */
    position: absolute;    /* Relativ zum positionierten Elternelement */
    position: fixed;       /* Relativ zum Viewport */
    position: sticky;      /* Hybrid aus relative und fixed */
    
    /* Versatz-Eigenschaften */
    top: 10px;
    right: 20px;
    bottom: 10px;
    left: 20px;
    
    /* Z-Index */
    z-index: 100;
}
```

### Float
```css
.float-element {
    float: left;
    float: right;
    clear: both;
}
```

## Flexbox

### Container-Eigenschaften
```css
.flex-container {
    display: flex;
    
    /* Richtung */
    flex-direction: row;
    flex-direction: column;
    
    /* Umbruch */
    flex-wrap: wrap;
    
    /* Ausrichtung Hauptachse */
    justify-content: flex-start;
    justify-content: center;
    justify-content: space-between;
    justify-content: space-around;
    
    /* Ausrichtung Querachse */
    align-items: stretch;
    align-items: center;
    align-items: flex-start;
    align-items: flex-end;
    
    /* Abstand */
    gap: 10px;
}
```

### Element-Eigenschaften
```css
.flex-item {
    /* Reihenfolge */
    order: 1;
    
    /* Wachsen */
    flex-grow: 1;
    
    /* Schrumpfen */
    flex-shrink: 0;
    
    /* Basis-Größe */
    flex-basis: 200px;
    
    /* Kurzschreibweise */
    flex: 1 0 200px;
    
    /* Selbstausrichtung */
    align-self: center;
}
```

## Grid

### Container-Eigenschaften
```css
.grid-container {
    display: grid;
    
    /* Spalten definieren */
    grid-template-columns: 200px 200px 200px;
    grid-template-columns: repeat(3, 1fr);
    grid-template-columns: minmax(100px, 1fr) 2fr 1fr;
    
    /* Zeilen definieren */
    grid-template-rows: 100px auto;
    
    /* Abstände */
    gap: 20px;
    column-gap: 20px;
    row-gap: 10px;
    
    /* Bereiche */
    grid-template-areas:
        "header header header"
        "sidebar main main"
        "footer footer footer";
}
```

### Element-Eigenschaften
```css
.grid-item {
    /* Platzierung */
    grid-column: 1 / 3;
    grid-row: 1 / 2;
    
    /* Bereich */
    grid-area: header;
    
    /* Ausrichtung */
    justify-self: center;
    align-self: center;
}
```

## Responsives Design

### Media Queries
```css
/* Mobile-First-Ansatz */
/* Basis-Stile für Mobile */
.element {
    width: 100%;
}

/* Tablet */
@media screen and (min-width: 768px) {
    .element {
        width: 50%;
    }
}

/* Desktop */
@media screen and (min-width: 1024px) {
    .element {
        width: 33.33%;
    }
}

/* Druck-Stile */
@media print {
    .no-print {
        display: none;
    }
}
```

### Responsive Einheiten
```css
.responsive-element {
    /* Viewport-Einheiten */
    width: 50vw;
    height: 50vh;
    
    /* Relative Einheiten */
    font-size: 1.2em;
    padding: 2rem;
    
    /* Prozent */
    width: 100%;
    max-width: 1200px;
    
    /* Berechnung */
    width: calc(100% - 40px);
}
```

## Animationen

### Übergänge
```css
.transition-element {
    /* Einzelne Eigenschaften */
    transition-property: all;
    transition-duration: 0.3s;
    transition-timing-function: ease-in-out;
    transition-delay: 0.1s;
    
    /* Kurzschreibweise */
    transition: all 0.3s ease-in-out 0.1s;
}
```

### Keyframe-Animationen
```css
/* Animation definieren */
@keyframes slide-in {
    0% {
        transform: translateX(-100%);
        opacity: 0;
    }
    100% {
        transform: translateX(0);
        opacity: 1;
    }
}

/* Animation anwenden */
.animated-element {
    animation: slide-in 0.5s ease-out forwards;
    
    /* Animations-Eigenschaften */
    animation-name: slide-in;
    animation-duration: 0.5s;
    animation-timing-function: ease-out;
    animation-delay: 0.1s;
    animation-iteration-count: infinite;
    animation-direction: alternate;
    animation-fill-mode: forwards;
}
```

### Transformationen
```css
.transform-element {
    /* 2D-Transformationen */
    transform: translate(50px, 100px);
    transform: rotate(45deg);
    transform: scale(1.5);
    transform: skew(10deg);
    
    /* 3D-Transformationen */
    transform: rotateX(45deg);
    transform: rotateY(45deg);
    transform: perspective(1000px);
    
    /* Mehrfache Transformationen */
    transform: translate(50px, 100px) rotate(45deg) scale(1.5);
}
```

## Beste Praktiken

1. CSS Reset oder Normalize verwenden
```css
/* Einfacher Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
```

2. CSS mit BEM-Methodik organisieren
```css
/* Block */
.card { }

/* Element */
.card__title { }
.card__content { }

/* Modifier */
.card--featured { }
```

3. CSS-Variablen verwenden
```css
:root {
    --primary-color: #007bff;
    --secondary-color: #6c757d;
    --spacing-unit: 8px;
}

.element {
    color: var(--primary-color);
    margin: var(--spacing-unit);
}
```

4. Mobile-First-Ansatz
```css
/* Basis-Stile (Mobile) */
.element {
    width: 100%;
}

/* Größere Bildschirme */
@media (min-width: 768px) {
    .element {
        width: 50%;
    }
}
```

5. Performance-Überlegungen
```css
/* Effiziente Selektoren verwenden */
.specific-class { } /* Gut */
div > div > div { } /* Vermeiden */

/* Ressourcenintensive Eigenschaften vermeiden */
.element {
    will-change: transform; /* Sparsam verwenden */
}
```

## Zusätzliche Ressourcen

1. [MDN CSS-Dokumentation](https://developer.mozilla.org/de/docs/Web/CSS)
2. [CSS-Tricks](https://css-tricks.com)
3. [Can I Use](https://caniuse.com)
4. [Flexbox Froggy](https://flexboxfroggy.com/#de)
5. [Grid Garden](https://cssgridgarden.com/#de)

## Übungsprojekte

1. Erstellen Sie ein responsives Navigationsmenü
2. Bauen Sie ein Karten-Layout mit Flexbox
3. Gestalten Sie eine Fotogalerie mit Grid
4. Implementieren Sie eine benutzerdefinierte Animation
5. Erstellen Sie ein responsives Formular-Layout

Denken Sie daran, regelmäßig zu üben und mit verschiedenen Eigenschaften und Werten zu experimentieren, um Ihre CSS-Fähigkeiten zu verbessern!
