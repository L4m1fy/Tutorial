# JSON Tutorial

## Table of Contents
1. [Introduction](#introduction)
2. [JSON Syntax](#json-syntax)
3. [Data Types](#data-types)
4. [Objects](#objects)
5. [Arrays](#arrays)
6. [Common Use Cases](#common-use-cases)
7. [Best Practices](#best-practices)
8. [Working with JSON](#working-with-json)

## Introduction

JSON (JavaScript Object Notation) is a lightweight, text-based data interchange format that is easy for humans to read and write and easy for machines to parse and generate. It is language-independent and widely used for transmitting data between a server and a web application.

## JSON Syntax

### Basic Rules
- Data is in name/value pairs
- Data is separated by commas
- Curly braces `{}` hold objects
- Square brackets `[]` hold arrays
- Names must be strings, written with double quotes
- String values must be enclosed in double quotes
- Numbers can be integers or floating point
- Boolean values can be true or false
- Null is allowed as a value

### Example
```json
{
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "married": false,
    "hobbies": ["reading", "music", "sports"],
    "children": null,
    "address": {
        "street": "123 Main St",
        "zipCode": "10001"
    }
}
```

## Data Types

JSON supports six basic data types:

1. **Strings**
```json
{
    "firstName": "John",
    "lastName": "Doe",
    "message": "Hello, World!"
}
```

2. **Numbers**
```json
{
    "age": 30,
    "height": 1.75,
    "temperature": -5,
    "scientificNotation": 1.2e-10
}
```

3. **Booleans**
```json
{
    "isStudent": true,
    "isEmployed": false
}
```

4. **null**
```json
{
    "spouse": null,
    "middleName": null
}
```

5. **Objects**
```json
{
    "person": {
        "name": "Jane",
        "age": 25
    }
}
```

6. **Arrays**
```json
{
    "colors": ["red", "green", "blue"],
    "numbers": [1, 2, 3, 4, 5]
}
```

## Objects

### Object Structure
```json
{
    "person": {
        "name": "John Doe",
        "age": 30,
        "contact": {
            "email": "john@example.com",
            "phone": "+1-555-555-5555"
        }
    }
}
```

### Nested Objects
```json
{
    "company": {
        "name": "Tech Corp",
        "departments": {
            "IT": {
                "head": "Jane Smith",
                "employees": 50
            },
            "HR": {
                "head": "Mike Johnson",
                "employees": 20
            }
        }
    }
}
```

## Arrays

### Simple Arrays
```json
{
    "fruits": ["apple", "banana", "orange"],
    "numbers": [1, 2, 3, 4, 5],
    "mixed": [1, "hello", true, null]
}
```

### Arrays of Objects
```json
{
    "employees": [
        {
            "name": "John Doe",
            "id": 1,
            "position": "Developer"
        },
        {
            "name": "Jane Smith",
            "id": 2,
            "position": "Designer"
        }
    ]
}
```

### Nested Arrays
```json
{
    "matrix": [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
    ],
    "categories": [
        ["fruit", ["apple", "banana"]],
        ["vegetable", ["carrot", "potato"]]
    ]
}
```

## Common Use Cases

### API Response
```json
{
    "status": "success",
    "code": 200,
    "data": {
        "users": [
            {
                "id": 1,
                "name": "John Doe",
                "email": "john@example.com"
            },
            {
                "id": 2,
                "name": "Jane Smith",
                "email": "jane@example.com"
            }
        ],
        "total": 2,
        "page": 1
    }
}
```

### Configuration File
```json
{
    "appSettings": {
        "theme": "dark",
        "language": "en",
        "notifications": {
            "email": true,
            "push": false
        },
        "security": {
            "twoFactorAuth": true,
            "passwordExpiry": 90
        }
    }
}
```

### Data Storage
```json
{
    "products": [
        {
            "id": "P001",
            "name": "Laptop",
            "price": 999.99,
            "specs": {
                "cpu": "Intel i5",
                "ram": "8GB",
                "storage": "256GB SSD"
            }
        },
        {
            "id": "P002",
            "name": "Smartphone",
            "price": 499.99,
            "specs": {
                "screen": "6.1 inch",
                "camera": "12MP",
                "storage": "128GB"
            }
        }
    ]
}
```

## Best Practices

1. **Use Consistent Formatting**
```json
{
    "good": {
        "consistent": "spacing",
        "proper": "indentation"
    },
    "bad":{"inconsistent":"spacing","no":"indentation"}
}
```

2. **Use Clear Property Names**
```json
{
    "good": {
        "firstName": "John",
        "emailAddress": "john@example.com"
    },
    "bad": {
        "fn": "John",
        "em": "john@example.com"
    }
}
```

3. **Use Appropriate Data Types**
```json
{
    "good": {
        "age": 25,
        "price": 19.99,
        "isActive": true
    },
    "bad": {
        "age": "25",
        "price": "19.99",
        "isActive": "true"
    }
}
```

4. **Structure Data Hierarchically**
```json
{
    "good": {
        "address": {
            "street": "123 Main St",
            "city": "New York",
            "country": "USA"
        }
    },
    "bad": {
        "addressStreet": "123 Main St",
        "addressCity": "New York",
        "addressCountry": "USA"
    }
}
```

## Working with JSON

### JavaScript Example
```javascript
// Parse JSON string to object
const jsonString = '{"name": "John", "age": 30}';
const obj = JSON.parse(jsonString);
console.log(obj.name); // Output: John

// Convert object to JSON string
const person = {
    name: "John",
    age: 30
};
const jsonStr = JSON.stringify(person);
console.log(jsonStr); // Output: {"name":"John","age":30}
```

### Python Example
```python
import json

# Parse JSON string to object
json_string = '{"name": "John", "age": 30}'
obj = json.loads(json_string)
print(obj['name'])  # Output: John

# Convert object to JSON string
person = {
    'name': 'John',
    'age': 30
}
json_str = json.dumps(person)
print(json_str)  # Output: {"name": "John", "age": 30}
```

### Common JSON Operations

1. **Reading JSON from a File**
```python
import json

# Python
with open('data.json', 'r') as file:
    data = json.load(file)
```

```javascript
// JavaScript
const fs = require('fs');
const data = JSON.parse(fs.readFileSync('data.json'));
```

2. **Writing JSON to a File**
```python
# Python
with open('data.json', 'w') as file:
    json.dump(data, file, indent=4)
```

```javascript
// JavaScript
const fs = require('fs');
fs.writeFileSync('data.json', JSON.stringify(data, null, 4));
```

3. **Validating JSON**
```python
import json

def is_valid_json(string):
    try:
        json.loads(string)
        return True
    except ValueError:
        return False
```

## Additional Resources

1. [JSON Official Website](https://www.json.org/)
2. [MDN JSON Documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON)
3. [JSON Schema](https://json-schema.org/)
4. [JSON Validator](https://jsonlint.com/)

## Practice Exercises

1. Create a JSON file representing a book library
2. Parse a complex JSON API response
3. Convert data structures to JSON format
4. Validate JSON using different tools
5. Work with nested JSON structures

Remember to validate your JSON using tools like JSONLint to ensure it's properly formatted and valid!
