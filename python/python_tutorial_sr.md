# Python Програмирање Туторијал

## Садржај
1. [Увод](#увод)
2. [Основни Концепти](#основни-концепти)
3. [Типови Података](#типови-података)
4. [Контролне Структуре](#контролне-структуре)
5. [Функције](#функције)
6. [Објектно Оријентисано Програмирање](#објектно-оријентисано-програмирање)
7. [Модули и Пакети](#модули-и-пакети)
8. [Рад са Датотекама](#рад-са-датотекама)
9. [Руковање Грешкама](#руковање-грешкама)
10. [Напредне Теме](#напредне-теме)
11. [Модерно Python Програмирање](#модерно-python-програмирање)
12. [Web Развој са FastAPI](#web-развој-са-fastapi)
13. [Data Science и Машино Учење](#data-science-и-машино-учење)
14. [Тестирање и Осигурање Квалитета](#тестирање-и-осигурање-квалитета)
15. [Најбоље Праксе и Дизајн Патерни](#најбоље-праксе-и-дизајн-патерни)
16. [Најбоље Праксе за Безбедност](#најбоље-праксе-за-безбедност)
17. [Структура Пројекта и Организација](#структура-пројекта-и-организација)

## Увод
Python је програмски језик високог нивоа познат по својој једноставности и читљивости. Овај туторијал ће вас водити кроз све основне концепте Python програмирања.

### Постављање Python-а
1. Преузмите Python са [python.org](https://python.org)
2. Инсталирајте Python са омогућеном PATH опцијом
3. Проверите инсталацију: `python --version`

## Основни Концепти

### Променљиве и Додељивање
```python
име = "John"      # String (текст)
године = 25      # Integer (цео број)
висина = 1.75    # Float (децимални број)
је_студент = True # Boolean (логичка вредност)
```

### Основне Операције
```python
# Аритметичке операције
збир = 10 + 5
разлика = 10 - 5
производ = 10 * 5
количник = 10 / 5
степен = 2 ** 3
остатак = 10 % 3

# Операције са стринговима
име = "John"
презиме = "Doe"
пуно_име = име + " " + презиме
```

## Типови Података

### Бројеви
```python
# Цео број
x = 5
# Децимални број
y = 3.14
# Комплексни број
z = 2 + 3j
```

### Стрингови
```python
# Креирање стринга
текст = "Здраво, Свете!"
више_линија = """Ово је текст
у више линија"""

# Стринг методе
велика_слова = текст.upper()
мала_слова = текст.lower()
дужина = len(текст)
```

### Листе
```python
# Креирање листе
воће = ["јабука", "банана", "поморанџа"]

# Операције са листама
воће.append("грожђе")
воће.remove("банана")
прво_воће = воће[0]
```

### Речници (Dictionaries)
```python
# Креирање речника
особа = {
    "име": "John",
    "године": 25,
    "град": "Београд"
}

# Операције са речницима
особа["email"] = "john@пример.срб"
године = особа.get("године")
```

## Контролне Структуре

### If Изјаве
```python
године = 18

if године >= 18:
    print("Пунолетан")
elif године >= 13:
    print("Тинејџер")
else:
    print("Дете")
```

### Петље
```python
# For петља
for i in range(5):
    print(i)

# While петља
бројач = 0
while бројач < 5:
    print(бројач)
    бројач += 1
```

## Функције

### Основне Функције
```python
def поздрави(име):
    return f"Здраво, {име}!"

# Позив функције
порука = поздрави("John")
```

### Lambda Функције
```python
квадрат = lambda x: x ** 2
резултат = квадрат(5)  # Враћа 25
```

## Објектно Оријентисано Програмирање

### Класе и Објекти
```python
class Особа:
    def __init__(self, име, године):
        self.име = име
        self.године = године
    
    def представи_се(self):
        return f"Ја сам {self.име}, имам {self.године} година"

# Креирање објекта
особа = Особа("John", 25)
представљање = особа.представи_се()
```

### Наслеђивање
```python
class Студент(Особа):
    def __init__(self, име, године, број_индекса):
        super().__init__(име, године)
        self.број_индекса = број_индекса
    
    def учи(self):
        return f"{self.име} учи"
```

## Модули и Пакети

### Коришћење Уграђених Модула
```python
import math
import random

# Математичке операције
корен = math.sqrt(16)
случајан_број = random.randint(1, 10)
```

### Креирање Сопствених Модула
```python
# мој_модул.py
def сопствена_функција():
    return "Поздрав из сопственог модула!"

# main.py
import мој_модул
резултат = мој_модул.сопствена_функција()
```

## Рад са Датотекама

### Читање и Писање Датотека
```python
# Писање у датотеку
with open("пример.txt", "w") as датотека:
    датотека.write("Здраво, Свете!")

# Читање из датотеке
with open("пример.txt", "r") as датотека:
    садржај = датотека.read()
```

## Руковање Грешкама

### Try-Except Блокови
```python
try:
    резултат = 10 / 0
except ZeroDivisionError:
    print("Није могуће делити са нулом!")
except Exception as e:
    print(f"Дошло је до грешке: {e}")
finally:
    print("Ово се увек извршава")
```

## Напредне Теме

### Декоратори
```python
def мој_декоратор(func):
    def wrapper():
        print("Пре функције")
        func()
        print("После функције")
    return wrapper

@мој_декоратор
def реци_здраво():
    print("Здраво!")
```

### Генератори
```python
def генератор_бројева(n):
    for i in range(n):
        yield i

# Коришћење генератора
ген = генератор_бројева(5)
for број in ген:
    print(број)
```

### Управљање Контекстом
```python
class МојКонтекстМенаџер:
    def __enter__(self):
        print("Улазак у контекст")
        return self
    
    def __exit__(self, exc_type, exc_value, traceback):
        print("Излазак из контекста")

# Коришћење контекст менаџера
with МојКонтекстМенаџер():
    print("Унутар контекста")
```

### List Comprehensions
```python
# List comprehension
квадрати = [x**2 for x in range(10)]

# Dictionary comprehension
речник_квадрата = {x: x**2 for x in range(5)}
```

## Најбоље Праксе

1. Пратите PEP 8 стил писања кода
2. Користите смислена имена променљивих
3. Пишите docstrings за функције и класе
4. Држите функције малим и фокусираним
5. Користите type hints за бољу читљивост
6. Правилно рукујте грешкама
7. Пишите unit тестове за свој код

## Додатни Ресурси

1. [Званична Python Документација](https://docs.python.org)
2. [Python Package Index (PyPI)](https://pypi.org)
3. [Python Заједница Србије](https://python.rs)
4. [Python Туторијали на Српском](https://tutorijalirs.com/python)

## Пројекти за Вежбу

1. Направите једноставан калкулатор
2. Изградите апликацију за to-do листу
3. Имплементирајте једноставан web scraper
4. Направите организатор датотека
5. Изградите једноставну игру (нпр. Икс-Окс)

Не заборавите редовно да вежбате и радите на стварним пројектима како бисте побољшали своје Python програмерске вештине!

## Moderno Python Programiranje

### Tipiziranje i Statička Provera Tipova
```python
from typing import List, Dict, Optional, Union, Callable

def obradi_podatke(elementi: List[int]) -> Dict[str, float]:
    rezultat: Dict[str, float] = {}
    zbir: float = sum(elementi)
    rezultat["zbir"] = zbir
    rezultat["prosek"] = zbir / len(elementi)
    return rezultat

# Optional i Union tipovi
def pronadji_korisnika(id_korisnika: int) -> Optional[Dict[str, Union[str, int]]]:
    # Može vratiti None ako korisnik nije pronađen
    return {"ime": "Marko", "godine": 30} if id_korisnika > 0 else None

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
        case {"tip": "proizvod", "ime": str(ime), "cena": float(cena)}:
            return f"Proizvod {ime} košta {cena:.2f} din"
        case _:
            return "Nepoznat format podataka"

# Union tipovi sa |
def obradi_vrednost(vrednost: int | float | str) -> str:
    return str(vrednost)

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

# Korišćenje asyncio
async def glavni_program():
    urls = [
        "https://api.primer.rs/podaci1",
        "https://api.primer.rs/podaci2"
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
    
    # Obrada nedostajućih vrednosti
    df = df.fillna(df.mean(numeric_only=True))
    
    # Inženjering karakteristika
    df['godina'] = pd.to_datetime(df['datum']).dt.year
    df['mesec'] = pd.to_datetime(df['datum']).dt.month
    
    return df

# Vizualizacija podataka
def vizualizuj_podatke(df: pd.DataFrame, ciljna_kolona: str):
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
    
    # Podela dataseta
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
    if not brojevi:
        raise ValueError("Lista ne sme biti prazna")
    return {
        "prosek": sum(brojevi) / len(brojevi),
        "minimum": min(brojevi),
        "maksimum": max(brojevi)
    }

class TestRacunanja:
    def test_osnovne_statistike(self):
        brojevi = [1.0, 2.0, 3.0, 4.0, 5.0]
        rezultat = izracunaj_statistike(brojevi)
        assert rezultat["prosek"] == 3.0
        assert rezultat["minimum"] == 1.0
        assert rezultat["maksimum"] == 5.0
    
    def test_prazna_lista(self):
        with pytest.raises(ValueError):
            izracunaj_statistike([])
    
    @pytest.mark.parametrize("ulazna_lista,ocekivani_prosek", [
        ([1, 2, 3], 2.0),
        ([0, 0, 0], 0.0),
        ([1, -1], 0.0)
    ])
    def test_racunanje_proseka(self, ulazna_lista, ocekivani_prosek):
        rezultat = izracunaj_statistike(ulazna_lista)
        assert rezultat["prosek"] == ocekivani_prosek
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
        json={"id": 1, "ime": "Test Korisnik", "email": "test@primer.rs"}
    )
    assert odgovor.status_code == 200
    assert odgovor.json()["ime"] == "Test Korisnik"

def test_preuzmi_korisnika():
    # Prvo kreiramo korisnika
    client.post(
        "/korisnici/",
        json={"id": 1, "ime": "Test Korisnik", "email": "test@primer.rs"}
    )
    
    # Zatim preuzimamo korisnika
    odgovor = client.get("/korisnici/1")
    assert odgovor.status_code == 200
    assert odgovor.json()["ime"] == "Test Korisnik"
```

## Najbolje Prakse i Dizajn Paterni

### Clean Code Principi
```python
# Loš primer
def f(p):
    return p['x'] * p['y']

# Dobar primer
def izracunaj_povrsinu(dimenzije: dict) -> float:
    """Izračunava površinu pravougaonika.
    
    Args:
        dimenzije: Rečnik koji sadrži 'sirina' i 'visina' ključeve
    
    Returns:
        Površina pravougaonika
    """
    return dimenzije['sirina'] * dimenzije['visina']

# Loš primer
l = []
for i in range(10):
    if i % 2 == 0:
        l.append(i)

# Dobar primer
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
            cls._instanca.inicijalizuj()
        return cls._instanca
    
    def inicijalizuj(self):
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
        return "Mjau!"

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

# Korišćenje memoizacije za skupe kalkulacije
@lru_cache(maxsize=128)
def fibonacci(n: int) -> int:
    if n < 2:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

# Context menadžeri za upravljanje resursima
class MeracVremena:
    def __enter__(self):
        self.pocetak = time.time()
        return self
    
    def __exit__(self, *args):
        self.kraj = time.time()
        self.trajanje = self.kraj - self.pocetak

# Primer korišćenja
def obradi_veliki_dataset(podaci: List[int]) -> List[int]:
    with MeracVremena() as merac:
        rezultat = [fibonacci(n) for n in podaci]
    print(f"Obrada je trajala {merac.trajanje:.2f} sekundi")
    return rezultat
```

## Najbolje Prakse za Bezbednost

### Bezbedno Rukovanje Lozinkama
```python
import hashlib
import os
from typing import Tuple

def heširaj_lozinku(lozinka: str) -> Tuple[bytes, bytes]:
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
    novi_heš = hashlib.pbkdf2_hmac(
        'sha256',
        lozinka.encode('utf-8'),
        salt,
        100000
    )
    return hash_obj == novi_heš
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
    def proveri_godine(cls, v):
        danas = date.today()
        godine = danas.year - v.year
        if godine < 18:
            raise ValueError('Morate imati najmanje 18 godina')
        return v
    
    @validator('lozinka')
    def proveri_jacinu_lozinke(cls, v):
        if not any(c.isupper() for c in v):
            raise ValueError('Lozinka mora sadržati najmanje jedno veliko slovo')
        if not any(c.islower() for c in v):
            raise ValueError('Lozinka mora sadržati najmanje jedno malo slovo')
        if not any(c.isdigit() for c in v):
            raise ValueError('Lozinka mora sadržati najmanje jedan broj')
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

# Korišćenje
podesavanja = preuzmi_podesavanja()
print(f"Povezivanje sa: {podesavanja.url_baze}")
```

Ovim je zaključen sveobuhvatni Python tutorijal sa modernim funkcijama, najboljim praksama i praktičnim primerima za različite slučajeve upotrebe.
