# HTML Tutorial

## Sadržaj
1. [Uvod](#uvod)
2. [Osnovna Struktura](#osnovna-struktura)
3. [Tekstualni Elementi](#tekstualni-elementi)
4. [Linkovi i Slike](#linkovi-i-slike)
5. [Liste](#liste)
6. [Tabele](#tabele)
7. [Forme](#forme)
8. [Semantički Elementi](#semanticki-elementi)
9. [HTML5 Funkcije](#html5-funkcije)
10. [Najbolje Prakse](#najbolje-prakse)

## Uvod
HTML (HyperText Markup Language) je standardni markup jezik za kreiranje web stranica. Ovaj tutorial pokriva sve osnovne HTML koncepte i elemente.

### Postavljanje
1. Odaberite tekstualni editor (VS Code, Sublime Text, itd.)
2. Kreirajte novu datoteku sa `.html` ekstenzijom
3. Počnite sa osnovnom HTML strukturom

## Osnovna Struktura

### HTML Predložak Dokumenta
```html
<!DOCTYPE html>
<html lang="bs">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Moja Prva HTML Stranica</title>
</head>
<body>
    <!-- Sadržaj dolazi ovdje -->
</body>
</html>
```

### Elementi Head Sekcije
```html
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Opis stranice">
    <meta name="keywords" content="HTML, tutorial, web">
    <meta name="author" content="Vaše Ime">
    <link rel="stylesheet" href="styles.css">
    <script src="script.js"></script>
</head>
```

## Tekstualni Elementi

### Naslovi
```html
<h1>Glavni Naslov</h1>
<h2>Podnaslov</h2>
<h3>Naslov Nivo 3</h3>
<h4>Naslov Nivo 4</h4>
<h5>Naslov Nivo 5</h5>
<h6>Naslov Nivo 6</h6>
```

### Paragrafi i Formatiranje Teksta
```html
<p>Ovo je paragraf.</p>
<p>Ovo je drugi paragraf sa <strong>podebljanim tekstom</strong> i <em>kurzivnim tekstom</em>.</p>
<p>Također možete koristiti <b>podebljano</b> i <i>kurziv</i> tagove.</p>
<p>Ovaj tekst sadrži <br>prelom linije.</p>
<hr>
<p>Horizontalna linija iznad.</p>
```

## Linkovi i Slike

### Linkovi
```html
<!-- Vanjski Link -->
<a href="https://www.primjer.ba">Posjetite Primjer.ba</a>

<!-- Unutrašnji Link -->
<a href="/o-nama.html">O nama</a>

<!-- Link sa Targetom -->
<a href="https://www.primjer.ba" target="_blank">Otvori u Novom Tabu</a>

<!-- Link za Email -->
<a href="mailto:primjer@email.ba">Pošalji Email</a>

<!-- Link za Telefon -->
<a href="tel:+38761234567">Nazovite nas</a>
```

### Slike
```html
<!-- Osnovna Slika -->
<img src="slika.jpg" alt="Opis">

<!-- Slika sa Veličinom -->
<img src="slika.jpg" alt="Opis" width="300" height="200">

<!-- Slika kao Link -->
<a href="stranica.html">
    <img src="slika.jpg" alt="Klikni ovdje">
</a>
```

## Liste

### Neuređene Liste
```html
<ul>
    <li>Prva stavka</li>
    <li>Druga stavka</li>
    <li>Treća stavka</li>
</ul>
```

### Uređene Liste
```html
<ol>
    <li>Prva stavka</li>
    <li>Druga stavka</li>
    <li>Treća stavka</li>
</ol>
```

### Liste Definicija
```html
<dl>
    <dt>Pojam 1</dt>
    <dd>Definicija 1</dd>
    <dt>Pojam 2</dt>
    <dd>Definicija 2</dd>
</dl>
```

## Tabele

### Osnovna Struktura Tabele
```html
<table>
    <thead>
        <tr>
            <th>Zaglavlje 1</th>
            <th>Zaglavlje 2</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Red 1, Ćelija 1</td>
            <td>Red 1, Ćelija 2</td>
        </tr>
        <tr>
            <td>Red 2, Ćelija 1</td>
            <td>Red 2, Ćelija 2</td>
        </tr>
    </tbody>
</table>
```

### Tabela sa Colspan i Rowspan
```html
<table>
    <tr>
        <td colspan="2">Ćelija preko 2 kolone</td>
    </tr>
    <tr>
        <td rowspan="2">Ćelija preko 2 reda</td>
        <td>Obična ćelija</td>
    </tr>
    <tr>
        <td>Obična ćelija</td>
    </tr>
</table>
```

## Forme

### Osnovna Struktura Forme
```html
<form action="/posalji" method="post">
    <!-- Elementi forme dolaze ovdje -->
</form>
```

### Tipovi Unosa
```html
<!-- Tekstualni Unos -->
<input type="text" name="korisnickoime" placeholder="Unesite korisničko ime">

<!-- Unos Lozinke -->
<input type="password" name="lozinka" placeholder="Unesite lozinku">

<!-- Email Unos -->
<input type="email" name="email" placeholder="Unesite email">

<!-- Numerički Unos -->
<input type="number" name="godine" min="0" max="120">

<!-- Unos Datuma -->
<input type="date" name="datumrodjenja">

<!-- Checkbox -->
<input type="checkbox" name="newsletter" id="newsletter">
<label for="newsletter">Pretplatite se na newsletter</label>

<!-- Radio Dugmad -->
<input type="radio" name="spol" value="musko" id="musko">
<label for="musko">Muško</label>
<input type="radio" name="spol" value="zensko" id="zensko">
<label for="zensko">Žensko</label>

<!-- Padajuća Lista -->
<select name="drzava">
    <option value="">Odaberite državu</option>
    <option value="ba">Bosna i Hercegovina</option>
    <option value="hr">Hrvatska</option>
    <option value="rs">Srbija</option>
</select>

<!-- Tekstualno Polje -->
<textarea name="poruka" rows="4" cols="50"></textarea>

<!-- Upload Datoteke -->
<input type="file" name="dokument">

<!-- Dugme za Slanje -->
<input type="submit" value="Pošalji">
```

## Semantički Elementi

### Struktura Stranice
```html
<header>
    <nav>
        <!-- Navigacijski sadržaj -->
    </nav>
</header>

<main>
    <article>
        <section>
            <!-- Sekcija članka -->
        </section>
    </article>
    
    <aside>
        <!-- Bočni sadržaj -->
    </aside>
</main>

<footer>
    <!-- Sadržaj podnožja -->
</footer>
```

### Elementi Sadržaja
```html
<figure>
    <img src="slika.jpg" alt="Opis">
    <figcaption>Opis slike</figcaption>
</figure>

<time datetime="2024-12-25">25. decembar 2024.</time>

<mark>Označeni tekst</mark>

<details>
    <summary>Kliknite za više</summary>
    <p>Detaljni sadržaj ovdje</p>
</details>
```

## HTML5 Funkcije

### Audio i Video
```html
<!-- Audio -->
<audio controls>
    <source src="audio.mp3" type="audio/mpeg">
    Vaš pretraživač ne podržava audio.
</audio>

<!-- Video -->
<video width="320" height="240" controls>
    <source src="video.mp4" type="video/mp4">
    Vaš pretraživač ne podržava video.
</video>
```

### Canvas
```html
<canvas id="mojCanvas" width="200" height="100"></canvas>
```

### SVG
```html
<svg width="100" height="100">
    <circle cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red" />
</svg>
```

## Najbolje Prakse

1. Uvijek deklarišite DOCTYPE
2. Koristite semantičke HTML elemente
3. Uključite alt atribute za slike
4. Koristite pravilno uvlačenje
5. Validirajte vaš HTML kod
6. Učinite vašu stranicu pristupačnom
7. Koristite smislena imena klasa i ID-eva
8. Održavajte kod čistim i organizovanim
9. Testirajte u različitim pretraživačima
10. Pratite HTML standarde

## Dodatni Resursi

1. [MDN Web Docs](https://developer.mozilla.org/bs/docs/Web/HTML)
2. [W3Schools HTML Tutorial](https://www.w3schools.com/html/)
3. [HTML5 Specifikacija](https://html.spec.whatwg.org/)
4. [Can I Use](https://caniuse.com/)

## Projekti za Vježbu

1. Kreirajte lični portfolio
2. Napravite blog layout
3. Dizajnirajte kontakt formu
4. Kreirajte landing stranicu proizvoda
5. Napravite stranicu menija restorana

Zapamtite da redovno vježbate i eksperimentišete sa različitim HTML elementima i atributima kako biste poboljšali svoje vještine!
