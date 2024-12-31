# CSS Туторијал

## Садржај
1. [Увод](#увод)
2. [Селектори](#селектори)
3. [Box Model](#box-model)
4. [Типографија](#типографија)
5. [Лејаут](#лејаут)
6. [Флексбокс](#флексбокс)
7. [Грид](#грид)
8. [Респонзивни Дизајн](#респонзивни-дизајн)
9. [Анимације](#анимације)
10. [Најбоље Праксе](#најбоље-праксе)

## Увод
CSS (Cascading Style Sheets) је језик за стилизовање који се користи за описивање презентације документа написаног у HTML-у. Овај туторијал покрива све основне CSS концепте и технике.

### Почетак
1. Одаберите начин укључивања CSS-а:
   ```html
   <!-- Спољни CSS -->
   <link rel="stylesheet" href="styles.css">
   
   <!-- Интерни CSS -->
   <style>
     /* CSS правила овде */
   </style>
   
   <!-- Инлајн CSS -->
   <div style="color: blue;">Садржај</div>
   ```

## Селектори

### Основни Селектори
```css
/* Селектор Елемента */
p {
    color: blue;
}

/* Селектор Класе */
.highlight {
    background-color: yellow;
}

/* ID Селектор */
#header {
    font-size: 24px;
}

/* Универзални Селектор */
* {
    margin: 0;
    padding: 0;
}
```

### Комбинатори
```css
/* Селектор Потомака */
div p {
    margin: 10px;
}

/* Селектор Детета */
div > p {
    padding: 5px;
}

/* Селектор Суседног Елемента */
h1 + p {
    font-weight: bold;
}

/* Селектор Општих Рођака */
h1 ~ p {
    color: gray;
}
```

### Псеудо-класе и Псеудо-елементи
```css
/* Псеудо-класе */
a:hover {
    text-decoration: underline;
}

button:active {
    background-color: #ddd;
}

input:focus {
    border-color: blue;
}

/* Псеудо-елементи */
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

### Компоненте Box Модела
```css
.box {
    /* Садржај */
    width: 200px;
    height: 100px;
    
    /* Падинг */
    padding: 20px;
    padding-top: 10px;
    padding-right: 15px;
    padding-bottom: 10px;
    padding-left: 15px;
    
    /* Ивица */
    border: 1px solid black;
    border-width: 2px;
    border-style: solid;
    border-color: #000;
    border-radius: 5px;
    
    /* Маргина */
    margin: 10px;
    margin-top: 20px;
    margin-right: 15px;
    margin-bottom: 20px;
    margin-left: 15px;
}
```

### Box Sizing
```css
/* Border-box укључује падинг и ивицу у укупну ширину и висину елемента */
* {
    box-sizing: border-box;
}

/* Content-box (подразумевано) искључује падинг и ивицу */
.content-box {
    box-sizing: content-box;
}
```

## Типографија

### Својства Фонта
```css
.text {
    /* Фамилија Фонта */
    font-family: Arial, sans-serif;
    
    /* Величина Фонта */
    font-size: 16px;
    font-size: 1.2em;
    font-size: 1.2rem;
    
    /* Дебљина Фонта */
    font-weight: bold;
    font-weight: 700;
    
    /* Стил Фонта */
    font-style: italic;
    
    /* Висина Линије */
    line-height: 1.5;
    
    /* Размак Између Слова */
    letter-spacing: 1px;
    
    /* Размак Између Речи */
    word-spacing: 2px;
    
    /* Поравнање Текста */
    text-align: center;
    
    /* Декорација Текста */
    text-decoration: underline;
    
    /* Трансформација Текста */
    text-transform: uppercase;
}
```

### Веб Фонтови
```css
/* Google Фонтови */
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

/* Прилагођени Фонт */
@font-face {
    font-family: 'CustomFont';
    src: url('путања/до/фонта.woff2') format('woff2'),
         url('путања/до/фонта.woff') format('woff');
}
```

## Лејаут

### Display Својство
```css
.element {
    /* Уобичајене Display Вредности */
    display: block;
    display: inline;
    display: inline-block;
    display: none;
    
    /* Флексбокс */
    display: flex;
    
    /* Грид */
    display: grid;
}
```

### Позиционирање
```css
.positioned {
    /* Вредности Позиционирања */
    position: static;      /* Подразумевано */
    position: relative;    /* Релативно у односу на нормалну позицију */
    position: absolute;    /* Релативно у односу на позиционирани родитељ */
    position: fixed;       /* Релативно у односу на viewport */
    position: sticky;      /* Хибрид relative и fixed */
    
    /* Својства Одмака */
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

## Флексбокс

### Својства Контејнера
```css
.flex-container {
    display: flex;
    
    /* Смер */
    flex-direction: row;
    flex-direction: column;
    
    /* Прелом */
    flex-wrap: wrap;
    
    /* Поравнање по Главној Оси */
    justify-content: flex-start;
    justify-content: center;
    justify-content: space-between;
    justify-content: space-around;
    
    /* Поравнање по Попречној Оси */
    align-items: stretch;
    align-items: center;
    align-items: flex-start;
    align-items: flex-end;
    
    /* Размак */
    gap: 10px;
}
```

### Својства Итема
```css
.flex-item {
    /* Редослед */
    order: 1;
    
    /* Раст */
    flex-grow: 1;
    
    /* Скупљање */
    flex-shrink: 0;
    
    /* Основна Величина */
    flex-basis: 200px;
    
    /* Скраћено */
    flex: 1 0 200px;
    
    /* Само-поравнање */
    align-self: center;
}
```

## Грид

### Својства Контејнера
```css
.grid-container {
    display: grid;
    
    /* Дефинисање Колона */
    grid-template-columns: 200px 200px 200px;
    grid-template-columns: repeat(3, 1fr);
    grid-template-columns: minmax(100px, 1fr) 2fr 1fr;
    
    /* Дефинисање Редова */
    grid-template-rows: 100px auto;
    
    /* Размак */
    gap: 20px;
    column-gap: 20px;
    row-gap: 10px;
    
    /* Области */
    grid-template-areas:
        "header header header"
        "sidebar main main"
        "footer footer footer";
}
```

### Својства Итема
```css
.grid-item {
    /* Позиционирање */
    grid-column: 1 / 3;
    grid-row: 1 / 2;
    
    /* Област */
    grid-area: header;
    
    /* Поравнање */
    justify-self: center;
    align-self: center;
}
```

## Респонзивни Дизајн

### Media Queries
```css
/* Mobile First Приступ */
/* Основни стилови за мобилне */
.element {
    width: 100%;
}

/* Таблет */
@media screen and (min-width: 768px) {
    .element {
        width: 50%;
    }
}

/* Десктоп */
@media screen and (min-width: 1024px) {
    .element {
        width: 33.33%;
    }
}

/* Принт Стилови */
@media print {
    .no-print {
        display: none;
    }
}
```

### Респонзивне Јединице
```css
.responsive-element {
    /* Viewport Јединице */
    width: 50vw;
    height: 50vh;
    
    /* Релативне Јединице */
    font-size: 1.2em;
    padding: 2rem;
    
    /* Проценат */
    width: 100%;
    max-width: 1200px;
    
    /* Calc */
    width: calc(100% - 40px);
}
```

## Анимације

### Транзиције
```css
.transition-element {
    /* Појединачна Својства */
    transition-property: all;
    transition-duration: 0.3s;
    transition-timing-function: ease-in-out;
    transition-delay: 0.1s;
    
    /* Скраћено */
    transition: all 0.3s ease-in-out 0.1s;
}
```

### Keyframe Анимације
```css
/* Дефинисање Анимације */
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

/* Примена Анимације */
.animated-element {
    animation: slide-in 0.5s ease-out forwards;
    
    /* Својства Анимације */
    animation-name: slide-in;
    animation-duration: 0.5s;
    animation-timing-function: ease-out;
    animation-delay: 0.1s;
    animation-iteration-count: infinite;
    animation-direction: alternate;
    animation-fill-mode: forwards;
}
```

### Трансформације
```css
.transform-element {
    /* 2D Трансформације */
    transform: translate(50px, 100px);
    transform: rotate(45deg);
    transform: scale(1.5);
    transform: skew(10deg);
    
    /* 3D Трансформације */
    transform: rotateX(45deg);
    transform: rotateY(45deg);
    transform: perspective(1000px);
    
    /* Вишеструке Трансформације */
    transform: translate(50px, 100px) rotate(45deg) scale(1.5);
}
```

## Најбоље Праксе

1. Користите CSS Reset или Normalize
```css
/* Једноставан Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
```

2. Организујте CSS са BEM Методологијом
```css
/* Block */
.card { }

/* Element */
.card__title { }
.card__content { }

/* Modifier */
.card--featured { }
```

3. Користите CSS Варијабле
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

4. Mobile-First Приступ
```css
/* Основни стилови (мобилни) */
.element {
    width: 100%;
}

/* Већи екрани */
@media (min-width: 768px) {
    .element {
        width: 50%;
    }
}
```

5. Разматрања Перформанси
```css
/* Користите ефикасне селекторе */
.specific-class { } /* Добро */
div > div > div { } /* Избегавајте */

/* Избегавајте скупа својства */
.element {
    will-change: transform; /* Користите умерено */
}
```

## Додатни Ресурси

1. [MDN CSS Документација](https://developer.mozilla.org/sr/docs/Web/CSS)
2. [CSS-Tricks](https://css-tricks.com)
3. [Can I Use](https://caniuse.com)
4. [Flexbox Froggy](https://flexboxfroggy.com)
5. [Grid Garden](https://cssgridgarden.com)

## Пројекти за Вежбу

1. Креирајте респонзивни навигациони мени
2. Направите card layout са Флексбоксом
3. Дизајнирајте фото галерију са Гридом
4. Имплементирајте прилагођену анимацију
5. Креирајте респонзивни form layout

Запамтите да редовно вежбате и експериментишете са различитим својствима и вредностима како бисте побољшали своје CSS вештине!
