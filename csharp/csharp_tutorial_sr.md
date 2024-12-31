# C# Programiranje Tutorijal

## Sadržaj
1. [Uvod](#uvod)
2. [Osnovni Koncepti](#osnovni-koncepti)
3. [Objektno Orijentisano Programiranje](#objektno-orijentisano-programiranje)
4. [Napredne Funkcije](#napredne-funkcije)
5. [Moderne C# Funkcije](#moderne-c-funkcije)
6. [Dizajn Obrasci](#dizajn-obrasci)
7. [Najbolje Prakse](#najbolje-prakse)
8. [Primer Projekti](#primer-projekti)

## Uvod

C# je moderan, objektno orijentisan programski jezik razvijen od strane Microsoft-a. Ovaj tutorijal pokriva osnovne koncepte i napredne funkcije C# jezika.

### Prvi Koraci
```csharp
// Jednostavan Hello World program
using System;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Zdravo, svete!");
    }
}
```

## Osnovni Koncepti

### Promenljive i Tipovi Podataka
```csharp
// Vrednosni tipovi
int broj = 42;
double pi = 3.14159;
bool jeValidno = true;
char slovo = 'A';

// Referentni tipovi
string tekst = "Zdravo, C#!";
object obj = new object();

// Nullable tipovi
int? nullabilniBroj = null;
```

### Kontrolne Strukture
```csharp
// If-else izjava
if (broj > 0)
{
    Console.WriteLine("Pozitivan");
}
else if (broj < 0)
{
    Console.WriteLine("Negativan");
}
else
{
    Console.WriteLine("Nula");
}

// Switch izraz (C# 8.0+)
string rezultat = broj switch
{
    > 0 => "Pozitivan",
    < 0 => "Negativan",
    _ => "Nula"
};

// Petlje
for (int i = 0; i < 5; i++)
{
    Console.WriteLine($"Iteracija {i}");
}

foreach (var element in kolekcija)
{
    Console.WriteLine(element);
}

while (uslov)
{
    // Kod
}

do
{
    // Kod
} while (uslov);
```

## Objektno Orijentisano Programiranje

### Klase i Objekti
```csharp
public class Osoba
{
    // Svojstva
    public string Ime { get; set; }
    public int Godine { get; set; }
    
    // Konstruktor
    public Osoba(string ime, int godine)
    {
        Ime = ime;
        Godine = godine;
    }
    
    // Metoda
    public void Predstavise()
    {
        Console.WriteLine($"Zdravo, ja sam {Ime} i imam {Godine} godina.");
    }
}

// Korišćenje klase
var osoba = new Osoba("Marko", 30);
osoba.Predstavise();
```

### Nasleđivanje i Polimorfizam
```csharp
public abstract class Oblik
{
    public abstract double IzracunajPovrsinu();
}

public class Krug : Oblik
{
    public double Poluprecnik { get; set; }
    
    public Krug(double poluprecnik)
    {
        Poluprecnik = poluprecnik;
    }
    
    public override double IzracunajPovrsinu()
    {
        return Math.PI * Poluprecnik * Poluprecnik;
    }
}

public class Pravougaonik : Oblik
{
    public double Sirina { get; set; }
    public double Visina { get; set; }
    
    public Pravougaonik(double sirina, double visina)
    {
        Sirina = sirina;
        Visina = visina;
    }
    
    public override double IzracunajPovrsinu()
    {
        return Sirina * Visina;
    }
}
```

## Napredne Funkcije

### LINQ (Language Integrated Query)
```csharp
var brojevi = Enumerable.Range(1, 10);

// Sintaksa upita
var parniBrojevi = from n in brojevi
                   where n % 2 == 0
                   select n;

// Sintaksa metoda
var neparniBrojevi = brojevi.Where(n => n % 2 != 0);

// Kompleksne LINQ operacije
var rezultat = brojevi
    .Where(n => n > 5)
    .Select(n => new { Broj = n, Kvadrat = n * n })
    .OrderByDescending(x => x.Kvadrat)
    .Take(3);
```

### Async/Await
```csharp
public class ServisPodataka
{
    public async Task<string> PreuzmiPodatkeAsync()
    {
        using var klijent = new HttpClient();
        var odgovor = await klijent.GetStringAsync("https://api.example.com/data");
        return odgovor;
    }
}

public class Program
{
    public static async Task Main()
    {
        var servis = new ServisPodataka();
        try
        {
            var podaci = await servis.PreuzmiPodatkeAsync();
            Console.WriteLine(podaci);
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Greška: {ex.Message}");
        }
    }
}
```

### Generički Tipovi
```csharp
public class GenerickoSkladiste<T> where T : class
{
    private readonly List<T> _elementi = new();
    
    public void Dodaj(T element)
    {
        _elementi.Add(element);
    }
    
    public IEnumerable<T> PreuzmiSve()
    {
        return _elementi.AsReadOnly();
    }
    
    public T PreuzmiPoId(Func<T, bool> predikat)
    {
        return _elementi.FirstOrDefault(predikat);
    }
}

// Korišćenje generičkog skladišta
var skladisteOsoba = new GenerickoSkladiste<Osoba>();
skladisteOsoba.Dodaj(new Osoba("Ana", 25));
```

## Moderne C# Funkcije

### Records (C# 9.0+)
```csharp
public record ZapisOsobe(string Ime, int Godine);

// Korišćenje zapisa
var osoba1 = new ZapisOsobe("Marko", 30);
var osoba2 = osoba1 with { Godine = 31 };

// Zapis sa dodatnim članovima
public record Zaposleni(string Ime, int Godine, string Odeljenje)
{
    public decimal IzracunajPlatu() => 50000m;
}
```

### Pattern Matching
```csharp
public static string OpisiVrednost(object obj) =>
    obj switch
    {
        string s => $"String dužine {s.Length}",
        int n when n < 0 => "Negativan broj",
        int n => $"Pozitivan broj: {n}",
        Osoba { Godine: > 18 } p => $"Odrasla osoba: {p.Ime}",
        null => "Null vrednost",
        _ => "Nepoznat tip"
    };
```

### Top-Level Statements (C# 9.0+)
```csharp
// Program.cs
using System;

Console.WriteLine("Zdravo, svete!");
await UrediNestoAsync();

async Task UrediNestoAsync()
{
    await Task.Delay(1000);
    Console.WriteLine("Gotovo!");
}
```

### Init-only Properties (C# 9.0+)
```csharp
public class Konfiguracija
{
    public string Host { get; init; }
    public int Port { get; init; }
    public string BazaPodataka { get; init; }
}

var config = new Konfiguracija
{
    Host = "localhost",
    Port = 5432,
    BazaPodataka = "mojadb"
};
```

## Dizajn Obrasci

### Singleton Obrazac
```csharp
public sealed class Singleton
{
    private static readonly Lazy<Singleton> _instanca =
        new Lazy<Singleton>(() => new Singleton());
        
    public static Singleton Instanca => _instanca.Value;
    
    private Singleton() { }
    
    public void UrediNesto()
    {
        Console.WriteLine("Singleton metoda pozvana");
    }
}
```

### Factory Obrazac
```csharp
public interface IZivotinja
{
    void NapraviZvuk();
}

public class Pas : IZivotinja
{
    public void NapraviZvuk() => Console.WriteLine("Av av!");
}

public class Macka : IZivotinja
{
    public void NapraviZvuk() => Console.WriteLine("Mjau!");
}

public static class FabrikaZivotinja
{
    public static IZivotinja KreirajZivotinju(string tip) =>
        tip.ToLower() switch
        {
            "pas" => new Pas(),
            "macka" => new Macka(),
            _ => throw new ArgumentException("Nevažeći tip životinje")
        };
}
```

## Primer Projekti

### Kreiranje REST API-ja
```csharp
[ApiController]
[Route("api/[controller]")]
public class KorisnikController : ControllerBase
{
    private readonly IKorisnikServis _korisnikServis;
    
    public KorisnikController(IKorisnikServis korisnikServis)
    {
        _korisnikServis = korisnikServis;
    }
    
    [HttpGet]
    public async Task<ActionResult<IEnumerable<Korisnik>>> PreuzmiKorisnike()
    {
        var korisnici = await _korisnikServis.PreuzmiSveKorisnikeAsync();
        return Ok(korisnici);
    }
    
    [HttpPost]
    public async Task<ActionResult<Korisnik>> KreirajKorisnika(KreiranjeKorisnikaDto dto)
    {
        var korisnik = await _korisnikServis.KreirajKorisnikaAsync(dto);
        return CreatedAtAction(nameof(PreuzmiKorisnike), new { id = korisnik.Id }, korisnik);
    }
}
```

### Kreiranje Desktop Aplikacije
```csharp
public partial class GlavniProzor : Window
{
    private readonly ObservableCollection<ZadatakStavka> _zadaci = new();
    
    public GlavniProzor()
    {
        InitializeComponent();
        ListaZadataka.ItemsSource = _zadaci;
    }
    
    private void DodajZadatak_Click(object sender, RoutedEventArgs e)
    {
        if (string.IsNullOrWhiteSpace(UnosZadatka.Text))
            return;
            
        _zadaci.Add(new ZadatakStavka
        {
            Naslov = UnosZadatka.Text,
            KreiranoDatuma = DateTime.Now
        });
        
        UnosZadatka.Clear();
    }
}

public class ZadatakStavka
{
    public string Naslov { get; set; }
    public DateTime KreiranoDatuma { get; set; }
    public bool JeZavrsen { get; set; }
}
```

## Najbolje Prakse

1. Koristite opisna imena za promenljive, metode i klase
2. Pratite C# konvencije imenovanja
3. Pišite čist, održiv kod
4. Koristite pravilno rukovanje izuzecima
5. Implementirajte interfejse za bolju apstrakciju
6. Koristite Dependency Injection
7. Pišite unit testove
8. Dokumentujte svoj kod
9. Pravilno koristite async/await
10. Pratite SOLID principe

## Dodatni Resursi

1. [Microsoft C# Dokumentacija](https://docs.microsoft.com/sr-latn-rs/dotnet/csharp/)
2. [C# Vodič za Programiranje](https://docs.microsoft.com/sr-latn-rs/dotnet/csharp/programming-guide/)
3. [.NET API Pretraživač](https://docs.microsoft.com/sr-latn-rs/dotnet/api/)
4. [C# Corner](https://www.c-sharpcorner.com/)

## Napredne teme

### Asinhrono programiranje
```csharp
// Osnovni async/await obrazac
public async Task<string> PreuzmiPodatkeAsync()
{
    using var klijent = new HttpClient(); // Kreiranje HTTP klijenta za web zahteve
    return await klijent.GetStringAsync("https://api.example.com/data"); // Asinhrono preuzimanje podataka
}

// Višestruke asinhrone operacije
public async Task ObradiPodatkeAsync()
{
    var zadatak1 = PreuzmiPodatkeAsync(); // Pokretanje prvog preuzimanja
    var zadatak2 = PreuzmiPodatkeAsync(); // Pokretanje drugog preuzimanja paralelno
    
    await Task.WhenAll(zadatak1, zadatak2); // Čekanje da se oba preuzimanja završe
}
```

### Kolekcije i strukture podataka
```csharp
// List<T> - Implementacija dinamičkog niza
List<int> brojevi = new(); // Moderna C# inicijalizacija liste
brojevi.Add(1); // Dodavanje jednog elementa
brojevi.AddRange(new[] { 2, 3, 4 }); // Dodavanje više elemenata

// Dictionary<TKey, TValue> - Parovi ključ-vrednost
Dictionary<string, int> godine = new()
{
    ["Marko"] = 25, // Inicijalizacija sa vrednostima
    ["Ana"] = 30
};

// HashSet<T> - Kolekcija jedinstvenih elemenata
HashSet<string> jedinstvenaImena = new()
{
    "Marko", // Duplikati se automatski uklanjaju
    "Ana",
    "Marko" // Ovo neće biti dodato
};

// Queue<T> - FIFO struktura podataka
Queue<string> redZaŠtampanje = new();
redZaŠtampanje.Enqueue("Dokument1.pdf"); // Dodavanje u red
var sledećiZaŠtampu = redZaŠtampanje.Dequeue(); // Uklanjanje i vraćanje prvog elementa

// Stack<T> - LIFO struktura podataka
Stack<string> stekPoništavanja = new();
stekPoništavanja.Push("Akcija1"); // Dodavanje na vrh
var poslednjaAkcija = stekPoništavanja.Pop(); // Uklanjanje i vraćanje elementa sa vrha
```

### Metode proširenja
```csharp
public static class StringProširenja
{
    // Metoda proširenja za string tip
    public static int BrojReči(this string str)
    {
        return str.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries).Length;
    }
    
    // Metoda proširenja sa parametrima
    public static string Skrati(this string str, int maxDužina)
    {
        return str.Length <= maxDužina ? str : str[..maxDužina] + "...";
    }
}

// Korišćenje metoda proširenja
string tekst = "Ovo je primer teksta";
int brojReči = tekst.BrojReči(); // Korišćenje metode proširenja
string skraćeno = tekst.Skrati(10); // Korišćenje parametrizovane metode proširenja
```

### Delegati i događaji
```csharp
// Deklaracija delegata
public delegate void RukovateljPoruke(string poruka);

// Klasa izdavača događaja
public class IzdavačPoruka
{
    // Deklaracija događaja
    public event RukovateljPoruke PorukaPrimljena;
    
    // Metoda za aktiviranje događaja
    public void PošaljiPoruku(string poruka)
    {
        PorukaPrimljena?.Invoke(poruka); // Bezbedno aktiviranje događaja
    }
}

// Klasa pretplatnika događaja
public class PretplatnikPoruka
{
    public void NaPorukuPrimljenu(string poruka)
    {
        Console.WriteLine($"Primljena poruka: {poruka}");
    }
}

// Korišćenje
var izdavač = new IzdavačPoruka();
var pretplatnik = new PretplatnikPoruka();
izdavač.PorukaPrimljena += pretplatnik.NaPorukuPrimljenu; // Pretplata na događaj
```

### Napredne LINQ operacije
```csharp
// Kompleksne transformacije podataka
var proizvodi = new List<Proizvod>();

var analiza = proizvodi
    .GroupBy(p => p.Kategorija) // Grupisanje po kategoriji
    .Select(g => new
    {
        Kategorija = g.Key,
        ProsečnaCena = g.Average(p => p.Cena),
        UkupnoProizvoda = g.Count(),
        NajskupljiProizvod = g.OrderByDescending(p => p.Cena).First()
    })
    .OrderByDescending(x => x.UkupnoProizvoda);

// Prilagođeni LINQ operatori
public static class LinqProširenja
{
    public static IEnumerable<T> DistinktPo<T, TKljuč>(
        this IEnumerable<T> izvor,
        Func<T, TKljuč> selektorKljuča)
    {
        HashSet<TKljuč> viđeniKljučevi = new();
        foreach (var element in izvor)
        {
            if (viđeniKljučevi.Add(selektorKljuča(element)))
            {
                yield return element;
            }
        }
    }
}
```

### Upravljanje memorijom i obrasci oslobađanja
```csharp
public class UpravljačResursa : IDisposable
{
    private bool oslobođeno = false;
    private IntPtr nativniResurs;
    private UpravljaniResurs upravljaniResurs;

    public UpravljačResursa()
    {
        nativniResurs = AlocirajNativniResurs();
        upravljaniResurs = new UpravljaniResurs();
    }

    // Implementacija IDisposable
    public void Dispose()
    {
        Dispose(true);
        GC.SuppressFinalize(this);
    }

    // Zaštićena metoda za oslobađanje
    protected virtual void Dispose(bool oslobađanje)
    {
        if (!oslobođeno)
        {
            if (oslobađanje)
            {
                // Oslobađanje upravljanih resursa
                upravljaniResurs?.Dispose();
            }

            // Oslobađanje neupravljanih resursa
            if (nativniResurs != IntPtr.Zero)
            {
                OslobodiNativniResurs(nativniResurs);
                nativniResurs = IntPtr.Zero;
            }

            oslobođeno = true;
        }
    }

    // Finalizator
    ~UpravljačResursa()
    {
        Dispose(false);
    }
}
```

### Napredno rukovanje izuzecima
```csharp
public class PrilagođeniIzuzetak : Exception
{
    public int KodGreške { get; }

    public PrilagođeniIzuzetak(string poruka, int kodGreške) 
        : base(poruka)
    {
        KodGreške = kodGreške;
    }
}

public async Task ObradiPodatkeSaPonavljanjemAsync()
{
    int brojPokušaja = 3;
    int trenutniPokušaj = 0;

    while (trenutniPokušaj < brojPokušaja)
    {
        try
        {
            await ObradiPodatkeAsync();
            break; // Uspeh, izlaz iz petlje
        }
        catch (HttpRequestException ex)
        {
            trenutniPokušaj++;
            if (trenutniPokušaj == brojPokušaja)
            {
                throw new PrilagođeniIzuzetak(
                    "Neuspeh nakon više pokušaja", 
                    kodGreške: 500);
            }
            await Task.Delay(1000 * trenutniPokušaj); // Eksponencijalno čekanje
        }
    }
}
```

### Refleksija i atributi
```csharp
// Prilagođeni atribut
[AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
public class RevizijskiAtribut : Attribute
{
    public string Opis { get; }
    
    public RevizijskiAtribut(string opis)
    {
        Opis = opis;
    }
}

// Korišćenje refleksije
public class PrimerRefleksije
{
    public static void IspitiTip<T>()
    {
        Type tip = typeof(T);
        
        // Dobijanje svih javnih svojstava
        var svojstva = tip.GetProperties()
            .Select(p => new
            {
                Ime = p.Name,
                Tip = p.PropertyType,
                Atributi = p.GetCustomAttributes()
            });
            
        // Dobijanje svih metoda sa specifičnim atributom
        var revidiranihMetoda = tip.GetMethods()
            .Where(m => m.GetCustomAttribute<RevizijskiAtribut>() != null)
            .Select(m => new
            {
                Ime = m.Name,
                Revizija = m.GetCustomAttribute<RevizijskiAtribut>()
            });
    }
}
```

### Moderne C# funkcije (C# 9.0+)
```csharp
// Record tipovi
public record Osoba(string Ime, string Prezime)
{
    public string PunoIme => $"{Ime} {Prezime}";
}

// Svojstva samo za inicijalizaciju
public class Konfiguracija
{
    public string Host { get; init; }
    public int Port { get; init; }
}

// Podudaranje obrazaca
public static string DobiOpisOblika(Oblik oblik) => oblik switch
{
    Krug { Poluprečnik: > 10 } => "Veliki krug",
    Pravougaonik { Širina: var š, Visina: var v } when š == v => "Kvadrat",
    Trougao { JePravougli: true } => "Pravougli trougao",
    _ => "Nepoznat oblik"
};

// Iskazi najvišeg nivoa
using System;
Console.WriteLine("Zdravo, svete!"); // Nije potrebna eksplicitna Main metoda
```

### Optimizacija performansi
```csharp
// Span<T> za efikasne operacije sa memorijom
public static void ObradiVelikiNiz()
{
    byte[] velikiNiz = new byte[1000000];
    Span<byte> span = velikiNiz;
    
    // Efikasno sečenje bez alokacije
    Span<byte> isečak = span.Slice(0, 1000);
    
    // Direktna manipulacija memorijom
    for (int i = 0; i < isečak.Length; i++)
    {
        isečak[i] = (byte)(i % 256);
    }
}

// Korišćenje ValueTask za performanse
public async ValueTask<int> DobiVrednostAsync()
{
    if (_keš.TryGetValue("ključ", out var vrednost))
    {
        return (int)vrednost;
    }
    
    return await SkupaOperacijaAsync();
}
```

### Najbolje prakse za jedinično testiranje
```csharp
[TestClass]
public class KalkulatorTestovi
{
    private Kalkulator _kalkulator;
    
    [TestInitialize]
    public void Postavljanje()
    {
        _kalkulator = new Kalkulator();
    }
    
    [TestMethod]
    [DataRow(1, 2, 3)]
    [DataRow(-1, 1, 0)]
    [DataRow(0, 0, 0)]
    public void Saberi_TrebaVratitiOčekivaniRezultat(
        int a, int b, int očekivano)
    {
        // Priprema
        // Akcija
        var rezultat = _kalkulator.Saberi(a, b);
        
        // Provera
        Assert.AreEqual(očekivano, rezultat);
    }
    
    [TestMethod]
    [ExpectedException(typeof(DivideByZeroException))]
    public void Podeli_NulomTrebaBacitiIzuzetak()
    {
        _kalkulator.Podeli(1, 0);
    }
}
```

### Implementacija dizajn obrazaca
```csharp
// Singleton obrazac
public sealed class Singleton
{
    private static readonly Lazy<Singleton> _instanca =
        new(() => new Singleton());
        
    public static Singleton Instanca => _instanca.Value;
    
    private Singleton() { }
}

// Factory Method obrazac
public abstract class FabrikaDokumenata
{
    public abstract IDokument KreirajDokument();
}

public class PdfFabrika : FabrikaDokumenata
{
    public override IDokument KreirajDokument()
    {
        return new PdfDokument();
    }
}

// Observer obrazac
public interface IPosmatrač<T>
{
    void Ažuriraj(T podaci);
}

public class Posmatrani<T>
{
    private readonly List<IPosmatrač<T>> _posmatrači = new();
    
    public void Dodaj(IPosmatrač<T> posmatrač)
    {
        _posmatrači.Add(posmatrač);
    }
    
    public void Obavesti(T podaci)
    {
        foreach (var posmatrač in _posmatrači)
        {
            posmatrač.Ažuriraj(podaci);
        }
    }
}
```

## Najbolje prakse i saveti

### Organizacija koda
- Koristite značajna imena za promenljive, metode i klase
- Pratite princip jedinstvene odgovornosti
- Držite metode malim i fokusiranim
- Implementirajte pravilno rukovanje izuzecima
- Implementirajte pravilno logovanje
- Pišite sveobuhvatne jedinične testove
- Dokumentujte javne API-je

### Razmatranja performansi
- Koristite odgovarajuće tipove kolekcija
- Implementirajte pravilne obrasce oslobađanja
- Razmotrite korišćenje vrednosnih tipova za male, jednostavne tipove
- Koristite async/await za I/O operacije
- Implementirajte keširanje gde je prikladno
- Profilišite kod za identifikaciju uskih grla

### Najbolje prakse za bezbednost
- Validacija unosa
- Pravilno rukovanje izuzecima
- Bezbedno čuvanje osetljivih podataka
- Korišćenje enkripcije gde je potrebno
- Implementacija pravilne autentifikacije i autorizacije
- Redovne bezbednosne provere

## Primer projekata

### Struktura Web API projekta
```plaintext
MojApi/
├── Kontroleri/
│   ├── KorisnikKontroler.cs
│   └── ProizvodKontroler.cs
├── Modeli/
│   ├── Korisnik.cs
│   └── Proizvod.cs
├── Servisi/
│   ├── IKorisnikServis.cs
│   └── KorisnikServis.cs
├── Repozitorijumi/
│   ├── IRepozitorijum.cs
│   └── Repozitorijum.cs
└── Program.cs
```

### Konzolna aplikacija
```plaintext
KonzolnaAplikacija/
├── Modeli/
├── Servisi/
├── Pomoćne klase/
└── Program.cs
```

Ovo zaključuje sveobuhvatni C# tutorijal. Svaki odeljak sadrži praktične primere i objašnjenja koja će vam pomoći da efikasno razumete i implementirate C# koncepte.
