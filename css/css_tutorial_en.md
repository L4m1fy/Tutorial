# CSS Tutorial

## Table of Contents
1. [Introduction](#introduction)
2. [Selectors](#selectors)
3. [Box Model](#box-model)
4. [Typography](#typography)
5. [Layout](#layout)
6. [Flexbox](#flexbox)
7. [Grid](#grid)
8. [Responsive Design](#responsive-design)
9. [Animations](#animations)
10. [Best Practices](#best-practices)
11. [Modern CSS Features](#modern-css-features)
12. [Advanced Projects](#advanced-projects)

## Introduction
CSS (Cascading Style Sheets) is a style sheet language used for describing the presentation of a document written in HTML. This tutorial covers all essential CSS concepts and techniques.

### Getting Started
1. Choose how to include CSS:
   ```html
   <!-- External CSS -->
   <link rel="stylesheet" href="styles.css">
   
   <!-- Internal CSS -->
   <style>
     /* CSS rules here */
   </style>
   
   <!-- Inline CSS -->
   <div style="color: blue;">Content</div>
   ```

## Selectors

### Basic Selectors
```css
/* Element Selector */
p {
    color: blue;
}

/* Class Selector */
.highlight {
    background-color: yellow;
}

/* ID Selector */
#header {
    font-size: 24px;
}

/* Universal Selector */
* {
    margin: 0;
    padding: 0;
}
```

### Combinators
```css
/* Descendant Selector */
div p {
    margin: 10px;
}

/* Child Selector */
div > p {
    padding: 5px;
}

/* Adjacent Sibling Selector */
h1 + p {
    font-weight: bold;
}

/* General Sibling Selector */
h1 ~ p {
    color: gray;
}
```

### Pseudo-classes and Pseudo-elements
```css
/* Pseudo-classes */
a:hover {
    text-decoration: underline;
}

button:active {
    background-color: #ddd;
}

input:focus {
    border-color: blue;
}

/* Pseudo-elements */
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

### Box Model Components
```css
.box {
    /* Content */
    width: 200px;
    height: 100px;
    
    /* Padding */
    padding: 20px;
    padding-top: 10px;
    padding-right: 15px;
    padding-bottom: 10px;
    padding-left: 15px;
    
    /* Border */
    border: 1px solid black;
    border-width: 2px;
    border-style: solid;
    border-color: #000;
    border-radius: 5px;
    
    /* Margin */
    margin: 10px;
    margin-top: 20px;
    margin-right: 15px;
    margin-bottom: 20px;
    margin-left: 15px;
}
```

### Box Sizing
```css
/* Border-box includes padding and border in element's total width and height */
* {
    box-sizing: border-box;
}

/* Content-box (default) excludes padding and border */
.content-box {
    box-sizing: content-box;
}
```

## Typography

### Font Properties
```css
.text {
    /* Font Family */
    font-family: Arial, sans-serif;
    
    /* Font Size */
    font-size: 16px;
    font-size: 1.2em;
    font-size: 1.2rem;
    
    /* Font Weight */
    font-weight: bold;
    font-weight: 700;
    
    /* Font Style */
    font-style: italic;
    
    /* Line Height */
    line-height: 1.5;
    
    /* Letter Spacing */
    letter-spacing: 1px;
    
    /* Word Spacing */
    word-spacing: 2px;
    
    /* Text Alignment */
    text-align: center;
    
    /* Text Decoration */
    text-decoration: underline;
    
    /* Text Transform */
    text-transform: uppercase;
}
```

### Web Fonts
```css
/* Google Fonts */
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

/* Custom Font Face */
@font-face {
    font-family: 'CustomFont';
    src: url('path/to/font.woff2') format('woff2'),
         url('path/to/font.woff') format('woff');
}
```

## Layout

### Display Property
```css
.element {
    /* Common Display Values */
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

### Position
```css
.positioned {
    /* Position Values */
    position: static;      /* Default */
    position: relative;    /* Relative to normal position */
    position: absolute;    /* Relative to positioned parent */
    position: fixed;       /* Relative to viewport */
    position: sticky;      /* Hybrid of relative and fixed */
    
    /* Offset Properties */
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

### Container Properties
```css
.flex-container {
    display: flex;
    
    /* Direction */
    flex-direction: row;
    flex-direction: column;
    
    /* Wrapping */
    flex-wrap: wrap;
    
    /* Justify Content (Main Axis) */
    justify-content: flex-start;
    justify-content: center;
    justify-content: space-between;
    justify-content: space-around;
    
    /* Align Items (Cross Axis) */
    align-items: stretch;
    align-items: center;
    align-items: flex-start;
    align-items: flex-end;
    
    /* Gap */
    gap: 10px;
}
```

### Item Properties
```css
.flex-item {
    /* Order */
    order: 1;
    
    /* Flex Grow */
    flex-grow: 1;
    
    /* Flex Shrink */
    flex-shrink: 0;
    
    /* Flex Basis */
    flex-basis: 200px;
    
    /* Shorthand */
    flex: 1 0 200px;
    
    /* Align Self */
    align-self: center;
}
```

## Grid

### Container Properties
```css
.grid-container {
    display: grid;
    
    /* Define Columns */
    grid-template-columns: 200px 200px 200px;
    grid-template-columns: repeat(3, 1fr);
    grid-template-columns: minmax(100px, 1fr) 2fr 1fr;
    
    /* Define Rows */
    grid-template-rows: 100px auto;
    
    /* Gap */
    gap: 20px;
    column-gap: 20px;
    row-gap: 10px;
    
    /* Areas */
    grid-template-areas:
        "header header header"
        "sidebar main main"
        "footer footer footer";
}
```

### Item Properties
```css
.grid-item {
    /* Placement */
    grid-column: 1 / 3;
    grid-row: 1 / 2;
    
    /* Area */
    grid-area: header;
    
    /* Alignment */
    justify-self: center;
    align-self: center;
}
```

## Responsive Design

### Media Queries
```css
/* Mobile First Approach */
/* Base styles for mobile */
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

/* Print Styles */
@media print {
    .no-print {
        display: none;
    }
}
```

### Responsive Units
```css
.responsive-element {
    /* Viewport Units */
    width: 50vw;
    height: 50vh;
    
    /* Relative Units */
    font-size: 1.2em;
    padding: 2rem;
    
    /* Percentage */
    width: 100%;
    max-width: 1200px;
    
    /* Calc */
    width: calc(100% - 40px);
}
```

## Animations

### Transitions
```css
.transition-element {
    /* Individual Properties */
    transition-property: all;
    transition-duration: 0.3s;
    transition-timing-function: ease-in-out;
    transition-delay: 0.1s;
    
    /* Shorthand */
    transition: all 0.3s ease-in-out 0.1s;
}
```

### Keyframe Animations
```css
/* Define Animation */
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

/* Apply Animation */
.animated-element {
    animation: slide-in 0.5s ease-out forwards;
    
    /* Animation Properties */
    animation-name: slide-in;
    animation-duration: 0.5s;
    animation-timing-function: ease-out;
    animation-delay: 0.1s;
    animation-iteration-count: infinite;
    animation-direction: alternate;
    animation-fill-mode: forwards;
}
```

### Transforms
```css
.transform-element {
    /* 2D Transforms */
    transform: translate(50px, 100px);
    transform: rotate(45deg);
    transform: scale(1.5);
    transform: skew(10deg);
    
    /* 3D Transforms */
    transform: rotateX(45deg);
    transform: rotateY(45deg);
    transform: perspective(1000px);
    
    /* Multiple Transforms */
    transform: translate(50px, 100px) rotate(45deg) scale(1.5);
}
```

## Best Practices

1. Use a CSS Reset or Normalize
```css
/* Simple Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
```

2. Organize CSS with BEM Methodology
```css
/* Block */
.card { }

/* Element */
.card__title { }
.card__content { }

/* Modifier */
.card--featured { }
```

3. Use CSS Variables (Custom Properties)
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

4. Mobile-First Approach
```css
/* Base styles (mobile) */
.element {
    width: 100%;
}

/* Larger screens */
@media (min-width: 768px) {
    .element {
        width: 50%;
    }
}
```

5. Performance Considerations
```css
/* Use efficient selectors */
.specific-class { } /* Good */
div > div > div { } /* Avoid */

/* Avoid expensive properties */
.element {
    will-change: transform; /* Use sparingly */
}
```

## Modern CSS Features

### Custom Properties (CSS Variables)
```css
:root {
    --primary-color: #3498db;
    --secondary-color: #2ecc71;
    --spacing-unit: 1rem;
    --border-radius: 4px;
}

.button {
    background-color: var(--primary-color);
    padding: var(--spacing-unit);
    border-radius: var(--border-radius);
}

/* CSS Variables with Fallback */
.element {
    color: var(--undefined-color, #000);
}
```

### Container Queries
```css
@container sidebar (min-width: 400px) {
    .sidebar-content {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
    }
}

.sidebar {
    container-type: inline-size;
    container-name: sidebar;
}
```

### CSS Grid Advanced Features
```css
/* Grid Areas */
.layout {
    display: grid;
    grid-template-areas:
        "header header header"
        "nav    main   aside"
        "footer footer footer";
    grid-template-columns: 200px 1fr 200px;
    grid-template-rows: auto 1fr auto;
    min-height: 100vh;
}

/* Subgrid */
.card-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 1rem;
}

.card {
    display: grid;
    grid-template-rows: subgrid;
    grid-row: span 3;
}

/* Auto-fit and Auto-fill */
.responsive-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 1rem;
}
```

### Advanced Flexbox Patterns
```css
/* Flexible Search Bar */
.search-container {
    display: flex;
    gap: 0.5rem;
}

.search-input {
    flex: 1;
    min-width: 0; /* Prevent overflow */
}

/* Card Layout with Variable Height */
.card-container {
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
}

.card {
    flex: 1 1 300px;
    display: flex;
    flex-direction: column;
}

.card-content {
    flex: 1;
}

/* Responsive Navigation */
.nav {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    align-items: center;
}

@media (max-width: 768px) {
    .nav {
        flex-direction: column;
    }
}
```

### Modern Animations and Transitions
```css
/* Keyframe Animations */
@keyframes slide-in {
    from {
        transform: translateX(-100%);
        opacity: 0;
    }
    to {
        transform: translateX(0);
        opacity: 1;
    }
}

.element {
    animation: slide-in 0.5s ease-out forwards;
}

/* Smooth State Transitions */
.button {
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

/* Advanced Hover Effects */
.card {
    position: relative;
    overflow: hidden;
}

.card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.5);
    transform: translateY(100%);
    transition: transform 0.3s ease;
}

.card:hover::before {
    transform: translateY(0);
}

/* Loading Animations */
.loader {
    width: 40px;
    height: 40px;
    border: 4px solid #f3f3f3;
    border-top: 4px solid #3498db;
    border-radius: 50%;
    animation: spin 1s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}
```

### Modern Layout Techniques
```css
/* Aspect Ratio */
.video-container {
    aspect-ratio: 16 / 9;
}

/* Clamp for Responsive Typography */
.title {
    font-size: clamp(1.5rem, 5vw, 3rem);
}

/* CSS Columns */
.content {
    columns: 3 300px;
    column-gap: 2rem;
}

.content h2 {
    column-span: all;
}

/* Sticky Headers */
.section-header {
    position: sticky;
    top: 0;
    background: white;
    z-index: 1;
}
```

### Advanced Selectors and Pseudo-Classes
```css
/* :is() and :where() */
:is(h1, h2, h3):hover {
    color: blue;
}

/* :has() Relational Pseudo-class */
.container:has(> img) {
    display: grid;
}

/* Custom Selectors */
@custom-selector :--heading h1, h2, h3, h4, h5, h6;
:--heading {
    font-family: sans-serif;
}

/* Advanced Attribute Selectors */
[data-type*="video"]:hover {
    transform: scale(1.1);
}
```

### Modern Color and Effects
```css
/* Modern Color Formats */
.element {
    /* HSL with Alpha */
    color: hsla(200, 100%, 50%, 0.8);
    
    /* Modern RGB Format */
    background: rgb(200 0 0 / 50%);
    
    /* Color Mix */
    background: color-mix(in srgb, #34c9eb 50%, #ffffff);
}

/* Backdrop Filter */
.glass-effect {
    background: rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(10px);
}

/* Modern Gradients */
.gradient {
    background: conic-gradient(from 45deg, #f06, #9f6, #06f, #f06);
}
```

### Performance Optimization
```css
/* Content Visibility */
.section {
    content-visibility: auto;
    contain-intrinsic-size: 0 500px;
}

/* Will-change */
.animated-element {
    will-change: transform;
}

/* Layer Creation */
@layer base, components, utilities;

@layer base {
    /* Base styles */
}

@layer components {
    /* Component styles */
}
```

## Advanced Projects

1. Build a Responsive Dashboard
   - Implement CSS Grid layout
   - Use CSS Variables for theming
   - Add smooth animations
   - Create responsive data visualizations

2. Create an Interactive Portfolio
   - Use modern hover effects
   - Implement scroll animations
   - Add parallax scrolling
   - Create custom cursors

3. Design a Modern E-commerce Interface
   - Build product cards with Grid
   - Create an animated shopping cart
   - Implement filter animations
   - Add loading states

4. Develop a Social Media Platform UI
   - Create a responsive feed layout
   - Add story circles with animations
   - Implement like/reaction animations
   - Design modern form elements

5. Build an Advanced Blog Theme
   - Use modern typography
   - Implement dark mode
   - Add reading progress indicator
   - Create animated category tags

Remember to:
- Test performance with Chrome DevTools
- Ensure cross-browser compatibility
- Optimize for mobile devices
- Follow accessibility guidelines
- Use modern CSS features with fallbacks

## Additional Resources

1. [MDN CSS Documentation](https://developer.mozilla.org/en-US/docs/Web/CSS)
2. [CSS-Tricks](https://css-tricks.com)
3. [Can I Use](https://caniuse.com)
4. [Flexbox Froggy](https://flexboxfroggy.com)
5. [Grid Garden](https://cssgridgarden.com)

## Practice Projects

1. Create a responsive navigation menu
2. Build a card layout with Flexbox
3. Design a photo gallery with Grid
4. Implement a custom animation
5. Create a responsive form layout

Remember to practice regularly and experiment with different properties and values to improve your CSS skills!

## Modern CSS Features

### Custom Properties (CSS Variables)
```css
:root {
    --primary-color: #2196f3;
    --secondary-color: #1976d2;
    --spacing-unit: 8px;
    --border-radius: 4px;
    --transition-duration: 0.3s;
    --shadow-color: rgba(0, 0, 0, 0.1);
}

.button {
    background-color: var(--primary-color);
    padding: calc(var(--spacing-unit) * 2);
    border-radius: var(--border-radius);
    transition: all var(--transition-duration) ease;
}

.button:hover {
    background-color: var(--secondary-color);
    box-shadow: 0 2px 8px var(--shadow-color);
}

@media (prefers-color-scheme: dark) {
    :root {
        --primary-color: #90caf9;
        --secondary-color: #64b5f6;
        --shadow-color: rgba(255, 255, 255, 0.1);
    }
}
```

### Container Queries
```css
@container card (min-width: 300px) {
    .card-title {
        font-size: 1.5rem;
    }
    
    .card-content {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
    }
}

.card {
    container-type: inline-size;
    container-name: card;
}

/* Nested containers */
.sidebar {
    container-type: inline-size;
    container-name: sidebar;
}

@container sidebar (min-width: 200px) {
    .widget {
        padding: 1rem;
    }
}
```

### Advanced CSS Grid
```css
/* Grid with auto-fit and minmax */
.grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
}

/* Grid Areas */
.layout {
    display: grid;
    grid-template-areas:
        "header header header"
        "nav main aside"
        "footer footer footer";
    grid-template-columns: 200px 1fr 200px;
    grid-template-rows: auto 1fr auto;
    min-height: 100vh;
}

.header { grid-area: header; }
.nav { grid-area: nav; }
.main { grid-area: main; }
.aside { grid-area: aside; }
.footer { grid-area: footer; }

/* Responsive Grid Layout */
@media (max-width: 768px) {
    .layout {
        grid-template-areas:
            "header"
            "nav"
            "main"
            "aside"
            "footer";
        grid-template-columns: 1fr;
    }
}

/* Grid with Auto-Flow Dense */
.gallery {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    grid-auto-flow: dense;
    gap: 10px;
}

.gallery-item {
    grid-column: span 1;
    grid-row: span 1;
}

.gallery-item.wide {
    grid-column: span 2;
}

.gallery-item.tall {
    grid-row: span 2;
}
```

### Modern Flexbox Patterns
```css
/* Card Layout with Flexbox */
.card {
    display: flex;
    flex-direction: column;
    gap: 1rem;
}

.card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.card-content {
    flex: 1;
}

/* Holy Grail Layout */
.holy-grail {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

.holy-grail-header,
.holy-grail-footer {
    flex: 0 0 auto;
}

.holy-grail-body {
    display: flex;
    flex: 1 0 auto;
}

.holy-grail-content {
    flex: 1;
}

.holy-grail-nav,
.holy-grail-ads {
    flex: 0 0 12em;
}

.holy-grail-nav {
    order: -1;
}

@media (max-width: 768px) {
    .holy-grail-body {
        flex-direction: column;
    }
    
    .holy-grail-nav,
    .holy-grail-ads {
        flex: 0;
    }
}

/* Masonry Layout with Flexbox */
.masonry {
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
}

.masonry-item {
    flex: 1 1 300px;
}
```

### Animations and Transitions
```css
/* Keyframe Animation */
@keyframes slide-in {
    from {
        transform: translateX(-100%);
        opacity: 0;
    }
    to {
        transform: translateX(0);
        opacity: 1;
    }
}

.slide-in {
    animation: slide-in 0.5s ease forwards;
}

/* Complex Animation */
@keyframes bounce {
    0%, 20%, 50%, 80%, 100% {
        transform: translateY(0);
    }
    40% {
        transform: translateY(-30px);
    }
    60% {
        transform: translateY(-15px);
    }
}

.bounce {
    animation: bounce 2s infinite;
}

/* Smooth Transitions */
.button {
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.button:hover {
    transform: scale(1.05);
}

/* Animation with Multiple Properties */
@keyframes card-flip {
    0% {
        transform: perspective(1000px) rotateY(0);
    }
    100% {
        transform: perspective(1000px) rotateY(180deg);
    }
}

.card {
    transform-style: preserve-3d;
    transition: transform 0.6s;
}

.card.flipped {
    transform: rotateY(180deg);
}

/* Loading Animation */
@keyframes loading {
    0% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(360deg);
    }
}

.loader {
    width: 40px;
    height: 40px;
    border: 4px solid #f3f3f3;
    border-top: 4px solid #3498db;
    border-radius: 50%;
    animation: loading 1s linear infinite;
}
```

### Modern Layout Techniques
```css
/* Sticky Header */
.header {
    position: sticky;
    top: 0;
    background: white;
    z-index: 1000;
    backdrop-filter: blur(10px);
}

/* Overlay Menu */
.menu {
    position: fixed;
    inset: 0;
    background: rgba(0, 0, 0, 0.8);
    backdrop-filter: blur(5px);
    display: grid;
    place-items: center;
    transform: translateX(-100%);
    transition: transform 0.3s ease;
}

.menu.active {
    transform: translateX(0);
}

/* Modern Card Layout */
.card {
    background: white;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 
        0 2px 4px rgba(0,0,0,0.1),
        0 8px 16px rgba(0,0,0,0.1);
    transition: transform 0.3s ease;
}

.card:hover {
    transform: translateY(-5px);
}

/* Glass Morphism */
.glass {
    background: rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255, 255, 255, 0.1);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}
```

### Advanced Selectors
```css
/* Attribute Selectors */
[data-type^="heading"] {
    font-weight: bold;
}

[data-size*="large"] {
    font-size: 2rem;
}

/* Pseudo-Classes */
:is(h1, h2, h3):hover {
    color: var(--primary-color);
}

:where(section, article) > :first-child {
    margin-top: 0;
}

/* Custom Selectors */
@custom-selector :--heading h1, h2, h3, h4, h5, h6;
@custom-selector :--input input, textarea, select;

:--heading {
    line-height: 1.2;
}

:--input {
    border: 1px solid #ddd;
    border-radius: 4px;
}

/* Complex Selectors */
.card:has(> img) {
    padding: 0;
}

.form-group:has(:invalid) {
    border-color: red;
}
```

### Modern Color and Effects
```css
/* Modern Colors */
:root {
    --gradient-1: linear-gradient(45deg, #12c2e9, #c471ed, #f64f59);
    --gradient-2: linear-gradient(to right, #2193b0, #6dd5ed);
}

/* Color Functions */
.button {
    --button-color: hsl(210, 100%, 56%);
    background-color: var(--button-color);
    color: hsl(from var(--button-color) h s calc(l + 40%));
}

/* Modern Shadows */
.card {
    box-shadow:
        0 2px 4px hsl(0 0% 0% / 0.1),
        0 8px 16px hsl(0 0% 0% / 0.1);
}

/* Blend Modes */
.hero-image {
    background-blend-mode: multiply;
    mix-blend-mode: overlay;
}

/* Filters */
.image {
    filter: brightness(1.2) contrast(1.1) saturate(1.2);
}

.blur-background {
    backdrop-filter: blur(10px) brightness(0.8);
}
```

## Example Projects

### Modern Dashboard
```css
/* Dashboard Layout */
.dashboard {
    display: grid;
    grid-template-columns: 250px 1fr;
    grid-template-rows: auto 1fr;
    min-height: 100vh;
}

.dashboard-header {
    grid-column: 1 / -1;
    padding: 1rem;
    background: white;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.dashboard-sidebar {
    background: #f8f9fa;
    padding: 1rem;
}

.dashboard-main {
    padding: 2rem;
}

/* Dashboard Components */
.widget {
    background: white;
    border-radius: 8px;
    padding: 1.5rem;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.stats-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 1rem;
}

.stat-card {
    background: white;
    padding: 1.5rem;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.chart-container {
    height: 300px;
    margin: 2rem 0;
}

/* Responsive Dashboard */
@media (max-width: 768px) {
    .dashboard {
        grid-template-columns: 1fr;
    }

    .dashboard-sidebar {
        display: none;
    }

    .dashboard-sidebar.active {
        display: block;
        position: fixed;
        top: 0;
        left: 0;
        bottom: 0;
        width: 250px;
        z-index: 1000;
    }
}
```

### E-commerce Product Page
```css
/* Product Layout */
.product {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 2rem;
    padding: 2rem;
}

.product-gallery {
    display: grid;
    gap: 1rem;
}

.product-main-image {
    aspect-ratio: 1;
    object-fit: cover;
    border-radius: 8px;
}

.product-thumbnails {
    display: flex;
    gap: 1rem;
}

.thumbnail {
    width: 80px;
    height: 80px;
    border-radius: 4px;
    cursor: pointer;
    transition: opacity 0.3s ease;
}

.thumbnail:hover {
    opacity: 0.8;
}

.product-info {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
}

.product-title {
    font-size: 2rem;
    font-weight: bold;
}

.product-price {
    font-size: 1.5rem;
    color: var(--primary-color);
}

.product-description {
    line-height: 1.6;
}

.product-variants {
    display: flex;
    gap: 1rem;
}

.variant {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    border: 2px solid transparent;
    cursor: pointer;
    transition: border-color 0.3s ease;
}

.variant.active {
    border-color: var(--primary-color);
}

.add-to-cart {
    background: var(--primary-color);
    color: white;
    border: none;
    padding: 1rem 2rem;
    border-radius: 4px;
    cursor: pointer;
    transition: background 0.3s ease;
}

.add-to-cart:hover {
    background: var(--secondary-color);
}

/* Responsive Product Page */
@media (max-width: 768px) {
    .product {
        grid-template-columns: 1fr;
    }
}
