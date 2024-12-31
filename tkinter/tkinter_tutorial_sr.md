# Tkinter Туторијал

## Садржај
1. [Увод](#увод)
2. [Први Кораци](#први-кораци)
3. [Основни Виџети](#основни-виџети)
4. [Управљање Лејаутом](#управљање-лејаутом)
5. [Обрада Догађаја](#обрада-догађаја)
6. [Напредни Виџети](#напредни-виџети)
7. [Менији и Дијалози](#менији-и-дијалози)
8. [Стилизација и Теме](#стилизација-и-теме)
9. [Најбоље Праксе](#најбоље-праксе)
10. [Примери Пројеката](#примери-пројеката)
11. [Рад са JSON Конфигурацијом](#рад-са-json-конфигурацијом)
12. [Напредне JSON Конфигурационе Функције](#напредне-json-конфигурационе-функције)

## Увод

Tkinter је Пајтонова стандардна GUI (Graphical User Interface) библиотека. Пружа брз и једноставан начин за креирање GUI апликација. Tkinter долази прединсталиран са Пајтоном, што га чини најпогоднијим избором за креирање десктоп апликација са Пајтоном.

## Први Кораци

### Креирање Основног Прозора
```python
import tkinter as tk

# Креирање главног прозора
root = tk.Tk()
root.title("Моја Прва Tkinter Апликација")
root.geometry("400x300")  # Ширина x Висина

# Покретање петље догађаја
root.mainloop()
```

### Додавање Виџета
```python
import tkinter as tk

root = tk.Tk()
root.title("Пример Основних Виџета")

# Додавање лабеле
label = tk.Label(root, text="Здраво, Tkinter!")
label.pack()

# Додавање дугмета
button = tk.Button(root, text="Кликни ме!", command=lambda: print("Дугме кликнуто!"))
button.pack()

root.mainloop()
```

## Основни Виџети

### Label
```python
# Текстуална лабела
text_label = tk.Label(root, text="Ово је лабела")
text_label.pack()

# Лабела са сликом
image = tk.PhotoImage(file="slika.png")
image_label = tk.Label(root, image=image)
image_label.image = image  # Задржати референцу!
image_label.pack()
```

### Button
```python
def button_click():
    print("Дугме кликнуто!")

# Основно дугме
button = tk.Button(root, text="Кликни ме!", command=button_click)
button.pack()

# Дугме са прилагођеним бојама
colored_button = tk.Button(root, 
                          text="Обојено Дугме",
                          bg="blue",  # Позадинска боја
                          fg="white",  # Боја текста
                          command=button_click)
colored_button.pack()
```

### Entry (Унос Текста)
```python
# Једнолинијски унос текста
entry = tk.Entry(root)
entry.pack()

# Унос лозинке
password_entry = tk.Entry(root, show="*")
password_entry.pack()

# Добијање унете вредности
def get_text():
    print(entry.get())

button = tk.Button(root, text="Узми Текст", command=get_text)
button.pack()
```

### Text (Вишелинијски Унос Текста)
```python
# Вишелинијски текст виџет
text = tk.Text(root, height=5, width=30)
text.pack()

# Добијање садржаја текста
def get_text_content():
    content = text.get("1.0", tk.END)
    print(content)

button = tk.Button(root, text="Узми Садржај", command=get_text_content)
button.pack()
```

## Управљање Лејаутом

### Pack
```python
# Вертикално распоређивање виџета
tk.Label(root, text="Врх").pack()
tk.Label(root, text="Средина").pack()
tk.Label(root, text="Дно").pack()

# Хоризонтално распоређивање виџета
tk.Label(root, text="Лево").pack(side=tk.LEFT)
tk.Label(root, text="Средина").pack(side=tk.LEFT)
tk.Label(root, text="Десно").pack(side=tk.LEFT)
```

### Grid
```python
# Креирање лејаута форме
tk.Label(root, text="Корисничко име:").grid(row=0, column=0)
tk.Entry(root).grid(row=0, column=1)

tk.Label(root, text="Лозинка:").grid(row=1, column=0)
tk.Entry(root, show="*").grid(row=1, column=1)

tk.Button(root, text="Пријава").grid(row=2, column=0, columnspan=2)
```

### Place
```python
# Апсолутно позиционирање
label = tk.Label(root, text="Позиционирани Виџет")
label.place(x=50, y=50)

# Релативно позиционирање
button = tk.Button(root, text="Релативно")
button.place(relx=0.5, rely=0.5, anchor="center")
```

## Обрада Догађаја

### Догађаји Клика на Дугме
```python
def handle_click():
    print("Дугме кликнуто!")

button = tk.Button(root, text="Кликни ме!", command=handle_click)
button.pack()
```

### Догађаји Тастатуре
```python
def handle_keypress(event):
    print(f"Притиснут тастер: {event.char}")

root.bind("<Key>", handle_keypress)

# Специфично везивање тастера
def handle_return(event):
    print("Притиснут тастер Enter!")

root.bind("<Return>", handle_return)
```

### Догађаји Миша
```python
def handle_mouse_click(event):
    print(f"Миш кликнут на: ({event.x}, {event.y})")

root.bind("<Button-1>", handle_mouse_click)  # Леви клик
root.bind("<Button-3>", lambda e: print("Десни клик"))  # Десни клик

def handle_mouse_motion(event):
    print(f"Миш померен на: ({event.x}, {event.y})")

root.bind("<Motion>", handle_mouse_motion)
```

## Напредни Виџети

### Listbox
```python
# Креирање листбокса
listbox = tk.Listbox(root)
listbox.pack()

# Додавање ставки
items = ["Ставка 1", "Ставка 2", "Ставка 3"]
for item in items:
    listbox.insert(tk.END, item)

# Обрада селекције
def on_select(event):
    selection = listbox.curselection()
    if selection:
        print(listbox.get(selection[0]))

listbox.bind("<<ListboxSelect>>", on_select)
```

### Combobox (Падајућа Листа)
```python
from tkinter import ttk

# Креирање комбобокса
combo = ttk.Combobox(root, values=["Опција 1", "Опција 2", "Опција 3"])
combo.pack()

# Обрада селекције
def on_select(event):
    print(f"Одабрано: {combo.get()}")

combo.bind("<<ComboboxSelected>>", on_select)
```

### Checkbutton
```python
# Креирање варијабли за чекбоксове
var1 = tk.BooleanVar()
var2 = tk.BooleanVar()

# Креирање чекбоксова
check1 = tk.Checkbutton(root, text="Опција 1", variable=var1)
check2 = tk.Checkbutton(root, text="Опција 2", variable=var2)

check1.pack()
check2.pack()

# Добијање вредности
def get_values():
    print(f"Опција 1: {var1.get()}")
    print(f"Опција 2: {var2.get()}")

button = tk.Button(root, text="Узми Вредности", command=get_values)
button.pack()
```

### Radiobutton
```python
# Креирање варијабле за радио дугмад
var = tk.StringVar()
var.set("опција1")  # Поставити подразумевану вредност

# Креирање радио дугмади
radio1 = tk.Radiobutton(root, text="Опција 1", variable=var, value="опција1")
radio2 = tk.Radiobutton(root, text="Опција 2", variable=var, value="опција2")

radio1.pack()
radio2.pack()

# Добијање одабране вредности
def get_selection():
    print(f"Одабрано: {var.get()}")

button = tk.Button(root, text="Узми Селекцију", command=get_selection)
button.pack()
```

## Менији и Дијалози

### Menu Bar
```python
# Креирање мени бара
menubar = tk.Menu(root)
root.config(menu=menubar)

# Креирање Фајл менија
file_menu = tk.Menu(menubar, tearoff=0)
menubar.add_cascade(label="Фајл", menu=file_menu)
file_menu.add_command(label="Нови", command=lambda: print("Нови"))
file_menu.add_command(label="Отвори", command=lambda: print("Отвори"))
file_menu.add_separator()
file_menu.add_command(label="Излаз", command=root.quit)

# Креирање Уреди менија
edit_menu = tk.Menu(menubar, tearoff=0)
menubar.add_cascade(label="Уреди", menu=edit_menu)
edit_menu.add_command(label="Исеци", command=lambda: print("Исеци"))
edit_menu.add_command(label="Копирај", command=lambda: print("Копирај"))
edit_menu.add_command(label="Налепи", command=lambda: print("Налепи"))
```

### Message Boxes
```python
from tkinter import messagebox

def show_info():
    messagebox.showinfo("Информација", "Ово је инфо порука")

def show_warning():
    messagebox.showwarning("Упозорење", "Ово је порука упозорења")

def show_error():
    messagebox.showerror("Грешка", "Ово је порука о грешци")

def ask_question():
    result = messagebox.askquestion("Питање", "Желите ли да наставите?")
    print(f"Резултат: {result}")  # 'yes' или 'no'

# Креирање дугмади за приказ различитих поруке
tk.Button(root, text="Инфо", command=show_info).pack()
tk.Button(root, text="Упозорење", command=show_warning).pack()
tk.Button(root, text="Грешка", command=show_error).pack()
tk.Button(root, text="Питање", command=ask_question).pack()
```

### File Dialog
```python
from tkinter import filedialog

def open_file():
    file_path = filedialog.askopenfilename(
        initialdir="/",
        title="Одабери фајл",
        filetypes=(("текст фајлови", "*.txt"), ("сви фајлови", "*.*"))
    )
    print(f"Одабрани фајл: {file_path}")

def save_file():
    file_path = filedialog.asksaveasfilename(
        defaultextension=".txt",
        filetypes=(("текст фајлови", "*.txt"), ("сви фајлови", "*.*"))
    )
    print(f"Сачувај као: {file_path}")

# Креирање дугмади за фајл дијалоге
tk.Button(root, text="Отвори Фајл", command=open_file).pack()
tk.Button(root, text="Сачувај Фајл", command=save_file).pack()
```

## Стилизација и Теме

### TTK Стилизација
```python
from tkinter import ttk
import tkinter as tk

root = tk.Tk()

# Креирање стила
style = ttk.Style()

# Конфигурација стила
style.configure("Custom.TButton",
                foreground="white",
                background="blue",
                font=("Arial", 12, "bold"),
                padding=10)

# Примена стила
button = ttk.Button(root, text="Стилизовано Дугме", style="Custom.TButton")
button.pack(pady=10)

# Промена теме
style.theme_use('clam')  # Пробајте: 'default', 'alt', 'clam', 'classic'
```

### Прилагођене Боје и Фонтови
```python
# Прилагођене боје
label = tk.Label(root,
                 text="Обојена Лабела",
                 bg="#ff0000",  # Позадинска боја
                 fg="#ffffff",  # Боја текста
                 font=("Arial", 14, "bold"))
label.pack()

# Прилагођени фонт
custom_font = ("Helvetica", 12, "italic")
button = tk.Button(root,
                   text="Дугме са Прилагођеним Фонтом",
                   font=custom_font)
button.pack()
```

## Најбоље Праксе

1. **Коришћење Објектно-Оријентисаног Програмирања**
```python
class Application(tk.Tk):
    def __init__(self):
        super().__init__()
        
        self.title("ООП Апликација")
        self.geometry("400x300")
        
        self.create_widgets()
    
    def create_widgets(self):
        self.label = tk.Label(self, text="Здраво, Свете!")
        self.label.pack()
        
        self.button = tk.Button(self, text="Кликни ме!", command=self.button_click)
        self.button.pack()
    
    def button_click(self):
        print("Дугме кликнуто!")

if __name__ == "__main__":
    app = Application()
    app.mainloop()
```

2. **Одвајање Логике од UI-а**
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
        
        self.button = tk.Button(root, text="Сабери", command=self.perform_addition)
        self.button.pack()
        
        self.result_label = tk.Label(root, text="Резултат: ")
        self.result_label.pack()
    
    def perform_addition(self):
        num1 = float(self.entry1.get())
        num2 = float(self.entry2.get())
        result = self.calc.add(num1, num2)
        self.result_label.config(text=f"Резултат: {result}")
```

3. **Правилно Руковање Грешкама**
```python
def safe_button_click():
    try:
        # Потенцијално опасна операција
        value = int(entry.get())
        result = 10 / value
        label.config(text=f"Резултат: {result}")
    except ValueError:
        messagebox.showerror("Грешка", "Молимо унесите валидан број")
    except ZeroDivisionError:
        messagebox.showerror("Грешка", "Није могуће делити са нулом")
    except Exception as e:
        messagebox.showerror("Грешка", f"Дошло је до грешке: {str(e)}")
```

## Примери Пројеката

### Једноставни Калкулатор
```python
class Calculator(tk.Tk):
    def __init__(self):
        super().__init__()
        
        self.title("Једноставни Калкулатор")
        self.geometry("300x400")
        
        self.result_var = tk.StringVar()
        self.create_widgets()
    
    def create_widgets(self):
        # Дисплеј
        display = tk.Entry(self, textvariable=self.result_var, justify="right")
        display.grid(row=0, column=0, columnspan=4, sticky="nsew", padx=5, pady=5)
        
        # Дугмад
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
                self.result_var.set("Грешка")
        else:
            self.result_var.set(self.result_var.get() + key)

if __name__ == "__main__":
    app = Calculator()
    app.mainloop()
```

### Апликација за To-Do Листу
```python
class TodoApp(tk.Tk):
    def __init__(self):
        super().__init__()
        
        self.title("To-Do Листа")
        self.geometry("400x500")
        
        self.create_widgets()
    
    def create_widgets(self):
        # Унос за нове задатке
        self.task_entry = tk.Entry(self)
        self.task_entry.pack(pady=10)
        
        # Дугме за додавање
        tk.Button(self, text="Додај Задатак", command=self.add_task).pack()
        
        # Листбокс за задатке
        self.task_listbox = tk.Listbox(self, width=50)
        self.task_listbox.pack(pady=10)
        
        # Дугме за брисање
        tk.Button(self, text="Обриши Задатак", command=self.delete_task).pack()
        
        # Дугме за завршавање
        tk.Button(self, text="Заврши Задатак", command=self.complete_task).pack()
    
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

## Рад са JSON Конфигурацијом

### Управљање JSON Конфигурацијом
```python
import json
import os
from typing import Dict, Any

class ConfigManager:
    def __init__(self, config_file: str):
        self.config_file = config_file
        self.config: Dict[str, Any] = self._load_config()

    def _load_config(self) -> Dict[str, Any]:
        """Учитај конфигурацију из JSON фајла или креирај подразумевану ако не постоји."""
        if os.path.exists(self.config_file):
            try:
                with open(self.config_file, 'r') as f:
                    return json.load(f)
            except json.JSONDecodeError:
                print(f"Грешка при читању конфигурационе датотеке: {self.config_file}")
                return self._create_default_config()
        return self._create_default_config()

    def _create_default_config(self) -> Dict[str, Any]:
        """Креирај и сачувај подразумевану конфигурацију."""
        default_config = {
            "window": {
                "width": 800,
                "height": 600,
                "title": "Моја Апликација",
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
        """Сачувај конфигурацију у JSON фајл."""
        if config is not None:
            self.config = config
        with open(self.config_file, 'w') as f:
            json.dump(self.config, f, indent=4)

    def get(self, key: str, default: Any = None) -> Any:
        """Добави вредност конфигурације по кључу."""
        try:
            keys = key.split('.')
            value = self.config
            for k in keys:
                value = value[k]
            return value
        except (KeyError, TypeError):
            return default

    def set(self, key: str, value: Any) -> None:
        """Постави вредност конфигурације по кључу."""
        keys = key.split('.')
        config = self.config
        for k in keys[:-1]:
            config = config.setdefault(k, {})
        config[keys[-1]] = value
        self.save_config()

class ConfigurableApplication(tk.Tk):
    def __init__(self):
        super().__init__()
        
        # Иницијализација конфигурације
        self.config_manager = ConfigManager("app_config.json")
        
        # Примена конфигурације прозора
        self.title(self.config_manager.get("window.title", "Апликација"))
        self.geometry(f"{self.config_manager.get('window.width', 800)}x{self.config_manager.get('window.height', 600)}")
        
        # Креирање и конфигурација виџета
        self.create_widgets()
        self.apply_theme()
        
    def create_widgets(self):
        # Креирање оквира за подешавања
        settings_frame = ttk.LabelFrame(self, text="Подешавања")
        settings_frame.pack(padx=10, pady=10, fill="x")
        
        # Избор теме
        ttk.Label(settings_frame, text="Тема:").pack(side="left", padx=5)
        theme_var = tk.StringVar(value=self.config_manager.get("window.theme"))
        theme_combo = ttk.Combobox(settings_frame, textvariable=theme_var, 
                                 values=["default", "clam", "alt", "classic"])
        theme_combo.pack(side="left", padx=5)
        theme_combo.bind("<<ComboboxSelected>>", lambda e: self.update_theme(theme_var.get()))
        
        # Избор величине фонта
        ttk.Label(settings_frame, text="Величина фонта:").pack(side="left", padx=5)
        font_size_var = tk.StringVar(value=str(self.config_manager.get("appearance.font_size")))
        font_size_spin = ttk.Spinbox(settings_frame, from_=8, to=24, width=5,
                                   textvariable=font_size_var)
        font_size_spin.pack(side="left", padx=5)
        font_size_spin.bind("<Return>", lambda e: self.update_font_size(int(font_size_var.get())))
        
        # Аутоматско чување toggle
        auto_save_var = tk.BooleanVar(value=self.config_manager.get("behavior.auto_save"))
        auto_save_check = ttk.Checkbutton(settings_frame, text="Ауто-чување",
                                        variable=auto_save_var,
                                        command=lambda: self.update_auto_save(auto_save_var.get()))
        auto_save_check.pack(side="left", padx=5)
        
        # Главни простор за садржај
        content_frame = ttk.Frame(self)
        content_frame.pack(padx=10, pady=10, fill="both", expand=True)
        
        # Текст едитор са конфигурисаним фонтом
        self.text_editor = tk.Text(content_frame)
        self.text_editor.pack(fill="both", expand=True)
        self.update_text_font()
        
    def apply_theme(self):
        """Примени тренутну тему конфигурације."""
        theme = self.config_manager.get("window.theme", "default")
        style = ttk.Style()
        style.theme_use(theme)
        
        # Примени прилагођене боје
        bg_color = self.config_manager.get("appearance.colors.background")
        fg_color = self.config_manager.get("appearance.colors.foreground")
        if bg_color and fg_color:
            self.configure(bg=bg_color)
            style.configure(".", background=bg_color, foreground=fg_color)
            
    def update_theme(self, theme: str):
        """Ажурирај тему апликације."""
        self.config_manager.set("window.theme", theme)
        self.apply_theme()
        
    def update_font_size(self, size: int):
        """Ажурирај величину фонта апликације."""
        self.config_manager.set("appearance.font_size", size)
        self.update_text_font()
        
    def update_text_font(self):
        """Ажурирај фонт текст едитора на основу конфигурације."""
        font_family = self.config_manager.get("appearance.font_family", "Arial")
        font_size = self.config_manager.get("appearance.font_size", 12)
        self.text_editor.configure(font=(font_family, font_size))
        
    def update_auto_save(self, enabled: bool):
        """Ажурирај конфигурацију аутоматског чувања."""
        self.config_manager.set("behavior.auto_save", enabled)
        if enabled:
            interval = self.config_manager.get("behavior.auto_save_interval", 300)
            self.after(interval * 1000, self.auto_save)
            
    def auto_save(self):
        """Изврши операцију аутоматског чувања."""
        if self.config_manager.get("behavior.auto_save"):
            print("Аутоматско чување садржаја...")
            # Имплементирајте своју логику чувања овде
            interval = self.config_manager.get("behavior.auto_save_interval", 300)
            self.after(interval * 1000, self.auto_save)

# Пример коришћења
if __name__ == "__main__":
    app = ConfigurableApplication()
    app.mainloop()
```

### Напредни Пример Конфигурације са Више Прозора
```python
class ConfigurableWindow:
    """Основна класа за прозоре који користе конфигурацију."""
    
    def __init__(self, config_manager: ConfigManager, window_key: str):
        self.config_manager = config_manager
        self.window_key = window_key
        
    def save_geometry(self, window: tk.Tk | tk.Toplevel):
        """Сачувај геометрију прозора у конфигурацију."""
        geometry = window.geometry()
        self.config_manager.set(f"{self.window_key}.geometry", geometry)
        
    def load_geometry(self, window: tk.Tk | tk.Toplevel):
        """Учитај геометрију прозора из конфигурације."""
        geometry = self.config_manager.get(f"{self.window_key}.geometry")
        if geometry:
            window.geometry(geometry)
            
class SettingsWindow(tk.Toplevel, ConfigurableWindow):
    def __init__(self, parent, config_manager: ConfigManager):
        tk.Toplevel.__init__(self, parent)
        ConfigurableWindow.__init__(self, config_manager, "settings_window")
        
        self.title("Подешавања")
        self.load_geometry(self)
        
        # Креирај интерфејс за подешавања
        self.create_widgets()
        
        # Сачувај геометрију при затварању прозора
        self.protocol("WM_DELETE_WINDOW", self.on_close)
        
    def create_widgets(self):
        # Креирај notebook за организована подешавања
        notebook = ttk.Notebook(self)
        notebook.pack(padx=10, pady=10, fill="both", expand=True)
        
        # Подешавања изгледа
        appearance_frame = ttk.Frame(notebook)
        notebook.add(appearance_frame, text="Изглед")
        
        # Подешавања теме
        theme_frame = ttk.LabelFrame(appearance_frame, text="Тема")
        theme_frame.pack(padx=5, pady=5, fill="x")
        
        ttk.Label(theme_frame, text="Шема боја:").grid(row=0, column=0, padx=5, pady=5)
        theme_var = tk.StringVar(value=self.config_manager.get("appearance.theme"))
        theme_combo = ttk.Combobox(theme_frame, textvariable=theme_var, 
                                 values=["светла", "тамна", "систем"])
        theme_combo.grid(row=0, column=1, padx=5, pady=5)
        theme_combo.bind("<<ComboboxSelected>>", 
                        lambda e: self.config_manager.set("appearance.theme", theme_var.get()))
        
        # Подешавања фонта
        font_frame = ttk.LabelFrame(appearance_frame, text="Фонт")
        font_frame.pack(padx=5, pady=5, fill="x")
        
        ttk.Label(font_frame, text="Фамилија:").grid(row=0, column=0, padx=5, pady=5)
        font_family_var = tk.StringVar(value=self.config_manager.get("appearance.font_family"))
        font_family_combo = ttk.Combobox(font_frame, textvariable=font_family_var,
                                       values=["Arial", "Helvetica", "Times New Roman"])
        font_family_combo.grid(row=0, column=1, padx=5, pady=5)
        font_family_combo.bind("<<ComboboxSelected>>",
                             lambda e: self.config_manager.set("appearance.font_family", 
                                                            font_family_var.get()))
        
        # Подешавања понашања
        behavior_frame = ttk.Frame(notebook)
        notebook.add(behavior_frame, text="Понашање")
        
        # Подешавања аутоматског чувања
        auto_save_frame = ttk.LabelFrame(behavior_frame, text="Аутоматско Чување")
        auto_save_frame.pack(padx=5, pady=5, fill="x")
        
        auto_save_var = tk.BooleanVar(value=self.config_manager.get("behavior.auto_save"))
        auto_save_check = ttk.Checkbutton(auto_save_frame, text="Омогући ауто-чување",
                                        variable=auto_save_var,
                                        command=lambda: self.config_manager.set(
                                            "behavior.auto_save", auto_save_var.get()))
        auto_save_check.pack(padx=5, pady=5)
        
        ttk.Label(auto_save_frame, text="Интервал (секунде):").pack(padx=5)
        interval_var = tk.StringVar(value=str(
            self.config_manager.get("behavior.auto_save_interval", 300)))
        interval_spin = ttk.Spinbox(auto_save_frame, from_=60, to=3600, width=10,
                                  textvariable=interval_var)
        interval_spin.pack(padx=5, pady=5)
        interval_spin.bind("<Return>", lambda e: self.config_manager.set(
            "behavior.auto_save_interval", int(interval_var.get())))
        
    def on_close(self):
        """Обради догађај затварања прозора."""
        self.save_geometry(self)
        self.destroy()

class MainApplication(tk.Tk, ConfigurableWindow):
    def __init__(self):
        tk.Tk.__init__(self)
        
        # Иницијализација конфигурације
        self.config_manager = ConfigManager("app_config.json")
        ConfigurableWindow.__init__(self, self.config_manager, "main_window")
        
        # Конфигуриши главни прозор
        self.title(self.config_manager.get("window.title", "Конфигурабилна Апликација"))
        self.load_geometry(self)
        
        # Креирај мени
        self.create_menu()
        
        # Креирај главни интерфејс
        self.create_widgets()
        
        # Сачувај геометрију при затварању прозора
        self.protocol("WM_DELETE_WINDOW", self.on_close)
        
    def create_menu(self):
        menubar = tk.Menu(self)
        self.config(menu=menubar)
        
        # Фајл мени
        file_menu = tk.Menu(menubar, tearoff=0)
        menubar.add_cascade(label="Фајл", menu=file_menu)
        file_menu.add_command(label="Нови", command=self.new_file)
        file_menu.add_command(label="Отвори", command=self.open_file)
        file_menu.add_command(label="Сачувај", command=self.save_file)
        file_menu.add_separator()
        file_menu.add_command(label="Излаз", command=self.on_close)
        
        # Уреди мени
        edit_menu = tk.Menu(menubar, tearoff=0)
        menubar.add_cascade(label="Уреди", menu=edit_menu)
        edit_menu.add_command(label="Подешавања", command=self.show_settings)
        
    def create_widgets(self):
        # Креирај главни простор за садржај
        self.text_editor = tk.Text(self)
        self.text_editor.pack(fill="both", expand=True)
        
        # Примени тренутна подешавања фонта
        self.update_text_font()
        
    def update_text_font(self):
        """Ажурирај фонт текст едитора на основу конфигурације."""
        family = self.config_manager.get("appearance.font_family", "Arial")
        size = self.config_manager.get("appearance.font_size", 12)
        self.text_editor.configure(font=(family, size))
        
    def show_settings(self):
        """Прикажи прозор са подешавањима."""
        SettingsWindow(self, self.config_manager)
        
    def new_file(self):
        """Креирај нови фајл."""
        if self.config_manager.get("behavior.confirm_action", True):
            if not messagebox.askyesno("Нови Фајл", "Креирати нови фајл? Несачуване промене ће бити изгубљене."):
                return
        self.text_editor.delete("1.0", tk.END)
        
    def open_file(self):
        """Отвори фајл."""
        file_path = filedialog.askopenfilename(
            filetypes=[("Текст фајлови", "*.txt"), ("Сви фајлови", "*.*")])
        if file_path:
            try:
                with open(file_path, 'r') as file:
                    content = file.read()
                self.text_editor.delete("1.0", tk.END)
                self.text_editor.insert("1.0", content)
            except Exception as e:
                messagebox.showerror("Грешка", f"Грешка при отварању фајла: {str(e)}")
                
    def save_file(self):
        """Сачувај тренутни фајл."""
        file_path = filedialog.asksaveasfilename(
            defaultextension=".txt",
            filetypes=[("Текст фајлови", "*.txt"), ("Сви фајлови", "*.*")])
        if file_path:
            try:
                content = self.text_editor.get("1.0", tk.END)
                with open(file_path, 'w') as file:
                    file.write(content)
            except Exception as e:
                messagebox.showerror("Грешка", f"Грешка при чувању фајла: {str(e)}")
                
    def on_close(self):
        """Обради затварање апликације."""
        if self.config_manager.get("behavior.confirm_exit", True):
            if not messagebox.askyesno("Излаз", "Да ли сте сигурни да желите да изађете?"):
                return
        self.save_geometry(self)
        self.quit()

if __name__ == "__main__":
    app = MainApplication()
    app.mainloop()

```

## Напредне JSON Конфигурационе Функције

```python
class AdvancedConfigManager(ConfigManager):
    def __init__(self, config_file: str):
        super().__init__(config_file)
        self._backup_file = f"{config_file}.backup"
        self._observers = []
        
    def add_observer(self, callback: Callable[[str, Any], None]):
        """Додај посматрача за промене конфигурације."""
        self._observers.append(callback)
        
    def remove_observer(self, callback: Callable[[str, Any], None]):
        """Уклони посматрача за промене конфигурације."""
        self._observers.remove(callback)
        
    def set(self, key: str, value: Any) -> None:
        """Постави вредност конфигурације и обавести посматраче."""
        super().set(key, value)
        for observer in self._observers:
            observer(key, value)
            
    def create_backup(self):
        """Креирај резервну копију тренутне конфигурације."""
        with open(self._backup_file, 'w') as f:
            json.dump(self.config, f, indent=4)
            
    def restore_from_backup(self):
        """Врати конфигурацију из резервне копије."""
        if os.path.exists(self._backup_file):
            with open(self._backup_file, 'r') as f:
                self.config = json.load(f)
            self.save_config()
            
    def import_config(self, file_path: str):
        """Увези конфигурацију из спољног фајла."""
        try:
            with open(file_path, 'r') as f:
                new_config = json.load(f)
            self.create_backup()  # Креирај резервну копију пре увоза
            self.config = new_config
            self.save_config()
            return True
        except Exception as e:
            print(f"Грешка при увозу конфигурације: {str(e)}")
            return False
            
    def export_config(self, file_path: str):
        """Извези тренутну конфигурацију у спољни фајл."""
        try:
            with open(file_path, 'w') as f:
                json.dump(self.config, f, indent=4)
            return True
        except Exception as e:
            print(f"Грешка при извозу конфигурације: {str(e)}")
            return False
            
    def merge_config(self, other_config: Dict[str, Any]):
        """Споји другу конфигурацију са тренутном."""
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
        """Ресетуј одређену секцију конфигурације."""
        default = self._create_default_config()
        if section in default:
            self.config[section] = default[section]
            self.save_config()
            
    def validate_config(self, schema: Dict[str, Any]) -> bool:
        """Валидирај конфигурацију према шеми."""
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

# Пример коришћења напредних функција
if __name__ == "__main__":
    # Шема за валидацију конфигурације
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
    
    # Креирај менаџер конфигурације
    config = AdvancedConfigManager("app_config.json")
    
    # Посматрач за промене конфигурације
    def config_changed(key: str, value: Any):
        print(f"Конфигурација промењена: {key} = {value}")
    
    config.add_observer(config_changed)
    
    # Валидирај конфигурацију
    if config.validate_config(config_schema):
        print("Конфигурација је валидна")
    else:
        print("Конфигурација није валидна")
    
    # Креирај и врати резервну копију
    config.create_backup()
    config.set("window.theme", "dark")
    config.restore_from_backup()
    
    # Извези и увези конфигурацију
    config.export_config("config_export.json")
    config.import_config("config_export.json")
    
    # Споји конфигурације
    other_config = {
        "appearance": {
            "colors": {
                "accent": "#ff0000"
            }
        }
    }
    config.merge_config(other_config)
    
    # Ресетуј секцију
    config.reset_section("appearance")
```

## Напредне Безбедносне Функције и Руковање Грешкама

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
        """Конфигурише систем за бележење."""
        logging.basicConfig(
            filename='config_manager.log',
            level=logging.INFO,
            format='%(asctime)s - %(levelname)s - %(message)s'
        )
        
    def _encrypt_data(self, data: str) -> str:
        """Шифрује податке користећи Fernet."""
        if self._fernet:
            return self._fernet.encrypt(data.encode()).decode()
        return data
        
    def _decrypt_data(self, data: str) -> str:
        """Дешифрује податке користећи Fernet."""
        if self._fernet:
            return self._fernet.decrypt(data.encode()).decode()
        return data
        
    def save_config(self) -> None:
        """Безбедно чува конфигурацију."""
        try:
            json_str = json.dumps(self.config, indent=4)
            encrypted_data = self._encrypt_data(json_str)
            
            with open(self._config_file, 'w') as f:
                f.write(encrypted_data)
                
            self._log_action("Конфигурација сачувана")
            self._create_audit_entry("save_config")
        except Exception as e:
            self._handle_error("Грешка при чувању конфигурације", e)
            
    def load_config(self) -> None:
        """Учитава шифровану конфигурацију."""
        try:
            if not os.path.exists(self._config_file):
                self.config = self._create_default_config()
                return
                
            with open(self._config_file, 'r') as f:
                encrypted_data = f.read()
                
            decrypted_data = self._decrypt_data(encrypted_data)
            self.config = json.loads(decrypted_data)
            
            self._log_action("Конфигурација учитана")
            self._create_audit_entry("load_config")
        except Exception as e:
            self._handle_error("Грешка при учитавању конфигурације", e)
            
    def _handle_error(self, message: str, error: Exception):
        """Рукује грешкама на јединствен начин."""
        error_details = f"{message}: {str(error)}"
        logging.error(error_details)
        self._create_audit_entry("error", error_details)
        raise ConfigError(error_details)
        
    def _create_audit_entry(self, action: str, details: str = ""):
        """Креира унос у дневнику ревизије."""
        entry = {
            "timestamp": datetime.datetime.now().isoformat(),
            "action": action,
            "details": details,
            "config_hash": self._calculate_config_hash()
        }
        self._audit_log.append(entry)
        
    def _calculate_config_hash(self) -> str:
        """Израчунава хеш тренутне конфигурације."""
        config_str = json.dumps(self.config, sort_keys=True)
        return hashlib.sha256(config_str.encode()).hexdigest()
        
    def get_audit_log(self) -> List[Dict]:
        """Враћа дневник ревизије."""
        return self._audit_log
        
    def validate_config_advanced(self, schema: Dict[str, Any]) -> List[str]:
        """Напредна валидација конфигурације са детаљним порукама о грешкама."""
        errors = []
        
        def validate_field(path: str, value: Any, schema_value: Any):
            if isinstance(schema_value, dict):
                if not isinstance(value, dict):
                    errors.append(f"Поље '{path}' мора бити објекат")
                    return
                for key, sub_schema in schema_value.items():
                    if key not in value:
                        errors.append(f"Обавезно поље '{path}.{key}' недостаје")
                    else:
                        validate_field(f"{path}.{key}", value[key], sub_schema)
            else:
                expected_type = schema_value
                if expected_type == "number":
                    if not isinstance(value, (int, float)):
                        errors.append(f"Поље '{path}' мора бити број")
                elif expected_type == "string":
                    if not isinstance(value, str):
                        errors.append(f"Поље '{path}' мора бити текст")
                elif expected_type == "boolean":
                    if not isinstance(value, bool):
                        errors.append(f"Поље '{path}' мора бити логичка вредност")
                        
        for key, schema_value in schema.items():
            if key not in self.config:
                errors.append(f"Обавезно поље '{key}' недостаје")
            else:
                validate_field(key, self.config[key], schema_value)
                
        return errors

class ConfigError(Exception):
    """Прилагођени изузетак за грешке у конфигурацији."""
    pass

# Пример коришћења напредних безбедносних функција
if __name__ == "__main__":
    # Генерисање кључа за шифровање
    encryption_key = Fernet.generate_key().decode()
    
    # Креирање безбедног менаџера конфигурације
    config = SecureConfigManager("secure_config.json", encryption_key)
    
    # Шема за напредну валидацију
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
        # Валидација конфигурације
        validation_errors = config.validate_config_advanced(advanced_schema)
        if validation_errors:
            print("Пронађене грешке при валидацији:")
            for error in validation_errors:
                print(f"- {error}")
        else:
            print("Конфигурација је валидна")
            
        # Постављање примера конфигурације
        config.set("window.position.x", 100)
        config.set("window.position.y", 200)
        config.set("security.auto_lock", True)
        config.set("security.lock_timeout", 300)
        
        # Чување конфигурације
        config.save_config()
        
        # Приказ дневника ревизије
        print("\nДневник ревизије:")
        for entry in config.get_audit_log():
            print(f"[{entry['timestamp']}] {entry['action']}: {entry['details']}")
            
    except ConfigError as e:
        print(f"Грешка у конфигурацији: {str(e)}")
    except Exception as e:
        print(f"Неочекивана грешка: {str(e)}")
```

### Пример Напредне Конфигурационе Апликације

```python
class SecureConfigurableApplication(tk.Tk):
    def __init__(self, encryption_key: str):
        super().__init__()
        
        self.config_manager = SecureConfigManager("secure_app_config.json", encryption_key)
        self.setup_ui()
        self.setup_security()
        
    def setup_ui(self):
        """Креира кориснички интерфејс."""
        self.title("Безбедна Конфигурациона Апликација")
        
        # Главни оквир
        main_frame = ttk.Frame(self, padding="10")
        main_frame.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))
        
        # Приказ конфигурације
        self.config_tree = ttk.Treeview(main_frame, columns=("Value",), show="tree")
        self.config_tree.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))
        
        # Клизач
        scrollbar = ttk.Scrollbar(main_frame, orient=tk.VERTICAL, command=self.config_tree.yview)
        scrollbar.grid(row=0, column=1, sticky=(tk.N, tk.S))
        self.config_tree.configure(yscrollcommand=scrollbar.set)
        
        # Дугмад
        button_frame = ttk.Frame(main_frame)
        button_frame.grid(row=1, column=0, columnspan=2, pady=10)
        
        ttk.Button(button_frame, text="Освежи", command=self.refresh_config_display).pack(side=tk.LEFT, padx=5)
        ttk.Button(button_frame, text="Извези", command=self.export_config).pack(side=tk.LEFT, padx=5)
        ttk.Button(button_frame, text="Дневник", command=self.show_audit_log).pack(side=tk.LEFT, padx=5)
        
    def setup_security(self):
        """Конфигурише безбедносне поставке."""
        self.protocol("WM_DELETE_WINDOW", self.secure_exit)
        self.bind("<Control-s>", lambda e: self.config_manager.save_config())
        
        # Тајмер за аутоматско закључавање
        self.last_activity = datetime.datetime.now()
        self.check_activity()
        
    def check_activity(self):
        """Проверава активност корисника за аутоматско закључавање."""
        if self.config_manager.get("security.auto_lock", False):
            timeout = self.config_manager.get("security.lock_timeout", 300)
            if (datetime.datetime.now() - self.last_activity).seconds > timeout:
                self.lock_application()
        self.after(1000, self.check_activity)
        
    def lock_application(self):
        """Закључава апликацију."""
        self.withdraw()
        dialog = tk.Toplevel(self)
        dialog.title("Апликација закључана")
        dialog.transient(self)
        dialog.grab_set()
        
        ttk.Label(dialog, text="Унесите лозинку:").pack(pady=10)
        password_var = tk.StringVar()
        password_entry = ttk.Entry(dialog, show="*", textvariable=password_var)
        password_entry.pack(pady=5)
        
        def unlock():
            if self.verify_password(password_var.get()):
                self.last_activity = datetime.datetime.now()
                dialog.destroy()
                self.deiconify()
            else:
                tk.messagebox.showerror("Грешка", "Погрешна лозинка")
                
        ttk.Button(dialog, text="Откључај", command=unlock).pack(pady=10)
        
    def verify_password(self, password: str) -> bool:
        """Проверава унету лозинку."""
        stored_hash = self.config_manager.get("security.password_hash", "")
        if not stored_hash:
            return True
        return hashlib.sha256(password.encode()).hexdigest() == stored_hash
        
    def refresh_config_display(self):
        """Освежава приказ конфигурације."""
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
        """Извози конфигурацију."""
        filename = tk.filedialog.asksaveasfilename(
            defaultextension=".json",
            filetypes=[("JSON фајлови", "*.json"), ("Сви фајлови", "*.*")]
        )
        if filename:
            try:
                self.config_manager.export_config(filename)
                tk.messagebox.showinfo("Успех", "Конфигурација успешно извезена")
            except Exception as e:
                tk.messagebox.showerror("Грешка", f"Грешка при извозу: {str(e)}")
                
    def show_audit_log(self):
        """Приказује дневник ревизије."""
        dialog = tk.Toplevel(self)
        dialog.title("Дневник Ревизије")
        dialog.transient(self)
        
        text = tk.Text(dialog, wrap=tk.WORD, width=60, height=20)
        text.pack(padx=10, pady=10)
        
        scrollbar = ttk.Scrollbar(dialog, orient=tk.VERTICAL, command=text.yview)
        scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
        text.configure(yscrollcommand=scrollbar.set)
        
        for entry in self.config_manager.get_audit_log():
            text.insert(tk.END, f"[{entry['timestamp']}] {entry['action']}\n")
            if entry['details']:
                text.insert(tk.END, f"Детаљи: {entry['details']}\n")
            text.insert(tk.END, f"Хеш: {entry['config_hash']}\n\n")
            
        text.configure(state=tk.DISABLED)
        
    def secure_exit(self):
        """Безбедно затварање апликације."""
        try:
            self.config_manager.save_config()
            self.quit()
        except Exception as e:
            tk.messagebox.showerror("Грешка", f"Грешка при чувању конфигурације: {str(e)}")

if __name__ == "__main__":
    # Генерисање кључа за шифровање
    encryption_key = Fernet.generate_key().decode()
    
    # Покретање апликације
    app = SecureConfigurableApplication(encryption_key)
    app.mainloop()
```

Ова напредна имплементација пружа:
1. Шифровано чување конфигурације
2. Аутоматску функцију закључавања при неактивности
3. Заштиту лозинком
4. Приказ дневника ревизије
5. Извоз конфигурације
6. Приказ конфигурације у облику стабла
7. Безбедно затварање апликације
