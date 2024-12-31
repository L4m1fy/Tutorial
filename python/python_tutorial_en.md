# Python Programming Tutorial

## Table of Contents
1. [Introduction](#introduction)
2. [Basic Concepts](#basic-concepts)
3. [Data Types](#data-types)
4. [Control Structures](#control-structures)
5. [Functions](#functions)
6. [Object-Oriented Programming](#object-oriented-programming)
7. [Modules and Packages](#modules-and-packages)
8. [File Handling](#file-handling)
9. [Error Handling](#error-handling)
10. [Advanced Topics](#advanced-topics)
11. [Modern Python Features](#modern-python-features)
12. [Best Practices](#best-practices)
13. [Additional Resources](#additional-resources)
14. [Practice Projects](#practice-projects)
15. [Advanced Projects](#advanced-projects)

## Introduction
Python is a high-level, interpreted programming language known for its simplicity and readability. This tutorial will guide you through all essential concepts of Python programming.

### Setting Up Python
1. Download Python from [python.org](https://python.org)
2. Install Python with PATH option enabled
3. Verify installation: `python --version`

## Basic Concepts

### Variables and Assignment
```python
name = "John"      # String
age = 25          # Integer
height = 1.75     # Float
is_student = True # Boolean
```

### Basic Operations
```python
# Arithmetic
sum = 10 + 5
difference = 10 - 5
product = 10 * 5
quotient = 10 / 5
power = 2 ** 3
remainder = 10 % 3

# String operations
first_name = "John"
last_name = "Doe"
full_name = first_name + " " + last_name
```

## Data Types

### Numbers
```python
# Integer
x = 5
# Float
y = 3.14
# Complex
z = 2 + 3j
```

### Strings
```python
# String creation
text = "Hello, World!"
multiline = """This is a
multiline string"""

# String methods
upper_text = text.upper()
lower_text = text.lower()
length = len(text)
```

### Lists
```python
# List creation
fruits = ["apple", "banana", "orange"]

# List operations
fruits.append("grape")
fruits.remove("banana")
first_fruit = fruits[0]
```

### Dictionaries
```python
# Dictionary creation
person = {
    "name": "John",
    "age": 25,
    "city": "New York"
}

# Dictionary operations
person["email"] = "john@example.com"
age = person.get("age")
```

## Control Structures

### If Statements
```python
age = 18

if age >= 18:
    print("Adult")
elif age >= 13:
    print("Teenager")
else:
    print("Child")
```

### Loops
```python
# For loop
for i in range(5):
    print(i)

# While loop
count = 0
while count < 5:
    print(count)
    count += 1
```

## Functions

### Basic Functions
```python
def greet(name):
    return f"Hello, {name}!"

# Function call
message = greet("John")
```

### Lambda Functions
```python
square = lambda x: x ** 2
result = square(5)  # Returns 25
```

## Object-Oriented Programming

### Classes and Objects
```python
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age
    
    def introduce(self):
        return f"I am {self.name}, {self.age} years old"

# Creating an object
person = Person("John", 25)
introduction = person.introduce()
```

### Inheritance
```python
class Student(Person):
    def __init__(self, name, age, student_id):
        super().__init__(name, age)
        self.student_id = student_id
    
    def study(self):
        return f"{self.name} is studying"
```

## Modules and Packages

### Using Built-in Modules
```python
import math
import random

# Math operations
sqrt_value = math.sqrt(16)
random_number = random.randint(1, 10)
```

### Creating Custom Modules
```python
# mymodule.py
def custom_function():
    return "Hello from custom module!"

# main.py
import mymodule
result = mymodule.custom_function()
```

## File Handling

### Reading and Writing Files
```python
# Writing to a file
with open("example.txt", "w") as file:
    file.write("Hello, World!")

# Reading from a file
with open("example.txt", "r") as file:
    content = file.read()
```

## Error Handling

### Try-Except Blocks
```python
try:
    result = 10 / 0
except ZeroDivisionError:
    print("Cannot divide by zero!")
except Exception as e:
    print(f"An error occurred: {e}")
finally:
    print("This always executes")
```

## Advanced Topics

### Decorators
```python
def my_decorator(func):
    def wrapper():
        print("Before function")
        func()
        print("After function")
    return wrapper

@my_decorator
def say_hello():
    print("Hello!")
```

### Generators
```python
def number_generator(n):
    for i in range(n):
        yield i

# Using generator
gen = number_generator(5)
for num in gen:
    print(num)
```

### Context Managers
```python
class MyContextManager:
    def __enter__(self):
        print("Entering context")
        return self
    
    def __exit__(self, exc_type, exc_value, traceback):
        print("Exiting context")

# Using context manager
with MyContextManager():
    print("Inside context")
```

### List Comprehensions
```python
# List comprehension
squares = [x**2 for x in range(10)]

# Dictionary comprehension
square_dict = {x: x**2 for x in range(5)}
```

## Modern Python Features

### Type Hints and Annotations
```python
from typing import List, Dict, Optional, Union, TypeVar, Generic

T = TypeVar('T')
class Stack(Generic[T]):
    def __init__(self) -> None:
        self.items: List[T] = []
    
    def push(self, item: T) -> None:
        self.items.append(item)
    
    def pop(self) -> Optional[T]:
        return self.items.pop() if self.items else None

# Type aliases
UserID = int
UserData = Dict[str, Union[str, int]]

def get_user(user_id: UserID) -> Optional[UserData]:
    # Implementation
    pass
```

### Async Programming
```python
import asyncio
from aiohttp import ClientSession

async def fetch_data(url: str) -> dict:
    async with ClientSession() as session:
        async with session.get(url) as response:
            return await response.json()

async def process_urls(urls: List[str]) -> List[dict]:
    tasks = [fetch_data(url) for url in urls]
    return await asyncio.gather(*tasks)

# Using async context managers
async def process_file(filename: str):
    async with aiofiles.open(filename, mode='r') as f:
        content = await f.read()
        return content

# Running async code
async def main():
    urls = [
        'https://api.example.com/data1',
        'https://api.example.com/data2'
    ]
    results = await process_urls(urls)
    print(results)

if __name__ == "__main__":
    asyncio.run(main())
```

### Pattern Matching (Python 3.10+)
```python
def analyze_data(data):
    match data:
        case {"type": "user", "name": str(name), "age": int(age)}:
            return f"User {name} is {age} years old"
        
        case {"type": "post", "title": str(title), "content": str(content)}:
            return f"Post titled '{title}' with content"
        
        case [int(x), int(y), *rest] if x > 0 and y > 0:
            return f"Positive coordinates: ({x}, {y})"
        
        case _:
            return "Unknown data format"

# Using pattern matching with classes
class Point:
    def __init__(self, x: int, y: int):
        self.x = x
        self.y = y

def analyze_point(point):
    match point:
        case Point(x=0, y=0):
            return "At origin"
        case Point(x=x, y=y) if x == y:
            return f"On diagonal at {x}"
        case Point():
            return "Somewhere else"
```

### Data Classes
```python
from dataclasses import dataclass, field
from datetime import datetime

@dataclass(frozen=True)
class User:
    id: int
    name: str
    email: str
    created_at: datetime = field(default_factory=datetime.now)
    active: bool = True
    
    def to_dict(self) -> dict:
        return {
            'id': self.id,
            'name': self.name,
            'email': self.email,
            'created_at': self.created_at.isoformat(),
            'active': self.active
        }

# Inheritance with dataclasses
@dataclass
class AdminUser(User):
    permissions: List[str] = field(default_factory=list)
```

### Modern Error Handling
```python
from contextlib import contextmanager
from typing import Generator

class APIError(Exception):
    def __init__(self, message: str, status_code: int):
        self.status_code = status_code
        super().__init__(message)

@contextmanager
def handle_api_errors() -> Generator[None, None, None]:
    try:
        yield
    except APIError as e:
        print(f"API Error {e.status_code}: {str(e)}")
    except Exception as e:
        print(f"Unexpected error: {str(e)}")
        raise

# Using the context manager
with handle_api_errors():
    # API calls here
    pass
```

### Advanced Decorators
```python
import functools
from typing import Callable, TypeVar, ParamSpec

P = ParamSpec('P')
R = TypeVar('R')

def retry(max_attempts: int = 3, delay: float = 1.0):
    def decorator(func: Callable[P, R]) -> Callable[P, R]:
        @functools.wraps(func)
        def wrapper(*args: P.args, **kwargs: P.kwargs) -> R:
            last_error = None
            for attempt in range(max_attempts):
                try:
                    return func(*args, **kwargs)
                except Exception as e:
                    last_error = e
                    if attempt < max_attempts - 1:
                        time.sleep(delay)
            raise last_error
        return wrapper
    return decorator

# Using the decorator
@retry(max_attempts=3, delay=1.0)
def fetch_data(url: str) -> dict:
    # Implementation
    pass
```

### Modern Testing
```python
import pytest
from unittest.mock import Mock, patch
from typing import Generator
import asyncio

# Fixtures
@pytest.fixture
def database_connection() -> Generator:
    print("Setting up database connection")
    yield "Database connection"
    print("Tearing down database connection")

# Parametrized tests
@pytest.mark.parametrize("input,expected", [
    (1, 2),
    (2, 4),
    (3, 6)
])
def test_multiply_by_two(input, expected):
    assert input * 2 == expected

# Async testing
@pytest.mark.asyncio
async def test_async_function():
    async def async_double(x: int) -> int:
        await asyncio.sleep(0.1)
        return x * 2

    result = await async_double(2)
    assert result == 4

# Mocking
def test_api_call():
    with patch('requests.get') as mock_get:
        mock_get.return_value.status_code = 200
        mock_get.return_value.json.return_value = {"data": "test"}
        
        # Your API call here
        response = mock_get("http://api.example.com")
        assert response.status_code == 200
        assert response.json() == {"data": "test"}

# Property-based testing
from hypothesis import given, strategies as st

@given(st.lists(st.integers()))
def test_list_reversal(lst):
    # This test will be run against many randomly generated lists
    reversed_twice = lst.reverse()
    reversed_twice.reverse()
    assert lst == reversed_twice
```

### Advanced Web Development
```python
from fastapi import FastAPI, Depends, HTTPException, status
from sqlalchemy.orm import Session
from typing import List
import uvicorn

app = FastAPI()

# Dependency Injection
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# Pydantic models
from pydantic import BaseModel, Field

class UserBase(BaseModel):
    email: str = Field(..., example="user@example.com")
    username: str = Field(..., min_length=3, max_length=50)

class UserCreate(UserBase):
    password: str = Field(..., min_length=8)

class User(UserBase):
    id: int
    is_active: bool = True

    class Config:
        orm_mode = True

# FastAPI routes with dependency injection
@app.post("/users/", response_model=User)
async def create_user(user: UserCreate, db: Session = Depends(get_db)):
    db_user = get_user_by_email(db, email=user.email)
    if db_user:
        raise HTTPException(
            status_code=400,
            detail="Email already registered"
        )
    return create_user_in_db(db=db, user=user)

# WebSocket support
from fastapi import WebSocket

@app.websocket("/ws/{client_id}")
async def websocket_endpoint(websocket: WebSocket, client_id: int):
    await websocket.accept()
    try:
        while True:
            data = await websocket.receive_text()
            await websocket.send_text(f"Message text was: {data}")
    except WebSocketDisconnect:
        print(f"Client #{client_id} disconnected")

# Background tasks
from fastapi import BackgroundTasks

def write_notification(email: str, message: str):
    with open("log.txt", mode="a") as email_file:
        content = f"notification for {email}: {message}\n"
        email_file.write(content)

@app.post("/send-notification/{email}")
async def send_notification(
    email: str,
    background_tasks: BackgroundTasks
):
    background_tasks.add_task(write_notification, email, message="some notification")
    return {"message": "Notification sent in the background"}
```

### Machine Learning Integration
```python
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import classification_report
import joblib

class MLModel:
    def __init__(self):
        self.model = RandomForestClassifier()
        self.scaler = StandardScaler()

    def preprocess_data(self, X: np.ndarray) -> np.ndarray:
        return self.scaler.fit_transform(X)

    def train(self, X: np.ndarray, y: np.ndarray) -> None:
        X_scaled = self.preprocess_data(X)
        X_train, X_test, y_train, y_test = train_test_split(
            X_scaled, y, test_size=0.2, random_state=42
        )
        self.model.fit(X_train, y_train)
        y_pred = self.model.predict(X_test)
        print(classification_report(y_test, y_pred))

    def predict(self, X: np.ndarray) -> np.ndarray:
        X_scaled = self.scaler.transform(X)
        return self.model.predict(X_scaled)

    def save_model(self, path: str) -> None:
        joblib.dump((self.model, self.scaler), path)

    @classmethod
    def load_model(cls, path: str) -> 'MLModel':
        instance = cls()
        instance.model, instance.scaler = joblib.load(path)
        return instance

# Using the ML model
def train_and_save_model():
    # Generate sample data
    X = np.random.randn(100, 4)
    y = (X.sum(axis=1) > 0).astype(int)

    model = MLModel()
    model.train(X, y)
    model.save_model("model.joblib")

    # Load and use the model
    loaded_model = MLModel.load_model("model.joblib")
    predictions = loaded_model.predict(np.random.randn(5, 4))
    print("Predictions:", predictions)
```

## Example Projects

### Building a RESTful API
```python
from fastapi import FastAPI, HTTPException, Depends
from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, Session
from pydantic import BaseModel
import uvicorn

# Database setup
SQLALCHEMY_DATABASE_URL = "sqlite:///./test.db"
engine = create_engine(SQLALCHEMY_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

# Database model
class DBUser(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True, index=True)
    email = Column(String, unique=True, index=True)
    username = Column(String)
    password = Column(String)

Base.metadata.create_all(bind=engine)

# Pydantic models
class UserBase(BaseModel):
    email: str
    username: str

class UserCreate(UserBase):
    password: str

class User(UserBase):
    id: int

    class Config:
        orm_mode = True

# FastAPI app
app = FastAPI()

# Dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.post("/users/", response_model=User)
def create_user(user: UserCreate, db: Session = Depends(get_db)):
    db_user = db.query(DBUser).filter(DBUser.email == user.email).first()
    if db_user:
        raise HTTPException(status_code=400, detail="Email already registered")
    
    db_user = DBUser(**user.dict())
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user

@app.get("/users/", response_model=list[User])
def read_users(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    users = db.query(DBUser).offset(skip).limit(limit).all()
    return users

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
```

### Building a Real-time Chat Application
```python
import asyncio
import websockets
import json
from dataclasses import dataclass
from typing import Set, Dict

@dataclass
class ChatRoom:
    name: str
    clients: Set[websockets.WebSocketServerProtocol]

class ChatServer:
    def __init__(self):
        self.rooms: Dict[str, ChatRoom] = {}

    async def register(self, websocket: websockets.WebSocketServerProtocol, room_name: str):
        if room_name not in self.rooms:
            self.rooms[room_name] = ChatRoom(room_name, set())
        self.rooms[room_name].clients.add(websocket)

    async def unregister(self, websocket: websockets.WebSocketServerProtocol, room_name: str):
        self.rooms[room_name].clients.remove(websocket)
        if not self.rooms[room_name].clients:
            del self.rooms[room_name]

    async def broadcast(self, room_name: str, message: str):
        if room_name in self.rooms:
            for client in self.rooms[room_name].clients:
                try:
                    await client.send(message)
                except websockets.ConnectionClosed:
                    pass

chat_server = ChatServer()

async def chat(websocket: websockets.WebSocketServerProtocol, path: str):
    try:
        # Receive the initial message with room information
        init_message = await websocket.recv()
        data = json.loads(init_message)
        room_name = data["room"]
        
        await chat_server.register(websocket, room_name)
        try:
            async for message in websocket:
                await chat_server.broadcast(room_name, message)
        finally:
            await chat_server.unregister(websocket, room_name)
    except websockets.ConnectionClosed:
        pass

async def main():
    async with websockets.serve(chat, "localhost", 8765):
        await asyncio.Future()  # run forever

if __name__ == "__main__":
    asyncio.run(main())

# HTML/JavaScript client
"""
<!DOCTYPE html>
<html>
<head>
    <title>WebSocket Chat</title>
</head>
<body>
    <div id="messages"></div>
    <input type="text" id="messageInput" placeholder="Type a message...">
    <button onclick="sendMessage()">Send</button>

    <script>
        const ws = new WebSocket('ws://localhost:8765');
        
        // Join a room when connecting
        ws.onopen = () => {
            ws.send(JSON.stringify({
                room: 'general'
            }));
        };
        
        ws.onmessage = (event) => {
            const messages = document.getElementById('messages');
            messages.innerHTML += `<p>${event.data}</p>`;
        };
        
        function sendMessage() {
            const input = document.getElementById('messageInput');
            ws.send(input.value);
            input.value = '';
        }
    </script>
</body>
</html>
```

### Building a Task Queue System
```python
import redis
import json
import time
from typing import Callable, Any, Dict
from dataclasses import dataclass
import threading
import uuid

@dataclass
class Task:
    id: str
    func: str
    args: tuple
    kwargs: dict
    status: str
    result: Any = None

class TaskQueue:
    def __init__(self, redis_url: str = "redis://localhost:6379"):
        self.redis = redis.from_url(redis_url)
        self.tasks: Dict[str, Task] = {}
        self.functions: Dict[str, Callable] = {}

    def register_function(self, func: Callable):
        self.functions[func.__name__] = func
        return func

    def enqueue(self, func: Callable, *args, **kwargs) -> str:
        task_id = str(uuid.uuid4())
        task = Task(
            id=task_id,
            func=func.__name__,
            args=args,
            kwargs=kwargs,
            status="pending"
        )
        self.tasks[task_id] = task
        self.redis.lpush(
            "task_queue",
            json.dumps({
                "id": task_id,
                "func": func.__name__,
                "args": args,
                "kwargs": kwargs
            })
        )
        return task_id

    def get_task_status(self, task_id: str) -> Dict[str, Any]:
        task = self.tasks.get(task_id)
        if task:
            return {
                "id": task.id,
                "status": task.status,
                "result": task.result
            }
        return {"error": "Task not found"}

    def process_tasks(self):
        while True:
            # Get task from Redis queue
            task_data = self.redis.brpop("task_queue")
            if task_data:
                task_info = json.loads(task_data[1])
                task_id = task_info["id"]
                task = self.tasks[task_id]
                
                try:
                    # Execute the task
                    func = self.functions[task.func]
                    result = func(*task.args, **task.kwargs)
                    
                    # Update task status and result
                    task.status = "completed"
                    task.result = result
                except Exception as e:
                    task.status = "failed"
                    task.result = str(e)

    def start_worker(self, num_threads: int = 1):
        for _ in range(num_threads):
            thread = threading.Thread(target=self.process_tasks)
            thread.daemon = True
            thread.start()

# Example usage
queue = TaskQueue()

@queue.register_function
def add(x: int, y: int) -> int:
    time.sleep(1)  # Simulate long-running task
    return x + y

@queue.register_function
def multiply(x: int, y: int) -> int:
    time.sleep(1)  # Simulate long-running task
    return x * y

# Start worker threads
queue.start_worker(num_threads=2)

# Enqueue tasks
task1_id = queue.enqueue(add, 2, 3)
task2_id = queue.enqueue(multiply, 4, 5)

# Check task status
print(queue.get_task_status(task1_id))
print(queue.get_task_status(task2_id))

# Wait for tasks to complete
time.sleep(2)

print(queue.get_task_status(task1_id))
print(queue.get_task_status(task2_id))
```

## Best Practices

1. Follow PEP 8 style guide
2. Use meaningful variable names
3. Write docstrings for functions and classes
4. Keep functions small and focused
5. Use type hints for better code readability
6. Handle errors appropriately
7. Write unit tests for your code

## Additional Resources

1. [Official Python Documentation](https://docs.python.org)
2. [Python Package Index (PyPI)](https://pypi.org)
3. [Real Python Tutorials](https://realpython.com)
4. [Python Weekly Newsletter](https://pythonweekly.com)

## Practice Projects

1. Create a simple calculator
2. Build a to-do list application
3. Implement a basic web scraper
4. Create a file organizer
5. Build a simple game (e.g., Tic-tac-toe)

## Advanced Projects

1. Build a Modern Web API
   - Use FastAPI or Django REST framework
   - Implement async views
   - Add type hints
   - Include comprehensive testing

2. Create a Data Processing Pipeline
   - Use async programming
   - Implement parallel processing
   - Add error handling
   - Include monitoring

3. Develop a CLI Application
   - Use Click or Typer
   - Implement rich terminal output
   - Add progress bars
   - Include configuration management

4. Build a Machine Learning Pipeline
   - Use modern ML libraries
   - Implement data validation
   - Add experiment tracking
   - Include model serving

5. Create a Microservices Application
   - Use modern messaging
   - Implement service discovery
   - Add health checks
   - Include logging and monitoring

Remember to:
- Use type hints consistently
- Write comprehensive tests
- Document your code
- Follow PEP 8 guidelines
- Use modern Python features appropriately

## Modern Python Development

### Type Hints and Static Type Checking
```python
from typing import List, Dict, Optional, Union, Callable

def process_data(items: List[int]) -> Dict[str, float]:
    result: Dict[str, float] = {}
    total: float = sum(items)
    result["sum"] = total
    result["average"] = total / len(items)
    return result

# Optional and Union types
def find_user(user_id: int) -> Optional[Dict[str, Union[str, int]]]:
    # Could return None if user not found
    return {"name": "John", "age": 30} if user_id > 0 else None

# Type aliases
UserData = Dict[str, Union[str, int]]
ProcessFunction = Callable[[List[int]], float]
```

### Modern Python Features (3.10+)
```python
# Pattern matching (Python 3.10+)
def analyze_data(data):
    match data:
        case {"type": "user", "name": str(name), "age": int(age)}:
            return f"User {name} is {age} years old"
        case {"type": "product", "name": str(name), "price": float(price)}:
            return f"Product {name} costs ${price:.2f}"
        case _:
            return "Unknown data format"

# Union types with |
def process_value(value: int | float | str) -> str:
    return str(value)

# Enhanced error messages
try:
    result = 1 / 0
except ZeroDivisionError as e:
    print(f"Error details: {e.__class__.__name__}: {e}")
```

### Asynchronous Programming
```python
import asyncio
from aiohttp import ClientSession

async def fetch_data(url: str) -> dict:
    async with ClientSession() as session:
        async with session.get(url) as response:
            return await response.json()

async def process_multiple_urls(urls: List[str]) -> List[dict]:
    tasks = [fetch_data(url) for url in urls]
    return await asyncio.gather(*tasks)

# Using asyncio
async def main():
    urls = [
        "https://api.example.com/data1",
        "https://api.example.com/data2"
    ]
    results = await process_multiple_urls(urls)
    for result in results:
        print(result)

if __name__ == "__main__":
    asyncio.run(main())
```

## Web Development with FastAPI

### Basic API Setup
```python
from fastapi import FastAPI, HTTPException, Depends
from pydantic import BaseModel
from typing import List, Optional

app = FastAPI()

class User(BaseModel):
    id: int
    name: str
    email: str
    age: Optional[int] = None

users: List[User] = []

@app.post("/users/", response_model=User)
async def create_user(user: User):
    users.append(user)
    return user

@app.get("/users/{user_id}", response_model=User)
async def get_user(user_id: int):
    if user := next((u for u in users if u.id == user_id), None):
        return user
    raise HTTPException(status_code=404, detail="User not found")
```

### Dependency Injection
```python
from fastapi import Depends
from sqlalchemy.orm import Session

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/users/{user_id}")
async def get_user(user_id: int, db: Session = Depends(get_db)):
    if user := db.query(UserModel).filter(UserModel.id == user_id).first():
        return user
    raise HTTPException(status_code=404, detail="User not found")
```

## Data Science and Machine Learning

### Data Analysis with Pandas
```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Data loading and basic analysis
def analyze_dataset(file_path: str) -> pd.DataFrame:
    df = pd.read_csv(file_path)
    
    # Basic statistics
    print("Dataset Info:")
    print(df.info())
    print("\nNumerical Columns Statistics:")
    print(df.describe())
    
    # Handle missing values
    df = df.fillna(df.mean(numeric_only=True))
    
    # Feature engineering
    df['year'] = pd.to_datetime(df['date']).dt.year
    df['month'] = pd.to_datetime(df['date']).dt.month
    
    return df

# Data visualization
def visualize_data(df: pd.DataFrame, target_column: str):
    plt.figure(figsize=(12, 6))
    
    # Distribution plot
    sns.histplot(data=df, x=target_column, kde=True)
    plt.title(f'Distribution of {target_column}')
    plt.show()
    
    # Correlation heatmap
    plt.figure(figsize=(10, 8))
    sns.heatmap(df.corr(), annot=True, cmap='coolwarm')
    plt.title('Correlation Matrix')
    plt.show()
```

### Machine Learning with Scikit-learn
```python
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import classification_report

def train_model(df: pd.DataFrame, target_column: str):
    # Prepare data
    X = df.drop(columns=[target_column])
    y = df[target_column]
    
    # Split dataset
    X_train, X_test, y_train, y_test = train_test_split(
        X, y, test_size=0.2, random_state=42
    )
    
    # Scale features
    scaler = StandardScaler()
    X_train_scaled = scaler.fit_transform(X_train)
    X_test_scaled = scaler.transform(X_test)
    
    # Train model
    model = RandomForestClassifier(n_estimators=100, random_state=42)
    model.fit(X_train_scaled, y_train)
    
    # Evaluate model
    y_pred = model.predict(X_test_scaled)
    print("\nModel Performance:")
    print(classification_report(y_test, y_pred))
    
    return model, scaler
```

## Testing and Quality Assurance

### Unit Testing with pytest
```python
import pytest
from typing import List

def calculate_statistics(numbers: List[float]) -> dict:
    if not numbers:
        raise ValueError("List cannot be empty")
    return {
        "mean": sum(numbers) / len(numbers),
        "min": min(numbers),
        "max": max(numbers)
    }

class TestCalculations:
    def test_basic_statistics(self):
        numbers = [1.0, 2.0, 3.0, 4.0, 5.0]
        result = calculate_statistics(numbers)
        assert result["mean"] == 3.0
        assert result["min"] == 1.0
        assert result["max"] == 5.0
    
    def test_empty_list(self):
        with pytest.raises(ValueError):
            calculate_statistics([])
    
    @pytest.mark.parametrize("input_list,expected_mean", [
        ([1, 2, 3], 2.0),
        ([0, 0, 0], 0.0),
        ([1, -1], 0.0)
    ])
    def test_mean_calculations(self, input_list, expected_mean):
        result = calculate_statistics(input_list)
        assert result["mean"] == expected_mean
```

### Integration Testing
```python
import pytest
from fastapi.testclient import TestClient
from your_app import app

client = TestClient(app)

def test_create_user():
    response = client.post(
        "/users/",
        json={"id": 1, "name": "Test User", "email": "test@example.com"}
    )
    assert response.status_code == 200
    assert response.json()["name"] == "Test User"

def test_get_user():
    # First create a user
    client.post(
        "/users/",
        json={"id": 1, "name": "Test User", "email": "test@example.com"}
    )
    
    # Then retrieve the user
    response = client.get("/users/1")
    assert response.status_code == 200
    assert response.json()["name"] == "Test User"
```

## Best Practices and Design Patterns

### Clean Code Principles
```python
# Bad example
def p(d):
    return d['x'] * d['y']

# Good example
def calculate_area(dimensions: dict) -> float:
    """Calculate the area of a rectangle.
    
    Args:
        dimensions: Dictionary containing 'width' and 'height' keys
    
    Returns:
        The area of the rectangle
    """
    return dimensions['width'] * dimensions['height']

# Bad example
l = []
for i in range(10):
    if i % 2 == 0:
        l.append(i)

# Good example
even_numbers = [num for num in range(10) if num % 2 == 0]
```

### Design Patterns
```python
# Singleton Pattern
class DatabaseConnection:
    _instance = None
    
    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls._instance.initialize()
        return cls._instance
    
    def initialize(self):
        self.host = "localhost"
        self.port = 5432
        self.connected = False

# Factory Pattern
from abc import ABC, abstractmethod

class Animal(ABC):
    @abstractmethod
    def speak(self) -> str:
        pass

class Dog(Animal):
    def speak(self) -> str:
        return "Woof!"

class Cat(Animal):
    def speak(self) -> str:
        return "Meow!"

class AnimalFactory:
    @staticmethod
    def create_animal(animal_type: str) -> Animal:
        if animal_type.lower() == "dog":
            return Dog()
        elif animal_type.lower() == "cat":
            return Cat()
        raise ValueError(f"Unknown animal type: {animal_type}")
```

### Performance Optimization
```python
from functools import lru_cache
import time

# Using memoization for expensive calculations
@lru_cache(maxsize=128)
def fibonacci(n: int) -> int:
    if n < 2:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

# Context managers for resource management
class Timer:
    def __enter__(self):
        self.start = time.time()
        return self
    
    def __exit__(self, *args):
        self.end = time.time()
        self.duration = self.end - self.start

# Usage example
def process_large_dataset(data: List[int]) -> List[int]:
    with Timer() as timer:
        result = [fibonacci(n) for n in data]
    print(f"Processing took {timer.duration:.2f} seconds")
    return result
```

## Security Best Practices

### Secure Password Handling
```python
import hashlib
import os
from typing import Tuple

def hash_password(password: str) -> Tuple[bytes, bytes]:
    """Hash a password with a random salt using SHA-256."""
    salt = os.urandom(32)
    hash_obj = hashlib.pbkdf2_hmac(
        'sha256',
        password.encode('utf-8'),
        salt,
        100000
    )
    return hash_obj, salt

def verify_password(password: str, hash_obj: bytes, salt: bytes) -> bool:
    """Verify a password against its hash."""
    new_hash = hashlib.pbkdf2_hmac(
        'sha256',
        password.encode('utf-8'),
        salt,
        100000
    )
    return hash_obj == new_hash
```

### Input Validation
```python
from pydantic import BaseModel, EmailStr, constr, validator
from datetime import date

class UserRegistration(BaseModel):
    username: constr(min_length=3, max_length=50)
    email: EmailStr
    password: constr(min_length=8)
    birth_date: date
    
    @validator('birth_date')
    def validate_age(cls, v):
        today = date.today()
        age = today.year - v.year
        if age < 18:
            raise ValueError('Must be at least 18 years old')
        return v
    
    @validator('password')
    def validate_password_strength(cls, v):
        if not any(c.isupper() for c in v):
            raise ValueError('Password must contain at least one uppercase letter')
        if not any(c.islower() for c in v):
            raise ValueError('Password must contain at least one lowercase letter')
        if not any(c.isdigit() for c in v):
            raise ValueError('Password must contain at least one number')
        return v
```

## Project Structure and Organization

### Modern Project Structure
```plaintext
my_project/
├── src/
│   ├── __init__.py
│   ├── main.py
│   ├── config.py
│   ├── api/
│   │   ├── __init__.py
│   │   ├── routes.py
│   │   └── dependencies.py
│   ├── models/
│   │   ├── __init__.py
│   │   ├── user.py
│   │   └── product.py
│   ├── services/
│   │   ├── __init__.py
│   │   └── business_logic.py
│   └── utils/
│       ├── __init__.py
│       └── helpers.py
├── tests/
│   ├── __init__.py
│   ├── test_api.py
│   └── test_services.py
├── docs/
│   ├── api.md
│   └── setup.md
├── requirements.txt
├── setup.py
└── README.md
```

### Configuration Management
```python
from pydantic import BaseSettings
from functools import lru_cache

class Settings(BaseSettings):
    app_name: str = "MyApp"
    database_url: str
    api_key: str
    debug: bool = False
    
    class Config:
        env_file = ".env"

@lru_cache()
def get_settings() -> Settings:
    return Settings()

# Usage
settings = get_settings()
print(f"Connecting to: {settings.database_url}")
```

This concludes the comprehensive Python tutorial with modern features, best practices, and practical examples for various use cases.
