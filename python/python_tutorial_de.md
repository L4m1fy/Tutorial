# Python Programmier-Tutorial

## Inhaltsverzeichnis
1. [Einführung](#einführung)
2. [Grundlegende Konzepte](#grundlegende-konzepte)
3. [Datentypen](#datentypen)
4. [Kontrollstrukturen](#kontrollstrukturen)
5. [Funktionen](#funktionen)
6. [Objektorientierte Programmierung](#objektorientierte-programmierung)
7. [Module und Pakete](#module-und-pakete)
8. [Dateiverwaltung](#dateiverwaltung)
9. [Fehlerbehandlung](#fehlerbehandlung)
10. [Fortgeschrittene Themen](#fortgeschrittene-themen)
11. [Moderne Python-Entwicklung](#moderne-python-entwicklung)
12. [Web-Entwicklung mit FastAPI](#web-entwicklung-mit-fastapi)
13. [Data Science und Maschinelles Lernen](#data-science-und-maschinelles-lernen)
14. [Testen und Qualitätssicherung](#testen-und-qualitätssicherung)
15. [Beste Praktiken und Entwurfsmuster](#beste-praktiken-und-entwurfsmuster)
16. [Sicherheits-Best-Practices](#sicherheits-best-practices)
17. [Projektstruktur und Organisation](#projektstruktur-und-organisation)

## Einführung
Python ist eine interpretierte Hochsprache, die für ihre Einfachheit und Lesbarkeit bekannt ist. Dieses Tutorial führt Sie durch alle wesentlichen Konzepte der Python-Programmierung.

### Python einrichten
1. Python von [python.org](https://python.org) herunterladen
2. Python mit aktivierter PATH-Option installieren
3. Installation überprüfen: `python --version`

## Grundlegende Konzepte

### Variablen und Zuweisungen
```python
name = "John"      # String (Zeichenkette)
alter = 25        # Integer (Ganzzahl)
groesse = 1.75    # Float (Fließkommazahl)
ist_student = True # Boolean (Wahrheitswert)
```

### Grundlegende Operationen
```python
# Arithmetische Operationen
summe = 10 + 5
differenz = 10 - 5
produkt = 10 * 5
quotient = 10 / 5
potenz = 2 ** 3
rest = 10 % 3

# String-Operationen
vorname = "John"
nachname = "Doe"
vollname = vorname + " " + nachname
```

## Datentypen

### Zahlen
```python
# Ganzzahl
x = 5
# Fließkommazahl
y = 3.14
# Komplexe Zahl
z = 2 + 3j
```

### Zeichenketten (Strings)
```python
# String-Erstellung
text = "Hallo, Welt!"
mehrzeilig = """Dies ist ein
mehrzeiliger String"""

# String-Methoden
grossbuchstaben = text.upper()
kleinbuchstaben = text.lower()
laenge = len(text)
```

### Listen
```python
# Listen-Erstellung
fruechte = ["Apfel", "Banane", "Orange"]

# Listen-Operationen
fruechte.append("Weintraube")
fruechte.remove("Banane")
erste_frucht = fruechte[0]
```

### Wörterbücher (Dictionaries)
```python
# Dictionary-Erstellung
person = {
    "name": "John",
    "alter": 25,
    "stadt": "Berlin"
}

# Dictionary-Operationen
person["email"] = "john@beispiel.de"
alter = person.get("alter")
```

## Kontrollstrukturen

### If-Anweisungen
```python
alter = 18

if alter >= 18:
    print("Erwachsener")
elif alter >= 13:
    print("Teenager")
else:
    print("Kind")
```

### Schleifen
```python
# For-Schleife
for i in range(5):
    print(i)

# While-Schleife
zaehler = 0
while zaehler < 5:
    print(zaehler)
    zaehler += 1
```

## Funktionen

### Einfache Funktionen
```python
def begruessen(name):
    return f"Hallo, {name}!"

# Funktionsaufruf
nachricht = begruessen("John")
```

### Lambda-Funktionen
```python
quadrat = lambda x: x ** 2
ergebnis = quadrat(5)  # Gibt 25 zurück
```

## Objektorientierte Programmierung

### Klassen und Objekte
```python
class Person:
    def __init__(self, name, alter):
        self.name = name
        self.alter = alter
    
    def vorstellen(self):
        return f"Ich bin {self.name}, {self.alter} Jahre alt"

# Objekt erstellen
person = Person("John", 25)
vorstellung = person.vorstellen()
```

### Vererbung
```python
class Student(Person):
    def __init__(self, name, alter, matrikelnummer):
        super().__init__(name, alter)
        self.matrikelnummer = matrikelnummer
    
    def lernen(self):
        return f"{self.name} lernt gerade"
```

## Module und Pakete

### Eingebaute Module verwenden
```python
import math
import random

# Mathematische Operationen
wurzel = math.sqrt(16)
zufallszahl = random.randint(1, 10)
```

### Eigene Module erstellen
```python
# meinmodul.py
def eigene_funktion():
    return "Hallo aus eigenem Modul!"

# main.py
import meinmodul
ergebnis = meinmodul.eigene_funktion()
```

## Dateiverwaltung

### Dateien lesen und schreiben
```python
# In Datei schreiben
with open("beispiel.txt", "w") as datei:
    datei.write("Hallo, Welt!")

# Aus Datei lesen
with open("beispiel.txt", "r") as datei:
    inhalt = datei.read()
```

## Fehlerbehandlung

### Try-Except-Blöcke
```python
try:
    ergebnis = 10 / 0
except ZeroDivisionError:
    print("Division durch Null nicht möglich!")
except Exception as e:
    print(f"Ein Fehler ist aufgetreten: {e}")
finally:
    print("Dies wird immer ausgeführt")
```

## Fortgeschrittene Themen

### Dekoratoren
```python
def mein_dekorator(func):
    def wrapper():
        print("Vor der Funktion")
        func()
        print("Nach der Funktion")
    return wrapper

@mein_dekorator
def sage_hallo():
    print("Hallo!")
```

### Generatoren
```python
def zahlen_generator(n):
    for i in range(n):
        yield i

# Generator verwenden
gen = zahlen_generator(5)
for num in gen:
    print(num)
```

### Kontextmanager
```python
class MeinKontextManager:
    def __enter__(self):
        print("Kontext betreten")
        return self
    
    def __exit__(self, exc_type, exc_value, traceback):
        print("Kontext verlassen")

# Kontextmanager verwenden
with MeinKontextManager():
    print("Innerhalb des Kontexts")
```

### List Comprehensions
```python
# Listen-Comprehension
quadrate = [x**2 for x in range(10)]

# Dictionary-Comprehension
quadrat_dict = {x: x**2 for x in range(5)}
```

## Moderne Python-Entwicklung

### Typ-Hinweise und Statische Typprüfung
```python
from typing import List, Dict, Optional, Union, Callable

def verarbeite_daten(elemente: List[int]) -> Dict[str, float]:
    ergebnis: Dict[str, float] = {}
    summe: float = sum(elemente)
    ergebnis["summe"] = summe
    ergebnis["durchschnitt"] = summe / len(elemente)
    return ergebnis

# Optional und Union Typen
def finde_benutzer(benutzer_id: int) -> Optional[Dict[str, Union[str, int]]]:
    # Könnte None zurückgeben, wenn Benutzer nicht gefunden
    return {"name": "Hans", "alter": 30} if benutzer_id > 0 else None

# Typ-Aliase
BenutzerDaten = Dict[str, Union[str, int]]
VerarbeitungsFunktion = Callable[[List[int]], float]
```

### Moderne Python-Funktionen (3.10+)
```python
# Muster-Abgleich (Python 3.10+)
def analysiere_daten(daten):
    match daten:
        case {"typ": "benutzer", "name": str(name), "alter": int(alter)}:
            return f"Benutzer {name} ist {alter} Jahre alt"
        case {"typ": "produkt", "name": str(name), "preis": float(preis)}:
            return f"Produkt {name} kostet {preis:.2f}€"
        case _:
            return "Unbekanntes Datenformat"

# Union-Typen mit |
def verarbeite_wert(wert: int | float | str) -> str:
    return str(wert)

# Verbesserte Fehlermeldungen
try:
    ergebnis = 1 / 0
except ZeroDivisionError as e:
    print(f"Fehlerdetails: {e.__class__.__name__}: {e}")
```

### Asynchrone Programmierung
```python
import asyncio
from aiohttp import ClientSession

async def hole_daten(url: str) -> dict:
    async with ClientSession() as session:
        async with session.get(url) as antwort:
            return await antwort.json()

async def verarbeite_mehrere_urls(urls: List[str]) -> List[dict]:
    aufgaben = [hole_daten(url) for url in urls]
    return await asyncio.gather(*aufgaben)

# Verwendung von asyncio
async def hauptprogramm():
    urls = [
        "https://api.beispiel.de/daten1",
        "https://api.beispiel.de/daten2"
    ]
    ergebnisse = await verarbeite_mehrere_urls(urls)
    for ergebnis in ergebnisse:
        print(ergebnis)

if __name__ == "__main__":
    asyncio.run(hauptprogramm())
```

## Web-Entwicklung mit FastAPI

### Grundlegende API-Einrichtung
```python
from fastapi import FastAPI, HTTPException, Depends
from pydantic import BaseModel
from typing import List, Optional

app = FastAPI()

class Benutzer(BaseModel):
    id: int
    name: str
    email: str
    alter: Optional[int] = None

benutzer: List[Benutzer] = []

@app.post("/benutzer/", response_model=Benutzer)
async def erstelle_benutzer(benutzer: Benutzer):
    benutzer.append(benutzer)
    return benutzer

@app.get("/benutzer/{benutzer_id}", response_model=Benutzer)
async def hole_benutzer(benutzer_id: int):
    if benutzer := next((b for b in benutzer if b.id == benutzer_id), None):
        return benutzer
    raise HTTPException(status_code=404, detail="Benutzer nicht gefunden")
```

### Abhängigkeitsinjektion
```python
from fastapi import Depends
from sqlalchemy.orm import Session

def hole_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/benutzer/{benutzer_id}")
async def hole_benutzer(benutzer_id: int, db: Session = Depends(hole_db)):
    if benutzer := db.query(BenutzerModel).filter(BenutzerModel.id == benutzer_id).first():
        return benutzer
    raise HTTPException(status_code=404, detail="Benutzer nicht gefunden")
```

## Data Science und Maschinelles Lernen

### Datenanalyse mit Pandas
```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Daten laden und grundlegende Analyse
def analysiere_datensatz(dateipfad: str) -> pd.DataFrame:
    df = pd.read_csv(dateipfad)
    
    # Grundlegende Statistiken
    print("Datensatz-Info:")
    print(df.info())
    print("\nStatistiken numerischer Spalten:")
    print(df.describe())
    
    # Fehlende Werte behandeln
    df = df.fillna(df.mean(numeric_only=True))
    
    # Feature-Engineering
    df['jahr'] = pd.to_datetime(df['datum']).dt.year
    df['monat'] = pd.to_datetime(df['datum']).dt.month
    
    return df

# Datenvisualisierung
def visualisiere_daten(df: pd.DataFrame, zielspalte: str):
    plt.figure(figsize=(12, 6))
    
    # Verteilungsdiagramm
    sns.histplot(data=df, x=zielspalte, kde=True)
    plt.title(f'Verteilung von {zielspalte}')
    plt.show()
    
    # Korrelationsmatrix
    plt.figure(figsize=(10, 8))
    sns.heatmap(df.corr(), annot=True, cmap='coolwarm')
    plt.title('Korrelationsmatrix')
    plt.show()
```

### Maschinelles Lernen mit Scikit-learn
```python
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import classification_report

def trainiere_modell(df: pd.DataFrame, zielspalte: str):
    # Daten vorbereiten
    X = df.drop(columns=[zielspalte])
    y = df[zielspalte]
    
    # Datensatz aufteilen
    X_train, X_test, y_train, y_test = train_test_split(
        X, y, test_size=0.2, random_state=42
    )
    
    # Merkmale skalieren
    scaler = StandardScaler()
    X_train_skaliert = scaler.fit_transform(X_train)
    X_test_skaliert = scaler.transform(X_test)
    
    # Modell trainieren
    modell = RandomForestClassifier(n_estimators=100, random_state=42)
    modell.fit(X_train_skaliert, y_train)
    
    # Modell auswerten
    y_pred = modell.predict(X_test_skaliert)
    print("\nModellleistung:")
    print(classification_report(y_test, y_pred))
    
    return modell, scaler
```

## Testen und Qualitätssicherung

### Unit-Tests mit pytest
```python
import pytest
from typing import List

def berechne_statistiken(zahlen: List[float]) -> dict:
    if not zahlen:
        raise ValueError("Liste darf nicht leer sein")
    return {
        "mittelwert": sum(zahlen) / len(zahlen),
        "minimum": min(zahlen),
        "maximum": max(zahlen)
    }

class TestBerechnungen:
    def test_grundlegende_statistiken(self):
        zahlen = [1.0, 2.0, 3.0, 4.0, 5.0]
        ergebnis = berechne_statistiken(zahlen)
        assert ergebnis["mittelwert"] == 3.0
        assert ergebnis["minimum"] == 1.0
        assert ergebnis["maximum"] == 5.0
    
    def test_leere_liste(self):
        with pytest.raises(ValueError):
            berechne_statistiken([])
    
    @pytest.mark.parametrize("eingabe_liste,erwarteter_mittelwert", [
        ([1, 2, 3], 2.0),
        ([0, 0, 0], 0.0),
        ([1, -1], 0.0)
    ])
    def test_mittelwert_berechnungen(self, eingabe_liste, erwarteter_mittelwert):
        ergebnis = berechne_statistiken(eingabe_liste)
        assert ergebnis["mittelwert"] == erwarteter_mittelwert
```

### Integrationstests
```python
import pytest
from fastapi.testclient import TestClient
from ihre_app import app

client = TestClient(app)

def test_erstelle_benutzer():
    antwort = client.post(
        "/benutzer/",
        json={"id": 1, "name": "Test Benutzer", "email": "test@beispiel.de"}
    )
    assert antwort.status_code == 200
    assert antwort.json()["name"] == "Test Benutzer"

def test_hole_benutzer():
    # Zuerst einen Benutzer erstellen
    client.post(
        "/benutzer/",
        json={"id": 1, "name": "Test Benutzer", "email": "test@beispiel.de"}
    )
    
    # Dann den Benutzer abrufen
    antwort = client.get("/benutzer/1")
    assert antwort.status_code == 200
    assert antwort.json()["name"] == "Test Benutzer"
```

## Beste Praktiken und Entwurfsmuster

### Clean Code Prinzipien
```python
# Schlechtes Beispiel
def b(d):
    return d['x'] * d['y']

# Gutes Beispiel
def berechne_flaeche(dimensionen: dict) -> float:
    """Berechnet die Fläche eines Rechtecks.
    
    Args:
        dimensionen: Dictionary mit 'breite' und 'hoehe' Schlüsseln
    
    Returns:
        Die Fläche des Rechtecks
    """
    return dimensionen['breite'] * dimensionen['hoehe']

# Schlechtes Beispiel
l = []
for i in range(10):
    if i % 2 == 0:
        l.append(i)

# Gutes Beispiel
gerade_zahlen = [zahl for zahl in range(10) if zahl % 2 == 0]
```

### Entwurfsmuster
```python
# Singleton-Muster
class DatenbankVerbindung:
    _instanz = None
    
    def __new__(cls):
        if cls._instanz is None:
            cls._instanz = super().__new__(cls)
            cls._instanz.initialisiere()
        return cls._instanz
    
    def initialisiere(self):
        self.host = "localhost"
        self.port = 5432
        self.verbunden = False

# Fabrik-Muster
from abc import ABC, abstractmethod

class Tier(ABC):
    @abstractmethod
    def sprechen(self) -> str:
        pass

class Hund(Tier):
    def sprechen(self) -> str:
        return "Wuff!"

class Katze(Tier):
    def sprechen(self) -> str:
        return "Miau!"

class TierFabrik:
    @staticmethod
    def erstelle_tier(tier_typ: str) -> Tier:
        if tier_typ.lower() == "hund":
            return Hund()
        elif tier_typ.lower() == "katze":
            return Katze()
        raise ValueError(f"Unbekannter Tiertyp: {tier_typ}")
```

### Leistungsoptimierung
```python
from functools import lru_cache
import time

# Memoization für aufwändige Berechnungen
@lru_cache(maxsize=128)
def fibonacci(n: int) -> int:
    if n < 2:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

# Kontextmanager für Ressourcenverwaltung
class Zeitmessung:
    def __enter__(self):
        self.start = time.time()
        return self
    
    def __exit__(self, *args):
        self.ende = time.time()
        self.dauer = self.ende - self.start

# Verwendungsbeispiel
def verarbeite_grossen_datensatz(daten: List[int]) -> List[int]:
    with Zeitmessung() as zeitmessung:
        ergebnis = [fibonacci(n) for n in daten]
    print(f"Verarbeitung dauerte {zeitmessung.dauer:.2f} Sekunden")
    return ergebnis
```

## Sicherheits-Best-Practices

### Sichere Passwortverwaltung
```python
import hashlib
import os
from typing import Tuple

def hash_passwort(passwort: str) -> Tuple[bytes, bytes]:
    """Hasht ein Passwort mit einem zufälligen Salt unter Verwendung von SHA-256."""
    salt = os.urandom(32)
    hash_obj = hashlib.pbkdf2_hmac(
        'sha256',
        passwort.encode('utf-8'),
        salt,
        100000
    )
    return hash_obj, salt

def verifiziere_passwort(passwort: str, hash_obj: bytes, salt: bytes) -> bool:
    """Überprüft ein Passwort gegen seinen Hash."""
    neuer_hash = hashlib.pbkdf2_hmac(
        'sha256',
        passwort.encode('utf-8'),
        salt,
        100000
    )
    return hash_obj == neuer_hash
```

### Eingabevalidierung
```python
from pydantic import BaseModel, EmailStr, constr, validator
from datetime import date

class BenutzerRegistrierung(BaseModel):
    benutzername: constr(min_length=3, max_length=50)
    email: EmailStr
    passwort: constr(min_length=8)
    geburtsdatum: date
    
    @validator('geburtsdatum')
    def validiere_alter(cls, v):
        heute = date.today()
        alter = heute.year - v.year
        if alter < 18:
            raise ValueError('Muss mindestens 18 Jahre alt sein')
        return v
    
    @validator('passwort')
    def validiere_passwort_staerke(cls, v):
        if not any(c.isupper() for c in v):
            raise ValueError('Passwort muss mindestens einen Großbuchstaben enthalten')
        if not any(c.islower() for c in v):
            raise ValueError('Passwort muss mindestens einen Kleinbuchstaben enthalten')
        if not any(c.isdigit() for c in v):
            raise ValueError('Passwort muss mindestens eine Zahl enthalten')
        return v
```

## Projektstruktur und Organisation

### Moderne Projektstruktur
```plaintext
mein_projekt/
├── src/
│   ├── __init__.py
│   ├── main.py
│   ├── config.py
│   ├── api/
│   │   ├── __init__.py
│   │   ├── routen.py
│   │   └── abhaengigkeiten.py
│   ├── modelle/
│   │   ├── __init__.py
│   │   ├── benutzer.py
│   │   └── produkt.py
│   ├── services/
│   │   ├── __init__.py
│   │   └── geschaeftslogik.py
│   └── utils/
│       ├── __init__.py
│       └── helfer.py
├── tests/
│   ├── __init__.py
│   ├── test_api.py
│   └── test_services.py
├── docs/
│   ├── api.md
│   └── einrichtung.md
├── requirements.txt
├── setup.py
└── README.md
```

### Konfigurationsverwaltung
```python
from pydantic import BaseSettings
from functools import lru_cache

class Einstellungen(BaseSettings):
    app_name: str = "MeineApp"
    datenbank_url: str
    api_schluessel: str
    debug: bool = False
    
    class Config:
        env_file = ".env"

@lru_cache()
def hole_einstellungen() -> Einstellungen:
    return Einstellungen()

# Verwendung
einstellungen = hole_einstellungen()
print(f"Verbinde mit: {einstellungen.datenbank_url}")
```

Damit ist das umfassende Python-Tutorial mit modernen Funktionen, Best Practices und praktischen Beispielen für verschiedene Anwendungsfälle abgeschlossen.
