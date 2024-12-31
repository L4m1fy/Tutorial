# Python Programiranje Tutorial

## Sadržaj
1. [Uvod](#uvod)
2. [Osnovni Koncepti](#osnovni-koncepti)
3. [Tipovi Podataka](#tipovi-podataka)
4. [Kontrolne Strukture](#kontrolne-strukture)
5. [Funkcije](#funkcije)
6. [Objektno Orijentirano Programiranje](#objektno-orijentirano-programiranje)
7. [Moduli i Paketi](#moduli-i-paketi)
8. [Rad sa Datotekama](#rad-sa-datotekama)
9. [Rukovanje Greškama](#rukovanje-greskama)
10. [Napredne Teme](#napredne-teme)
11. [Moderno Python Programiranje](#moderno-python-programiranje)
12. [Web Razvoj sa FastAPI](#web-razvoj-sa-fastapi)
13. [Data Science i Mašinsko Učenje](#data-science-i-masinsko-ucenje)
14. [Testiranje i Osiguranje Kvaliteta](#testiranje-i-osiguranje-kvaliteta)
15. [Najbolje Prakse i Dizajn Paterni](#najbolje-prakse-i-dizajn-paterni)
16. [Najbolje Prakse za Sigurnost](#najbolje-prakse-za-sigurnost)
17. [Struktura Projekta i Organizacija](#struktura-projekta-i-organizacija)

## Uvod
Python je programski jezik visokog nivoa poznat po svojoj jednostavnosti i čitljivosti. Ovaj tutorial će vas voditi kroz sve osnovne koncepte Python programiranja.

### Postavljanje Pythona
1. Preuzmite Python sa [python.org](https://python.org)
2. Instalirajte Python sa omogućenom PATH opcijom
3. Provjerite instalaciju: `python --version`

## Osnovni Koncepti

### Varijable i Dodjeljivanje
```python
ime = "John"      # String (tekst)
godine = 25      # Integer (cijeli broj)
visina = 1.75    # Float (decimalni broj)
je_student = True # Boolean (logička vrijednost)
```

### Osnovne Operacije
```python
# Aritmetičke operacije
zbir = 10 + 5
razlika = 10 - 5
proizvod = 10 * 5
kolicnik = 10 / 5
stepen = 2 ** 3
ostatak = 10 % 3

# Operacije sa stringovima
ime = "John"
prezime = "Doe"
puno_ime = ime + " " + prezime
```

## Tipovi Podataka

### Brojevi
```python
# Cijeli broj
x = 5
# Decimalni broj
y = 3.14
# Kompleksni broj
z = 2 + 3j
```

### Stringovi
```python
# Kreiranje stringa
tekst = "Zdravo, Svijete!"
vise_linija = """Ovo je tekst
u više linija"""

# String metode
velika_slova = tekst.upper()
mala_slova = tekst.lower()
duzina = len(tekst)
```

### Liste
```python
# Kreiranje liste
voce = ["jabuka", "banana", "narandža"]

# Operacije sa listama
voce.append("grožđe")
voce.remove("banana")
prvo_voce = voce[0]
```

### Rječnici (Dictionaries)
```python
# Kreiranje rječnika
osoba = {
    "ime": "John",
    "godine": 25,
    "grad": "Sarajevo"
}

# Operacije sa rječnicima
osoba["email"] = "john@primjer.ba"
godine = osoba.get("godine")
```

## Kontrolne Strukture

### If Izjave
```python
godine = 18

if godine >= 18:
    print("Punoljetan")
elif godine >= 13:
    print("Tinejdžer")
else:
    print("Dijete")
```

### Petlje
```python
# For petlja
for i in range(5):
    print(i)

# While petlja
brojac = 0
while brojac < 5:
    print(brojac)
    brojac += 1
```

## Funkcije

### Osnovne Funkcije
```python
def pozdravi(ime):
    return f"Zdravo, {ime}!"

# Poziv funkcije
poruka = pozdravi("John")
```

### Lambda Funkcije
```python
kvadrat = lambda x: x ** 2
rezultat = kvadrat(5)  # Vraća 25
```

## Objektno Orijentirano Programiranje

### Klase i Objekti
```python
class Osoba:
    def __init__(self, ime, godine):
        self.ime = ime
        self.godine = godine
    
    def predstavi_se(self):
        return f"Ja sam {self.ime}, imam {self.godine} godina"

# Kreiranje objekta
osoba = Osoba("John", 25)
predstavljanje = osoba.predstavi_se()
```

### Nasljeđivanje
```python
class Student(Osoba):
    def __init__(self, ime, godine, broj_indeksa):
        super().__init__(ime, godine)
        self.broj_indeksa = broj_indeksa
    
    def uci(self):
        return f"{self.ime} uči"
```

## Moduli i Paketi

### Korištenje Ugrađenih Modula
```python
import math
import random

# Matematičke operacije
korijen = math.sqrt(16)
slucajan_broj = random.randint(1, 10)
```

### Kreiranje Vlastitih Modula
```python
# moj_modul.py
def vlastita_funkcija():
    return "Pozdrav iz vlastitog modula!"

# main.py
import moj_modul
rezultat = moj_modul.vlastita_funkcija()
```

## Rad sa Datotekama

### Čitanje i Pisanje Datoteka
```python
# Pisanje u datoteku
with open("primjer.txt", "w") as datoteka:
    datoteka.write("Zdravo, Svijete!")

# Čitanje iz datoteke
with open("primjer.txt", "r") as datoteka:
    sadrzaj = datoteka.read()
```

## Rukovanje Greškama

### Try-Except Blokovi
```python
try:
    rezultat = 10 / 0
except ZeroDivisionError:
    print("Nije moguće dijeliti sa nulom!")
except Exception as e:
    print(f"Došlo je do greške: {e}")
finally:
    print("Ovo se uvijek izvršava")
```

## Napredne Teme

### Dekoratori
```python
def moj_dekorator(func):
    def wrapper():
        print("Prije funkcije")
        func()
        print("Nakon funkcije")
    return wrapper

@moj_dekorator
def reci_zdravo():
    print("Zdravo!")
```

### Generatori
```python
def generator_brojeva(n):
    for i in range(n):
        yield i

# Korištenje generatora
gen = generator_brojeva(5)
for broj in gen:
    print(broj)
```

### Upravljanje Kontekstom
```python
class MojKontekstMenadzer:
    def __enter__(self):
        print("Ulazak u kontekst")
        return self
    
    def __exit__(self, exc_type, exc_value, traceback):
        print("Izlazak iz konteksta")

# Korištenje kontekst menadžera
with MojKontekstMenadzer():
    print("Unutar konteksta")
```

### List Comprehensions
```python
# List comprehension
kvadrati = [x**2 for x in range(10)]

# Dictionary comprehension
rjecnik_kvadrata = {x: x**2 for x in range(5)}
```

## Najbolje Prakse

1. Pratite PEP 8 stil pisanja koda
2. Koristite smislena imena varijabli
3. Pišite docstrings za funkcije i klase
4. Držite funkcije malim i fokusiranim
5. Koristite type hints za bolju čitljivost
6. Pravilno rukujte greškama
7. Pišite unit testove za svoj kod

## Dodatni Resursi

1. [Službena Python Dokumentacija](https://docs.python.org)
2. [Python Package Index (PyPI)](https://pypi.org)
3. [Python Zajednica BiH](https://pythonba.com)
4. [Python Tutorijali na Bosanskom](https://tutorijaliba.com/python)

## Projekti za Vježbu

1. Napravite jednostavan kalkulator
2. Izgradite aplikaciju za to-do listu
3. Implementirajte jednostavan web scraper
4. Napravite organizator datoteka
5. Izgradite jednostavnu igru (npr. Iks-Oks)

Ne zaboravite redovno vježbati i raditi na stvarnim projektima kako biste poboljšali svoje Python programerske vještine!

## Moderno Python Programiranje

### Tipiziranje i Statička Provjera Tipova
```python
from typing import List, Dict, Optional, Union, Callable

def obradi_podatke(elementi: List[int]) -> Dict[str, float]:
    rezultat: Dict[str, float] = {}
    zbir: float = sum(elementi)
    rezultat["zbir"] = zbir
    rezultat["prosjek"] = zbir / len(elementi)
    return rezultat

# Optional i Union tipovi
def pronadi_korisnika(id_korisnika: int) -> Optional[Dict[str, Union[str, int]]]:
    # Može vratiti None ako korisnik nije pronađen
    return {"ime": "Amir", "godine": 30} if id_korisnika > 0 else None

# Alijasi tipova
KorisnickiPodaci = Dict[str, Union[str, int]]
FunkcijaObrade = Callable[[List[int]], float]
```

### Moderne Python Funkcije (3.10+)
```python
# Pattern matching (Python 3.10+)
def analiziraj_podatke(podaci):
    match podaci:
        case {"tip": "korisnik", "ime": str(ime), "godine": int(godine)}:
            return f"Korisnik {ime} ima {godine} godina"
        case {"tip": "proizvod", "ime": str(ime), "cijena": float(cijena)}:
            return f"Proizvod {ime} košta {cijena:.2f} KM"
        case _:
            return "Nepoznat format podataka"

# Union tipovi sa |
def obradi_vrijednost(vrijednost: int | float | str) -> str:
    return str(vrijednost)

# Poboljšane poruke o greškama
try:
    rezultat = 1 / 0
except ZeroDivisionError as e:
    print(f"Detalji greške: {e.__class__.__name__}: {e}")
```

### Asinhrono Programiranje
```python
import asyncio
from aiohttp import ClientSession

async def preuzmi_podatke(url: str) -> dict:
    async with ClientSession() as sesija:
        async with sesija.get(url) as odgovor:
            return await odgovor.json()

async def obradi_vise_url(urls: List[str]) -> List[dict]:
    zadaci = [preuzmi_podatke(url) for url in urls]
    return await asyncio.gather(*zadaci)

# Korištenje asyncio
async def glavni_program():
    urls = [
        "https://api.primjer.ba/podaci1",
        "https://api.primjer.ba/podaci2"
    ]
    rezultati = await obradi_vise_url(urls)
    for rezultat in rezultati:
        print(rezultat)

if __name__ == "__main__":
    asyncio.run(glavni_program())
```

## Web Razvoj sa FastAPI

### Osnovno API Podešavanje
```python
from fastapi import FastAPI, HTTPException, Depends
from pydantic import BaseModel
from typing import List, Optional

app = FastAPI()

class Korisnik(BaseModel):
    id: int
    ime: str
    email: str
    godine: Optional[int] = None

korisnici: List[Korisnik] = []

@app.post("/korisnici/", response_model=Korisnik)
async def kreiraj_korisnika(korisnik: Korisnik):
    korisnici.append(korisnik)
    return korisnik

@app.get("/korisnici/{id_korisnika}", response_model=Korisnik)
async def preuzmi_korisnika(id_korisnika: int):
    if korisnik := next((k for k in korisnici if k.id == id_korisnika), None):
        return korisnik
    raise HTTPException(status_code=404, detail="Korisnik nije pronađen")
```

### Injekcija Zavisnosti
```python
from fastapi import Depends
from sqlalchemy.orm import Session

def preuzmi_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/korisnici/{id_korisnika}")
async def preuzmi_korisnika(id_korisnika: int, db: Session = Depends(preuzmi_db)):
    if korisnik := db.query(KorisnikModel).filter(KorisnikModel.id == id_korisnika).first():
        return korisnik
    raise HTTPException(status_code=404, detail="Korisnik nije pronađen")
```

## Data Science i Mašinsko Učenje

### Analiza Podataka sa Pandas
```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Učitavanje i osnovna analiza podataka
def analiziraj_dataset(putanja_fajla: str) -> pd.DataFrame:
    df = pd.read_csv(putanja_fajla)
    
    # Osnovne statistike
    print("Informacije o datasetu:")
    print(df.info())
    print("\nStatistike numeričkih kolona:")
    print(df.describe())
    
    # Obrada nedostajućih vrijednosti
    df = df.fillna(df.mean(numeric_only=True))
    
    # Inženjering karakteristika
    df['godina'] = pd.to_datetime(df['datum']).dt.year
    df['mjesec'] = pd.to_datetime(df['datum']).dt.month
    
    return df

# Vizualizacija podataka
def vizualiziraj_podatke(df: pd.DataFrame, ciljna_kolona: str):
    plt.figure(figsize=(12, 6))
    
    # Distribucioni plot
    sns.histplot(data=df, x=ciljna_kolona, kde=True)
    plt.title(f'Distribucija {ciljna_kolona}')
    plt.show()
    
    # Korelaciona matrica
    plt.figure(figsize=(10, 8))
    sns.heatmap(df.corr(), annot=True, cmap='coolwarm')
    plt.title('Korelaciona Matrica')
    plt.show()
```

### Mašinsko Učenje sa Scikit-learn
```python
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import classification_report

def treniraj_model(df: pd.DataFrame, ciljna_kolona: str):
    # Priprema podataka
    X = df.drop(columns=[ciljna_kolona])
    y = df[ciljna_kolona]
    
    # Podjela dataseta
    X_train, X_test, y_train, y_test = train_test_split(
        X, y, test_size=0.2, random_state=42
    )
    
    # Skaliranje karakteristika
    skaler = StandardScaler()
    X_train_skalirano = skaler.fit_transform(X_train)
    X_test_skalirano = skaler.transform(X_test)
    
    # Treniranje modela
    model = RandomForestClassifier(n_estimators=100, random_state=42)
    model.fit(X_train_skalirano, y_train)
    
    # Evaluacija modela
    y_pred = model.predict(X_test_skalirano)
    print("\nPerformanse Modela:")
    print(classification_report(y_test, y_pred))
    
    return model, skaler
```

## Testiranje i Osiguranje Kvaliteta

### Unit Testiranje sa pytest
```python
import pytest
from typing import List

def izracunaj_statistike(brojevi: List[float]) -> dict:
    """Izračunava površinu pravougaonika.
    
    Args:
        brojevi: Lista brojeva
    
    Returns:
        Površina pravougaonika
    """
    if not brojevi:
        raise ValueError("Lista ne smije biti prazna")
    return {
        "prosjek": sum(brojevi) / len(brojevi),
        "minimum": min(brojevi),
        "maksimum": max(brojevi)
    }

class TestRacunanja:
    def test_osnovne_statistike(self):
        brojevi = [1.0, 2.0, 3.0, 4.0, 5.0]
        rezultat = izracunaj_statistike(brojevi)
        assert rezultat["prosjek"] == 3.0
        assert rezultat["minimum"] == 1.0
        assert rezultat["maksimum"] == 5.0
    
    def test_prazna_lista(self):
        with pytest.raises(ValueError):
            izracunaj_statistike([])
    
    @pytest.mark.parametrize("ulazna_lista,ocekivani_prosjek", [
        ([1, 2, 3], 2.0),
        ([0, 0, 0], 0.0),
        ([1, -1], 0.0)
    ])
    def test_racunanje_prosjeka(self, ulazna_lista, ocekivani_prosjek):
        rezultat = izracunaj_statistike(ulazna_lista)
        assert rezultat["prosjek"] == ocekivani_prosjek
```

### Integraciono Testiranje
```python
import pytest
from fastapi.testclient import TestClient
from vasa_aplikacija import app

client = TestClient(app)

def test_kreiraj_korisnika():
    odgovor = client.post(
        "/korisnici/",
        json={"id": 1, "ime": "Test Korisnik", "email": "test@primjer.ba"}
    )
    assert odgovor.status_code == 200
    assert odgovor.json()["ime"] == "Test Korisnik"

def test_preuzmi_korisnika():
    # Prvo kreiramo korisnika
    client.post(
        "/korisnici/",
        json={"id": 1, "ime": "Test Korisnik", "email": "test@primjer.ba"}
    )
    
    # Zatim preuzimamo korisnika
    odgovor = client.get("/korisnici/1")
    assert odgovor.status_code == 200
    assert odgovor.json()["ime"] == "Test Korisnik"
```

## Najbolje Prakse i Dizajn Paterni

### Clean Code Principi
```python
# Loš primjer
def f(p):
    return p['x'] * p['y']

# Dobar primjer
def izracunaj_povrsinu(dimenzije: dict) -> float:
    """Izračunava površinu pravougaonika.
    
    Args:
        dimenzije: Rječnik koji sadrži 'sirina' i 'visina' ključeve
    
    Returns:
        Površina pravougaonika
    """
    return dimenzije['sirina'] * dimenzije['visina']

# Loš primjer
l = []
for i in range(10):
    if i % 2 == 0:
        l.append(i)

# Dobar primjer
parni_brojevi = [broj for broj in range(10) if broj % 2 == 0]
```

### Dizajn Paterni
```python
# Singleton Patern
class KonekcijaBaze:
    _instanca = None
    
    def __new__(cls):
        if cls._instanca is None:
            cls._instanca = super().__new__(cls)
            cls._instanca.inicijaliziraj()
        return cls._instanca
    
    def inicijaliziraj(self):
        self.host = "localhost"
        self.port = 5432
        self.povezan = False

# Factory Patern
from abc import ABC, abstractmethod

class Zivotinja(ABC):
    @abstractmethod
    def oglasi_se(self) -> str:
        pass

class Pas(Zivotinja):
    def oglasi_se(self) -> str:
        return "Av av!"

class Macka(Zivotinja):
    def oglasi_se(self) -> str:
        return "Mijau!"

class FabrikaZivotinja:
    @staticmethod
    def kreiraj_zivotinju(tip_zivotinje: str) -> Zivotinja:
        if tip_zivotinje.lower() == "pas":
            return Pas()
        elif tip_zivotinje.lower() == "macka":
            return Macka()
        raise ValueError(f"Nepoznat tip životinje: {tip_zivotinje}")
```

### Optimizacija Performansi
```python
from functools import lru_cache
import time

# Korištenje memoizacije za skupe kalkulacije
@lru_cache(maxsize=128)
def fibonacci(n: int) -> int:
    if n < 2:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

# Context menadžeri za upravljanje resursima
class MjeracVremena:
    def __enter__(self):
        self.pocetak = time.time()
        return self
    
    def __exit__(self, *args):
        self.kraj = time.time()
        self.trajanje = self.kraj - self.pocetak

# Primjer korištenja
def obradi_veliki_dataset(podaci: List[int]) -> List[int]:
    with MjeracVremena() as mjerac:
        rezultat = [fibonacci(n) for n in podaci]
    print(f"Obrada je trajala {mjerac.trajanje:.2f} sekundi")
    return rezultat
```

## Najbolje Prakse za Sigurnost

### Sigurno Rukovanje Lozinkama
```python
import hashlib
import os
from typing import Tuple

def hesiraj_lozinku(lozinka: str) -> Tuple[bytes, bytes]:
    """Hešira lozinku sa nasumičnim salt-om koristeći SHA-256."""
    salt = os.urandom(32)
    hash_obj = hashlib.pbkdf2_hmac(
        'sha256',
        lozinka.encode('utf-8'),
        salt,
        100000
    )
    return hash_obj, salt

def verifikuj_lozinku(lozinka: str, hash_obj: bytes, salt: bytes) -> bool:
    """Verifikuje lozinku sa njenim hešom."""
    novi_hes = hashlib.pbkdf2_hmac(
        'sha256',
        lozinka.encode('utf-8'),
        salt,
        100000
    )
    return hash_obj == novi_hes
```

### Validacija Unosa
```python
from pydantic import BaseModel, EmailStr, constr, validator
from datetime import date

class RegistracijaKorisnika(BaseModel):
    korisnicko_ime: constr(min_length=3, max_length=50)
    email: EmailStr
    lozinka: constr(min_length=8)
    datum_rodjenja: date
    
    @validator('datum_rodjenja')
    def provjeri_godine(cls, v):
        danas = date.today()
        godine = danas.year - v.year
        if godine < 18:
            raise ValueError('Morate imati najmanje 18 godina')
        return v
    
    @validator('lozinka')
    def provjeri_jacinu_lozinke(cls, v):
        if not any(c.isupper() for c in v):
            raise ValueError('Lozinka mora sadržavati najmanje jedno veliko slovo')
        if not any(c.islower() for c in v):
            raise ValueError('Lozinka mora sadržavati najmanje jedno malo slovo')
        if not any(c.isdigit() for c in v):
            raise ValueError('Lozinka mora sadržavati najmanje jedan broj')
        return v
```

## Struktura Projekta i Organizacija

### Moderna Struktura Projekta
```plaintext
moj_projekat/
├── src/
│   ├── __init__.py
│   ├── main.py
│   ├── config.py
│   ├── api/
│   │   ├── __init__.py
│   │   ├── rute.py
│   │   └── zavisnosti.py
│   ├── modeli/
│   │   ├── __init__.py
│   │   ├── korisnik.py
│   │   └── proizvod.py
│   ├── servisi/
│   │   ├── __init__.py
│   │   └── poslovna_logika.py
│   └── utils/
│       ├── __init__.py
│       └── pomocne_funkcije.py
├── testovi/
│   ├── __init__.py
│   ├── test_api.py
│   └── test_servisi.py
├── docs/
│   ├── api.md
│   └── podesavanje.md
├── requirements.txt
├── setup.py
└── README.md
```

### Upravljanje Konfiguracijom
```python
from pydantic import BaseSettings
from functools import lru_cache

class Podesavanja(BaseSettings):
    ime_aplikacije: str = "MojaAplikacija"
    url_baze: str
    api_kljuc: str
    debug: bool = False
    
    class Config:
        env_file = ".env"

@lru_cache()
def preuzmi_podesavanja() -> Podesavanja:
    return Podesavanja()

# Korištenje
podesavanja = preuzmi_podesavanja()
print(f"Povezivanje sa: {podesavanja.url_baze}")
```

Ovim je zaključen sveobuhvatni Python tutorijal sa modernim funkcijama, najboljim praksama i praktičnim primjerima za različite slučajeve upotrebe.
