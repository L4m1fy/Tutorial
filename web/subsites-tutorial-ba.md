# Kreiranje višejezične web stranice: Praktični vodič sa Rust igricom kao primjerom

## Sadržaj
1. [Uvod](#uvod)
2. [Struktura projekta](#struktura-projekta)
3. [Vodič za implementaciju](#vodič-za-implementaciju)
4. [Vodič za stilizovanje](#vodič-za-stilizovanje)
5. [JavaScript funkcionalnost](#javascript-funkcionalnost)
6. [Najbolje prakse](#najbolje-prakse)

## Uvod
Ovaj tutorijal će vam pokazati kako da kreirate višejezičnu web stranicu koristeći web stranicu Rust igrice kao primjer. Naučit ćete kako da strukturirate fajlove, kreirate konzistentnu navigaciju i implementirate responsivan dizajn.

## Struktura projekta
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

## Vodič za implementaciju

### 1. Postavljanje osnovne HTML strukture
```html
<!DOCTYPE html>
<html lang="bs">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rust vodič za igru</title>
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <!-- Navigacija -->
    <nav class="navbar">
        <div class="container nav-container">
            <a href="index.html" class="logo">RUST</a>
            <ul class="nav-links">
                <li><a href="index.html">Početna</a></li>
                <li><a href="pages/weapons.html">Oružje</a></li>
                <li><a href="pages/bases.html">Izgradnja baze</a></li>
                <li><a href="pages/monuments.html">Spomenici</a></li>
                <li><a href="pages/survival.html">Vodič za preživljavanje</a></li>
            </ul>
        </div>
    </nav>

    <!-- Glavni sadržaj -->
    <main>
        <!-- Sadržaj ovdje -->
    </main>

    <!-- Podnožje -->
    <footer class="footer">
        <!-- Sadržaj podnožja -->
    </footer>
</body>
</html>
```

### 2. Kreiranje podstranica
Svaka podstranica prati istu strukturu, ali sa različitim sadržajem. Primjer za weapons.html:

```html
<!-- pages/weapons.html -->
<!DOCTYPE html>
<html lang="bs">
<head>
    <!-- Isti sadržaj kao u index.html, ali sa prilagođenim putanjama -->
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <!-- Ista navigacija sa prilagođenim putanjama -->
    <nav class="navbar">
        <!-- Sadržaj navigacije -->
    </nav>

    <!-- Specifični sadržaj stranice -->
    <section class="hero">
        <div class="hero-content">
            <h1>Vodič za oružje</h1>
            <p>Ovladajte vještinom borbe u Rust-u</p>
        </div>
    </section>

    <!-- Kategorije oružja i sadržaj -->
    <section class="section">
        <!-- Sadržaj ovdje -->
    </section>

    <!-- Podnožje -->
    <footer class="footer">
        <!-- Sadržaj podnožja -->
    </footer>
</body>
</html>
```

## Vodič za stilizovanje

### 1. CSS varijable i osnovni stilovi
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

### 2. Responsivna navigacija
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
        display: none; /* Dodati funkcionalnost mobilnog menija */
    }
}
```

## JavaScript funkcionalnost

### 1. Unapređenje navigacije
```javascript
// Dodavanje aktivne klase trenutnom elementu navigacije
const currentLocation = window.location.pathname;
const navLinks = document.querySelectorAll('.nav-links a');
navLinks.forEach(link => {
    if (link.getAttribute('href') === currentLocation) {
        link.classList.add('active');
    }
});
```

### 2. Glatko skrolovanje
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

## Najbolje prakse

1. **Organizacija fajlova**
   - Držite povezane fajlove zajedno (CSS, JS, slike)
   - Koristite konzistentne konvencije imenovanja
   - Organizujte podstranice u zasebnom folderu

2. **Responsivan dizajn**
   - Koristite CSS Grid i Flexbox za raspored
   - Implementirajte Mobile-First dizajn
   - Testirajte na različitim veličinama ekrana

3. **Performanse**
   - Optimizujte slike
   - Minifikujte CSS i JavaScript
   - Koristite odgovarajuće formate slika (SVG za ikone)

4. **Održavanje**
   - Komentarišite kod
   - Koristite CSS varijable za konzistentno stilizovanje
   - Održavajte organizovanu strukturu fajlova

5. **Pristupačnost**
   - Koristite semantički HTML
   - Dodajte alt tekst za slike
   - Obezbijedite dovoljan kontrast boja

6. **Kompatibilnost sa pretraživačima**
   - Testirajte u različitim pretraživačima
   - Koristite vendor prefikse kada je potrebno
   - Implementirajte Graceful Degradation

## Zaključak
Ovaj tutorijal vam je pokazao kako da kreirate višejezičnu web stranicu koristeći web stranicu Rust igrice kao primjer. Principi i prakse obrađeni ovdje mogu se primijeniti na bilo koji višejezični web projekat. Prilikom kreiranja vlastitih web stranica, imajte na umu održavanje, responsivnost i korisničko iskustvo.
