# Креирање вишејезичног веб сајта: Практични водич са Rust игрицом као примером

## Садржај
1. [Увод](#увод)
2. [Структура пројекта](#структура-пројекта)
3. [Водич за имплементацију](#водич-за-имплементацију)
4. [Водич за стилизовање](#водич-за-стилизовање)
5. [JavaScript функционалност](#javascript-функционалност)
6. [Најбоље праксе](#најбоље-праксе)

## Увод
Овај туторијал ће вам показати како да креирате вишејезични веб сајт користећи веб сајт Rust игрице као пример. Научићете како да структурирате фајлове, креирате конзистентну навигацију и имплементирате респонзиван дизајн.

## Структура пројекта
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

## Водич за имплементацију

### 1. Постављање основне HTML структуре
```html
<!DOCTYPE html>
<html lang="sr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rust водич за игру</title>
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <!-- Навигација -->
    <nav class="navbar">
        <div class="container nav-container">
            <a href="index.html" class="logo">RUST</a>
            <ul class="nav-links">
                <li><a href="index.html">Почетна</a></li>
                <li><a href="pages/weapons.html">Оружје</a></li>
                <li><a href="pages/bases.html">Изградња базе</a></li>
                <li><a href="pages/monuments.html">Споменици</a></li>
                <li><a href="pages/survival.html">Водич за преживљавање</a></li>
            </ul>
        </div>
    </nav>

    <!-- Главни садржај -->
    <main>
        <!-- Садржај овде -->
    </main>

    <!-- Подножје -->
    <footer class="footer">
        <!-- Садржај подножја -->
    </footer>
</body>
</html>
```

### 2. Креирање подстраница
Свака подстраница прати исту структуру, али са различитим садржајем. Пример за weapons.html:

```html
<!-- pages/weapons.html -->
<!DOCTYPE html>
<html lang="sr">
<head>
    <!-- Исти садржај као у index.html, али са прилагођеним путањама -->
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <!-- Иста навигација са прилагођеним путањама -->
    <nav class="navbar">
        <!-- Садржај навигације -->
    </nav>

    <!-- Специфични садржај странице -->
    <section class="hero">
        <div class="hero-content">
            <h1>Водич за оружје</h1>
            <p>Овладајте вештином борбе у Rust-у</p>
        </div>
    </section>

    <!-- Категорије оружја и садржај -->
    <section class="section">
        <!-- Садржај овде -->
    </section>

    <!-- Подножје -->
    <footer class="footer">
        <!-- Садржај подножја -->
    </footer>
</body>
</html>
```

## Водич за стилизовање

### 1. CSS варијабле и основни стилови
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

### 2. Респонзивна навигација
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
        display: none; /* Додати функционалност мобилног менија */
    }
}
```

## JavaScript функционалност

### 1. Унапређење навигације
```javascript
// Додавање активне класе тренутном елементу навигације
const currentLocation = window.location.pathname;
const navLinks = document.querySelectorAll('.nav-links a');
navLinks.forEach(link => {
    if (link.getAttribute('href') === currentLocation) {
        link.classList.add('active');
    }
});
```

### 2. Глатко скроловање
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

## Најбоље праксе

1. **Организација фајлова**
   - Држите повезане фајлове заједно (CSS, JS, слике)
   - Користите конзистентне конвенције именовања
   - Организујте подстранице у засебном фолдеру

2. **Респонзиван дизајн**
   - Користите CSS Grid и Flexbox за распоред
   - Имплементирајте Mobile-First дизајн
   - Тестирајте на различитим величинама екрана

3. **Перформансе**
   - Оптимизујте слике
   - Минификујте CSS и JavaScript
   - Користите одговарајуће формате слика (SVG за иконе)

4. **Одржавање**
   - Коментаришите код
   - Користите CSS варијабле за конзистентно стилизовање
   - Одржавајте организовану структуру фајлова

5. **Приступачност**
   - Користите семантички HTML
   - Додајте alt текст за слике
   - Обезбедите довољан контраст боја

6. **Компатибилност са претраживачима**
   - Тестирајте у различитим претраживачима
   - Користите vendor префиксе када је потребно
   - Имплементирајте Graceful Degradation

## Закључак
Овај туторијал вам је показао како да креирате вишејезични веб сајт користећи веб сајт Rust игрице као пример. Принципи и праксе обрађени овде могу се применити на било који вишејезични веб пројекат. Приликом креирања сопствених веб сајтова, имајте на уму одржавање, респонзивност и корисничко искуство.
