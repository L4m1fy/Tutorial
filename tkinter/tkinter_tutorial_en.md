# Tkinter Tutorial

## Table of Contents
1. [Introduction](#introduction)
2. [Getting Started](#getting-started)
3. [Basic Widgets](#basic-widgets)
4. [Layout Management](#layout-management)
5. [Event Handling](#event-handling)
6. [Advanced Widgets](#advanced-widgets)
7. [Menus and Dialogs](#menus-and-dialogs)
8. [Styling and Themes](#styling-and-themes)
9. [Best Practices](#best-practices)
10. [Example Projects](#example-projects)
11. [Working with JSON Configuration](#working-with-json-configuration)
12. [Modern Tkinter Features](#modern-tkinter-features)
13. [Advanced Projects](#advanced-projects)

## Introduction

Tkinter is Python's standard GUI (Graphical User Interface) library. It provides a fast and easy way to create GUI applications. Tkinter comes pre-installed with Python, making it the most convenient choice for creating desktop applications with Python.

## Getting Started

### Basic Window Creation
```python
import tkinter as tk

# Create the main window
root = tk.Tk()
root.title("My First Tkinter App")
root.geometry("400x300")  # Width x Height

# Start the event loop
root.mainloop()
```

### Adding Widgets
```python
import tkinter as tk

root = tk.Tk()
root.title("Basic Widgets Example")

# Adding a label
label = tk.Label(root, text="Hello, Tkinter!")
label.pack()

# Adding a button
button = tk.Button(root, text="Click Me!", command=lambda: print("Button clicked!"))
button.pack()

root.mainloop()
```

## Basic Widgets

### Label
```python
# Text label
text_label = tk.Label(root, text="This is a label")
text_label.pack()

# Image label
image = tk.PhotoImage(file="image.png")
image_label = tk.Label(root, image=image)
image_label.image = image  # Keep a reference!
image_label.pack()
```

### Button
```python
def button_click():
    print("Button clicked!")

# Basic button
button = tk.Button(root, text="Click Me!", command=button_click)
button.pack()

# Button with custom colors
colored_button = tk.Button(root, 
                          text="Colored Button",
                          bg="blue",  # Background color
                          fg="white",  # Foreground (text) color
                          command=button_click)
colored_button.pack()
```

### Entry (Text Input)
```python
# Single line text input
entry = tk.Entry(root)
entry.pack()

# Password entry
password_entry = tk.Entry(root, show="*")
password_entry.pack()

# Getting entry value
def get_text():
    print(entry.get())

button = tk.Button(root, text="Get Text", command=get_text)
button.pack()
```

### Text (Multiline Text Input)
```python
# Multiline text widget
text = tk.Text(root, height=5, width=30)
text.pack()

# Getting text content
def get_text_content():
    content = text.get("1.0", tk.END)
    print(content)

button = tk.Button(root, text="Get Content", command=get_text_content)
button.pack()
```

## Layout Management

### Pack
```python
# Pack widgets vertically
tk.Label(root, text="Top").pack()
tk.Label(root, text="Middle").pack()
tk.Label(root, text="Bottom").pack()

# Pack widgets horizontally
tk.Label(root, text="Left").pack(side=tk.LEFT)
tk.Label(root, text="Center").pack(side=tk.LEFT)
tk.Label(root, text="Right").pack(side=tk.LEFT)
```

### Grid
```python
# Create a form layout
tk.Label(root, text="Username:").grid(row=0, column=0)
tk.Entry(root).grid(row=0, column=1)

tk.Label(root, text="Password:").grid(row=1, column=0)
tk.Entry(root, show="*").grid(row=1, column=1)

tk.Button(root, text="Login").grid(row=2, column=0, columnspan=2)
```

### Place
```python
# Absolute positioning
label = tk.Label(root, text="Placed Widget")
label.place(x=50, y=50)

# Relative positioning
button = tk.Button(root, text="Relative")
button.place(relx=0.5, rely=0.5, anchor="center")
```

## Event Handling

### Button Click Events
```python
def handle_click():
    print("Button clicked!")

button = tk.Button(root, text="Click Me!", command=handle_click)
button.pack()
```

### Keyboard Events
```python
def handle_keypress(event):
    print(f"Key pressed: {event.char}")

root.bind("<Key>", handle_keypress)

# Specific key binding
def handle_return(event):
    print("Return key pressed!")

root.bind("<Return>", handle_return)
```

### Mouse Events
```python
def handle_mouse_click(event):
    print(f"Mouse clicked at: ({event.x}, {event.y})")

root.bind("<Button-1>", handle_mouse_click)  # Left click
root.bind("<Button-3>", lambda e: print("Right click"))  # Right click

def handle_mouse_motion(event):
    print(f"Mouse moved to: ({event.x}, {event.y})")

root.bind("<Motion>", handle_mouse_motion)
```

## Advanced Widgets

### Listbox
```python
# Create listbox
listbox = tk.Listbox(root)
listbox.pack()

# Add items
items = ["Item 1", "Item 2", "Item 3"]
for item in items:
    listbox.insert(tk.END, item)

# Handle selection
def on_select(event):
    selection = listbox.curselection()
    if selection:
        print(listbox.get(selection[0]))

listbox.bind("<<ListboxSelect>>", on_select)
```

### Combobox (Dropdown)
```python
from tkinter import ttk

# Create combobox
combo = ttk.Combobox(root, values=["Option 1", "Option 2", "Option 3"])
combo.pack()

# Handle selection
def on_select(event):
    print(f"Selected: {combo.get()}")

combo.bind("<<ComboboxSelected>>", on_select)
```

### Checkbutton
```python
# Create variables for checkbuttons
var1 = tk.BooleanVar()
var2 = tk.BooleanVar()

# Create checkbuttons
check1 = tk.Checkbutton(root, text="Option 1", variable=var1)
check2 = tk.Checkbutton(root, text="Option 2", variable=var2)

check1.pack()
check2.pack()

# Get values
def get_values():
    print(f"Option 1: {var1.get()}")
    print(f"Option 2: {var2.get()}")

button = tk.Button(root, text="Get Values", command=get_values)
button.pack()
```

### Radiobutton
```python
# Create variable for radiobuttons
var = tk.StringVar()
var.set("option1")  # Set default value

# Create radiobuttons
radio1 = tk.Radiobutton(root, text="Option 1", variable=var, value="option1")
radio2 = tk.Radiobutton(root, text="Option 2", variable=var, value="option2")

radio1.pack()
radio2.pack()

# Get selected value
def get_selection():
    print(f"Selected: {var.get()}")

button = tk.Button(root, text="Get Selection", command=get_selection)
button.pack()
```

## Menus and Dialogs

### Menu Bar
```python
# Create menu bar
menubar = tk.Menu(root)
root.config(menu=menubar)

# Create File menu
file_menu = tk.Menu(menubar, tearoff=0)
menubar.add_cascade(label="File", menu=file_menu)
file_menu.add_command(label="New", command=lambda: print("New"))
file_menu.add_command(label="Open", command=lambda: print("Open"))
file_menu.add_separator()
file_menu.add_command(label="Exit", command=root.quit)

# Create Edit menu
edit_menu = tk.Menu(menubar, tearoff=0)
menubar.add_cascade(label="Edit", menu=edit_menu)
edit_menu.add_command(label="Cut", command=lambda: print("Cut"))
edit_menu.add_command(label="Copy", command=lambda: print("Copy"))
edit_menu.add_command(label="Paste", command=lambda: print("Paste"))
```

### Message Boxes
```python
from tkinter import messagebox

def show_info():
    messagebox.showinfo("Information", "This is an info message")

def show_warning():
    messagebox.showwarning("Warning", "This is a warning message")

def show_error():
    messagebox.showerror("Error", "This is an error message")

def ask_question():
    result = messagebox.askquestion("Question", "Do you want to proceed?")
    print(f"Result: {result}")  # 'yes' or 'no'

# Create buttons to show different message boxes
tk.Button(root, text="Info", command=show_info).pack()
tk.Button(root, text="Warning", command=show_warning).pack()
tk.Button(root, text="Error", command=show_error).pack()
tk.Button(root, text="Question", command=ask_question).pack()
```

### File Dialog
```python
from tkinter import filedialog

def open_file():
    file_path = filedialog.askopenfilename(
        initialdir="/",
        title="Select file",
        filetypes=(("text files", "*.txt"), ("all files", "*.*"))
    )
    print(f"Selected file: {file_path}")

def save_file():
    file_path = filedialog.asksaveasfilename(
        defaultextension=".txt",
        filetypes=(("text files", "*.txt"), ("all files", "*.*"))
    )
    print(f"Save to: {file_path}")

# Create buttons for file dialogs
tk.Button(root, text="Open File", command=open_file).pack()
tk.Button(root, text="Save File", command=save_file).pack()
```

## Styling and Themes

### TTK Styling
```python
from tkinter import ttk
import tkinter as tk

root = tk.Tk()

# Create a style
style = ttk.Style()

# Configure a style
style.configure("Custom.TButton",
                foreground="white",
                background="blue",
                font=("Arial", 12, "bold"),
                padding=10)

# Apply the style
button = ttk.Button(root, text="Styled Button", style="Custom.TButton")
button.pack(pady=10)

# Change theme
style.theme_use('clam')  # Try: 'default', 'alt', 'clam', 'classic'
```

### Custom Colors and Fonts
```python
# Custom colors
label = tk.Label(root,
                 text="Colored Label",
                 bg="#ff0000",  # Background color
                 fg="#ffffff",  # Text color
                 font=("Arial", 14, "bold"))
label.pack()

# Custom font
custom_font = ("Helvetica", 12, "italic")
button = tk.Button(root,
                   text="Custom Font Button",
                   font=custom_font)
button.pack()
```

## Best Practices

1. **Use Object-Oriented Programming**
```python
class Application(tk.Tk):
    def __init__(self):
        super().__init__()
        
        self.title("OOP Application")
        self.geometry("400x300")
        
        self.create_widgets()
    
    def create_widgets(self):
        self.label = tk.Label(self, text="Hello, World!")
        self.label.pack()
        
        self.button = tk.Button(self, text="Click Me!", command=self.button_click)
        self.button.pack()
    
    def button_click(self):
        print("Button clicked!")

if __name__ == "__main__":
    app = Application()
    app.mainloop()
```

2. **Separate Logic from UI**
```python
class Calculator:
    def add(self, a, b):
        return a + b

class CalculatorGUI:
    def __init__(self, root):
        self.root = root
        self.calc = Calculator()
        
        self.entry1 = tk.Entry(root)
        self.entry1.pack()
        
        self.entry2 = tk.Entry(root)
        self.entry2.pack()
        
        self.button = tk.Button(root, text="Add", command=self.perform_addition)
        self.button.pack()
        
        self.result_label = tk.Label(root, text="Result: ")
        self.result_label.pack()
    
    def perform_addition(self):
        num1 = float(self.entry1.get())
        num2 = float(self.entry2.get())
        result = self.calc.add(num1, num2)
        self.result_label.config(text=f"Result: {result}")
```

3. **Handle Errors Gracefully**
```python
def safe_button_click():
    try:
        # Potentially dangerous operation
        value = int(entry.get())
        result = 10 / value
        label.config(text=f"Result: {result}")
    except ValueError:
        messagebox.showerror("Error", "Please enter a valid number")
    except ZeroDivisionError:
        messagebox.showerror("Error", "Cannot divide by zero")
    except Exception as e:
        messagebox.showerror("Error", f"An error occurred: {str(e)}")
```

## Example Projects

### Simple Calculator
```python
class Calculator(tk.Tk):
    def __init__(self):
        super().__init__()
        
        self.title("Simple Calculator")
        self.geometry("300x400")
        
        self.result_var = tk.StringVar()
        self.create_widgets()
    
    def create_widgets(self):
        # Display
        display = tk.Entry(self, textvariable=self.result_var, justify="right")
        display.grid(row=0, column=0, columnspan=4, sticky="nsew", padx=5, pady=5)
        
        # Buttons
        buttons = [
            '7', '8', '9', '/',
            '4', '5', '6', '*',
            '1', '2', '3', '-',
            '0', '.', '=', '+'
        ]
        
        row = 1
        col = 0
        for button in buttons:
            cmd = lambda x=button: self.click(x)
            tk.Button(self, text=button, command=cmd).grid(row=row, column=col, sticky="nsew")
            col += 1
            if col > 3:
                col = 0
                row += 1
    
    def click(self, key):
        if key == '=':
            try:
                result = eval(self.result_var.get())
                self.result_var.set(result)
            except:
                self.result_var.set("Error")
        else:
            self.result_var.set(self.result_var.get() + key)

if __name__ == "__main__":
    app = Calculator()
    app.mainloop()
```

### To-Do List Application
```python
class TodoApp(tk.Tk):
    def __init__(self):
        super().__init__()
        
        self.title("To-Do List")
        self.geometry("400x500")
        
        self.create_widgets()
    
    def create_widgets(self):
        # Entry for new tasks
        self.task_entry = tk.Entry(self)
        self.task_entry.pack(pady=10)
        
        # Add button
        tk.Button(self, text="Add Task", command=self.add_task).pack()
        
        # Listbox for tasks
        self.task_listbox = tk.Listbox(self, width=50)
        self.task_listbox.pack(pady=10)
        
        # Delete button
        tk.Button(self, text="Delete Task", command=self.delete_task).pack()
        
        # Complete button
        tk.Button(self, text="Complete Task", command=self.complete_task).pack()
    
    def add_task(self):
        task = self.task_entry.get()
        if task:
            self.task_listbox.insert(tk.END, task)
            self.task_entry.delete(0, tk.END)
    
    def delete_task(self):
        try:
            selection = self.task_listbox.curselection()
            self.task_listbox.delete(selection)
        except:
            pass
    
    def complete_task(self):
        try:
            selection = self.task_listbox.curselection()
            task = self.task_listbox.get(selection)
            self.task_listbox.delete(selection)
            self.task_listbox.insert(tk.END, f"✓ {task}")
        except:
            pass

if __name__ == "__main__":
    app = TodoApp()
    app.mainloop()
```

## Working with JSON Configuration

### JSON Configuration Management
```python
import json
import os
from typing import Dict, Any

class ConfigManager:
    def __init__(self, config_file: str):
        self.config_file = config_file
        self.config: Dict[str, Any] = self._load_config()

    def _load_config(self) -> Dict[str, Any]:
        """Load configuration from JSON file or create default if not exists."""
        if os.path.exists(self.config_file):
            try:
                with open(self.config_file, 'r') as f:
                    return json.load(f)
            except json.JSONDecodeError:
                print(f"Error reading config file: {self.config_file}")
                return self._create_default_config()
        return self._create_default_config()

    def _create_default_config(self) -> Dict[str, Any]:
        """Create and save default configuration."""
        default_config = {
            "window": {
                "width": 800,
                "height": 600,
                "title": "My Application",
                "theme": "default"
            },
            "appearance": {
                "font_family": "Arial",
                "font_size": 12,
                "colors": {
                    "background": "#ffffff",
                    "foreground": "#000000",
                    "accent": "#007bff"
                }
            },
            "behavior": {
                "auto_save": True,
                "auto_save_interval": 300,
                "confirm_exit": True
            }
        }
        self.save_config(default_config)
        return default_config

    def save_config(self, config: Dict[str, Any] = None) -> None:
        """Save configuration to JSON file."""
        if config is not None:
            self.config = config
        with open(self.config_file, 'w') as f:
            json.dump(self.config, f, indent=4)

    def get(self, key: str, default: Any = None) -> Any:
        """Get configuration value by key."""
        try:
            keys = key.split('.')
            value = self.config
            for k in keys:
                value = value[k]
            return value
        except (KeyError, TypeError):
            return default

    def set(self, key: str, value: Any) -> None:
        """Set configuration value by key."""
        keys = key.split('.')
        config = self.config
        for k in keys[:-1]:
            config = config.setdefault(k, {})
        config[keys[-1]] = value
        self.save_config()

class ConfigurableApplication(tk.Tk):
    def __init__(self):
        super().__init__()
        
        # Initialize configuration
        self.config_manager = ConfigManager("app_config.json")
        
        # Apply window configuration
        self.title(self.config_manager.get("window.title", "Application"))
        self.geometry(f"{self.config_manager.get('window.width', 800)}x{self.config_manager.get('window.height', 600)}")
        
        # Create and configure widgets
        self.create_widgets()
        self.apply_theme()
        
    def create_widgets(self):
        # Create main content area
        self.text_editor = tk.Text(self)
        self.text_editor.pack(fill="both", expand=True)
        
        # Apply current font settings
        self.update_font()
        
    def update_font(self):
        """Update text editor font based on configuration."""
        family = self.config_manager.get("appearance.font_family", "Arial")
        size = self.config_manager.get("appearance.font_size", 12)
        self.text_editor.configure(font=(family, size))
        
    def apply_theme(self):
        """Apply the current theme configuration."""
        theme = self.config_manager.get("window.theme", "default")
        style = ttk.Style()
        style.theme_use(theme)
        
        # Apply custom colors
        bg_color = self.config_manager.get("appearance.colors.background")
        fg_color = self.config_manager.get("appearance.colors.foreground")
        if bg_color and fg_color:
            self.configure(bg=bg_color)
            style.configure(".", background=bg_color, foreground=fg_color)
            
class ConfigurableWindow:
    """Base class for windows that use configuration."""
    
    def __init__(self, config_manager: ConfigManager, window_key: str):
        self.config_manager = config_manager
        self.window_key = window_key
        
    def save_geometry(self, window: tk.Tk | tk.Toplevel):
        """Save window geometry to configuration."""
        geometry = window.geometry()
        self.config_manager.set(f"{self.window_key}.geometry", geometry)
        
    def load_geometry(self, window: tk.Tk | tk.Toplevel):
        """Load window geometry from configuration."""
        geometry = self.config_manager.get(f"{self.window_key}.geometry")
        if geometry:
            window.geometry(geometry)
            
class SettingsWindow(tk.Toplevel, ConfigurableWindow):
    def __init__(self, parent, config_manager: ConfigManager):
        tk.Toplevel.__init__(self, parent)
        ConfigurableWindow.__init__(self, config_manager, "settings_window")
        
        self.title("Settings")
        self.load_geometry(self)
        
        # Create settings interface
        self.create_widgets()
        
        # Save geometry on window close
        self.protocol("WM_DELETE_WINDOW", self.on_close)
        
    def create_widgets(self):
        # Create notebook for organized settings
        notebook = ttk.Notebook(self)
        notebook.pack(padx=10, pady=10, fill="both", expand=True)
        
        # Appearance settings
        appearance_frame = ttk.Frame(notebook)
        notebook.add(appearance_frame, text="Appearance")
        
        # Theme settings
        theme_frame = ttk.LabelFrame(appearance_frame, text="Theme")
        theme_frame.pack(padx=5, pady=5, fill="x")
        
        ttk.Label(theme_frame, text="Color Scheme:").grid(row=0, column=0, padx=5, pady=5)
        theme_var = tk.StringVar(value=self.config_manager.get("appearance.theme"))
        theme_combo = ttk.Combobox(theme_frame, textvariable=theme_var,
                                 values=["light", "dark", "system"])
        theme_combo.grid(row=0, column=1, padx=5, pady=5)
        theme_combo.bind("<<ComboboxSelected>>", 
                        lambda e: self.config_manager.set("appearance.theme", theme_var.get()))
        
        # Font settings
        font_frame = ttk.LabelFrame(appearance_frame, text="Font")
        font_frame.pack(padx=5, pady=5, fill="x")
        
        ttk.Label(font_frame, text="Family:").grid(row=0, column=0, padx=5, pady=5)
        font_family_var = tk.StringVar(value=self.config_manager.get("appearance.font_family"))
        font_family_combo = ttk.Combobox(font_frame, textvariable=font_family_var,
                                       values=["Arial", "Helvetica", "Times New Roman"])
        font_family_combo.grid(row=0, column=1, padx=5, pady=5)
        font_family_combo.bind("<<ComboboxSelected>>",
                             lambda e: self.config_manager.set("appearance.font_family", 
                                                            font_family_var.get()))
        
        # Behavior settings
        behavior_frame = ttk.Frame(notebook)
        notebook.add(behavior_frame, text="Behavior")
        
        # Auto-save settings
        auto_save_frame = ttk.LabelFrame(behavior_frame, text="Auto Save")
        auto_save_frame.pack(padx=5, pady=5, fill="x")
        
        auto_save_var = tk.BooleanVar(value=self.config_manager.get("behavior.auto_save"))
        auto_save_check = ttk.Checkbutton(auto_save_frame, text="Enable Auto-save",
                                        variable=auto_save_var,
                                        command=lambda: self.config_manager.set(
                                            "behavior.auto_save", auto_save_var.get()))
        auto_save_check.pack(padx=5, pady=5)
        
        ttk.Label(auto_save_frame, text="Interval (seconds):").pack(padx=5)
        interval_var = tk.StringVar(value=str(
            self.config_manager.get("behavior.auto_save_interval", 300)))
        interval_spin = ttk.Spinbox(auto_save_frame, from_=60, to=3600, width=10,
                                  textvariable=interval_var)
        interval_spin.pack(padx=5, pady=5)
        interval_spin.bind("<Return>", lambda e: self.config_manager.set(
            "behavior.auto_save_interval", int(interval_var.get())))
        
    def on_close(self):
        """Handle window close event."""
        self.save_geometry(self)
        self.destroy()

class MainApplication(tk.Tk, ConfigurableWindow):
    def __init__(self):
        tk.Tk.__init__(self)
        
        # Initialize configuration
        self.config_manager = ConfigManager("app_config.json")
        ConfigurableWindow.__init__(self, self.config_manager, "main_window")
        
        # Configure main window
        self.title(self.config_manager.get("window.title", "Configurable Application"))
        self.load_geometry(self)
        
        # Create menu
        self.create_menu()
        
        # Create main interface
        self.create_widgets()
        
        # Save geometry on window close
        self.protocol("WM_DELETE_WINDOW", self.on_close)
        
    def create_menu(self):
        menubar = tk.Menu(self)
        self.config(menu=menubar)
        
        # File menu
        file_menu = tk.Menu(menubar, tearoff=0)
        menubar.add_cascade(label="File", menu=file_menu)
        file_menu.add_command(label="New", command=self.new_file)
        file_menu.add_command(label="Open", command=self.open_file)
        file_menu.add_command(label="Save", command=self.save_file)
        file_menu.add_separator()
        file_menu.add_command(label="Exit", command=self.on_close)
        
        # Edit menu
        edit_menu = tk.Menu(menubar, tearoff=0)
        menubar.add_cascade(label="Edit", menu=edit_menu)
        edit_menu.add_command(label="Settings", command=self.show_settings)
        
    def create_widgets(self):
        # Create main content area
        self.text_editor = tk.Text(self)
        self.text_editor.pack(fill="both", expand=True)
        
        # Apply current font settings
        self.update_font()
        
    def update_font(self):
        """Update text editor font based on configuration."""
        family = self.config_manager.get("appearance.font_family", "Arial")
        size = self.config_manager.get("appearance.font_size", 12)
        self.text_editor.configure(font=(family, size))
        
    def show_settings(self):
        """Show the settings window."""
        SettingsWindow(self, self.config_manager)
        
    def new_file(self):
        """Create a new file."""
        if self.config_manager.get("behavior.confirm_action", True):
            if not messagebox.askyesno("New File", "Create new file? Unsaved changes will be lost."):
                return
        self.text_editor.delete("1.0", tk.END)
        
    def open_file(self):
        """Open a file."""
        file_path = filedialog.askopenfilename(
            filetypes=[("Text files", "*.txt"), ("All files", "*.*")])
        if file_path:
            try:
                with open(file_path, 'r') as file:
                    content = file.read()
                self.text_editor.delete("1.0", tk.END)
                self.text_editor.insert("1.0", content)
            except Exception as e:
                messagebox.showerror("Error", f"Failed to open file: {str(e)}")
                
    def save_file(self):
        """Save the current file."""
        file_path = filedialog.asksaveasfilename(
            defaultextension=".txt",
            filetypes=[("Text files", "*.txt"), ("All files", "*.*")])
        if file_path:
            try:
                content = self.text_editor.get("1.0", tk.END)
                with open(file_path, 'w') as file:
                    file.write(content)
            except Exception as e:
                messagebox.showerror("Error", f"Failed to save file: {str(e)}")
                
    def on_close(self):
        """Handle application close."""
        if self.config_manager.get("behavior.confirm_exit", True):
            if not messagebox.askyesno("Exit", "Are you sure you want to exit?"):
                return
        self.save_geometry(self)
        self.quit()

if __name__ == "__main__":
    app = MainApplication()
    app.mainloop()
```

## Modern Tkinter Features

### Custom Widgets with Modern Design
```python
class ModernButton(tk.Button):
    def __init__(self, master, **kwargs):
        super().__init__(master, **kwargs)
        self.configure(
            relief=tk.FLAT,
            bg="#2ecc71",
            fg="white",
            padx=20,
            pady=10,
            font=("Helvetica", 10),
            cursor="hand2"
        )
        self.bind("<Enter>", self.on_enter)
        self.bind("<Leave>", self.on_leave)

    def on_enter(self, e):
        self.configure(bg="#27ae60")

    def on_leave(self, e):
        self.configure(bg="#2ecc71")

class ModernEntry(tk.Entry):
    def __init__(self, master, placeholder="", **kwargs):
        super().__init__(master, **kwargs)
        self.placeholder = placeholder
        self.placeholder_color = "grey"
        self.default_fg_color = self["fg"]

        self.bind("<FocusIn>", self.on_focus_in)
        self.bind("<FocusOut>", self.on_focus_out)
        
        self.put_placeholder()

    def put_placeholder(self):
        self.insert(0, self.placeholder)
        self["fg"] = self.placeholder_color

    def on_focus_in(self, *args):
        if self["fg"] == self.placeholder_color:
            self.delete(0, tk.END)
            self["fg"] = self.default_fg_color

    def on_focus_out(self, *args):
        if not self.get():
            self.put_placeholder()
```

### Responsive Layout Management
```python
class ResponsiveFrame(tk.Frame):
    def __init__(self, master, min_width=300, **kwargs):
        super().__init__(master, **kwargs)
        self.min_width = min_width
        self.grid_columnconfigure(0, weight=1)
        self.bind("<Configure>", self.on_resize)

    def on_resize(self, event):
        width = event.width
        if width < self.min_width:
            # Switch to vertical layout
            for widget in self.grid_slaves():
                widget.grid_configure(
                    row=self.grid_info()["row"],
                    column=0,
                    sticky="ew"
                )
        else:
            # Switch to horizontal layout
            for i, widget in enumerate(self.grid_slaves()):
                widget.grid_configure(
                    row=0,
                    column=i,
                    sticky="nsew"
                )

# Usage example
responsive_frame = ResponsiveFrame(root)
responsive_frame.pack(fill="both", expand=True)
```

### Modern Theming System
```python
class ThemeManager:
    THEMES = {
        "light": {
            "bg": "#ffffff",
            "fg": "#000000",
            "accent": "#2ecc71",
            "error": "#e74c3c",
            "warning": "#f1c40f",
            "success": "#2ecc71",
            "font": ("Helvetica", 10),
            "heading_font": ("Helvetica", 14, "bold")
        },
        "dark": {
            "bg": "#2c3e50",
            "fg": "#ecf0f1",
            "accent": "#3498db",
            "error": "#e74c3c",
            "warning": "#f1c40f",
            "success": "#2ecc71",
            "font": ("Helvetica", 10),
            "heading_font": ("Helvetica", 14, "bold")
        }
    }

    @classmethod
    def apply_theme(cls, root, theme_name):
        theme = cls.THEMES.get(theme_name, cls.THEMES["light"])
        
        style = ttk.Style()
        style.configure(".", 
            background=theme["bg"],
            foreground=theme["fg"],
            font=theme["font"]
        )
        
        style.configure("Accent.TButton",
            background=theme["accent"],
            foreground=theme["fg"]
        )
        
        style.configure("Heading.TLabel",
            font=theme["heading_font"],
            foreground=theme["fg"]
        )
        
        root.configure(bg=theme["bg"])
        
        # Apply theme to all widgets
        for widget in root.winfo_children():
            cls._apply_theme_to_widget(widget, theme)
    
    @classmethod
    def _apply_theme_to_widget(cls, widget, theme):
        widget_type = widget.winfo_class()
        
        if widget_type in ("Frame", "Label", "Button"):
            widget.configure(
                bg=theme["bg"],
                fg=theme["fg"]
            )
        
        for child in widget.winfo_children():
            cls._apply_theme_to_widget(child, theme)
```

### Advanced Animation System
```python
class AnimationManager:
    def __init__(self):
        self.animations = {}
    
    def animate(self, widget, property_name, end_value, duration=500, 
                easing="linear", callback=None):
        start_value = float(widget.cget(property_name))
        start_time = time.time() * 1000
        
        animation_id = f"{id(widget)}_{property_name}"
        if animation_id in self.animations:
            widget.after_cancel(self.animations[animation_id])
        
        def update():
            current_time = time.time() * 1000
            progress = (current_time - start_time) / duration
            
            if progress >= 1:
                widget.configure(**{property_name: end_value})
                if callback:
                    callback()
                self.animations.pop(animation_id, None)
                return
            
            current_value = self._interpolate(
                start_value, end_value, progress, easing)
            widget.configure(**{property_name: current_value})
            
            self.animations[animation_id] = widget.after(
                16, update)  # ~60 FPS
        
        update()
    
    def _interpolate(self, start, end, progress, easing):
        if easing == "linear":
            return start + (end - start) * progress
        elif easing == "ease-in":
            return start + (end - start) * (progress ** 2)
        elif easing == "ease-out":
            return start + (end - start) * (1 - (1 - progress) ** 2)
        return start + (end - start) * progress

# Usage example
animation_manager = AnimationManager()
animation_manager.animate(widget, "width", 200, duration=500, 
                        easing="ease-out")
```

### Modern Dialog Windows
```python
class ModernDialog(tk.Toplevel):
    def __init__(self, parent, title, message):
        super().__init__(parent)
        self.title(title)
        
        # Remove window decorations
        self.overrideredirect(True)
        
        # Center dialog
        self.geometry(self._center_window(300, 200))
        
        # Create content
        content_frame = tk.Frame(self, bg="white")
        content_frame.pack(fill="both", expand=True)
        
        # Title bar
        title_bar = tk.Frame(content_frame, bg="#2ecc71")
        title_bar.pack(fill="x")
        
        tk.Label(title_bar, text=title, bg="#2ecc71", fg="white",
                font=("Helvetica", 12)).pack(side="left", padx=10, pady=5)
        
        close_button = tk.Label(title_bar, text="×", bg="#2ecc71",
                              fg="white", font=("Helvetica", 16))
        close_button.pack(side="right", padx=10, pady=5)
        close_button.bind("<Button-1>", lambda e: self.destroy())
        
        # Message
        tk.Label(content_frame, text=message, bg="white",
                wraplength=250).pack(pady=20)
        
        # Make window draggable
        title_bar.bind("<Button-1>", self.start_move)
        title_bar.bind("<B1-Motion>", self.do_move)
    
    def _center_window(self, width, height):
        screen_width = self.winfo_screenwidth()
        screen_height = self.winfo_screenheight()
        x = (screen_width - width) // 2
        y = (screen_height - height) // 2
        return f"{width}x{height}+{x}+{y}"
    
    def start_move(self, event):
        self.x = event.x
        self.y = event.y
    
    def do_move(self, event):
        deltax = event.x - self.x
        deltay = event.y - self.y
        x = self.winfo_x() + deltax
        y = self.winfo_y() + deltay
        self.geometry(f"+{x}+{y}")
```

### Modern Table Widget
```python
class ModernTable(ttk.Treeview):
    def __init__(self, master, columns, **kwargs):
        super().__init__(master, columns=columns, show="headings", **kwargs)
        
        # Configure scrollbars
        self.scrollbar_y = ttk.Scrollbar(
            master, orient="vertical", command=self.yview)
        self.scrollbar_x = ttk.Scrollbar(
            master, orient="horizontal", command=self.xview)
        self.configure(
            yscrollcommand=self.scrollbar_y.set,
            xscrollcommand=self.scrollbar_x.set
        )
        
        # Configure grid
        self.grid(row=0, column=0, sticky="nsew")
        self.scrollbar_y.grid(row=0, column=1, sticky="ns")
        self.scrollbar_x.grid(row=1, column=0, sticky="ew")
        
        # Configure sorting
        for col in columns:
            self.heading(col, text=col, command=lambda c=col: 
                        self.sort_column(c))
        
        # Configure selection
        self.selected_items = set()
        self.bind("<<TreeviewSelect>>", self._on_select)
    
    def sort_column(self, col):
        items = [(self.set(item, col), item) for item in self.get_children("")]
        items.sort()
        for index, (_, item) in enumerate(items):
            self.move(item, "", index)
    
    def _on_select(self, event):
        self.selected_items = set(self.selection())
    
    def add_row(self, values):
        self.insert("", "end", values=values)
    
    def remove_selected(self):
        for item in self.selected_items:
            self.delete(item)
        self.selected_items.clear()
```

### Modern Form Validation
```python
class FormValidator:
    def __init__(self):
        self.validators = {}
        self.errors = {}
    
    def add_validator(self, field, validator, message):
        if field not in self.validators:
            self.validators[field] = []
        self.validators[field].append((validator, message))
    
    def validate(self, data):
        self.errors.clear()
        
        for field, validators in self.validators.items():
            value = data.get(field, "")
            
            for validator, message in validators:
                if not validator(value):
                    if field not in self.errors:
                        self.errors[field] = []
                    self.errors[field].append(message)
        
        return len(self.errors) == 0
    
    def get_errors(self, field=None):
        if field:
            return self.errors.get(field, [])
        return self.errors

# Usage example
validator = FormValidator()
validator.add_validator(
    "email",
    lambda x: "@" in x and "." in x,
    "Invalid email format"
)
validator.add_validator(
    "password",
    lambda x: len(x) >= 8,
    "Password must be at least 8 characters"
)

data = {"email": "test@example.com", "password": "short"}
if not validator.validate(data):
    print(validator.get_errors())
```

## Advanced Projects

1. Build a Modern Text Editor
   - Implement syntax highlighting
   - Add line numbering
   - Create a file browser
   - Add search and replace
   - Implement auto-completion

2. Create a Data Visualization Dashboard
   - Use modern charts and graphs
   - Implement real-time updates
   - Add interactive filters
   - Create custom visualizations
   - Include export functionality

3. Develop a Task Management Application
   - Create a modern UI
   - Implement drag-and-drop
   - Add categories and tags
   - Include due dates and reminders
   - Create progress tracking

4. Build a Media Player
   - Design a modern interface
   - Add playlist management
   - Implement media controls
   - Create visualizations
   - Add keyboard shortcuts

5. Create a File Management System
   - Build a modern file browser
   - Implement file operations
   - Add search functionality
   - Create file previews
   - Include batch operations

Remember to:
- Use modern design principles
- Implement proper error handling
- Add keyboard shortcuts
- Include accessibility features
- Create responsive layouts
- Add proper documentation
