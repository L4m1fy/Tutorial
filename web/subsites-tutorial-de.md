# Erstellen einer mehrsprachigen Website: Ein praktischer Leitfaden mit Rust-Spiel-Website als Beispiel

## Inhaltsverzeichnis
1. [Einführung](#einführung)
2. [Projektstruktur](#projektstruktur)
3. [Implementierungsleitfaden](#implementierungsleitfaden)
4. [Styling-Leitfaden](#styling-leitfaden)
5. [JavaScript-Funktionalität](#javascript-funktionalität)
6. [Beste Praktiken](#beste-praktiken)

## Einführung
Dieses Tutorial zeigt Ihnen, wie Sie eine mehrsprachige Website mit einer Rust-Spiel-Website als Beispiel erstellen. Sie lernen, wie Sie Ihre Dateien strukturieren, eine konsistente Navigation erstellen und responsives Design implementieren.

## Projektstruktur
```
website/
├── css/
│   └── styles.css
├── js/
│   └── main.js
├── images/
│   ├── hero-bg.jpg
│   ├── weapons/
│   ├── bases/
│   └── monuments/
├── pages/
│   ├── weapons.html
│   ├── bases.html
│   ├── monuments.html
│   └── survival.html
└── index.html
```

## Implementierungsleitfaden

### 1. Grundlegende HTML-Struktur einrichten
```html
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rust Spiel Guide</title>
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar">
        <div class="container nav-container">
            <a href="index.html" class="logo">RUST</a>
            <ul class="nav-links">
                <li><a href="index.html">Startseite</a></li>
                <li><a href="pages/weapons.html">Waffen</a></li>
                <li><a href="pages/bases.html">Basenbau</a></li>
                <li><a href="pages/monuments.html">Monumente</a></li>
                <li><a href="pages/survival.html">Überlebensguide</a></li>
            </ul>
        </div>
    </nav>

    <!-- Hauptinhalt -->
    <main>
        <!-- Inhalt hier -->
    </main>

    <!-- Fußzeile -->
    <footer class="footer">
        <!-- Fußzeileninhalt -->
    </footer>
</body>
</html>
```

### 2. Unterseiten erstellen
Jede Unterseite folgt der gleichen Struktur, aber mit unterschiedlichem Inhalt. Beispiel für weapons.html:

```html
<!-- pages/weapons.html -->
<!DOCTYPE html>
<html lang="de">
<head>
    <!-- Gleicher Head-Inhalt wie index.html, aber mit angepassten Pfaden -->
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <!-- Gleiche Navigation mit angepassten Pfaden -->
    <nav class="navbar">
        <!-- Navigationsinhalt -->
    </nav>

    <!-- Seitenspezifischer Inhalt -->
    <section class="hero">
        <div class="hero-content">
            <h1>Waffen Guide</h1>
            <p>Meistere die Kunst des Kampfes in Rust</p>
        </div>
    </section>

    <!-- Waffenkategorien und Inhalt -->
    <section class="section">
        <!-- Inhalt hier -->
    </section>

    <!-- Fußzeile -->
    <footer class="footer">
        <!-- Fußzeileninhalt -->
    </footer>
</body>
</html>
```

## Styling-Leitfaden

### 1. CSS-Variablen und Basis-Stile
```css
:root {
    --bg-primary: #1a1a1a;
    --bg-secondary: #2a2a2a;
    --text-primary: #ffffff;
    --text-secondary: #b0b0b0;
    --accent-color: #cd412b;
    --card-bg: #333333;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Roboto', sans-serif;
    background-color: var(--bg-primary);
    color: var(--text-primary);
}
```

### 2. Responsive Navigation
```css
.navbar {
    position: fixed;
    width: 100%;
    background-color: rgba(26, 26, 26, 0.9);
    backdrop-filter: blur(10px);
    z-index: 1000;
}

.nav-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem 2rem;
}

@media (max-width: 768px) {
    .nav-links {
        display: none; /* Mobile Menü-Funktionalität hinzufügen */
    }
}
```

## JavaScript-Funktionalität

### 1. Navigationsverbesserung
```javascript
// Aktive Klasse zum aktuellen Navigationselement hinzufügen
const currentLocation = window.location.pathname;
const navLinks = document.querySelectorAll('.nav-links a');
navLinks.forEach(link => {
    if (link.getAttribute('href') === currentLocation) {
        link.classList.add('active');
    }
});
```

### 2. Sanftes Scrollen
```javascript
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        document.querySelector(this.getAttribute('href')).scrollIntoView({
            behavior: 'smooth'
        });
    });
});
```

## Beste Praktiken

1. **Dateiorganisation**
   - Zusammengehörige Dateien zusammenhalten (CSS, JS, Bilder)
   - Konsistente Namenskonventionen verwenden
   - Unterseiten in einem eigenen Ordner organisieren

2. **Responsives Design**
   - CSS Grid und Flexbox für Layouts verwenden
   - Mobile-First-Design implementieren
   - Auf verschiedenen Bildschirmgrößen testen

3. **Performance**
   - Bilder optimieren
   - CSS und JavaScript minimieren
   - Geeignete Bildformate verwenden (SVG für Icons)

4. **Wartung**
   - Code kommentieren
   - CSS-Variablen für konsistentes Styling verwenden
   - Dateistruktur organisiert halten

5. **Barrierefreiheit**
   - Semantisches HTML verwenden
   - Alt-Text für Bilder einbinden
   - Ausreichenden Farbkontrast sicherstellen

6. **Browser-Kompatibilität**
   - In mehreren Browsern testen
   - Vendor-Präfixe bei Bedarf verwenden
   - Graceful Degradation implementieren

## Fazit
Dieses Tutorial hat Ihnen gezeigt, wie Sie eine mehrsprachige Website mit der Rust-Spiel-Website als Beispiel erstellen. Die hier behandelten Prinzipien und Praktiken können auf jedes mehrsprachige Website-Projekt angewendet werden. Denken Sie beim Erstellen Ihrer eigenen Websites an Wartbarkeit, Responsivität und Benutzerfreundlichkeit.
