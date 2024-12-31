# JSON Tutorial

## Sadržaj
1. [Uvod](#uvod)
2. [JSON Sintaksa](#json-sintaksa)
3. [Tipovi Podataka](#tipovi-podataka)
4. [Objekti](#objekti)
5. [Nizovi](#nizovi)
6. [Česti Slučajevi Upotrebe](#česti-slučajevi-upotrebe)
7. [Najbolje Prakse](#najbolje-prakse)
8. [Rad sa JSON-om](#rad-sa-json-om)

## Uvod

JSON (JavaScript Object Notation) je lagan format za razmjenu podataka baziran na tekstu, koji je lako čitljiv i pisljiv za ljude, a jednostavan za parsiranje i generisanje za mašine. Nezavisan je od jezika i široko se koristi za prenos podataka između servera i web aplikacije.

## JSON Sintaksa

### Osnovna Pravila
- Podaci su u parovima ime/vrijednost
- Podaci su odvojeni zarezima
- Vitičaste zagrade `{}` sadrže objekte
- Uglaste zagrade `[]` sadrže nizove
- Imena moraju biti stringovi, napisani sa dvostrukim navodnicima
- String vrijednosti moraju biti u dvostrukim navodnicima
- Brojevi mogu biti cijeli ili decimalni
- Boolean vrijednosti mogu biti true ili false
- Null je dozvoljen kao vrijednost

### Primjer
```json
{
    "ime": "Emir Hodžić",
    "godine": 30,
    "grad": "Sarajevo",
    "oženjen": false,
    "hobiji": ["čitanje", "muzika", "sport"],
    "djeca": null,
    "adresa": {
        "ulica": "Glavni put 123",
        "poštanskiBroj": "71000"
    }
}
```

## Tipovi Podataka

JSON podržava šest osnovnih tipova podataka:

1. **Stringovi**
```json
{
    "ime": "Emir",
    "prezime": "Hodžić",
    "poruka": "Zdravo, svijete!"
}
```

2. **Brojevi**
```json
{
    "godine": 30,
    "visina": 1.75,
    "temperatura": -5,
    "naučnaNotacija": 1.2e-10
}
```

3. **Boolean**
```json
{
    "jeStudent": true,
    "jeZaposlen": false
}
```

4. **Null**
```json
{
    "supružnik": null,
    "srednjeIme": null
}
```

5. **Objekti**
```json
{
    "osoba": {
        "ime": "Amina",
        "godine": 25
    }
}
```

6. **Nizovi**
```json
{
    "boje": ["crvena", "zelena", "plava"],
    "brojevi": [1, 2, 3, 4, 5]
}
```

## Objekti

### Struktura Objekta
```json
{
    "osoba": {
        "ime": "Emir Hodžić",
        "godine": 30,
        "kontakt": {
            "email": "emir@primjer.ba",
            "telefon": "+387-61-555-555"
        }
    }
}
```

### Ugnježđeni Objekti
```json
{
    "kompanija": {
        "naziv": "Tech d.o.o.",
        "odjeli": {
            "IT": {
                "šef": "Amina Begić",
                "zaposleni": 50
            },
            "HR": {
                "šef": "Mirza Kovač",
                "zaposleni": 20
            }
        }
    }
}
```

## Nizovi

### Jednostavni Nizovi
```json
{
    "voće": ["jabuka", "banana", "narandža"],
    "brojevi": [1, 2, 3, 4, 5],
    "mješovito": [1, "zdravo", true, null]
}
```

### Nizovi Objekata
```json
{
    "zaposleni": [
        {
            "ime": "Emir Hodžić",
            "id": 1,
            "pozicija": "Programer"
        },
        {
            "ime": "Amina Begić",
            "id": 2,
            "pozicija": "Dizajner"
        }
    ]
}
```

### Ugnježđeni Nizovi
```json
{
    "matrica": [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
    ],
    "kategorije": [
        ["voće", ["jabuka", "banana"]],
        ["povrće", ["mrkva", "krompir"]]
    ]
}
```

## Česti Slučajevi Upotrebe

### API Odgovor
```json
{
    "status": "uspjeh",
    "kod": 200,
    "podaci": {
        "korisnici": [
            {
                "id": 1,
                "ime": "Emir Hodžić",
                "email": "emir@primjer.ba"
            },
            {
                "id": 2,
                "ime": "Amina Begić",
                "email": "amina@primjer.ba"
            }
        ],
        "ukupno": 2,
        "stranica": 1
    }
}
```

### Konfiguracijska Datoteka
```json
{
    "appPostavke": {
        "tema": "tamna",
        "jezik": "bs",
        "obavještenja": {
            "email": true,
            "push": false
        },
        "sigurnost": {
            "dvoFaktorska": true,
            "istekLozinke": 90
        }
    }
}
```

### Skladištenje Podataka
```json
{
    "proizvodi": [
        {
            "id": "P001",
            "naziv": "Laptop",
            "cijena": 1999.99,
            "specifikacije": {
                "procesor": "Intel i5",
                "ram": "8GB",
                "storage": "256GB SSD"
            }
        },
        {
            "id": "P002",
            "naziv": "Smartphone",
            "cijena": 899.99,
            "specifikacije": {
                "ekran": "6,1 inča",
                "kamera": "12MP",
                "storage": "128GB"
            }
        }
    ]
}
```

## Najbolje Prakse

1. **Koristite Konzistentno Formatiranje**
```json
{
    "dobro": {
        "konzistentno": "razmaci",
        "pravilno": "uvlačenje"
    },
    "loše":{"nekonzistentno":"razmaci","bez":"uvlačenja"}
}
```

2. **Koristite Jasna Imena Svojstava**
```json
{
    "dobro": {
        "ime": "Emir",
        "emailAdresa": "emir@primjer.ba"
    },
    "loše": {
        "i": "Emir",
        "em": "emir@primjer.ba"
    }
}
```

3. **Koristite Odgovarajuće Tipove Podataka**
```json
{
    "dobro": {
        "godine": 25,
        "cijena": 19.99,
        "jeAktivan": true
    },
    "loše": {
        "godine": "25",
        "cijena": "19.99",
        "jeAktivan": "true"
    }
}
```

4. **Strukturirajte Podatke Hijerarhijski**
```json
{
    "dobro": {
        "adresa": {
            "ulica": "Glavni put 123",
            "grad": "Sarajevo",
            "država": "BiH"
        }
    },
    "loše": {
        "adresaUlica": "Glavni put 123",
        "adresaGrad": "Sarajevo",
        "adresaDržava": "BiH"
    }
}
```

## Rad sa JSON-om

### JavaScript Primjer
```javascript
// Parsiranje JSON stringa u objekt
const jsonString = '{"ime": "Emir", "godine": 30}';
const obj = JSON.parse(jsonString);
console.log(obj.ime); // Izlaz: Emir

// Konverzija objekta u JSON string
const osoba = {
    ime: "Emir",
    godine: 30
};
const jsonStr = JSON.stringify(osoba);
console.log(jsonStr); // Izlaz: {"ime":"Emir","godine":30}
```

### Python Primjer
```python
import json

# Parsiranje JSON stringa u objekt
json_string = '{"ime": "Emir", "godine": 30}'
obj = json.loads(json_string)
print(obj['ime'])  # Izlaz: Emir

# Konverzija objekta u JSON string
osoba = {
    'ime': 'Emir',
    'godine': 30
}
json_str = json.dumps(osoba)
print(json_str)  # Izlaz: {"ime": "Emir", "godine": 30}
```

### Česte JSON Operacije

1. **Čitanje JSON-a iz Datoteke**
```python
import json

# Python
with open('podaci.json', 'r') as file:
    podaci = json.load(file)
```

```javascript
// JavaScript
const fs = require('fs');
const podaci = JSON.parse(fs.readFileSync('podaci.json'));
```

2. **Pisanje JSON-a u Datoteku**
```python
# Python
with open('podaci.json', 'w') as file:
    json.dump(podaci, file, indent=4)
```

```javascript
// JavaScript
const fs = require('fs');
fs.writeFileSync('podaci.json', JSON.stringify(podaci, null, 4));
```

3. **Validacija JSON-a**
```python
import json

def je_validan_json(string):
    try:
        json.loads(string)
        return True
    except ValueError:
        return False
```

## Dodatni Resursi

1. [JSON Službena Web Stranica](https://www.json.org/)
2. [MDN JSON Dokumentacija](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON)
3. [JSON Schema](https://json-schema.org/)
4. [JSON Validator](https://jsonlint.com/)

## Vježbe

1. Kreirajte JSON datoteku koja predstavlja biblioteku knjiga
2. Parsirajte kompleksan JSON API odgovor
3. Konvertujte strukture podataka u JSON format
4. Validirajte JSON koristeći različite alate
5. Radite sa ugnježđenim JSON strukturama

Zapamtite da validirate svoj JSON koristeći alate poput JSONLint-a kako biste osigurali da je pravilno formatiran i validan!
