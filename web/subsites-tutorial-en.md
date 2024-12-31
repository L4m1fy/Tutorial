# Creating a Multi-Page Website: A Practical Guide with Rust Game Website Example

## Table of Contents
1. [Introduction](#introduction)
2. [Project Structure](#project-structure)
3. [Implementation Guide](#implementation-guide)
4. [Styling Guide](#styling-guide)
5. [JavaScript Functionality](#javascript-functionality)
6. [Best Practices](#best-practices)

## Introduction
This tutorial demonstrates how to create a multi-page website using a Rust game website as an example. You'll learn how to structure your files, create consistent navigation, and implement responsive design.

## Project Structure
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

## Implementation Guide

### 1. Setting Up the Base HTML Structure
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rust Game Guide</title>
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
                <li><a href="index.html">Home</a></li>
                <li><a href="pages/weapons.html">Weapons</a></li>
                <li><a href="pages/bases.html">Base Building</a></li>
                <li><a href="pages/monuments.html">Monuments</a></li>
                <li><a href="pages/survival.html">Survival Guide</a></li>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <main>
        <!-- Content here -->
    </main>

    <!-- Footer -->
    <footer class="footer">
        <!-- Footer content -->
    </footer>
</body>
</html>
```

### 2. Creating Subpages
Each subpage follows the same structure but with different content. Example for weapons.html:

```html
<!-- pages/weapons.html -->
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Same head content as index.html but with adjusted paths -->
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <!-- Same navigation with adjusted paths -->
    <nav class="navbar">
        <!-- Navigation content -->
    </nav>

    <!-- Page-specific content -->
    <section class="hero">
        <div class="hero-content">
            <h1>Weapons Guide</h1>
            <p>Master the art of combat in Rust</p>
        </div>
    </section>

    <!-- Weapon categories and content -->
    <section class="section">
        <!-- Content here -->
    </section>

    <!-- Footer -->
    <footer class="footer">
        <!-- Footer content -->
    </footer>
</body>
</html>
```

## Styling Guide

### 1. CSS Variables and Base Styles
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
        display: none; /* Add mobile menu functionality */
    }
}
```

## JavaScript Functionality

### 1. Navigation Enhancement
```javascript
// Add active class to current navigation item
const currentLocation = window.location.pathname;
const navLinks = document.querySelectorAll('.nav-links a');
navLinks.forEach(link => {
    if (link.getAttribute('href') === currentLocation) {
        link.classList.add('active');
    }
});
```

### 2. Smooth Scrolling
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

## Best Practices

1. **File Organization**
   - Keep related files together (CSS, JS, images)
   - Use consistent naming conventions
   - Organize subpages in a dedicated folder

2. **Responsive Design**
   - Use CSS Grid and Flexbox for layouts
   - Implement mobile-first design
   - Test on various screen sizes

3. **Performance**
   - Optimize images
   - Minimize CSS and JavaScript
   - Use appropriate image formats (SVG for icons)

4. **Maintenance**
   - Comment your code
   - Use CSS variables for consistent styling
   - Keep your file structure organized

5. **Accessibility**
   - Use semantic HTML
   - Include alt text for images
   - Ensure proper color contrast

6. **Cross-Browser Compatibility**
   - Test on multiple browsers
   - Use vendor prefixes when needed
   - Implement graceful degradation

## Conclusion
This tutorial showed you how to create a multi-page website using the Rust game website as an example. The principles and practices covered here can be applied to any multi-page website project. Remember to focus on maintainability, responsiveness, and user experience when building your own websites.
