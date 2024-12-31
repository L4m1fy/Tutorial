# HTML Tutorial

## Table of Contents
1. [Introduction](#introduction)
2. [Basic Structure](#basic-structure)
3. [Text Elements](#text-elements)
4. [Links and Images](#links-and-images)
5. [Lists](#lists)
6. [Tables](#tables)
7. [Forms](#forms)
8. [Semantic Elements](#semantic-elements)
9. [HTML5 Features](#html5-features)
10. [Best Practices](#best-practices)
11. [Modern HTML Features and Best Practices](#modern-html-features-and-best-practices)
12. [Advanced Projects](#advanced-projects)

## Introduction
HTML (HyperText Markup Language) is the standard markup language for creating web pages. This tutorial covers all essential HTML concepts and elements.

### Setting Up
1. Choose a text editor (VS Code, Sublime Text, etc.)
2. Create a new file with `.html` extension
3. Start with the basic HTML structure

## Basic Structure

### HTML Document Template
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My First HTML Page</title>
</head>
<body>
    <!-- Content goes here -->
</body>
</html>
```

### Head Section Elements
```html
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Page description">
    <meta name="keywords" content="HTML, tutorial, web">
    <meta name="author" content="Your Name">
    <link rel="stylesheet" href="styles.css">
    <script src="script.js"></script>
</head>
```

## Text Elements

### Headings
```html
<h1>Main Heading</h1>
<h2>Subheading</h2>
<h3>Level 3 Heading</h3>
<h4>Level 4 Heading</h4>
<h5>Level 5 Heading</h5>
<h6>Level 6 Heading</h6>
```

### Paragraphs and Text Formatting
```html
<p>This is a paragraph.</p>
<p>This is another paragraph with <strong>bold text</strong> and <em>italic text</em>.</p>
<p>You can also use <b>bold</b> and <i>italic</i> tags.</p>
<p>This text contains a <br>line break.</p>
<hr>
<p>Horizontal line above.</p>
```

## Links and Images

### Links
```html
<!-- External Link -->
<a href="https://www.example.com">Visit Example.com</a>

<!-- Internal Link -->
<a href="/about.html">About Page</a>

<!-- Link with Target -->
<a href="https://www.example.com" target="_blank">Open in New Tab</a>

<!-- Link to Email -->
<a href="mailto:example@email.com">Send Email</a>

<!-- Link to Phone -->
<a href="tel:+1234567890">Call Us</a>
```

### Images
```html
<!-- Basic Image -->
<img src="image.jpg" alt="Description">

<!-- Image with Size -->
<img src="image.jpg" alt="Description" width="300" height="200">

<!-- Image as Link -->
<a href="page.html">
    <img src="image.jpg" alt="Click me">
</a>
```

## Lists

### Unordered Lists
```html
<ul>
    <li>First item</li>
    <li>Second item</li>
    <li>Third item</li>
</ul>
```

### Ordered Lists
```html
<ol>
    <li>First item</li>
    <li>Second item</li>
    <li>Third item</li>
</ol>
```

### Definition Lists
```html
<dl>
    <dt>Term 1</dt>
    <dd>Definition 1</dd>
    <dt>Term 2</dt>
    <dd>Definition 2</dd>
</dl>
```

## Tables

### Basic Table Structure
```html
<table>
    <thead>
        <tr>
            <th>Header 1</th>
            <th>Header 2</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Row 1, Cell 1</td>
            <td>Row 1, Cell 2</td>
        </tr>
        <tr>
            <td>Row 2, Cell 1</td>
            <td>Row 2, Cell 2</td>
        </tr>
    </tbody>
</table>
```

### Table with Colspan and Rowspan
```html
<table>
    <tr>
        <td colspan="2">Cell spans 2 columns</td>
    </tr>
    <tr>
        <td rowspan="2">Cell spans 2 rows</td>
        <td>Regular cell</td>
    </tr>
    <tr>
        <td>Regular cell</td>
    </tr>
</table>
```

## Forms

### Basic Form Structure
```html
<form action="/submit" method="post">
    <!-- Form elements go here -->
</form>
```

### Input Types
```html
<!-- Text Input -->
<input type="text" name="username" placeholder="Enter username">

<!-- Password Input -->
<input type="password" name="password" placeholder="Enter password">

<!-- Email Input -->
<input type="email" name="email" placeholder="Enter email">

<!-- Number Input -->
<input type="number" name="age" min="0" max="120">

<!-- Date Input -->
<input type="date" name="birthdate">

<!-- Checkbox -->
<input type="checkbox" name="subscribe" id="subscribe">
<label for="subscribe">Subscribe to newsletter</label>

<!-- Radio Buttons -->
<input type="radio" name="gender" value="male" id="male">
<label for="male">Male</label>
<input type="radio" name="gender" value="female" id="female">
<label for="female">Female</label>

<!-- Select Dropdown -->
<select name="country">
    <option value="">Select country</option>
    <option value="us">United States</option>
    <option value="uk">United Kingdom</option>
</select>

<!-- Textarea -->
<textarea name="message" rows="4" cols="50"></textarea>

<!-- File Upload -->
<input type="file" name="document">

<!-- Submit Button -->
<input type="submit" value="Submit">
```

## Semantic Elements

### Page Structure
```html
<header>
    <nav>
        <!-- Navigation content -->
    </nav>
</header>

<main>
    <article>
        <section>
            <!-- Article section -->
        </section>
    </article>
    
    <aside>
        <!-- Sidebar content -->
    </aside>
</main>

<footer>
    <!-- Footer content -->
</footer>
```

### Content Elements
```html
<figure>
    <img src="image.jpg" alt="Description">
    <figcaption>Image caption</figcaption>
</figure>

<time datetime="2024-12-25">December 25, 2024</time>

<mark>Highlighted text</mark>

<details>
    <summary>Click to expand</summary>
    <p>Detailed content here</p>
</details>
```

## HTML5 Features

### Audio and Video
```html
<!-- Audio -->
<audio controls>
    <source src="audio.mp3" type="audio/mpeg">
    Your browser does not support audio.
</audio>

<!-- Video -->
<video width="320" height="240" controls>
    <source src="video.mp4" type="video/mp4">
    Your browser does not support video.
</video>
```

### Canvas
```html
<canvas id="myCanvas" width="200" height="100"></canvas>
```

### SVG
```html
<svg width="100" height="100">
    <circle cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red" />
</svg>
```

## Best Practices

1. Always declare DOCTYPE
2. Use semantic HTML elements
3. Include alt attributes for images
4. Use proper indentation
5. Validate your HTML code
6. Make your site accessible
7. Use meaningful class and ID names
8. Keep your code clean and organized
9. Test across different browsers
10. Follow HTML standards

## Modern HTML Features and Best Practices

### Web Components
```html
<!-- Custom Element Definition -->
<script>
class UserCard extends HTMLElement {
    constructor() {
        super();
        this.attachShadow({ mode: 'open' });
    }

    static get observedAttributes() {
        return ['name', 'avatar'];
    }

    connectedCallback() {
        this.render();
    }

    attributeChangedCallback(name, oldValue, newValue) {
        if (oldValue !== newValue) {
            this.render();
        }
    }

    render() {
        const name = this.getAttribute('name') || 'Anonymous';
        const avatar = this.getAttribute('avatar') || 'default.png';

        this.shadowRoot.innerHTML = `
            <style>
                :host {
                    display: inline-block;
                    width: 300px;
                    border-radius: 8px;
                    overflow: hidden;
                    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
                }
                .card {
                    padding: 20px;
                    background: white;
                }
                img {
                    width: 100%;
                    height: 200px;
                    object-fit: cover;
                }
                h2 {
                    margin: 10px 0;
                    color: #333;
                }
            </style>
            <div class="card">
                <img src="${avatar}" alt="${name}">
                <h2>${name}</h2>
                <slot></slot>
            </div>
        `;
    }
}

customElements.define('user-card', UserCard);
</script>

<!-- Using the Custom Element -->
<user-card name="John Doe" avatar="john.jpg">
    <p>Web Developer</p>
</user-card>
```

### Progressive Web Apps
```html
<!-- manifest.json -->
{
    "name": "My PWA App",
    "short_name": "PWA",
    "start_url": "/",
    "display": "standalone",
    "background_color": "#ffffff",
    "theme_color": "#2196f3",
    "icons": [
        {
            "src": "icon-192.png",
            "sizes": "192x192",
            "type": "image/png"
        },
        {
            "src": "icon-512.png",
            "sizes": "512x512",
            "type": "image/png"
        }
    ]
}

<!-- HTML Setup -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="manifest" href="/manifest.json">
    <meta name="theme-color" content="#2196f3">
    <link rel="apple-touch-icon" href="icon-192.png">
    <title>PWA App</title>
</head>
<body>
    <script>
        // Service Worker Registration
        if ('serviceWorker' in navigator) {
            window.addEventListener('load', () => {
                navigator.serviceWorker.register('/sw.js')
                    .then(registration => {
                        console.log('SW registered:', registration);
                    })
                    .catch(error => {
                        console.log('SW registration failed:', error);
                    });
            });
        }
    </script>
</body>
</html>

<!-- service-worker.js -->
const CACHE_NAME = 'my-pwa-cache-v1';
const urlsToCache = [
    '/',
    '/styles/main.css',
    '/scripts/main.js',
    '/images/logo.png'
];

self.addEventListener('install', event => {
    event.waitUntil(
        caches.open(CACHE_NAME)
            .then(cache => cache.addAll(urlsToCache))
    );
});

self.addEventListener('fetch', event => {
    event.respondWith(
        caches.match(event.request)
            .then(response => response || fetch(event.request))
    );
});
```

### Advanced Forms
```html
<!-- Modern Form with Validation -->
<form id="advancedForm" novalidate>
    <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" 
               id="email" 
               name="email" 
               required 
               pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
               autocomplete="email">
        <div class="error"></div>
    </div>

    <div class="form-group">
        <label for="phone">Phone:</label>
        <input type="tel" 
               id="phone" 
               name="phone" 
               required 
               pattern="[0-9]{10}"
               autocomplete="tel">
        <div class="error"></div>
    </div>

    <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" 
               id="password" 
               name="password" 
               required 
               minlength="8"
               autocomplete="new-password">
        <div class="password-strength"></div>
        <div class="error"></div>
    </div>

    <div class="form-group">
        <label for="dob">Date of Birth:</label>
        <input type="date" 
               id="dob" 
               name="dob" 
               required
               max="2005-01-01">
        <div class="error"></div>
    </div>

    <div class="form-group">
        <label for="avatar">Profile Picture:</label>
        <input type="file" 
               id="avatar" 
               name="avatar" 
               accept="image/*"
               capture="user">
        <div class="preview"></div>
        <div class="error"></div>
    </div>

    <button type="submit">Submit</button>
</form>

<style>
.form-group {
    margin-bottom: 1rem;
}

.error {
    color: red;
    font-size: 0.8em;
    margin-top: 0.2rem;
}

.password-strength {
    height: 5px;
    margin-top: 5px;
    background: #eee;
}

.preview {
    max-width: 200px;
    max-height: 200px;
    margin-top: 10px;
}
</style>

<script>
document.getElementById('advancedForm').addEventListener('submit', function(e) {
    e.preventDefault();
    
    if (this.checkValidity()) {
        // Form is valid, proceed with submission
        const formData = new FormData(this);
        
        fetch('/api/submit', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            console.log('Success:', data);
        })
        .catch(error => {
            console.error('Error:', error);
        });
    } else {
        // Show validation messages
        Array.from(this.elements).forEach(element => {
            if (!element.validity.valid) {
                showError(element);
            }
        });
    }
});

function showError(element) {
    const errorDiv = element.nextElementSibling;
    if (errorDiv && errorDiv.classList.contains('error')) {
        if (element.validity.valueMissing) {
            errorDiv.textContent = 'This field is required';
        } else if (element.validity.typeMismatch) {
            errorDiv.textContent = `Please enter a valid ${element.type}`;
        } else if (element.validity.patternMismatch) {
            errorDiv.textContent = 'Please match the requested format';
        } else if (element.validity.tooShort) {
            errorDiv.textContent = `Minimum length is ${element.minLength}`;
        }
    }
}

// Password strength indicator
document.getElementById('password').addEventListener('input', function(e) {
    const password = e.target.value;
    const strength = calculatePasswordStrength(password);
    const indicator = document.querySelector('.password-strength');
    
    indicator.style.width = `${strength}%`;
    indicator.style.background = 
        strength < 33 ? 'red' :
        strength < 66 ? 'yellow' : 'green';
});

function calculatePasswordStrength(password) {
    let strength = 0;
    
    if (password.length >= 8) strength += 25;
    if (password.match(/[a-z]/)) strength += 25;
    if (password.match(/[A-Z]/)) strength += 25;
    if (password.match(/[0-9]/)) strength += 25;
    
    return strength;
}

// File preview
document.getElementById('avatar').addEventListener('change', function(e) {
    const file = e.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            const preview = document.querySelector('.preview');
            preview.style.backgroundImage = `url(${e.target.result})`;
        }
        reader.readAsDataURL(file);
    }
});
</script>
```

### Responsive Images
```html
<!-- Art Direction -->
<picture>
    <source media="(min-width: 1200px)" 
            srcset="hero-large.jpg">
    <source media="(min-width: 800px)" 
            srcset="hero-medium.jpg">
    <img src="hero-small.jpg" 
         alt="Hero image"
         loading="lazy"
         decoding="async">
</picture>

<!-- Resolution Switching -->
<img srcset="image-320w.jpg 320w,
             image-480w.jpg 480w,
             image-800w.jpg 800w"
     sizes="(max-width: 320px) 280px,
            (max-width: 480px) 440px,
            800px"
     src="image-800w.jpg"
     alt="Responsive image"
     loading="lazy"
     decoding="async">

<!-- Modern Image Formats -->
<picture>
    <source type="image/webp" srcset="image.webp">
    <source type="image/jpeg" srcset="image.jpg">
    <img src="image.jpg" 
         alt="Image with fallback"
         loading="lazy"
         decoding="async">
</picture>
```

### Advanced Meta Tags
```html
<!-- Basic Meta Tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="A comprehensive description of your page">
<meta name="keywords" content="keyword1, keyword2, keyword3">
<meta name="author" content="Your Name">

<!-- Open Graph Meta Tags -->
<meta property="og:title" content="Your Page Title">
<meta property="og:description" content="Description for social media">
<meta property="og:image" content="https://example.com/image.jpg">
<meta property="og:url" content="https://example.com/page">
<meta property="og:type" content="website">

<!-- Twitter Card Meta Tags -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:site" content="@yourusername">
<meta name="twitter:title" content="Your Page Title">
<meta name="twitter:description" content="Description for Twitter">
<meta name="twitter:image" content="https://example.com/image.jpg">

<!-- App Link Meta Tags -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="App Name">
<link rel="apple-touch-icon" href="/apple-touch-icon.png">

<!-- Favicon Meta Tags -->
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="theme-color" content="#ffffff">

<!-- SEO Meta Tags -->
<link rel="canonical" href="https://example.com/page">
<meta name="robots" content="index, follow">
<meta name="googlebot" content="index, follow">
```

### Security Features
```html
<!-- Content Security Policy -->
<meta http-equiv="Content-Security-Policy" 
      content="default-src 'self';
               script-src 'self' 'unsafe-inline' 'unsafe-eval' https://trusted.com;
               style-src 'self' 'unsafe-inline' https://trusted.com;
               img-src 'self' data: https:;
               font-src 'self' https://trusted.com;
               connect-src 'self' https://api.trusted.com;">

<!-- Cross-Origin Resource Sharing -->
<link rel="preconnect" href="https://api.example.com">
<link rel="dns-prefetch" href="https://api.example.com">

<!-- Referrer Policy -->
<meta name="referrer" content="strict-origin-when-cross-origin">

<!-- Feature Policy -->
<meta http-equiv="Feature-Policy" 
      content="camera 'none';
               microphone 'none';
               geolocation 'self';">

<!-- CSRF Protection -->
<meta name="csrf-token" content="your-csrf-token">
```

## Example Projects

### Modern Portfolio Website
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modern Portfolio</title>
    <style>
        /* Modern CSS Reset */
        *, *::before, *::after {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        /* Custom Properties */
        :root {
            --primary-color: #2196f3;
            --secondary-color: #1976d2;
            --text-color: #333;
            --background-color: #fff;
        }

        /* Modern Layout */
        body {
            font-family: system-ui, -apple-system, BlinkMacSystemFont, 
                         'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 
                         'Open Sans', 'Helvetica Neue', sans-serif;
            line-height: 1.6;
            color: var(--text-color);
            background: var(--background-color);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Hero Section */
        .hero {
            min-height: 100vh;
            display: grid;
            place-items: center;
            background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
            color: white;
            text-align: center;
        }

        /* Portfolio Grid */
        .portfolio {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            padding: 40px 0;
        }

        .portfolio-item {
            position: relative;
            overflow: hidden;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .portfolio-item:hover {
            transform: translateY(-5px);
        }

        .portfolio-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Contact Form */
        .contact-form {
            max-width: 600px;
            margin: 40px auto;
            padding: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background: var(--primary-color);
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn:hover {
            background: var(--secondary-color);
        }
    </style>
</head>
<body>
    <header class="hero">
        <div class="container">
            <h1>John Doe</h1>
            <p>Web Developer & Designer</p>
        </div>
    </header>

    <main class="container">
        <section class="portfolio">
            <article class="portfolio-item">
                <img src="project1.jpg" alt="Project 1">
                <div class="overlay">
                    <h3>Project 1</h3>
                    <p>Web Development</p>
                </div>
            </article>
            <!-- More portfolio items -->
        </section>

        <section class="contact-form">
            <h2>Contact Me</h2>
            <form id="contact">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" id="name" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" required>
                </div>
                <div class="form-group">
                    <label for="message">Message</label>
                    <textarea id="message" rows="5" required></textarea>
                </div>
                <button type="submit" class="btn">Send Message</button>
            </form>
        </section>
    </main>

    <footer class="container">
        <p>&copy; 2024 John Doe. All rights reserved.</p>
    </footer>

    <script>
        // Form handling
        document.getElementById('contact').addEventListener('submit', function(e) {
            e.preventDefault();
            // Add form submission logic here
        });

        // Intersection Observer for animations
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate');
                }
            });
        });

        document.querySelectorAll('.portfolio-item').forEach((item) => {
            observer.observe(item);
        });
    </script>
</body>
</html>
```

## Advanced Projects

1. Build a Progressive Web App
   - Create a manifest.json
   - Implement a service worker
   - Add offline functionality
   - Implement push notifications

2. Create an Accessible Web Application
   - Use semantic HTML5 elements
   - Implement ARIA roles and attributes
   - Add keyboard navigation
   - Test with screen readers

3. Develop a Multimedia Portfolio
   - Implement responsive images
   - Add video and audio content
   - Create custom video controls
   - Optimize media loading

4. Build an Advanced Form Application
   - Use modern form controls
   - Implement custom validation
   - Add dynamic form elements
   - Create an autocomplete system

5. Create a Web Component Library
   - Design reusable components
   - Implement Shadow DOM
   - Use HTML templates
   - Add custom events

Remember to:
- Test across different browsers and devices
- Validate HTML using W3C validator
- Check accessibility with tools like WAVE
- Optimize performance using Lighthouse
- Follow security best practices

## Additional Resources

1. [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/HTML)
2. [W3Schools HTML Tutorial](https://www.w3schools.com/html/)
3. [HTML5 Specification](https://html.spec.whatwg.org/)
4. [Can I Use](https://caniuse.com/)

## Practice Projects

1. Create a personal portfolio
2. Build a blog layout
3. Design a contact form
4. Create a product landing page
5. Build a restaurant menu page

Remember to practice regularly and experiment with different HTML elements and attributes to improve your skills!
