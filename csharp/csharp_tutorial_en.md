# C# Programming Tutorial

## Table of Contents
1. [Introduction](#introduction)
2. [Basic Concepts](#basic-concepts)
3. [Object-Oriented Programming](#object-oriented-programming)
4. [Advanced Features](#advanced-features)
5. [Modern C# Features](#modern-c-features)
6. [Design Patterns](#design-patterns)
7. [Best Practices](#best-practices)
8. [Example Projects](#example-projects)

## Introduction

C# is a modern, object-oriented programming language developed by Microsoft. This tutorial covers essential concepts and advanced features of C#.

### Getting Started
```csharp
// Basic Hello World Program
using System;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Hello, World!");
    }
}
```

## Basic Concepts

### Variables and Data Types
```csharp
// Value Types
int number = 42;
double pi = 3.14159;
bool isValid = true;
char letter = 'A';

// Reference Types
string text = "Hello, C#!";
object obj = new object();

// Nullable Types
int? nullableNumber = null;
```

### Control Structures
```csharp
// If-else statement
if (number > 0)
{
    Console.WriteLine("Positive");
}
else if (number < 0)
{
    Console.WriteLine("Negative");
}
else
{
    Console.WriteLine("Zero");
}

// Switch expression (C# 8.0+)
string result = number switch
{
    > 0 => "Positive",
    < 0 => "Negative",
    _ => "Zero"
};

// Loops
for (int i = 0; i < 5; i++)
{
    Console.WriteLine($"Iteration {i}");
}

foreach (var item in collection)
{
    Console.WriteLine(item);
}

while (condition)
{
    // Code
}

do
{
    // Code
} while (condition);
```

## Object-Oriented Programming

### Classes and Objects
```csharp
public class Person
{
    // Properties
    public string Name { get; set; }
    public int Age { get; set; }
    
    // Constructor
    public Person(string name, int age)
    {
        Name = name;
        Age = age;
    }
    
    // Method
    public void Introduce()
    {
        Console.WriteLine($"Hi, I'm {Name} and I'm {Age} years old.");
    }
}

// Using the class
var person = new Person("John", 30);
person.Introduce();
```

### Inheritance and Polymorphism
```csharp
public abstract class Shape
{
    public abstract double CalculateArea();
}

public class Circle : Shape
{
    public double Radius { get; set; }
    
    public Circle(double radius)
    {
        Radius = radius;
    }
    
    public override double CalculateArea()
    {
        return Math.PI * Radius * Radius;
    }
}

public class Rectangle : Shape
{
    public double Width { get; set; }
    public double Height { get; set; }
    
    public Rectangle(double width, double height)
    {
        Width = width;
        Height = height;
    }
    
    public override double CalculateArea()
    {
        return Width * Height;
    }
}
```

## Advanced Features

### LINQ (Language Integrated Query)
```csharp
var numbers = Enumerable.Range(1, 10);

// Query syntax
var evenNumbers = from n in numbers
                 where n % 2 == 0
                 select n;

// Method syntax
var oddNumbers = numbers.Where(n => n % 2 != 0);

// Complex LINQ operations
var result = numbers
    .Where(n => n > 5)
    .Select(n => new { Number = n, Square = n * n })
    .OrderByDescending(x => x.Square)
    .Take(3);
```

### Async/Await
```csharp
public class DataService
{
    public async Task<string> FetchDataAsync()
    {
        using var client = new HttpClient();
        var response = await client.GetStringAsync("https://api.example.com/data");
        return response;
    }
}

public class Program
{
    public static async Task Main()
    {
        var service = new DataService();
        try
        {
            var data = await service.FetchDataAsync();
            Console.WriteLine(data);
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
        }
    }
}
```

### Generic Types
```csharp
public class GenericRepository<T> where T : class
{
    private readonly List<T> _items = new();
    
    public void Add(T item)
    {
        _items.Add(item);
    }
    
    public IEnumerable<T> GetAll()
    {
        return _items.AsReadOnly();
    }
    
    public T GetById(Func<T, bool> predicate)
    {
        return _items.FirstOrDefault(predicate);
    }
}

// Using the generic repository
var peopleRepo = new GenericRepository<Person>();
peopleRepo.Add(new Person("Alice", 25));
```

## Modern C# Features

### Records (C# 9.0+)
```csharp
public record PersonRecord(string Name, int Age);

// Using records
var person1 = new PersonRecord("John", 30);
var person2 = person1 with { Age = 31 };

// Record with additional members
public record Employee(string Name, int Age, string Department)
{
    public decimal CalculateSalary() => 50000m;
}
```

### Pattern Matching
```csharp
public static string DescribeValue(object obj) =>
    obj switch
    {
        string s => $"String of length {s.Length}",
        int n when n < 0 => "Negative number",
        int n => $"Positive number: {n}",
        Person { Age: > 18 } p => $"Adult: {p.Name}",
        null => "Null value",
        _ => "Unknown type"
    };
```

### Top-level Statements (C# 9.0+)
```csharp
// Program.cs
using System;

Console.WriteLine("Hello, World!");
await DoSomethingAsync();

async Task DoSomethingAsync()
{
    await Task.Delay(1000);
    Console.WriteLine("Done!");
}
```

### Init-only Properties (C# 9.0+)
```csharp
public class Configuration
{
    public string Host { get; init; }
    public int Port { get; init; }
    public string Database { get; init; }
}

var config = new Configuration
{
    Host = "localhost",
    Port = 5432,
    Database = "mydb"
};
```

## Design Patterns

### Singleton Pattern
```csharp
public sealed class Singleton
{
    private static readonly Lazy<Singleton> _instance =
        new Lazy<Singleton>(() => new Singleton());
        
    public static Singleton Instance => _instance.Value;
    
    private Singleton() { }
    
    public void DoSomething()
    {
        Console.WriteLine("Singleton method called");
    }
}
```

### Factory Pattern
```csharp
public interface IAnimal
{
    void MakeSound();
}

public class Dog : IAnimal
{
    public void MakeSound() => Console.WriteLine("Woof!");
}

public class Cat : IAnimal
{
    public void MakeSound() => Console.WriteLine("Meow!");
}

public static class AnimalFactory
{
    public static IAnimal CreateAnimal(string type) =>
        type.ToLower() switch
        {
            "dog" => new Dog(),
            "cat" => new Cat(),
            _ => throw new ArgumentException("Invalid animal type")
        };
}
```

## Example Projects

### Building a REST API
```csharp
[ApiController]
[Route("api/[controller]")]
public class UsersController : ControllerBase
{
    private readonly IUserService _userService;
    
    public UsersController(IUserService userService)
    {
        _userService = userService;
    }
    
    [HttpGet]
    public async Task<ActionResult<IEnumerable<User>>> GetUsers()
    {
        var users = await _userService.GetAllUsersAsync();
        return Ok(users);
    }
    
    [HttpPost]
    public async Task<ActionResult<User>> CreateUser(CreateUserDto dto)
    {
        var user = await _userService.CreateUserAsync(dto);
        return CreatedAtAction(nameof(GetUsers), new { id = user.Id }, user);
    }
}
```

### Building a Desktop Application
```csharp
public partial class MainWindow : Window
{
    private readonly ObservableCollection<TodoItem> _todos = new();
    
    public MainWindow()
    {
        InitializeComponent();
        TodoList.ItemsSource = _todos;
    }
    
    private void AddTodo_Click(object sender, RoutedEventArgs e)
    {
        if (string.IsNullOrWhiteSpace(TodoInput.Text))
            return;
            
        _todos.Add(new TodoItem
        {
            Title = TodoInput.Text,
            CreatedAt = DateTime.Now
        });
        
        TodoInput.Clear();
    }
}

public class TodoItem
{
    public string Title { get; set; }
    public DateTime CreatedAt { get; set; }
    public bool IsCompleted { get; set; }
}
```

## Best Practices

1. Use meaningful names for variables, methods, and classes
2. Follow C# naming conventions
3. Write clean, maintainable code
4. Use proper exception handling
5. Implement interfaces for better abstraction
6. Use dependency injection
7. Write unit tests
8. Document your code
9. Use async/await properly
10. Follow SOLID principles

## Additional Resources

1. [Microsoft C# Documentation](https://docs.microsoft.com/en-us/dotnet/csharp/)
2. [C# Programming Guide](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/)
3. [.NET API Browser](https://docs.microsoft.com/en-us/dotnet/api/)
4. [C# Corner](https://www.c-sharpcorner.com/)
