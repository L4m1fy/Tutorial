# Tkinter Tutorial

## Sadržaj
1. [Uvod](#uvod)
2. [Prvi Koraci](#prvi-koraci)
3. [Osnovni Widgeti](#osnovni-widgeti)
4. [Upravljanje Layoutom](#upravljanje-layoutom)
5. [Obrada Događaja](#obrada-događaja)
6. [Napredni Widgeti](#napredni-widgeti)
7. [Meniji i Dijalozi](#meniji-i-dijalozi)
8. [Stiliziranje i Teme](#stiliziranje-i-teme)
9. [Najbolje Prakse](#najbolje-prakse)
10. [Primjeri Projekata](#primjeri-projekata)
11. [Rad sa JSON Konfiguracijom](#rad-sa-json-konfiguracijom)
12. [Napredne JSON Konfiguracijske Funkcije](#napredne-json-konfiguracijske-funkcije)

## Uvod

Tkinter je Pythonova standardna GUI (Graphical User Interface) biblioteka. Pruža brz i jednostavan način za kreiranje GUI aplikacija. Tkinter dolazi predinstaliran s Pythonom, što ga čini najzgodnijim izborom za kreiranje desktop aplikacija s Pythonom.

## Prvi Koraci

### Kreiranje Osnovnog Prozora
```python
import tkinter as tk

# Kreiranje glavnog prozora
root = tk.Tk()
root.title("Moja Prva Tkinter Aplikacija")
root.geometry("400x300")  # Širina x Visina

# Pokretanje petlje događaja
root.mainloop()
```

### Dodavanje Widgeta
```python
import tkinter as tk

root = tk.Tk()
root.title("Primjer Osnovnih Widgeta")

# Dodavanje labele
label = tk.Label(root, text="Zdravo, Tkinter!")
label.pack()

# Dodavanje dugmeta
button = tk.Button(root, text="Klikni me!", command=lambda: print("Dugme kliknuto!"))
button.pack()

root.mainloop()
```

## Osnovni Widgeti

### Label
```python
# Tekstualna labela
text_label = tk.Label(root, text="Ovo je labela")
text_label.pack()

# Labela sa slikom
image = tk.PhotoImage(file="slika.png")
image_label = tk.Label(root, image=image)
image_label.image = image  # Zadržati referencu!
image_label.pack()
```

### Button
```python
def button_click():
    print("Dugme kliknuto!")

# Osnovno dugme
button = tk.Button(root, text="Klikni me!", command=button_click)
button.pack()

# Dugme sa prilagođenim bojama
colored_button = tk.Button(root, 
                          text="Obojeno Dugme",
                          bg="blue",  # Pozadinska boja
                          fg="white",  # Boja teksta
                          command=button_click)
colored_button.pack()
```

### Entry (Unos Teksta)
```python
# Jednolinjski unos teksta
entry = tk.Entry(root)
entry.pack()

# Unos lozinke
password_entry = tk.Entry(root, show="*")
password_entry.pack()

# Dobijanje unesene vrijednosti
def get_text():
    print(entry.get())

button = tk.Button(root, text="Uzmi Tekst", command=get_text)
button.pack()
```

### Text (Višelinijski Unos Teksta)
```python
# Višelinijski tekst widget
text = tk.Text(root, height=5, width=30)
text.pack()

# Dobijanje sadržaja teksta
def get_text_content():
    content = text.get("1.0", tk.END)
    print(content)

button = tk.Button(root, text="Uzmi Sadržaj", command=get_text_content)
button.pack()
```

## Upravljanje Layoutom

### Pack
```python
# Vertikalno raspoređivanje widgeta
tk.Label(root, text="Vrh").pack()
tk.Label(root, text="Sredina").pack()
tk.Label(root, text="Dno").pack()

# Horizontalno raspoređivanje widgeta
tk.Label(root, text="Lijevo").pack(side=tk.LEFT)
tk.Label(root, text="Sredina").pack(side=tk.LEFT)
tk.Label(root, text="Desno").pack(side=tk.LEFT)
```

### Grid
```python
# Kreiranje layout-a forme
tk.Label(root, text="Korisničko ime:").grid(row=0, column=0)
tk.Entry(root).grid(row=0, column=1)

tk.Label(root, text="Lozinka:").grid(row=1, column=0)
tk.Entry(root, show="*").grid(row=1, column=1)

tk.Button(root, text="Prijava").grid(row=2, column=0, columnspan=2)
```

### Place
```python
# Apsolutno pozicioniranje
label = tk.Label(root, text="Pozicionirani Widget")
label.place(x=50, y=50)

# Relativno pozicioniranje
button = tk.Button(root, text="Relativno")
button.place(relx=0.5, rely=0.5, anchor="center")
```

## Obrada Događaja

### Događaji Klika na Dugme
```python
def handle_click():
    print("Dugme kliknuto!")

button = tk.Button(root, text="Klikni me!", command=handle_click)
button.pack()
```

### Događaji Tastature
```python
def handle_keypress(event):
    print(f"Pritisnuta tipka: {event.char}")

root.bind("<Key>", handle_keypress)

# Specifično vezivanje tipke
def handle_return(event):
    print("Pritisnuta tipka Enter!")

root.bind("<Return>", handle_return)
```

### Događaji Miša
```python
def handle_mouse_click(event):
    print(f"Miš kliknut na: ({event.x}, {event.y})")

root.bind("<Button-1>", handle_mouse_click)  # Lijevi klik
root.bind("<Button-3>", lambda e: print("Desni klik"))  # Desni klik

def handle_mouse_motion(event):
    print(f"Miš pomjeren na: ({event.x}, {event.y})")

root.bind("<Motion>", handle_mouse_motion)
```

## Napredni Widgeti

### Listbox
```python
# Kreiranje listbox-a
listbox = tk.Listbox(root)
listbox.pack()

# Dodavanje stavki
items = ["Stavka 1", "Stavka 2", "Stavka 3"]
for item in items:
    listbox.insert(tk.END, item)

# Obrada selekcije
def on_select(event):
    selection = listbox.curselection()
    if selection:
        print(listbox.get(selection[0]))

listbox.bind("<<ListboxSelect>>", on_select)
```

### Combobox (Padajuća Lista)
```python
from tkinter import ttk

# Kreiranje combobox-a
combo = ttk.Combobox(root, values=["Opcija 1", "Opcija 2", "Opcija 3"])
combo.pack()

# Obrada selekcije
def on_select(event):
    print(f"Odabrano: {combo.get()}")

combo.bind("<<ComboboxSelected>>", on_select)
```

### Checkbutton
```python
# Kreiranje varijabli za checkbutton-e
var1 = tk.BooleanVar()
var2 = tk.BooleanVar()

# Kreiranje checkbutton-a
check1 = tk.Checkbutton(root, text="Opcija 1", variable=var1)
check2 = tk.Checkbutton(root, text="Opcija 2", variable=var2)

check1.pack()
check2.pack()

# Dobijanje vrijednosti
def get_values():
    print(f"Opcija 1: {var1.get()}")
    print(f"Opcija 2: {var2.get()}")

button = tk.Button(root, text="Uzmi Vrijednosti", command=get_values)
button.pack()
```

### Radiobutton
```python
# Kreiranje varijable za radiobutton-e
var = tk.StringVar()
var.set("opcija1")  # Postaviti podrazumijevanu vrijednost

# Kreiranje radiobutton-a
radio1 = tk.Radiobutton(root, text="Opcija 1", variable=var, value="opcija1")
radio2 = tk.Radiobutton(root, text="Opcija 2", variable=var, value="opcija2")

radio1.pack()
radio2.pack()

# Dobijanje odabrane vrijednosti
def get_selection():
    print(f"Odabrano: {var.get()}")

button = tk.Button(root, text="Uzmi Selekciju", command=get_selection)
button.pack()
```

## Meniji i Dijalozi

### Menu Bar
```python
# Kreiranje menu bara
menubar = tk.Menu(root)
root.config(menu=menubar)

# Kreiranje File menija
file_menu = tk.Menu(menubar, tearoff=0)
menubar.add_cascade(label="Fajl", menu=file_menu)
file_menu.add_command(label="Novi", command=lambda: print("Novi"))
file_menu.add_command(label="Otvori", command=lambda: print("Otvori"))
file_menu.add_separator()
file_menu.add_command(label="Izlaz", command=root.quit)

# Kreiranje Edit menija
edit_menu = tk.Menu(menubar, tearoff=0)
menubar.add_cascade(label="Uredi", menu=edit_menu)
edit_menu.add_command(label="Izreži", command=lambda: print("Izreži"))
edit_menu.add_command(label="Kopiraj", command=lambda: print("Kopiraj"))
edit_menu.add_command(label="Zalijepi", command=lambda: print("Zalijepi"))
```

### Message Boxes
```python
from tkinter import messagebox

def show_info():
    messagebox.showinfo("Informacija", "Ovo je info poruka")

def show_warning():
    messagebox.showwarning("Upozorenje", "Ovo je poruka upozorenja")

def show_error():
    messagebox.showerror("Greška", "Ovo je poruka o grešci")

def ask_question():
    result = messagebox.askquestion("Pitanje", "Želite li nastaviti?")
    print(f"Rezultat: {result}")  # 'yes' ili 'no'

# Kreiranje dugmadi za prikaz različitih message box-ova
tk.Button(root, text="Info", command=show_info).pack()
tk.Button(root, text="Upozorenje", command=show_warning).pack()
tk.Button(root, text="Greška", command=show_error).pack()
tk.Button(root, text="Pitanje", command=ask_question).pack()
```

### File Dialog
```python
from tkinter import filedialog

def open_file():
    file_path = filedialog.askopenfilename(
        initialdir="/",
        title="Odaberi fajl",
        filetypes=(("text fajlovi", "*.txt"), ("svi fajlovi", "*.*"))
    )
    print(f"Odabrani fajl: {file_path}")

def save_file():
    file_path = filedialog.asksaveasfilename(
        defaultextension=".txt",
        filetypes=(("text fajlovi", "*.txt"), ("svi fajlovi", "*.*"))
    )
    print(f"Sačuvaj kao: {file_path}")

# Kreiranje dugmadi za file dijaloge
tk.Button(root, text="Otvori Fajl", command=open_file).pack()
tk.Button(root, text="Sačuvaj Fajl", command=save_file).pack()
```

## Stiliziranje i Teme

### TTK Stiliziranje
```python
from tkinter import ttk
import tkinter as tk

root = tk.Tk()

# Kreiranje stila
style = ttk.Style()

# Konfiguracija stila
style.configure("Custom.TButton",
                foreground="white",
                background="blue",
                font=("Arial", 12, "bold"),
                padding=10)

# Primjena stila
button = ttk.Button(root, text="Stilizirano Dugme", style="Custom.TButton")
button.pack(pady=10)

# Promjena teme
style.theme_use('clam')  # Probajte: 'default', 'alt', 'clam', 'classic'
```

### Prilagođene Boje i Fontovi
```python
# Prilagođene boje
label = tk.Label(root,
                 text="Obojena Labela",
                 bg="#ff0000",  # Pozadinska boja
                 fg="#ffffff",  # Boja teksta
                 font=("Arial", 14, "bold"))
label.pack()

# Prilagođeni font
custom_font = ("Helvetica", 12, "italic")
button = tk.Button(root,
                   text="Dugme sa Prilagođenim Fontom",
                   font=custom_font)
button.pack()
```

## Najbolje Prakse

1. **Korištenje Objektno-Orijentisanog Programiranja**
```python
class Application(tk.Tk):
    def __init__(self):
        super().__init__()
        
        self.title("OOP Aplikacija")
        self.geometry("400x300")
        
        self.create_widgets()
    
    def create_widgets(self):
        self.label = tk.Label(self, text="Zdravo, Svijete!")
        self.label.pack()
        
        self.button = tk.Button(self, text="Klikni me!", command=self.button_click)
        self.button.pack()
    
    def button_click(self):
        print("Dugme kliknuto!")

if __name__ == "__main__":
    app = Application()
    app.mainloop()
```

2. **Odvajanje Logike od UI-a**
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
        
        self.button = tk.Button(root, text="Saberi", command=self.perform_addition)
        self.button.pack()
        
        self.result_label = tk.Label(root, text="Rezultat: ")
        self.result_label.pack()
    
    def perform_addition(self):
        num1 = float(self.entry1.get())
        num2 = float(self.entry2.get())
        result = self.calc.add(num1, num2)
        self.result_label.config(text=f"Rezultat: {result}")
```

3. **Pravilno Rukovanje Greškama**
```python
def safe_button_click():
    try:
        # Potencijalno opasna operacija
        value = int(entry.get())
        result = 10 / value
        label.config(text=f"Rezultat: {result}")
    except ValueError:
        messagebox.showerror("Greška", "Molimo unesite validan broj")
    except ZeroDivisionError:
        messagebox.showerror("Greška", "Nije moguće dijeliti sa nulom")
    except Exception as e:
        messagebox.showerror("Greška", f"Došlo je do greške: {str(e)}")
```

## Primjeri Projekata

### Jednostavni Kalkulator
```python
class Calculator(tk.Tk):
    def __init__(self):
        super().__init__()
        
        self.title("Jednostavni Kalkulator")
        self.geometry("300x400")
        
        self.result_var = tk.StringVar()
        self.create_widgets()
    
    def create_widgets(self):
        # Display
        display = tk.Entry(self, textvariable=self.result_var, justify="right")
        display.grid(row=0, column=0, columnspan=4, sticky="nsew", padx=5, pady=5)
        
        # Dugmad
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
                self.result_var.set("Greška")
        else:
            self.result_var.set(self.result_var.get() + key)

if __name__ == "__main__":
    app = Calculator()
    app.mainloop()
```

### Aplikacija za To-Do Listu
```python
class TodoApp(tk.Tk):
    def __init__(self):
        super().__init__()
        
        self.title("To-Do Lista")
        self.geometry("400x500")
        
        self.create_widgets()
    
    def create_widgets(self):
        # Unos za nove zadatke
        self.task_entry = tk.Entry(self)
        self.task_entry.pack(pady=10)
        
        # Dugme za dodavanje
        tk.Button(self, text="Dodaj Zadatak", command=self.add_task).pack()
        
        # Listbox za zadatke
        self.task_listbox = tk.Listbox(self, width=50)
        self.task_listbox.pack(pady=10)
        
        # Dugme za brisanje
        tk.Button(self, text="Obriši Zadatak", command=self.delete_task).pack()
        
        # Dugme za završavanje
        tk.Button(self, text="Završi Zadatak", command=self.complete_task).pack()
    
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

## Rad sa JSON Konfiguracijom

### Upravljanje JSON Konfiguracijom
```python
import json
import os
from typing import Dict, Any

class ConfigManager:
    def __init__(self, config_file: str):
        self.config_file = config_file
        self.config: Dict[str, Any] = self._load_config()

    def _load_config(self) -> Dict[str, Any]:
        """Učitaj konfiguraciju iz JSON fajla ili kreiraj podrazumijevanu ako ne postoji."""
        if os.path.exists(self.config_file):
            try:
                with open(self.config_file, 'r') as f:
                    return json.load(f)
            except json.JSONDecodeError:
                print(f"Greška pri čitanju konfiguracijske datoteke: {self.config_file}")
                return self._create_default_config()
        return self._create_default_config()

    def _create_default_config(self) -> Dict[str, Any]:
        """Kreiraj i sačuvaj podrazumijevanu konfiguraciju."""
        default_config = {
            "window": {
                "width": 800,
                "height": 600,
                "title": "Moja Aplikacija",
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
        """Sačuvaj konfiguraciju u JSON fajl."""
        if config is not None:
            self.config = config
        with open(self.config_file, 'w') as f:
            json.dump(self.config, f, indent=4)

    def get(self, key: str, default: Any = None) -> Any:
        """Dobavi vrijednost konfiguracije po ključu."""
        try:
            keys = key.split('.')
            value = self.config
            for k in keys:
                value = value[k]
            return value
        except (KeyError, TypeError):
            return default

    def set(self, key: str, value: Any) -> None:
        """Postavi vrijednost konfiguracije po ključu."""
        keys = key.split('.')
        config = self.config
        for k in keys[:-1]:
            config = config.setdefault(k, {})
        config[keys[-1]] = value
        self.save_config()

class ConfigurableApplication(tk.Tk):
    def __init__(self):
        tk.Tk.__init__(self)
        
        # Inicijalizacija konfiguracije
        self.config_manager = ConfigManager("app_config.json")
        
        # Primjena konfiguracije prozora
        self.title(self.config_manager.get("window.title", "Aplikacija"))
        self.geometry(f"{self.config_manager.get('window.width', 800)}x{self.config_manager.get('window.height', 600)}")
        
        # Kreiranje i konfiguracija widgeta
        self.create_widgets()
        self.apply_theme()
        
    def create_widgets(self):
        # Kreiranje okvira za postavke
        settings_frame = ttk.LabelFrame(self, text="Postavke")
        settings_frame.pack(padx=10, pady=10, fill="x")
        
        # Izbor teme
        ttk.Label(settings_frame, text="Tema:").pack(side="left", padx=5)
        theme_var = tk.StringVar(value=self.config_manager.get("window.theme"))
        theme_combo = ttk.Combobox(settings_frame, textvariable=theme_var, 
                                 values=["default", "clam", "alt", "classic"])
        theme_combo.pack(side="left", padx=5)
        theme_combo.bind("<<ComboboxSelected>>", lambda e: self.update_theme(theme_var.get()))
        
        # Izbor veličine fonta
        ttk.Label(settings_frame, text="Veličina fonta:").pack(side="left", padx=5)
        font_size_var = tk.StringVar(value=str(self.config_manager.get("appearance.font_size")))
        font_size_spin = ttk.Spinbox(settings_frame, from_=8, to=24, width=5,
                                   textvariable=font_size_var)
        font_size_spin.pack(side="left", padx=5)
        font_size_spin.bind("<Return>", lambda e: self.update_font_size(int(font_size_var.get())))
        
        # Automatsko spašavanje toggle
        auto_save_var = tk.BooleanVar(value=self.config_manager.get("behavior.auto_save"))
        auto_save_check = ttk.Checkbutton(settings_frame, text="Auto-spašavanje",
                                        variable=auto_save_var,
                                        command=lambda: self.update_auto_save(auto_save_var.get()))
        auto_save_check.pack(side="left", padx=5)
        
        # Glavni prostor za sadržaj
        content_frame = ttk.Frame(self)
        content_frame.pack(padx=10, pady=10, fill="both", expand=True)
        
        # Text editor sa konfigurisanim fontom
        self.text_editor = tk.Text(content_frame)
        self.text_editor.pack(fill="both", expand=True)
        self.update_text_font()
        
    def apply_theme(self):
        """Primijeni trenutnu temu konfiguracije."""
        theme = self.config_manager.get("window.theme", "default")
        style = ttk.Style()
        style.theme_use(theme)
        
        # Primijeni prilagođene boje
        bg_color = self.config_manager.get("appearance.colors.background")
        fg_color = self.config_manager.get("appearance.colors.foreground")
        if bg_color and fg_color:
            self.configure(bg=bg_color)
            style.configure(".", background=bg_color, foreground=fg_color)
            
    def update_theme(self, theme: str):
        """Ažuriraj temu aplikacije."""
        self.config_manager.set("window.theme", theme)
        self.apply_theme()
        
    def update_font_size(self, size: int):
        """Ažuriraj veličinu fonta aplikacije."""
        self.config_manager.set("appearance.font_size", size)
        self.update_text_font()
        
    def update_text_font(self):
        """Ažuriraj font text editora na osnovu konfiguracije."""
        font_family = self.config_manager.get("appearance.font_family", "Arial")
        font_size = self.config_manager.get("appearance.font_size", 12)
        self.text_editor.configure(font=(font_family, font_size))
        
    def update_auto_save(self, enabled: bool):
        """Ažuriraj konfiguraciju automatskog spašavanja."""
        self.config_manager.set("behavior.auto_save", enabled)
        if enabled:
            interval = self.config_manager.get("behavior.auto_save_interval", 300)
            self.after(interval * 1000, self.auto_save)
            
    def auto_save(self):
        """Izvrši operaciju automatskog spašavanja."""
        if self.config_manager.get("behavior.auto_save"):
            print("Automatsko spašavanje sadržaja...")
            # Implementirajte svoju logiku spašavanja ovdje
            interval = self.config_manager.get("behavior.auto_save_interval", 300)
            self.after(interval * 1000, self.auto_save)

# Primjer korištenja
if __name__ == "__main__":
    app = ConfigurableApplication()
    app.mainloop()
```

### Napredni Primjer Konfiguracije sa Više Prozora
```python
class ConfigurableWindow:
    """Osnovna klasa za prozore koji koriste konfiguraciju."""
    
    def __init__(self, config_manager: ConfigManager, window_key: str):
        self.config_manager = config_manager
        self.window_key = window_key
        
    def save_geometry(self, window: tk.Tk | tk.Toplevel):
        """Sačuvaj geometriju prozora u konfiguraciju."""
        geometry = window.geometry()
        self.config_manager.set(f"{self.window_key}.geometry", geometry)
        
    def load_geometry(self, window: tk.Tk | tk.Toplevel):
        """Učitaj geometriju prozora iz konfiguracije."""
        geometry = self.config_manager.get(f"{self.window_key}.geometry")
        if geometry:
            window.geometry(geometry)
            
class SettingsWindow(tk.Toplevel, ConfigurableWindow):
    def __init__(self, parent, config_manager: ConfigManager):
        tk.Toplevel.__init__(self, parent)
        ConfigurableWindow.__init__(self, config_manager, "settings_window")
        
        self.title("Postavke")
        self.load_geometry(self)
        
        # Kreiraj interfejs za postavke
        self.create_widgets()
        
        # Sačuvaj geometriju pri zatvaranju prozora
        self.protocol("WM_DELETE_WINDOW", self.on_close)
        
    def create_widgets(self):
        # Kreiraj notebook za organizovane postavke
        notebook = ttk.Notebook(self)
        notebook.pack(padx=10, pady=10, fill="both", expand=True)
        
        # Postavke izgleda
        appearance_frame = ttk.Frame(notebook)
        notebook.add(appearance_frame, text="Izgled")
        
        # Postavke teme
        theme_frame = ttk.LabelFrame(appearance_frame, text="Tema")
        theme_frame.pack(padx=5, pady=5, fill="x")
        
        ttk.Label(theme_frame, text="Šema boja:").grid(row=0, column=0, padx=5, pady=5)
        theme_var = tk.StringVar(value=self.config_manager.get("appearance.theme"))
        theme_combo = ttk.Combobox(theme_frame, textvariable=theme_var,
                                 values=["svijetla", "tamna", "sistem"])
        theme_combo.grid(row=0, column=1, padx=5, pady=5)
        theme_combo.bind("<<ComboboxSelected>>", 
                        lambda e: self.config_manager.set("appearance.theme", theme_var.get()))
        
        # Postavke fonta
        font_frame = ttk.LabelFrame(appearance_frame, text="Font")
        font_frame.pack(padx=5, pady=5, fill="x")
        
        ttk.Label(font_frame, text="Familija:").grid(row=0, column=0, padx=5, pady=5)
        font_family_var = tk.StringVar(value=self.config_manager.get("appearance.font_family"))
        font_family_combo = ttk.Combobox(font_frame, textvariable=font_family_var,
                                       values=["Arial", "Helvetica", "Times New Roman"])
        font_family_combo.grid(row=0, column=1, padx=5, pady=5)
        font_family_combo.bind("<<ComboboxSelected>>",
                             lambda e: self.config_manager.set("appearance.font_family", 
                                                            font_family_var.get()))
        
        # Postavke ponašanja
        behavior_frame = ttk.Frame(notebook)
        notebook.add(behavior_frame, text="Ponašanje")
        
        # Postavke automatskog spašavanja
        auto_save_frame = ttk.LabelFrame(behavior_frame, text="Automatsko Spašavanje")
        auto_save_frame.pack(padx=5, pady=5, fill="x")
        
        auto_save_var = tk.BooleanVar(value=self.config_manager.get("behavior.auto_save"))
        auto_save_check = ttk.Checkbutton(auto_save_frame, text="Omogući auto-spašavanje",
                                        variable=auto_save_var,
                                        command=lambda: self.config_manager.set(
                                            "behavior.auto_save", auto_save_var.get()))
        auto_save_check.pack(padx=5, pady=5)
        
        ttk.Label(auto_save_frame, text="Interval (sekunde):").pack(padx=5)
        interval_var = tk.StringVar(value=str(
            self.config_manager.get("behavior.auto_save_interval", 300)))
        interval_spin = ttk.Spinbox(auto_save_frame, from_=60, to=3600, width=10,
                                  textvariable=interval_var)
        interval_spin.pack(padx=5, pady=5)
        interval_spin.bind("<Return>", lambda e: self.config_manager.set(
            "behavior.auto_save_interval", int(interval_var.get())))
        
    def on_close(self):
        """Obradi događaj zatvaranja prozora."""
        self.save_geometry(self)
        self.destroy()

class MainApplication(tk.Tk, ConfigurableWindow):
    def __init__(self):
        tk.Tk.__init__(self)
        
        # Inicijalizacija konfiguracije
        self.config_manager = ConfigManager("app_config.json")
        ConfigurableWindow.__init__(self, self.config_manager, "main_window")
        
        # Konfiguriši glavni prozor
        self.title(self.config_manager.get("window.title", "Konfigurabilna Aplikacija"))
        self.load_geometry(self)
        
        # Kreiraj meni
        self.create_menu()
        
        # Kreiraj glavni interfejs
        self.create_widgets()
        
        # Sačuvaj geometriju pri zatvaranju prozora
        self.protocol("WM_DELETE_WINDOW", self.on_close)
        
    def create_menu(self):
        menubar = tk.Menu(self)
        self.config(menu=menubar)
        
        # Fajl meni
        file_menu = tk.Menu(menubar, tearoff=0)
        menubar.add_cascade(label="Fajl", menu=file_menu)
        file_menu.add_command(label="Novi", command=self.new_file)
        file_menu.add_command(label="Otvori", command=self.open_file)
        file_menu.add_command(label="Spasi", command=self.save_file)
        file_menu.add_separator()
        file_menu.add_command(label="Izlaz", command=self.on_close)
        
        # Uredi meni
        edit_menu = tk.Menu(menubar, tearoff=0)
        menubar.add_cascade(label="Uredi", menu=edit_menu)
        edit_menu.add_command(label="Postavke", command=self.show_settings)
        
    def create_widgets(self):
        # Kreiraj glavni prostor za sadržaj
        self.text_editor = tk.Text(self)
        self.text_editor.pack(fill="both", expand=True)
        
        # Primijeni trenutne postavke fonta
        self.update_font()
        
    def update_font(self):
        """Ažuriraj font text editora na osnovu konfiguracije."""
        family = self.config_manager.get("appearance.font_family", "Arial")
        size = self.config_manager.get("appearance.font_size", 12)
        self.text_editor.configure(font=(family, size))
        
    def show_settings(self):
        """Prikaži prozor sa postavkama."""
        SettingsWindow(self, self.config_manager)
        
    def new_file(self):
        """Kreiraj novi fajl."""
        if self.config_manager.get("behavior.confirm_action", True):
            if not messagebox.askyesno("Novi Fajl", "Kreirati novi fajl? Nespašene promjene će biti izgubljene."):
                return
        self.text_editor.delete("1.0", tk.END)
        
    def open_file(self):
        """Otvori fajl."""
        file_path = filedialog.askopenfilename(
            filetypes=[("Text fajlovi", "*.txt"), ("Svi fajlovi", "*.*")])
        if file_path:
            try:
                with open(file_path, 'r') as file:
                    content = file.read()
                self.text_editor.delete("1.0", tk.END)
                self.text_editor.insert("1.0", content)
            except Exception as e:
                messagebox.showerror("Greška", f"Greška pri otvaranju fajla: {str(e)}")
                
    def save_file(self):
        """Spasi trenutni fajl."""
        file_path = filedialog.asksaveasfilename(
            defaultextension=".txt",
            filetypes=[("Text fajlovi", "*.txt"), ("Svi fajlovi", "*.*")])
        if file_path:
            try:
                content = self.text_editor.get("1.0", tk.END)
                with open(file_path, 'w') as file:
                    file.write(content)
            except Exception as e:
                messagebox.showerror("Greška", f"Greška pri spašavanju fajla: {str(e)}")
                
    def on_close(self):
        """Obradi zatvaranje aplikacije."""
        if self.config_manager.get("behavior.confirm_exit", True):
            if not messagebox.askyesno("Izlaz", "Da li ste sigurni da želite izaći?"):
                return
        self.save_geometry(self)
        self.quit()

if __name__ == "__main__":
    app = MainApplication()
    app.mainloop()
```

## Napredne JSON Konfiguracijske Funkcije

```python
class AdvancedConfigManager(ConfigManager):
    def __init__(self, config_file: str):
        super().__init__(config_file)
        self._backup_file = f"{config_file}.backup"
        self._observers = []
        
    def add_observer(self, callback: Callable[[str, Any], None]):
        """Dodaj posmatrača za promjene konfiguracije."""
        self._observers.append(callback)
        
    def remove_observer(self, callback: Callable[[str, Any], None]):
        """Ukloni posmatrača za promjene konfiguracije."""
        self._observers.remove(callback)
        
    def set(self, key: str, value: Any) -> None:
        """Postavi vrijednost konfiguracije i obavijesti posmatrače."""
        super().set(key, value)
        for observer in self._observers:
            observer(key, value)
            
    def create_backup(self):
        """Kreiraj backup trenutne konfiguracije."""
        with open(self._backup_file, 'w') as f:
            json.dump(self.config, f, indent=4)
            
    def restore_from_backup(self):
        """Vrati konfiguraciju iz backupa."""
        if os.path.exists(self._backup_file):
            with open(self._backup_file, 'r') as f:
                self.config = json.load(f)
            self.save_config()
            
    def import_config(self, file_path: str):
        """Importuj konfiguraciju iz vanjskog fajla."""
        try:
            with open(file_path, 'r') as f:
                new_config = json.load(f)
            self.create_backup()  # Kreiraj backup prije importa
            self.config = new_config
            self.save_config()
            return True
        except Exception as e:
            print(f"Greška pri importovanju konfiguracije: {str(e)}")
            return False
            
    def export_config(self, file_path: str):
        """Eksportuj trenutnu konfiguraciju u vanjski fajl."""
        try:
            with open(file_path, 'w') as f:
                json.dump(self.config, f, indent=4)
            return True
        except Exception as e:
            print(f"Greška pri eksportovanju konfiguracije: {str(e)}")
            return False
            
    def merge_config(self, other_config: Dict[str, Any]):
        """Spoji drugu konfiguraciju sa trenutnom."""
        def deep_merge(source: Dict, destination: Dict):
            for key, value in source.items():
                if key in destination:
                    if isinstance(value, dict) and isinstance(destination[key], dict):
                        deep_merge(value, destination[key])
                    else:
                        destination[key] = value
                else:
                    destination[key] = value
                    
        deep_merge(other_config, self.config)
        self.save_config()
        
    def reset_section(self, section: str):
        """Resetuj određenu sekciju konfiguracije."""
        default = self._create_default_config()
        if section in default:
            self.config[section] = default[section]
            self.save_config()
            
    def validate_config(self, schema: Dict[str, Any]) -> bool:
        """Validiraj konfiguraciju prema shemi."""
        def validate_type(value: Any, expected_type: Any) -> bool:
            if expected_type == "number":
                return isinstance(value, (int, float))
            elif expected_type == "string":
                return isinstance(value, str)
            elif expected_type == "boolean":
                return isinstance(value, bool)
            elif isinstance(expected_type, dict):
                return isinstance(value, dict) and all(
                    k in value and validate_type(value[k], v)
                    for k, v in expected_type.items()
                )
            elif isinstance(expected_type, list):
                return isinstance(value, list) and all(
                    validate_type(item, expected_type[0])
                    for item in value
                )
            return False
            
        try:
            return all(
                k in self.config and validate_type(self.config[k], v)
                for k, v in schema.items()
            )
        except Exception:
            return False

# Primjer korištenja naprednih funkcija
if __name__ == "__main__":
    # Shema za validaciju konfiguracije
    config_schema = {
        "window": {
            "width": "number",
            "height": "number",
            "title": "string",
            "theme": "string"
        },
        "appearance": {
            "font_family": "string",
            "font_size": "number",
            "colors": {
                "background": "string",
                "foreground": "string",
                "accent": "string"
            }
        },
        "behavior": {
            "auto_save": "boolean",
            "auto_save_interval": "number",
            "confirm_exit": "boolean"
        }
    }
    
    # Kreiraj menadžer konfiguracije
    config = AdvancedConfigManager("app_config.json")
    
    # Posmatrač za promjene konfiguracije
    def config_changed(key: str, value: Any):
        print(f"Konfiguracija promijenjena: {key} = {value}")
    
    config.add_observer(config_changed)
    
    # Validiraj konfiguraciju
    if config.validate_config(config_schema):
        print("Konfiguracija je validna")
    else:
        print("Konfiguracija nije validna")
    
    # Kreiraj i vrati backup
    config.create_backup()
    config.set("window.theme", "dark")
    config.restore_from_backup()
    
    # Eksportuj i importuj konfiguraciju
    config.export_config("config_export.json")
    config.import_config("config_export.json")
    
    # Spoji konfiguracije
    other_config = {
        "appearance": {
            "colors": {
                "accent": "#ff0000"
            }
        }
    }
    config.merge_config(other_config)
    
    # Resetuj sekciju
    config.reset_section("appearance")
```

Ove napredne funkcije pružaju:
1. Obrazac posmatrača za promjene konfiguracije
2. Backup i vraćanje
3. Import i export konfiguracija
4. Spajanje konfiguracija
5. Validaciju prema shemi
6. Selektivno resetovanje sekcija konfiguracije

{{ ... }}

```

### Napredne Sigurnosne i Funkcije za Rukovanje Greškama

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
        """Konfigurira sistem za logiranje."""
        logging.basicConfig(
            filename='config_manager.log',
            level=logging.INFO,
            format='%(asctime)s - %(levelname)s - %(message)s'
        )
        
    def _encrypt_data(self, data: str) -> str:
        """Enkriptuje podatke koristeći Fernet."""
        if self._fernet:
            return self._fernet.encrypt(data.encode()).decode()
        return data
        
    def _decrypt_data(self, data: str) -> str:
        """Dekriptuje podatke koristeći Fernet."""
        if self._fernet:
            return self._fernet.decrypt(data.encode()).decode()
        return data
        
    def save_config(self) -> None:
        """Sigurno spašava konfiguraciju."""
        try:
            json_str = json.dumps(self.config, indent=4)
            encrypted_data = self._encrypt_data(json_str)
            
            with open(self._config_file, 'w') as f:
                f.write(encrypted_data)
                
            self._log_action("Konfiguracija spašena")
            self._create_audit_entry("save_config")
        except Exception as e:
            self._handle_error("Greška pri spašavanju konfiguracije", e)
            
    def load_config(self) -> None:
        """Učitava enkriptovanu konfiguraciju."""
        try:
            if not os.path.exists(self._config_file):
                self.config = self._create_default_config()
                return
                
            with open(self._config_file, 'r') as f:
                encrypted_data = f.read()
                
            decrypted_data = self._decrypt_data(encrypted_data)
            self.config = json.loads(decrypted_data)
            
            self._log_action("Konfiguracija učitana")
            self._create_audit_entry("load_config")
        except Exception as e:
            self._handle_error("Greška pri učitavanju konfiguracije", e)
            
    def _handle_error(self, message: str, error: Exception):
        """Rukuje greškama na jedinstven način."""
        error_details = f"{message}: {str(error)}"
        logging.error(error_details)
        self._create_audit_entry("error", error_details)
        raise ConfigError(error_details)
        
    def _create_audit_entry(self, action: str, details: str = ""):
        """Kreira unos u audit log."""
        entry = {
            "timestamp": datetime.datetime.now().isoformat(),
            "action": action,
            "details": details,
            "config_hash": self._calculate_config_hash()
        }
        self._audit_log.append(entry)
        
    def _calculate_config_hash(self) -> str:
        """Računa hash trenutne konfiguracije."""
        config_str = json.dumps(self.config, sort_keys=True)
        return hashlib.sha256(config_str.encode()).hexdigest()
        
    def get_audit_log(self) -> List[Dict]:
        """Vraća audit log."""
        return self._audit_log
        
    def validate_config_advanced(self, schema: Dict[str, Any]) -> List[str]:
        """Napredna validacija konfiguracije sa detaljnim porukama o greškama."""
        errors = []
        
        def validate_field(path: str, value: Any, schema_value: Any):
            if isinstance(schema_value, dict):
                if not isinstance(value, dict):
                    errors.append(f"Polje '{path}' mora biti objekat")
                    return
                for key, sub_schema in schema_value.items():
                    if key not in value:
                        errors.append(f"Obavezno polje '{path}.{key}' nedostaje")
                    else:
                        validate_field(f"{path}.{key}", value[key], sub_schema)
            else:
                expected_type = schema_value
                if expected_type == "number":
                    if not isinstance(value, (int, float)):
                        errors.append(f"Polje '{path}' mora biti broj")
                elif expected_type == "string":
                    if not isinstance(value, str):
                        errors.append(f"Polje '{path}' mora biti string")
                elif expected_type == "boolean":
                    if not isinstance(value, bool):
                        errors.append(f"Polje '{path}' mora biti boolean")
                        
        for key, schema_value in schema.items():
            if key not in self.config:
                errors.append(f"Obavezno polje '{key}' nedostaje")
            else:
                validate_field(key, self.config[key], schema_value)
                
        return errors

class ConfigError(Exception):
    """Prilagođeni izuzetak za greške u konfiguraciji."""
    pass

# Primjer korištenja naprednih sigurnosnih funkcija
if __name__ == "__main__":
    # Generisanje ključa za enkripciju
    encryption_key = Fernet.generate_key().decode()
    
    # Kreiranje sigurnog menadžera konfiguracije
    config = SecureConfigManager("secure_config.json", encryption_key)
    
    # Shema za naprednu validaciju
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
        # Validacija konfiguracije
        validation_errors = config.validate_config_advanced(advanced_schema)
        if validation_errors:
            print("Pronađene greške pri validaciji:")
            for error in validation_errors:
                print(f"- {error}")
        else:
            print("Konfiguracija je validna")
            
        # Postavljanje primjera konfiguracije
        config.set("window.position.x", 100)
        config.set("window.position.y", 200)
        config.set("security.auto_lock", True)
        config.set("security.lock_timeout", 300)
        
        # Spašavanje konfiguracije
        config.save_config()
        
        # Prikaz audit loga
        print("\nAudit Log:")
        for entry in config.get_audit_log():
            print(f"[{entry['timestamp']}] {entry['action']}: {entry['details']}")
            
    except ConfigError as e:
        print(f"Greška u konfiguraciji: {str(e)}")
    except Exception as e:
        print(f"Neočekivana greška: {str(e)}")
```

Ove napredne sigurnosne funkcije pružaju:
1. Enkripciju konfiguracijskih podataka
2. Detaljno rukovanje greškama i logiranje
3. Audit log za promjene konfiguracije
4. Naprednu validaciju sheme sa detaljnim porukama o greškama
5. Hash konfiguracije za provjeru integriteta
6. Sigurno rukovanje greškama sa prilagođenim izuzecima

### Primjer Napredne Konfiguracijske Aplikacije

```python
class SecureConfigurableApplication(tk.Tk):
    def __init__(self, encryption_key: str):
        super().__init__()
        
        self.config_manager = SecureConfigManager("secure_app_config.json", encryption_key)
        self.setup_ui()
        self.setup_security()
        
    def setup_ui(self):
        """Kreira korisnički interfejs."""
        self.title("Sigurna Konfiguracijska Aplikacija")
        
        # Glavni okvir
        main_frame = ttk.Frame(self, padding="10")
        main_frame.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))
        
        # Prikaz konfiguracije
        self.config_tree = ttk.Treeview(main_frame, columns=("Value",), show="tree")
        self.config_tree.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))
        
        # Scrollbar
        scrollbar = ttk.Scrollbar(main_frame, orient=tk.VERTICAL, command=self.config_tree.yview)
        scrollbar.grid(row=0, column=1, sticky=(tk.N, tk.S))
        self.config_tree.configure(yscrollcommand=scrollbar.set)
        
        # Dugmad
        button_frame = ttk.Frame(main_frame)
        button_frame.grid(row=1, column=0, columnspan=2, pady=10)
        
        ttk.Button(button_frame, text="Osvježi", command=self.refresh_config_display).pack(side=tk.LEFT, padx=5)
        ttk.Button(button_frame, text="Eksportuj", command=self.export_config).pack(side=tk.LEFT, padx=5)
        ttk.Button(button_frame, text="Audit Log", command=self.show_audit_log).pack(side=tk.LEFT, padx=5)
        
    def setup_security(self):
        """Konfigurira sigurnosne postavke."""
        self.protocol("WM_DELETE_WINDOW", self.secure_exit)
        self.bind("<Control-s>", lambda e: self.config_manager.save_config())
        
        # Auto-Lock Timer
        self.last_activity = datetime.datetime.now()
        self.check_activity()
        
    def check_activity(self):
        """Provjerava aktivnost korisnika za auto-lock."""
        if self.config_manager.get("security.auto_lock", False):
            timeout = self.config_manager.get("security.lock_timeout", 300)
            if (datetime.datetime.now() - self.last_activity).seconds > timeout:
                self.lock_application()
        self.after(1000, self.check_activity)
        
    def lock_application(self):
        """Zaključava aplikaciju."""
        self.withdraw()
        dialog = tk.Toplevel(self)
        dialog.title("Aplikacija zaključana")
        dialog.transient(self)
        dialog.grab_set()
        
        ttk.Label(dialog, text="Unesite lozinku:").pack(pady=10)
        password_var = tk.StringVar()
        password_entry = ttk.Entry(dialog, show="*", textvariable=password_var)
        password_entry.pack(pady=5)
        
        def unlock():
            if self.verify_password(password_var.get()):
                self.last_activity = datetime.datetime.now()
                dialog.destroy()
                self.deiconify()
            else:
                tk.messagebox.showerror("Greška", "Pogrešna lozinka")
                
        ttk.Button(dialog, text="Otključaj", command=unlock).pack(pady=10)
        
    def verify_password(self, password: str) -> bool:
        """Provjerava unesenu lozinku."""
        stored_hash = self.config_manager.get("security.password_hash", "")
        if not stored_hash:
            return True
        return hashlib.sha256(password.encode()).hexdigest() == stored_hash
        
    def refresh_config_display(self):
        """Osvježava prikaz konfiguracije."""
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
        """Eksportuje konfiguraciju."""
        filename = tk.filedialog.asksaveasfilename(
            defaultextension=".json",
            filetypes=[("JSON fajlovi", "*.json"), ("Svi fajlovi", "*.*")]
        )
        if filename:
            try:
                self.config_manager.export_config(filename)
                tk.messagebox.showinfo("Uspjeh", "Konfiguracija uspješno eksportovana")
            except Exception as e:
                tk.messagebox.showerror("Greška", f"Greška pri eksportovanju: {str(e)}")
                
    def show_audit_log(self):
        """Prikazuje audit log."""
        dialog = tk.Toplevel(self)
        dialog.title("Audit Log")
        dialog.transient(self)
        
        text = tk.Text(dialog, wrap=tk.WORD, width=60, height=20)
        text.pack(padx=10, pady=10)
        
        scrollbar = ttk.Scrollbar(dialog, orient=tk.VERTICAL, command=text.yview)
        scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
        text.configure(yscrollcommand=scrollbar.set)
        
        for entry in self.config_manager.get_audit_log():
            text.insert(tk.END, f"[{entry['timestamp']}] {entry['action']}\n")
            if entry['details']:
                text.insert(tk.END, f"Detalji: {entry['details']}\n")
            text.insert(tk.END, f"Hash: {entry['config_hash']}\n\n")
            
        text.configure(state=tk.DISABLED)
        
    def secure_exit(self):
        """Sigurno zatvaranje aplikacije."""
        try:
            self.config_manager.save_config()
            self.quit()
        except Exception as e:
            tk.messagebox.showerror("Greška", f"Greška pri spašavanju konfiguracije: {str(e)}")

if __name__ == "__main__":
    # Generisanje ključa za enkripciju
    encryption_key = Fernet.generate_key().decode()
    
    # Pokretanje aplikacije
    app = SecureConfigurableApplication(encryption_key)
    app.mainloop()
```

Ova napredna implementacija pruža:
1. Enkriptovano spašavanje konfiguracije
2. Automatsku funkciju zaključavanja pri neaktivnosti
3. Zaštitu lozinkom
4. Prikaz audit loga
5. Eksport konfiguracije
6. Stablo prikaz konfiguracije
7. Sigurno zatvaranje aplikacije

{{ ... }}
