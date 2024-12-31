# CSS Tutorial

## Sadržaj
1. [Uvod](#uvod)
2. [Selektori](#selektori)
3. [Box Model](#box-model)
4. [Tipografija](#tipografija)
5. [Layout](#layout)
6. [Flexbox](#flexbox)
7. [Grid](#grid)
8. [Responzivni Dizajn](#responzivni-dizajn)
9. [Animacije](#animacije)
10. [Najbolje Prakse](#najbolje-prakse)

## Uvod
CSS (Cascading Style Sheets) je jezik za stiliziranje koji se koristi za opisivanje prezentacije dokumenta napisanog u HTML-u. Ovaj tutorial pokriva sve osnovne CSS koncepte i tehnike.

### Početak
1. Odaberite način uključivanja CSS-a:
   ```html
   <!-- Vanjski CSS -->
   <link rel="stylesheet" href="styles.css">
   
   <!-- Interni CSS -->
   <style>
     /* CSS pravila ovdje */
   </style>
   
   <!-- Inline CSS -->
   <div style="color: blue;">Sadržaj</div>
   ```

## Selektori

### Osnovni Selektori
```css
/* Selektor Elementa */
p {
    color: blue;
}

/* Selektor Klase */
.highlight {
    background-color: yellow;
}

/* ID Selektor */
#header {
    font-size: 24px;
}

/* Univerzalni Selektor */
* {
    margin: 0;
    padding: 0;
}
```

### Kombinatori
```css
/* Selektor Potomaka */
div p {
    margin: 10px;
}

/* Selektor Djeteta */
div > p {
    padding: 5px;
}

/* Selektor Susjednog Elementa */
h1 + p {
    font-weight: bold;
}

/* Selektor Općih Rođaka */
h1 ~ p {
    color: gray;
}
```

### Pseudo-klase i Pseudo-elementi
```css
/* Pseudo-klase */
a:hover {
    text-decoration: underline;
}

button:active {
    background-color: #ddd;
}

input:focus {
    border-color: blue;
}

/* Pseudo-elementi */
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

## Box Model

### Komponente Box Modela
```css
.box {
    /* Sadržaj */
    width: 200px;
    height: 100px;
    
    /* Padding */
    padding: 20px;
    padding-top: 10px;
    padding-right: 15px;
    padding-bottom: 10px;
    padding-left: 15px;
    
    /* Obrub */
    border: 1px solid black;
    border-width: 2px;
    border-style: solid;
    border-color: #000;
    border-radius: 5px;
    
    /* Margina */
    margin: 10px;
    margin-top: 20px;
    margin-right: 15px;
    margin-bottom: 20px;
    margin-left: 15px;
}
```

### Box Sizing
```css
/* Border-box uključuje padding i border u ukupnu širinu i visinu elementa */
* {
    box-sizing: border-box;
}

/* Content-box (default) isključuje padding i border */
.content-box {
    box-sizing: content-box;
}
```

## Tipografija

### Svojstva Fonta
```css
.text {
    /* Font Family */
    font-family: Arial, sans-serif;
    
    /* Veličina Fonta */
    font-size: 16px;
    font-size: 1.2em;
    font-size: 1.2rem;
    
    /* Debljina Fonta */
    font-weight: bold;
    font-weight: 700;
    
    /* Stil Fonta */
    font-style: italic;
    
    /* Visina Linije */
    line-height: 1.5;
    
    /* Razmak Između Slova */
    letter-spacing: 1px;
    
    /* Razmak Između Riječi */
    word-spacing: 2px;
    
    /* Poravnanje Teksta */
    text-align: center;
    
    /* Dekoracija Teksta */
    text-decoration: underline;
    
    /* Transformacija Teksta */
    text-transform: uppercase;
}
```

### Web Fontovi
```css
/* Google Fontovi */
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

/* Prilagođeni Font */
@font-face {
    font-family: 'CustomFont';
    src: url('putanja/do/fonta.woff2') format('woff2'),
         url('putanja/do/fonta.woff') format('woff');
}
```

## Layout

### Display Svojstvo
```css
.element {
    /* Uobičajene Display Vrijednosti */
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

### Pozicioniranje
```css
.positioned {
    /* Vrijednosti Pozicioniranja */
    position: static;      /* Default */
    position: relative;    /* Relativno u odnosu na normalnu poziciju */
    position: absolute;    /* Relativno u odnosu na pozicionirani parent */
    position: fixed;       /* Relativno u odnosu na viewport */
    position: sticky;      /* Hibrid relative i fixed */
    
    /* Svojstva Odmaka */
    top: 10px;
    right: 20px;
    bottom: 10px;
    left: 20px;
    
    /* Z-index */
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

### Svojstva Containera
```css
.flex-container {
    display: flex;
    
    /* Smjer */
    flex-direction: row;
    flex-direction: column;
    
    /* Prelom */
    flex-wrap: wrap;
    
    /* Poravnanje po Glavnoj Osi */
    justify-content: flex-start;
    justify-content: center;
    justify-content: space-between;
    justify-content: space-around;
    
    /* Poravnanje po Poprečnoj Osi */
    align-items: stretch;
    align-items: center;
    align-items: flex-start;
    align-items: flex-end;
    
    /* Razmak */
    gap: 10px;
}
```

### Svojstva Itema
```css
.flex-item {
    /* Redoslijed */
    order: 1;
    
    /* Rast */
    flex-grow: 1;
    
    /* Skupljanje */
    flex-shrink: 0;
    
    /* Osnovna Veličina */
    flex-basis: 200px;
    
    /* Skraćeno */
    flex: 1 0 200px;
    
    /* Samo-poravnanje */
    align-self: center;
}
```

## Grid

### Svojstva Containera
```css
.grid-container {
    display: grid;
    
    /* Definisanje Kolona */
    grid-template-columns: 200px 200px 200px;
    grid-template-columns: repeat(3, 1fr);
    grid-template-columns: minmax(100px, 1fr) 2fr 1fr;
    
    /* Definisanje Redova */
    grid-template-rows: 100px auto;
    
    /* Razmak */
    gap: 20px;
    column-gap: 20px;
    row-gap: 10px;
    
    /* Područja */
    grid-template-areas:
        "header header header"
        "sidebar main main"
        "footer footer footer";
}
```

### Svojstva Itema
```css
.grid-item {
    /* Pozicioniranje */
    grid-column: 1 / 3;
    grid-row: 1 / 2;
    
    /* Područje */
    grid-area: header;
    
    /* Poravnanje */
    justify-self: center;
    align-self: center;
}
```

## Responzivni Dizajn

### Media Queries
```css
/* Mobile First Pristup */
/* Osnovni stilovi za mobile */
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

/* Print Stilovi */
@media print {
    .no-print {
        display: none;
    }
}
```

### Responzivne Jedinice
```css
.responsive-element {
    /* Viewport Jedinice */
    width: 50vw;
    height: 50vh;
    
    /* Relativne Jedinice */
    font-size: 1.2em;
    padding: 2rem;
    
    /* Procenat */
    width: 100%;
    max-width: 1200px;
    
    /* Calc */
    width: calc(100% - 40px);
}
```

## Animacije

### Tranzicije
```css
.transition-element {
    /* Pojedinačna Svojstva */
    transition-property: all;
    transition-duration: 0.3s;
    transition-timing-function: ease-in-out;
    transition-delay: 0.1s;
    
    /* Skraćeno */
    transition: all 0.3s ease-in-out 0.1s;
}
```

### Keyframe Animacije
```css
/* Definisanje Animacije */
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

/* Primjena Animacije */
.animated-element {
    animation: slide-in 0.5s ease-out forwards;
    
    /* Svojstva Animacije */
    animation-name: slide-in;
    animation-duration: 0.5s;
    animation-timing-function: ease-out;
    animation-delay: 0.1s;
    animation-iteration-count: infinite;
    animation-direction: alternate;
    animation-fill-mode: forwards;
}
```

### Transformacije
```css
.transform-element {
    /* 2D Transformacije */
    transform: translate(50px, 100px);
    transform: rotate(45deg);
    transform: scale(1.5);
    transform: skew(10deg);
    
    /* 3D Transformacije */
    transform: rotateX(45deg);
    transform: rotateY(45deg);
    transform: perspective(1000px);
    
    /* Višestruke Transformacije */
    transform: translate(50px, 100px) rotate(45deg) scale(1.5);
}
```

## Najbolje Prakse

1. Koristite CSS Reset ili Normalize
```css
/* Jednostavan Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
```

2. Organizujte CSS sa BEM Metodologijom
```css
/* Block */
.card { }

/* Element */
.card__title { }
.card__content { }

/* Modifier */
.card--featured { }
```

3. Koristite CSS Varijable
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

4. Mobile-First Pristup
```css
/* Osnovni stilovi (mobile) */
.element {
    width: 100%;
}

/* Veći ekrani */
@media (min-width: 768px) {
    .element {
        width: 50%;
    }
}
```

5. Razmatranja Performansi
```css
/* Koristite efikasne selektore */
.specific-class { } /* Dobro */
div > div > div { } /* Izbjegavajte */

/* Izbjegavajte skupe svojstva */
.element {
    will-change: transform; /* Koristite umjereno */
}
```

## Dodatni Resursi

1. [MDN CSS Dokumentacija](https://developer.mozilla.org/bs/docs/Web/CSS)
2. [CSS-Tricks](https://css-tricks.com)
3. [Can I Use](https://caniuse.com)
4. [Flexbox Froggy](https://flexboxfroggy.com)
5. [Grid Garden](https://cssgridgarden.com)

## Projekti za Vježbu

1. Kreirajte responzivni navigacijski meni
2. Napravite card layout sa Flexbox-om
3. Dizajnirajte foto galeriju sa Grid-om
4. Implementirajte prilagođenu animaciju
5. Kreirajte responzivni form layout

Zapamtite da redovno vježbate i eksperimentišete sa različitim svojstvima i vrijednostima kako biste poboljšali svoje CSS vještine!
