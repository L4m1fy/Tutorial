# Tkinter Tutorial

## Inhaltsverzeichnis
1. [Einführung](#einführung)
2. [Erste Schritte](#erste-schritte)
3. [Grundlegende Widgets](#grundlegende-widgets)
4. [Layout-Management](#layout-management)
5. [Ereignisbehandlung](#ereignisbehandlung)
6. [Fortgeschrittene Widgets](#fortgeschrittene-widgets)
7. [Menüs und Dialoge](#menüs-und-dialoge)
8. [Styling und Themes](#styling-und-themes)
9. [Beste Praktiken](#beste-praktiken)
10. [Beispielprojekte](#beispielprojekte)
11. [Arbeiten mit JSON-Konfiguration](#arbeiten-mit-json-konfiguration)
12. [Erweiterte Sicherheits- und Fehlerbehandlungsfunktionen](#erweiterte-sicherheits--und-fehlerbehandlungsfunktionen)

## Einführung

Tkinter ist Pythons Standard-GUI-Bibliothek (Graphical User Interface). Sie bietet eine schnelle und einfache Möglichkeit, GUI-Anwendungen zu erstellen. Tkinter ist bereits in Python vorinstalliert und ist damit die praktischste Wahl für die Erstellung von Desktop-Anwendungen mit Python.

## Erste Schritte

### Grundlegendes Fenster erstellen
```python
import tkinter as tk

# Hauptfenster erstellen
root = tk.Tk()
root.title("Meine erste Tkinter-App")
root.geometry("400x300")  # Breite x Höhe

# Ereignisschleife starten
root.mainloop()
```

### Widgets hinzufügen
```python
import tkinter as tk

root = tk.Tk()
root.title("Grundlegende Widgets Beispiel")

# Label hinzufügen
label = tk.Label(root, text="Hallo, Tkinter!")
label.pack()

# Button hinzufügen
button = tk.Button(root, text="Klick mich!", command=lambda: print("Button geklickt!"))
button.pack()

root.mainloop()
```

## Grundlegende Widgets

### Label
```python
# Text-Label
text_label = tk.Label(root, text="Dies ist ein Label")
text_label.pack()

# Bild-Label
image = tk.PhotoImage(file="bild.png")
image_label = tk.Label(root, image=image)
image_label.image = image  # Referenz behalten!
image_label.pack()
```

### Button
```python
def button_click():
    print("Button geklickt!")

# Einfacher Button
button = tk.Button(root, text="Klick mich!", command=button_click)
button.pack()

# Button mit benutzerdefinierten Farben
colored_button = tk.Button(root, 
                          text="Farbiger Button",
                          bg="blue",  # Hintergrundfarbe
                          fg="white",  # Vordergrundfarbe (Text)
                          command=button_click)
colored_button.pack()
```

### Entry (Texteingabe)
```python
# Einzeilige Texteingabe
entry = tk.Entry(root)
entry.pack()

# Passworteingabe
password_entry = tk.Entry(root, show="*")
password_entry.pack()

# Eingabewert abrufen
def get_text():
    print(entry.get())

button = tk.Button(root, text="Text abrufen", command=get_text)
button.pack()
```

### Text (Mehrzeilige Texteingabe)
```python
# Mehrzeiliges Text-Widget
text = tk.Text(root, height=5, width=30)
text.pack()

# Textinhalt abrufen
def get_text_content():
    content = text.get("1.0", tk.END)
    print(content)

button = tk.Button(root, text="Inhalt abrufen", command=get_text_content)
button.pack()
```

## Layout-Management

### Pack
```python
# Widgets vertikal anordnen
tk.Label(root, text="Oben").pack()
tk.Label(root, text="Mitte").pack()
tk.Label(root, text="Unten").pack()

# Widgets horizontal anordnen
tk.Label(root, text="Links").pack(side=tk.LEFT)
tk.Label(root, text="Mitte").pack(side=tk.LEFT)
tk.Label(root, text="Rechts").pack(side=tk.LEFT)
```

### Grid
```python
# Formular-Layout erstellen
tk.Label(root, text="Benutzername:").grid(row=0, column=0)
tk.Entry(root).grid(row=0, column=1)

tk.Label(root, text="Passwort:").grid(row=1, column=0)
tk.Entry(root, show="*").grid(row=1, column=1)

tk.Button(root, text="Anmelden").grid(row=2, column=0, columnspan=2)
```

### Place
```python
# Absolute Positionierung
label = tk.Label(root, text="Platziertes Widget")
label.place(x=50, y=50)

# Relative Positionierung
button = tk.Button(root, text="Relativ")
button.place(relx=0.5, rely=0.5, anchor="center")
```

## Ereignisbehandlung

### Button-Klick-Ereignisse
```python
def handle_click():
    print("Button geklickt!")

button = tk.Button(root, text="Klick mich!", command=handle_click)
button.pack()
```

### Tastatur-Ereignisse
```python
def handle_keypress(event):
    print(f"Taste gedrückt: {event.char}")

root.bind("<Key>", handle_keypress)

# Spezifische Tastenbindung
def handle_return(event):
    print("Return-Taste gedrückt!")

root.bind("<Return>", handle_return)
```

### Maus-Ereignisse
```python
def handle_mouse_click(event):
    print(f"Mausklick bei: ({event.x}, {event.y})")

root.bind("<Button-1>", handle_mouse_click)  # Linksklick
root.bind("<Button-3>", lambda e: print("Rechtsklick"))  # Rechtsklick

def handle_mouse_motion(event):
    print(f"Maus bewegt zu: ({event.x}, {event.y})")

root.bind("<Motion>", handle_mouse_motion)
```

## Fortgeschrittene Widgets

### Listbox
```python
# Listbox erstellen
listbox = tk.Listbox(root)
listbox.pack()

# Elemente hinzufügen
items = ["Element 1", "Element 2", "Element 3"]
for item in items:
    listbox.insert(tk.END, item)

# Auswahl behandeln
def on_select(event):
    selection = listbox.curselection()
    if selection:
        print(listbox.get(selection[0]))

listbox.bind("<<ListboxSelect>>", on_select)
```

### Combobox (Dropdown)
```python
from tkinter import ttk

# Combobox erstellen
combo = ttk.Combobox(root, values=["Option 1", "Option 2", "Option 3"])
combo.pack()

# Auswahl behandeln
def on_select(event):
    print(f"Ausgewählt: {combo.get()}")

combo.bind("<<ComboboxSelected>>", on_select)
```

### Checkbutton
```python
# Variablen für Checkbuttons erstellen
var1 = tk.BooleanVar()
var2 = tk.BooleanVar()

# Checkbuttons erstellen
check1 = tk.Checkbutton(root, text="Option 1", variable=var1)
check2 = tk.Checkbutton(root, text="Option 2", variable=var2)

check1.pack()
check2.pack()

# Werte abrufen
def get_values():
    print(f"Option 1: {var1.get()}")
    print(f"Option 2: {var2.get()}")

button = tk.Button(root, text="Werte abrufen", command=get_values)
button.pack()
```

### Radiobutton
```python
# Variable für Radiobuttons erstellen
var = tk.StringVar()
var.set("option1")  # Standardwert setzen

# Radiobuttons erstellen
radio1 = tk.Radiobutton(root, text="Option 1", variable=var, value="option1")
radio2 = tk.Radiobutton(root, text="Option 2", variable=var, value="option2")

radio1.pack()
radio2.pack()

# Ausgewählten Wert abrufen
def get_selection():
    print(f"Ausgewählt: {var.get()}")

button = tk.Button(root, text="Auswahl abrufen", command=get_selection)
button.pack()
```

## Menüs und Dialoge

### Menüleiste
```python
# Menüleiste erstellen
menubar = tk.Menu(root)
root.config(menu=menubar)

# Datei-Menü erstellen
file_menu = tk.Menu(menubar, tearoff=0)
menubar.add_cascade(label="Datei", menu=file_menu)
file_menu.add_command(label="Neu", command=lambda: print("Neu"))
file_menu.add_command(label="Öffnen", command=lambda: print("Öffnen"))
file_menu.add_separator()
file_menu.add_command(label="Beenden", command=root.quit)

# Bearbeiten-Menü erstellen
edit_menu = tk.Menu(menubar, tearoff=0)
menubar.add_cascade(label="Bearbeiten", menu=edit_menu)
edit_menu.add_command(label="Ausschneiden", command=lambda: print("Ausschneiden"))
edit_menu.add_command(label="Kopieren", command=lambda: print("Kopieren"))
edit_menu.add_command(label="Einfügen", command=lambda: print("Einfügen"))
```

### Nachrichtenboxen
```python
from tkinter import messagebox

def show_info():
    messagebox.showinfo("Information", "Dies ist eine Info-Nachricht")

def show_warning():
    messagebox.showwarning("Warnung", "Dies ist eine Warnung")

def show_error():
    messagebox.showerror("Fehler", "Dies ist eine Fehlermeldung")

def ask_question():
    result = messagebox.askquestion("Frage", "Möchten Sie fortfahren?")
    print(f"Ergebnis: {result}")  # 'yes' oder 'no'

# Buttons erstellen, um verschiedene Nachrichtenboxen anzuzeigen
tk.Button(root, text="Info", command=show_info).pack()
tk.Button(root, text="Warnung", command=show_warning).pack()
tk.Button(root, text="Fehler", command=show_error).pack()
tk.Button(root, text="Frage", command=ask_question).pack()
```

### Dateidialog
```python
from tkinter import filedialog

def open_file():
    file_path = filedialog.askopenfilename(
        initialdir="/",
        title="Datei auswählen",
        filetypes=(("Textdateien", "*.txt"), ("Alle Dateien", "*.*"))
    )
    print(f"Ausgewählte Datei: {file_path}")

def save_file():
    file_path = filedialog.asksaveasfilename(
        defaultextension=".txt",
        filetypes=(("Textdateien", "*.txt"), ("Alle Dateien", "*.*"))
    )
    print(f"Speichern unter: {file_path}")

# Buttons für Dateidialoge erstellen
tk.Button(root, text="Datei öffnen", command=open_file).pack()
tk.Button(root, text="Datei speichern", command=save_file).pack()
```

## Styling und Themes

### TTK Styling
```python
from tkinter import ttk
import tkinter as tk

root = tk.Tk()

# Style erstellen
style = ttk.Style()

# Style konfigurieren
style.configure("Custom.TButton",
                foreground="white",
                background="blue",
                font=("Arial", 12, "bold"),
                padding=10)

# Style anwenden
button = ttk.Button(root, text="Gestylter Button", style="Custom.TButton")
button.pack(pady=10)

# Theme ändern
style.theme_use('clam')  # Versuchen Sie: 'default', 'alt', 'clam', 'classic'
```

### Benutzerdefinierte Farben und Schriftarten
```python
# Benutzerdefinierte Farben
label = tk.Label(root,
                 text="Farbiges Label",
                 bg="#ff0000",  # Hintergrundfarbe
                 fg="#ffffff",  # Textfarbe
                 font=("Arial", 14, "bold"))
label.pack()

# Benutzerdefinierte Schriftart
custom_font = ("Helvetica", 12, "italic")
button = tk.Button(root,
                   text="Button mit benutzerdef. Schrift",
                   font=custom_font)
button.pack()
```

## Beste Praktiken

1. **Objektorientierte Programmierung verwenden**
```python
class Application(tk.Tk):
    def __init__(self):
        super().__init__()
        
        self.title("OOP Anwendung")
        self.geometry("400x300")
        
        self.create_widgets()
    
    def create_widgets(self):
        self.label = tk.Label(self, text="Hallo, Welt!")
        self.label.pack()
        
        self.button = tk.Button(self, text="Klick mich!", command=self.button_click)
        self.button.pack()
    
    def button_click(self):
        print("Button geklickt!")

if __name__ == "__main__":
    app = Application()
    app.mainloop()
```

2. **Logik von UI trennen**
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
        
        self.button = tk.Button(root, text="Addieren", command=self.perform_addition)
        self.button.pack()
        
        self.result_label = tk.Label(root, text="Ergebnis: ")
        self.result_label.pack()
    
    def perform_addition(self):
        num1 = float(self.entry1.get())
        num2 = float(self.entry2.get())
        result = self.calc.add(num1, num2)
        self.result_label.config(text=f"Ergebnis: {result}")
```

3. **Fehler angemessen behandeln**
```python
def safe_button_click():
    try:
        # Potenziell gefährliche Operation
        value = int(entry.get())
        result = 10 / value
        label.config(text=f"Ergebnis: {result}")
    except ValueError:
        messagebox.showerror("Fehler", "Bitte geben Sie eine gültige Zahl ein")
    except ZeroDivisionError:
        messagebox.showerror("Fehler", "Division durch Null nicht möglich")
    except Exception as e:
        messagebox.showerror("Fehler", f"Ein Fehler ist aufgetreten: {str(e)}")
```

## Beispielprojekte

### Einfacher Taschenrechner
```python
class Calculator(tk.Tk):
    def __init__(self):
        super().__init__()
        
        # Fensterkonfiguration
        self.title("Einfacher Taschenrechner")
        self.geometry("300x400")
        
        # Display
        self.result_var = tk.StringVar()
        self.create_widgets()
    
    def create_widgets(self):
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
                self.result_var.set("Fehler")
        else:
            self.result_var.set(self.result_var.get() + key)

if __name__ == "__main__":
    app = Calculator()
    app.mainloop()
```

### Aufgabenlisten-Anwendung
```python
class TodoApp(tk.Tk):
    def __init__(self):
        tk.Tk.__init__(self)
        
        # Fensterkonfiguration
        self.title("Aufgabenliste")
        self.geometry("400x500")
        
        # Eingabe für neue Aufgaben
        self.task_entry = tk.Entry(self)
        self.task_entry.pack(pady=10)
        
        # Hinzufügen-Button
        tk.Button(self, text="Aufgabe hinzufügen", command=self.add_task).pack()
        
        # Listbox für Aufgaben
        self.task_listbox = tk.Listbox(self, width=50)
        self.task_listbox.pack(pady=10)
        
        # Löschen-Button
        tk.Button(self, text="Aufgabe löschen", command=self.delete_task).pack()
        
        # Erledigt-Button
        tk.Button(self, text="Aufgabe erledigt", command=self.complete_task).pack()
    
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

## Arbeiten mit JSON-Konfiguration

### JSON-Konfigurationsverwaltung
```python
import json
import os
from typing import Dict, Any

class ConfigManager:
    def __init__(self, config_file: str):
        self.config_file = config_file
        self.config: Dict[str, Any] = self._load_config()

    def _load_config(self) -> Dict[str, Any]:
        """Konfiguration aus JSON-Datei laden oder Standardkonfiguration erstellen."""
        if os.path.exists(self.config_file):
            try:
                with open(self.config_file, 'r') as f:
                    return json.load(f)
            except json.JSONDecodeError:
                print(f"Fehler beim Lesen der Konfigurationsdatei: {self.config_file}")
                return self._create_default_config()
        return self._create_default_config()

    def _create_default_config(self) -> Dict[str, Any]:
        """Standardkonfiguration erstellen und speichern."""
        default_config = {
            "window": {
                "width": 800,
                "height": 600,
                "title": "Meine Anwendung",
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
        """Konfiguration in JSON-Datei speichern."""
        if config is not None:
            self.config = config
        with open(self.config_file, 'w') as f:
            json.dump(self.config, f, indent=4)

    def get(self, key: str, default: Any = None) -> Any:
        """Konfigurationswert nach Schlüssel abrufen."""
        try:
            keys = key.split('.')
            value = self.config
            for k in keys:
                value = value[k]
            return value
        except (KeyError, TypeError):
            return default

    def set(self, key: str, value: Any) -> None:
        """Konfigurationswert nach Schlüssel setzen."""
        keys = key.split('.')
        config = self.config
        for k in keys[:-1]:
            config = config.setdefault(k, {})
        config[keys[-1]] = value
        self.save_config()

class ConfigurableApplication(tk.Tk):
    def __init__(self):
        tk.Tk.__init__(self)
        
        # Konfiguration initialisieren
        self.config_manager = ConfigManager("app_config.json")
        
        # Fensterkonfiguration anwenden
        self.title(self.config_manager.get("window.title", "Anwendung"))
        self.geometry(f"{self.config_manager.get('window.width', 800)}x{self.config_manager.get('window.height', 600)}")
        
        # Widgets erstellen und konfigurieren
        self.create_widgets()
        self.apply_theme()
        
    def create_widgets(self):
        # Einstellungsrahmen erstellen
        settings_frame = ttk.LabelFrame(self, text="Einstellungen")
        settings_frame.pack(padx=10, pady=10, fill="x")
        
        # Themenauswahl
        ttk.Label(settings_frame, text="Theme:").pack(side="left", padx=5)
        theme_var = tk.StringVar(value=self.config_manager.get("window.theme"))
        theme_combo = ttk.Combobox(settings_frame, textvariable=theme_var, 
                                 values=["default", "clam", "alt", "classic"])
        theme_combo.pack(side="left", padx=5)
        theme_combo.bind("<<ComboboxSelected>>", lambda e: self.update_theme(theme_var.get()))
        
        # Schriftgrößenauswahl
        ttk.Label(settings_frame, text="Schriftgröße:").pack(side="left", padx=5)
        font_size_var = tk.StringVar(value=str(self.config_manager.get("appearance.font_size")))
        font_size_spin = ttk.Spinbox(settings_frame, from_=8, to=24, width=5,
                                   textvariable=font_size_var)
        font_size_spin.pack(side="left", padx=5)
        font_size_spin.bind("<Return>", lambda e: self.update_font_size(int(font_size_var.get())))
        
        # Auto-Speichern-Toggle
        auto_save_var = tk.BooleanVar(value=self.config_manager.get("behavior.auto_save"))
        auto_save_check = ttk.Checkbutton(settings_frame, text="Auto-Speichern",
                                        variable=auto_save_var,
                                        command=lambda: self.update_auto_save(auto_save_var.get()))
        auto_save_check.pack(side="left", padx=5)
        
        # Hauptinhaltsbereich
        content_frame = ttk.Frame(self)
        content_frame.pack(padx=10, pady=10, fill="both", expand=True)
        
        # Texteditor mit konfigurierter Schrift
        self.text_editor = tk.Text(content_frame)
        self.text_editor.pack(fill="both", expand=True)
        self.update_text_font()
        
    def apply_theme(self):
        """Aktuelle Themenkonfiguration anwenden."""
        theme = self.config_manager.get("window.theme", "default")
        style = ttk.Style()
        style.theme_use(theme)
        
        # Benutzerdefinierte Farben anwenden
        bg_color = self.config_manager.get("appearance.colors.background")
        fg_color = self.config_manager.get("appearance.colors.foreground")
        if bg_color and fg_color:
            self.configure(bg=bg_color)
            style.configure(".", background=bg_color, foreground=fg_color)
            
    def update_theme(self, theme: str):
        """Anwendungsthema aktualisieren."""
        self.config_manager.set("window.theme", theme)
        self.apply_theme()
        
    def update_font_size(self, size: int):
        """Anwendungsschriftgröße aktualisieren."""
        self.config_manager.set("appearance.font_size", size)
        self.update_text_font()
        
    def update_text_font(self):
        """Texteditor-Schrift basierend auf Konfiguration aktualisieren."""
        font_family = self.config_manager.get("appearance.font_family", "Arial")
        font_size = self.config_manager.get("appearance.font_size", 12)
        self.text_editor.configure(font=(font_family, font_size))
        
    def update_auto_save(self, enabled: bool):
        """Auto-Speichern-Konfiguration aktualisieren."""
        self.config_manager.set("behavior.auto_save", enabled)
        if enabled:
            interval = self.config_manager.get("behavior.auto_save_interval", 300)
            self.after(interval * 1000, self.auto_save)
            
    def auto_save(self):
        """Auto-Speichern-Operation durchführen."""
        if self.config_manager.get("behavior.auto_save"):
            print("Automatisches Speichern des Inhalts...")
            # Implementieren Sie hier Ihre Speicherlogik
            interval = self.config_manager.get("behavior.auto_save_interval", 300)
            self.after(interval * 1000, self.auto_save)

# Beispielverwendung
if __name__ == "__main__":
    app = ConfigurableApplication()
    app.mainloop()
```

### Erweitertes Konfigurationsbeispiel mit mehreren Fenstern
```python
class ConfigurableWindow:
    """Basisklasse für Fenster, die Konfiguration verwenden."""
    
    def __init__(self, config_manager: ConfigManager, window_key: str):
        self.config_manager = config_manager
        self.window_key = window_key
        
    def save_geometry(self, window: tk.Tk | tk.Toplevel):
        """Fenstergeometrie in Konfiguration speichern."""
        geometry = window.geometry()
        self.config_manager.set(f"{self.window_key}.geometry", geometry)
        
    def load_geometry(self, window: tk.Tk | tk.Toplevel):
        """Fenstergeometrie aus Konfiguration laden."""
        geometry = self.config_manager.get(f"{self.window_key}.geometry")
        if geometry:
            window.geometry(geometry)
            
class SettingsWindow(tk.Toplevel, ConfigurableWindow):
    def __init__(self, parent, config_manager: ConfigManager):
        tk.Toplevel.__init__(self, parent)
        ConfigurableWindow.__init__(self, config_manager, "settings_window")
        
        self.title("Einstellungen")
        self.load_geometry(self)
        
        # Einstellungsoberfläche erstellen
        self.create_widgets()
        
        # Geometrie beim Schließen des Fensters speichern
        self.protocol("WM_DELETE_WINDOW", self.on_close)
        
    def create_widgets(self):
        # Notebook für organisierte Einstellungen erstellen
        notebook = ttk.Notebook(self)
        notebook.pack(padx=10, pady=10, fill="both", expand=True)
        
        # Erscheinungsbild-Einstellungen
        appearance_frame = ttk.Frame(notebook)
        notebook.add(appearance_frame, text="Erscheinungsbild")
        
        # Theme-Einstellungen
        theme_frame = ttk.LabelFrame(appearance_frame, text="Theme")
        theme_frame.pack(padx=5, pady=5, fill="x")
        
        ttk.Label(theme_frame, text="Farbschema:").grid(row=0, column=0, padx=5, pady=5)
        theme_var = tk.StringVar(value=self.config_manager.get("appearance.theme"))
        theme_combo = ttk.Combobox(theme_frame, textvariable=theme_var,
                                 values=["hell", "dunkel", "system"])
        theme_combo.grid(row=0, column=1, padx=5, pady=5)
        theme_combo.bind("<<ComboboxSelected>>", 
                        lambda e: self.config_manager.set("appearance.theme", theme_var.get()))
        
        # Schrifteinstellungen
        font_frame = ttk.LabelFrame(appearance_frame, text="Schrift")
        font_frame.pack(padx=5, pady=5, fill="x")
        
        ttk.Label(font_frame, text="Familie:").grid(row=0, column=0, padx=5, pady=5)
        font_family_var = tk.StringVar(value=self.config_manager.get("appearance.font_family"))
        font_family_combo = ttk.Combobox(font_frame, textvariable=font_family_var,
                                       values=["Arial", "Helvetica", "Times New Roman"])
        font_family_combo.grid(row=0, column=1, padx=5, pady=5)
        font_family_combo.bind("<<ComboboxSelected>>",
                             lambda e: self.config_manager.set("appearance.font_family", 
                                                            font_family_var.get()))
        
        # Verhaltenseinstellungen
        behavior_frame = ttk.Frame(notebook)
        notebook.add(behavior_frame, text="Verhalten")
        
        # Auto-Speichern-Einstellungen
        auto_save_frame = ttk.LabelFrame(behavior_frame, text="Automatisches Speichern")
        auto_save_frame.pack(padx=5, pady=5, fill="x")
        
        auto_save_var = tk.BooleanVar(value=self.config_manager.get("behavior.auto_save"))
        auto_save_check = ttk.Checkbutton(auto_save_frame, text="Auto-Speichern aktivieren",
                                        variable=auto_save_var,
                                        command=lambda: self.config_manager.set(
                                            "behavior.auto_save", auto_save_var.get()))
        auto_save_check.pack(padx=5, pady=5)
        
        ttk.Label(auto_save_frame, text="Intervall (Sekunden):").pack(padx=5)
        interval_var = tk.StringVar(value=str(
            self.config_manager.get("behavior.auto_save_interval", 300)))
        interval_spin = ttk.Spinbox(auto_save_frame, from_=60, to=3600, width=10,
                                  textvariable=interval_var)
        interval_spin.pack(padx=5, pady=5)
        interval_spin.bind("<Return>", lambda e: self.config_manager.set(
            "behavior.auto_save_interval", int(interval_var.get())))
        
    def on_close(self):
        """Fenster-Schließen-Ereignis behandeln."""
        self.save_geometry(self)
        self.destroy()

class MainApplication(tk.Tk, ConfigurableWindow):
    def __init__(self):
        tk.Tk.__init__(self)
        
        # Konfiguration initialisieren
        self.config_manager = ConfigManager("app_config.json")
        ConfigurableWindow.__init__(self, self.config_manager, "main_window")
        
        # Hauptfenster konfigurieren
        self.title(self.config_manager.get("window.title", "Konfigurierbare Anwendung"))
        self.load_geometry(self)
        
        # Menü erstellen
        self.create_menu()
        
        # Hauptoberfläche erstellen
        self.create_widgets()
        
        # Geometrie beim Schließen des Fensters speichern
        self.protocol("WM_DELETE_WINDOW", self.on_close)
        
    def create_menu(self):
        menubar = tk.Menu(self)
        self.config(menu=menubar)
        
        # Datei-Menü
        file_menu = tk.Menu(menubar, tearoff=0)
        menubar.add_cascade(label="Datei", menu=file_menu)
        file_menu.add_command(label="Neu", command=self.new_file)
        file_menu.add_command(label="Öffnen", command=self.open_file)
        file_menu.add_command(label="Speichern", command=self.save_file)
        file_menu.add_separator()
        file_menu.add_command(label="Beenden", command=self.on_close)
        
        # Bearbeiten-Menü
        edit_menu = tk.Menu(menubar, tearoff=0)
        menubar.add_cascade(label="Bearbeiten", menu=edit_menu)
        edit_menu.add_command(label="Einstellungen", command=self.show_settings)
        
    def create_widgets(self):
        # Hauptinhaltsbereich erstellen
        self.text_editor = tk.Text(self)
        self.text_editor.pack(fill="both", expand=True)
        
        # Aktuelle Schrifteinstellungen anwenden
        self.update_font()
        
    def update_font(self):
        """Texteditor-Schrift basierend auf Konfiguration aktualisieren."""
        family = self.config_manager.get("appearance.font_family", "Arial")
        size = self.config_manager.get("appearance.font_size", 12)
        self.text_editor.configure(font=(family, size))
        
    def show_settings(self):
        """Einstellungsfenster anzeigen."""
        SettingsWindow(self, self.config_manager)
        
    def new_file(self):
        """Neue Datei erstellen."""
        if self.config_manager.get("behavior.confirm_action", True):
            if not messagebox.askyesno("Neue Datei", "Neue Datei erstellen? Nicht gespeicherte Änderungen gehen verloren."):
                return
        self.text_editor.delete("1.0", tk.END)
        
    def open_file(self):
        """Datei öffnen."""
        file_path = filedialog.askopenfilename(
            filetypes=[("Textdateien", "*.txt"), ("Alle Dateien", "*.*")])
        if file_path:
            try:
                with open(file_path, 'r') as file:
                    content = file.read()
                self.text_editor.delete("1.0", tk.END)
                self.text_editor.insert("1.0", content)
            except Exception as e:
                messagebox.showerror("Fehler", f"Fehler beim Öffnen der Datei: {str(e)}")
                
    def save_file(self):
        """Aktuelle Datei speichern."""
        file_path = filedialog.asksaveasfilename(
            defaultextension=".txt",
            filetypes=[("Textdateien", "*.txt"), ("Alle Dateien", "*.*")])
        if file_path:
            try:
                content = self.text_editor.get("1.0", tk.END)
                with open(file_path, 'w') as file:
                    file.write(content)
            except Exception as e:
                messagebox.showerror("Fehler", f"Fehler beim Speichern der Datei: {str(e)}")
                
    def on_close(self):
        """Anwendungsbeendigung behandeln."""
        if self.config_manager.get("behavior.confirm_exit", True):
            if not messagebox.askyesno("Beenden", "Möchten Sie die Anwendung wirklich beenden?"):
                return
        self.save_geometry(self)
        self.quit()

if __name__ == "__main__":
    app = MainApplication()
    app.mainloop()
```

## Erweiterte Sicherheits- und Fehlerbehandlungsfunktionen

```python
from cryptography.fernet import Fernet
from typing import Optional, Dict, Any, List, Callable
import json
import os
import logging
import hashlib
import datetime

class SecureConfigManager(AdvancedConfigManager):
    def __init__(self, config_file: str, encryption_key: Optional[str] = None):
        super().__init__(config_file)
        self._encryption_key = encryption_key
        self._fernet = Fernet(encryption_key.encode()) if encryption_key else None
        self._audit_log = []
        self._setup_logging()
        
    def _setup_logging(self):
        """Konfiguriert das Logging-System."""
        logging.basicConfig(
            filename='config_manager.log',
            level=logging.INFO,
            format='%(asctime)s - %(levelname)s - %(message)s'
        )
        
    def _encrypt_data(self, data: str) -> str:
        """Verschlüsselt die Daten mit Fernet."""
        if self._fernet:
            return self._fernet.encrypt(data.encode()).decode()
        return data
        
    def _decrypt_data(self, data: str) -> str:
        """Entschlüsselt die Daten mit Fernet."""
        if self._fernet:
            return self._fernet.decrypt(data.encode()).decode()
        return data
        
    def save_config(self) -> None:
        """Speichert die Konfiguration sicher."""
        try:
            json_str = json.dumps(self.config, indent=4)
            encrypted_data = self._encrypt_data(json_str)
            
            with open(self._config_file, 'w') as f:
                f.write(encrypted_data)
                
            self._log_action("Konfiguration gespeichert")
            self._create_audit_entry("save_config")
        except Exception as e:
            self._handle_error("Fehler beim Speichern der Konfiguration", e)
            
    def load_config(self) -> None:
        """Lädt die verschlüsselte Konfiguration."""
        try:
            if not os.path.exists(self._config_file):
                self.config = self._create_default_config()
                return
                
            with open(self._config_file, 'r') as f:
                encrypted_data = f.read()
                
            decrypted_data = self._decrypt_data(encrypted_data)
            self.config = json.loads(decrypted_data)
            
            self._log_action("Konfiguration geladen")
            self._create_audit_entry("load_config")
        except Exception as e:
            self._handle_error("Fehler beim Laden der Konfiguration", e)
            
    def _handle_error(self, message: str, error: Exception):
        """Behandelt Fehler einheitlich."""
        error_details = f"{message}: {str(error)}"
        logging.error(error_details)
        self._create_audit_entry("error", error_details)
        raise ConfigError(error_details)
        
    def _create_audit_entry(self, action: str, details: str = ""):
        """Erstellt einen Audit-Log-Eintrag."""
        entry = {
            "timestamp": datetime.datetime.now().isoformat(),
            "action": action,
            "details": details,
            "config_hash": self._calculate_config_hash()
        }
        self._audit_log.append(entry)
        
    def _calculate_config_hash(self) -> str:
        """Berechnet einen Hash der aktuellen Konfiguration."""
        config_str = json.dumps(self.config, sort_keys=True)
        return hashlib.sha256(config_str.encode()).hexdigest()
        
    def get_audit_log(self) -> List[Dict]:
        """Gibt das Audit-Log zurück."""
        return self._audit_log
        
    def validate_config_advanced(self, schema: Dict[str, Any]) -> List[str]:
        """Erweiterte Konfigurationsvalidierung mit detaillierten Fehlermeldungen."""
        errors = []
        
        def validate_field(path: str, value: Any, schema_value: Any):
            if isinstance(schema_value, dict):
                if not isinstance(value, dict):
                    errors.append(f"Feld '{path}' muss ein Objekt sein")
                    return
                for key, sub_schema in schema_value.items():
                    if key not in value:
                        errors.append(f"Pflichtfeld '{path}.{key}' fehlt")
                    else:
                        validate_field(f"{path}.{key}", value[key], sub_schema)
            else:
                expected_type = schema_value
                if expected_type == "number":
                    if not isinstance(value, (int, float)):
                        errors.append(f"Feld '{path}' muss eine Zahl sein")
                elif expected_type == "string":
                    if not isinstance(value, str):
                        errors.append(f"Feld '{path}' muss eine Zeichenkette sein")
                elif expected_type == "boolean":
                    if not isinstance(value, bool):
                        errors.append(f"Feld '{path}' muss ein Boolean sein")
                        
        for key, schema_value in schema.items():
            if key not in self.config:
                errors.append(f"Pflichtfeld '{key}' fehlt")
            else:
                validate_field(key, self.config[key], schema_value)
                
        return errors

class ConfigError(Exception):
    """Benutzerdefinierte Ausnahme für Konfigurationsfehler."""
    pass

# Beispiel für die Verwendung der erweiterten Sicherheitsfunktionen
if __name__ == "__main__":
    # Verschlüsselungsschlüssel generieren
    encryption_key = Fernet.generate_key().decode()
    
    # Sicheren Konfigurationsmanager erstellen
    config = SecureConfigManager("secure_config.json", encryption_key)
    
    # Schema für erweiterte Validierung
    advanced_schema = {
        "window": {
            "width": "number",
            "height": "number",
            "title": "string",
            "theme": "string",
            "position": {
                "x": "number",
                "y": "number"
            }
        },
        "security": {
            "auto_lock": "boolean",
            "lock_timeout": "number",
            "allowed_ips": ["string"]
        }
    }
    
    try:
        # Konfiguration validieren
        validation_errors = config.validate_config_advanced(advanced_schema)
        if validation_errors:
            print("Validierungsfehler gefunden:")
            for error in validation_errors:
                print(f"- {error}")
        else:
            print("Konfiguration ist gültig")
            
        # Beispielkonfiguration setzen
        config.set("window.position.x", 100)
        config.set("window.position.y", 200)
        config.set("security.auto_lock", True)
        config.set("security.lock_timeout", 300)
        
        # Konfiguration speichern
        config.save_config()
        
        # Audit-Log anzeigen
        print("\nAudit-Log:")
        for entry in config.get_audit_log():
            print(f"[{entry['timestamp']}] {entry['action']}: {entry['details']}")
            
    except ConfigError as e:
        print(f"Konfigurationsfehler: {str(e)}")
    except Exception as e:
        print(f"Unerwarteter Fehler: {str(e)}")
```

Diese erweiterten Sicherheitsfunktionen bieten:
1. Verschlüsselung der Konfigurationsdaten
2. Detaillierte Fehlerbehandlung und -protokollierung
3. Audit-Log für Konfigurationsänderungen
4. Erweiterte Schemavalidierung mit detaillierten Fehlermeldungen
5. Konfigurationshash für Integritätsprüfungen
6. Sichere Fehlerbehandlung mit benutzerdefinierten Ausnahmen

### Beispiel für eine erweiterte Konfigurationsanwendung

```python
class SecureConfigurableApplication(tk.Tk):
    def __init__(self, encryption_key: str):
        super().__init__()
        
        self.config_manager = SecureConfigManager("secure_app_config.json", encryption_key)
        self.setup_ui()
        self.setup_security()
        
    def setup_ui(self):
        """Erstellt die Benutzeroberfläche."""
        self.title("Sichere Konfigurationsanwendung")
        
        # Hauptframe
        main_frame = ttk.Frame(self, padding="10")
        main_frame.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))
        
        # Konfigurationsanzeige
        self.config_tree = ttk.Treeview(main_frame, columns=("Value",), show="tree")
        self.config_tree.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))
        
        # Scrollbar
        scrollbar = ttk.Scrollbar(main_frame, orient=tk.VERTICAL, command=self.config_tree.yview)
        scrollbar.grid(row=0, column=1, sticky=(tk.N, tk.S))
        self.config_tree.configure(yscrollcommand=scrollbar.set)
        
        # Buttons
        button_frame = ttk.Frame(main_frame)
        button_frame.grid(row=1, column=0, columnspan=2, pady=10)
        
        ttk.Button(button_frame, text="Aktualisieren", command=self.refresh_config_display).pack(side=tk.LEFT, padx=5)
        ttk.Button(button_frame, text="Exportieren", command=self.export_config).pack(side=tk.LEFT, padx=5)
        ttk.Button(button_frame, text="Audit-Log", command=self.show_audit_log).pack(side=tk.LEFT, padx=5)
        
    def setup_security(self):
        """Konfiguriert Sicherheitseinstellungen."""
        self.protocol("WM_DELETE_WINDOW", self.secure_exit)
        self.bind("<Control-s>", lambda e: self.config_manager.save_config())
        
        # Auto-Lock Timer
        self.last_activity = datetime.datetime.now()
        self.check_activity()
        
    def check_activity(self):
        """Überprüft Benutzeraktivität für Auto-Lock."""
        if self.config_manager.get("security.auto_lock", False):
            timeout = self.config_manager.get("security.lock_timeout", 300)
            if (datetime.datetime.now() - self.last_activity).seconds > timeout:
                self.lock_application()
        self.after(1000, self.check_activity)
        
    def lock_application(self):
        """Sperrt die Anwendung."""
        self.withdraw()
        dialog = tk.Toplevel(self)
        dialog.title("Anwendung gesperrt")
        dialog.transient(self)
        dialog.grab_set()
        
        ttk.Label(dialog, text="Bitte Passwort eingeben:").pack(pady=10)
        password_var = tk.StringVar()
        password_entry = ttk.Entry(dialog, show="*", textvariable=password_var)
        password_entry.pack(pady=5)
        
        def unlock():
            if self.verify_password(password_var.get()):
                self.last_activity = datetime.datetime.now()
                dialog.destroy()
                self.deiconify()
            else:
                tk.messagebox.showerror("Fehler", "Falsches Passwort")
                
        ttk.Button(dialog, text="Entsperren", command=unlock).pack(pady=10)
        
    def verify_password(self, password: str) -> bool:
        """Überprüft das eingegebene Passwort."""
        stored_hash = self.config_manager.get("security.password_hash", "")
        if not stored_hash:
            return True
        return hashlib.sha256(password.encode()).hexdigest() == stored_hash
        
    def refresh_config_display(self):
        """Aktualisiert die Konfigurationsanzeige."""
        self.config_tree.delete(*self.config_tree.get_children())
        
        def insert_config(parent: str, key: str, value: Any):
            if isinstance(value, dict):
                node = self.config_tree.insert(parent, "end", text=key)
                for k, v in value.items():
                    insert_config(node, k, v)
            else:
                self.config_tree.insert(parent, "end", text=key, values=(str(value),))
                
        for key, value in self.config_manager.config.items():
            insert_config("", key, value)
            
    def export_config(self):
        """Exportiert die Konfiguration."""
        filename = tk.filedialog.asksaveasfilename(
            defaultextension=".json",
            filetypes=[("JSON files", "*.json"), ("All files", "*.*")]
        )
        if filename:
            try:
                self.config_manager.export_config(filename)
                tk.messagebox.showinfo("Erfolg", "Konfiguration erfolgreich exportiert")
            except Exception as e:
                tk.messagebox.showerror("Fehler", f"Fehler beim Exportieren: {str(e)}")
                
    def show_audit_log(self):
        """Zeigt das Audit-Log an."""
        dialog = tk.Toplevel(self)
        dialog.title("Audit-Log")
        dialog.transient(self)
        
        text = tk.Text(dialog, wrap=tk.WORD, width=60, height=20)
        text.pack(padx=10, pady=10)
        
        scrollbar = ttk.Scrollbar(dialog, orient=tk.VERTICAL, command=text.yview)
        scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
        text.configure(yscrollcommand=scrollbar.set)
        
        for entry in self.config_manager.get_audit_log():
            text.insert(tk.END, f"[{entry['timestamp']}] {entry['action']}\n")
            if entry['details']:
                text.insert(tk.END, f"Details: {entry['details']}\n")
            text.insert(tk.END, f"Hash: {entry['config_hash']}\n\n")
            
        text.configure(state=tk.DISABLED)
        
    def secure_exit(self):
        """Sicheres Beenden der Anwendung."""
        try:
            self.config_manager.save_config()
            self.quit()
        except Exception as e:
            tk.messagebox.showerror("Fehler", f"Fehler beim Speichern der Konfiguration: {str(e)}")

if __name__ == "__main__":
    # Verschlüsselungsschlüssel generieren
    encryption_key = Fernet.generate_key().decode()
    
    # Anwendung starten
    app = SecureConfigurableApplication(encryption_key)
    app.mainloop()
```

Diese erweiterte Implementierung bietet:
1. Verschlüsselte Konfigurationsspeicherung
2. Automatische Sperrfunktion bei Inaktivität
3. Passwortschutz
4. Audit-Log-Anzeige
5. Konfigurationsexport
6. Baumansicht der Konfiguration
7. Sichere Beendigung der Anwendung
