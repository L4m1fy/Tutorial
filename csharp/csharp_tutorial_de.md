# C# Programmierung Tutorial

## Inhaltsverzeichnis
1. [Einführung](#einführung)
2. [Grundlegende Konzepte](#grundlegende-konzepte)
3. [Objektorientierte Programmierung](#objektorientierte-programmierung)
4. [Fortgeschrittene Funktionen](#fortgeschrittene-funktionen)
5. [Moderne C# Funktionen](#moderne-c-funktionen)
6. [Entwurfsmuster](#entwurfsmuster)
7. [Best Practices](#best-practices)
8. [Beispielprojekte](#beispielprojekte)

## Einführung

C# ist eine moderne, objektorientierte Programmiersprache, die von Microsoft entwickelt wurde. Dieses Tutorial behandelt grundlegende Konzepte und fortgeschrittene Funktionen von C#.

### Erste Schritte
```csharp
// Einfaches Hello World Programm
using System;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Hallo, Welt!");
    }
}
```

## Grundlegende Konzepte

### Variablen und Datentypen
```csharp
// Werttypen
int zahl = 42;
double pi = 3.14159;
bool istGültig = true;
char buchstabe = 'A';

// Referenztypen
string text = "Hallo, C#!";
object obj = new object();

// Nullable Typen
int? nullbareZahl = null;
```

### Kontrollstrukturen
```csharp
// If-else Anweisung
if (zahl > 0)
{
    Console.WriteLine("Positiv");
}
else if (zahl < 0)
{
    Console.WriteLine("Negativ");
}
else
{
    Console.WriteLine("Null");
}

// Switch-Ausdruck (C# 8.0+)
string ergebnis = zahl switch
{
    > 0 => "Positiv",
    < 0 => "Negativ",
    _ => "Null"
};

// Schleifen
for (int i = 0; i < 5; i++)
{
    Console.WriteLine($"Durchlauf {i}");
}

foreach (var element in sammlung)
{
    Console.WriteLine(element);
}

while (bedingung)
{
    // Code
}

do
{
    // Code
} while (bedingung);
```

## Objektorientierte Programmierung

### Klassen und Objekte
```csharp
public class Person
{
    // Eigenschaften
    public string Name { get; set; }
    public int Alter { get; set; }
    
    // Konstruktor
    public Person(string name, int alter)
    {
        Name = name;
        Alter = alter;
    }
    
    // Methode
    public void Vorstellen()
    {
        Console.WriteLine($"Hallo, ich bin {Name} und ich bin {Alter} Jahre alt.");
    }
}

// Verwendung der Klasse
var person = new Person("Hans", 30);
person.Vorstellen();
```

### Vererbung und Polymorphismus
```csharp
public abstract class Form
{
    public abstract double BerechneFläche();
}

public class Kreis : Form
{
    public double Radius { get; set; }
    
    public Kreis(double radius)
    {
        Radius = radius;
    }
    
    public override double BerechneFläche()
    {
        return Math.PI * Radius * Radius;
    }
}

public class Rechteck : Form
{
    public double Breite { get; set; }
    public double Höhe { get; set; }
    
    public Rechteck(double breite, double höhe)
    {
        Breite = breite;
        Höhe = höhe;
    }
    
    public override double BerechneFläche()
    {
        return Breite * Höhe;
    }
}
```

## Fortgeschrittene Funktionen

### LINQ (Language Integrated Query)
```csharp
var zahlen = Enumerable.Range(1, 10);

// Abfragesyntax
var geradeZahlen = from n in zahlen
                   where n % 2 == 0
                   select n;

// Methodensyntax
var ungeradeZahlen = zahlen.Where(n => n % 2 != 0);

// Komplexe LINQ-Operationen
var ergebnis = zahlen
    .Where(n => n > 5)
    .Select(n => new { Zahl = n, Quadrat = n * n })
    .OrderByDescending(x => x.Quadrat)
    .Take(3);
```

### Async/Await
```csharp
public class DatenService
{
    public async Task<string> HoleDatenAsync()
    {
        using var client = new HttpClient();
        var antwort = await client.GetStringAsync("https://api.example.com/data");
        return antwort;
    }
}

public class Program
{
    public static async Task Main()
    {
        var service = new DatenService();
        try
        {
            var daten = await service.HoleDatenAsync();
            Console.WriteLine(daten);
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Fehler: {ex.Message}");
        }
    }
}
```

### Generische Typen
```csharp
public class GenericRepository<T> where T : class
{
    private readonly List<T> _elemente = new();
    
    public void Hinzufügen(T element)
    {
        _elemente.Add(element);
    }
    
    public IEnumerable<T> HoleAlle()
    {
        return _elemente.AsReadOnly();
    }
    
    public T HoleNachId(Func<T, bool> prädikat)
    {
        return _elemente.FirstOrDefault(prädikat);
    }
}

// Verwendung des generischen Repositories
var personenRepo = new GenericRepository<Person>();
personenRepo.Hinzufügen(new Person("Alice", 25));
```

## Moderne C# Funktionen

### Records (C# 9.0+)
```csharp
public record PersonRecord(string Name, int Alter);

// Verwendung von Records
var person1 = new PersonRecord("Hans", 30);
var person2 = person1 with { Alter = 31 };

// Record mit zusätzlichen Membern
public record Mitarbeiter(string Name, int Alter, string Abteilung)
{
    public decimal BerechneGehalt() => 50000m;
}
```

### Pattern Matching
```csharp
public static string BeschreibeWert(object obj) =>
    obj switch
    {
        string s => $"String mit Länge {s.Length}",
        int n when n < 0 => "Negative Zahl",
        int n => $"Positive Zahl: {n}",
        Person { Alter: > 18 } p => $"Erwachsener: {p.Name}",
        null => "Null-Wert",
        _ => "Unbekannter Typ"
    };
```

### Top-Level Statements (C# 9.0+)
```csharp
// Program.cs
using System;

Console.WriteLine("Hallo, Welt!");
await MacheEtwasAsync();

async Task MacheEtwasAsync()
{
    await Task.Delay(1000);
    Console.WriteLine("Fertig!");
}
```

### Init-only Properties (C# 9.0+)
```csharp
public class Konfiguration
{
    public string Host { get; init; }
    public int Port { get; init; }
    public string Datenbank { get; init; }
}

var config = new Konfiguration
{
    Host = "localhost",
    Port = 5432,
    Datenbank = "meindb"
};
```

## Entwurfsmuster

### Singleton-Muster
```csharp
public sealed class Singleton
{
    private static readonly Lazy<Singleton> _instanz =
        new Lazy<Singleton>(() => new Singleton());
        
    public static Singleton Instanz => _instanz.Value;
    
    private Singleton() { }
    
    public void MacheEtwas()
    {
        Console.WriteLine("Singleton-Methode aufgerufen");
    }
}
```

### Factory-Muster
```csharp
public interface ITier
{
    void MachGeräusch();
}

public class Hund : ITier
{
    public void MachGeräusch() => Console.WriteLine("Wuff!");
}

public class Katze : ITier
{
    public void MachGeräusch() => Console.WriteLine("Miau!");
}

public static class TierFactory
{
    public static ITier ErstelleTier(string typ) =>
        typ.ToLower() switch
        {
            "hund" => new Hund(),
            "katze" => new Katze(),
            _ => throw new ArgumentException("Ungültiger Tiertyp")
        };
}
```

## Beispielprojekte

### Erstellen einer REST-API
```csharp
[ApiController]
[Route("api/[controller]")]
public class BenutzerController : ControllerBase
{
    private readonly IBenutzerService _benutzerService;
    
    public BenutzerController(IBenutzerService benutzerService)
    {
        _benutzerService = benutzerService;
    }
    
    [HttpGet]
    public async Task<ActionResult<IEnumerable<Benutzer>>> HoleBenutzer()
    {
        var benutzer = await _benutzerService.HoleAlleBenutzerAsync();
        return Ok(benutzer);
    }
    
    [HttpPost]
    public async Task<ActionResult<Benutzer>> ErstelleBenutzer(BenutzerErstellenDto dto)
    {
        var benutzer = await _benutzerService.ErstelleBenutzerAsync(dto);
        return CreatedAtAction(nameof(HoleBenutzer), new { id = benutzer.Id }, benutzer);
    }
}
```

### Erstellen einer Desktop-Anwendung
```csharp
public partial class MainWindow : Window
{
    private readonly ObservableCollection<TodoElement> _todos = new();
    
    public MainWindow()
    {
        InitializeComponent();
        TodoListe.ItemsSource = _todos;
    }
    
    private void TodoHinzufügen_Click(object sender, RoutedEventArgs e)
    {
        if (string.IsNullOrWhiteSpace(TodoEingabe.Text))
            return;
            
        _todos.Add(new TodoElement
        {
            Titel = TodoEingabe.Text,
            ErstelltAm = DateTime.Now
        });
        
        TodoEingabe.Clear();
    }
}

public class TodoElement
{
    public string Titel { get; set; }
    public DateTime ErstelltAm { get; set; }
    public bool IstAbgeschlossen { get; set; }
}
```

## Best Practices

1. Verwende aussagekräftige Namen für Variablen, Methoden und Klassen
2. Folge den C#-Namenskonventionen
3. Schreibe sauberen, wartbaren Code
4. Verwende ordnungsgemäße Ausnahmebehandlung
5. Implementiere Schnittstellen für bessere Abstraktion
6. Verwende Dependency Injection
7. Schreibe Unit-Tests
8. Dokumentiere deinen Code
9. Verwende async/await korrekt
10. Folge den SOLID-Prinzipien

## Zusätzliche Ressourcen

1. [Microsoft C# Dokumentation](https://docs.microsoft.com/de-de/dotnet/csharp/)
2. [C# Programmierhandbuch](https://docs.microsoft.com/de-de/dotnet/csharp/programming-guide/)
3. [.NET API Browser](https://docs.microsoft.com/de-de/dotnet/api/)
4. [C# Corner](https://www.c-sharpcorner.com/)
{
    using var client = new HttpClient(); // HTTP-Client für Webanfragen erstellen
    return await client.GetStringAsync("https://api.example.com/data"); // Daten asynchron abrufen
}

// Mehrere asynchrone Operationen
public async Task ProcessDataAsync()
{
    var task1 = DownloadDataAsync(); // Ersten Download starten
    var task2 = DownloadDataAsync(); // Zweiten Download parallel starten
    
    await Task.WhenAll(task1, task2); // Auf Abschluss beider Downloads warten
}
```

### Sammlungen und Datenstrukturen
```csharp
// List<T> - Dynamische Array-Implementierung
List<int> zahlen = new(); // Moderne C#-Listeninitialisierung
zahlen.Add(1); // Einzelnes Element hinzufügen
zahlen.AddRange(new[] { 2, 3, 4 }); // Mehrere Elemente hinzufügen

// Dictionary<TKey, TValue> - Schlüssel-Wert-Paare
Dictionary<string, int> alter = new()
{
    ["Hans"] = 25, // Mit Werten initialisieren
    ["Alice"] = 30
};

// HashSet<T> - Sammlung eindeutiger Elemente
HashSet<string> eindeutigeNamen = new()
{
    "Hans", // Duplikate werden automatisch entfernt
    "Alice",
    "Hans" // Dies wird nicht hinzugefügt
};

// Queue<T> - FIFO-Datenstruktur
Queue<string> druckWarteschlange = new();
druckWarteschlange.Enqueue("Dokument1.pdf"); // Zur Warteschlange hinzufügen
var nächsterDruck = druckWarteschlange.Dequeue(); // Erstes Element entfernen und zurückgeben

// Stack<T> - LIFO-Datenstruktur
Stack<string> rückgängigStack = new();
rückgängigStack.Push("Aktion1"); // Zum Stack hinzufügen
var letzteAktion = rückgängigStack.Pop(); // Oberstes Element entfernen und zurückgeben
```

### Erweiterungsmethoden
```csharp
public static class StringErweiterungen
{
    // Erweiterungsmethode für String-Typ
    public static int WortAnzahl(this string str)
    {
        return str.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries).Length;
    }
    
    // Erweiterungsmethode mit Parametern
    public static string Kürzen(this string str, int maxLänge)
    {
        return str.Length <= maxLänge ? str : str[..maxLänge] + "...";
    }
}

// Verwendung von Erweiterungsmethoden
string text = "Dies ist ein Beispieltext";
int wortAnzahl = text.WortAnzahl(); // Verwendung der Erweiterungsmethode
string gekürzt = text.Kürzen(10); // Verwendung der parametrisierten Erweiterungsmethode
```

### Delegaten und Events
```csharp
// Delegatdeklaration
public delegate void NachrichtHandler(string nachricht);

// Event-Publisher-Klasse
public class NachrichtPublisher
{
    // Event-Deklaration
    public event NachrichtHandler NachrichtEmpfangen;
    
    // Methode zum Auslösen des Events
    public void NachrichtSenden(string nachricht)
    {
        NachrichtEmpfangen?.Invoke(nachricht); // Null-sichere Event-Auslösung
    }
}

// Event-Subscriber-Klasse
public class NachrichtSubscriber
{
    public void BeiNachrichtEmpfangen(string nachricht)
    {
        Console.WriteLine($"Nachricht empfangen: {nachricht}");
    }
}

// Verwendung
var publisher = new NachrichtPublisher();
var subscriber = new NachrichtSubscriber();
publisher.NachrichtEmpfangen += subscriber.BeiNachrichtEmpfangen; // Event abonnieren
```

### Fortgeschrittene LINQ-Operationen
```csharp
// Komplexe Datentransformationen
var produkte = new List<Produkt>();

var analyse = produkte
    .GroupBy(p => p.Kategorie) // Nach Kategorie gruppieren
    .Select(g => new
    {
        Kategorie = g.Key,
        DurchschnittsPreis = g.Average(p => p.Preis),
        GesamtProdukte = g.Count(),
        TeuersteProdukt = g.OrderByDescending(p => p.Preis).First()
    })
    .OrderByDescending(x => x.GesamtProdukte);

// Benutzerdefinierte LINQ-Operatoren
public static class LinqErweiterungen
{
    public static IEnumerable<T> DistinctBy<T, TKey>(
        this IEnumerable<T> quelle,
        Func<T, TKey> schlüsselSelector)
    {
        HashSet<TKey> geseheneSchlüssel = new();
        foreach (var element in quelle)
        {
            if (geseheneSchlüssel.Add(schlüsselSelector(element)))
            {
                yield return element;
            }
        }
    }
}
```

### Speicherverwaltung und Entsorgungsmuster
```csharp
public class RessourcenManager : IDisposable
{
    private bool entsorgt = false;
    private IntPtr nativeRessource;
    private ManagedRessource verwalteteRessource;

    public RessourcenManager()
    {
        nativeRessource = AllocateNativeResource();
        verwalteteRessource = new ManagedRessource();
    }

    // IDisposable implementieren
    public void Dispose()
    {
        Dispose(true);
        GC.SuppressFinalize(this);
    }

    // Geschützte Entsorgungsmethode
    protected virtual void Dispose(bool disposing)
    {
        if (!entsorgt)
        {
            if (disposing)
            {
                // Verwaltete Ressourcen entsorgen
                verwalteteRessource?.Dispose();
            }

            // Nicht verwaltete Ressourcen freigeben
            if (nativeRessource != IntPtr.Zero)
            {
                FreeNativeResource(nativeRessource);
                nativeRessource = IntPtr.Zero;
            }

            entsorgt = true;
        }
    }

    // Finalisierer
    ~RessourcenManager()
    {
        Dispose(false);
    }
}
```

### Fortgeschrittene Ausnahmebehandlung
```csharp
public class BenutzerdefinierteAusnahme : Exception
{
    public int Fehlercode { get; }

    public BenutzerdefinierteAusnahme(string nachricht, int fehlercode) 
        : base(nachricht)
    {
        Fehlercode = fehlercode;
    }
}

public async Task DatenMitWiederholungVerarbeitenAsync()
{
    int wiederholungsAnzahl = 3;
    int aktuellerVersuch = 0;

    while (aktuellerVersuch < wiederholungsAnzahl)
    {
        try
        {
            await DatenVerarbeitenAsync();
            break; // Erfolg, Schleife verlassen
        }
        catch (HttpRequestException ex)
        {
            aktuellerVersuch++;
            if (aktuellerVersuch == wiederholungsAnzahl)
            {
                throw new BenutzerdefinierteAusnahme(
                    "Fehler nach mehreren Versuchen", 
                    fehlercode: 500);
            }
            await Task.Delay(1000 * aktuellerVersuch); // Exponentielles Backoff
        }
    }
}
```

### Reflection und Attribute
```csharp
// Benutzerdefiniertes Attribut
[AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
public class PrüfungsAttribute : Attribute
{
    public string Beschreibung { get; }
    
    public PrüfungsAttribute(string beschreibung)
    {
        Beschreibung = beschreibung;
    }
}

// Verwendung von Reflection
public class ReflectionBeispiel
{
    public static void TypInspizieren<T>()
    {
        Type typ = typeof(T);
        
        // Alle öffentlichen Eigenschaften abrufen
        var eigenschaften = typ.GetProperties()
            .Select(p => new
            {
                Name = p.Name,
                Typ = p.PropertyType,
                Attribute = p.GetCustomAttributes()
            });
            
        // Alle Methoden mit spezifischem Attribut abrufen
        var geprüfteMethoden = typ.GetMethods()
            .Where(m => m.GetCustomAttribute<PrüfungsAttribute>() != null)
            .Select(m => new
            {
                Name = m.Name,
                Prüfung = m.GetCustomAttribute<PrüfungsAttribute>()
            });
    }
}
```

### Moderne C#-Funktionen (C# 9.0+)
```csharp
// Record-Typen
public record Person(string Vorname, string Nachname)
{
    public string VollerName => $"{Vorname} {Nachname}";
}

// Nur-Initialisierungs-Eigenschaften
public class Konfiguration
{
    public string Host { get; init; }
    public int Port { get; init; }
}

// Musterabgleich
public static string FormBeschreibungErhalten(Form form) => form switch
{
    Kreis { Radius: > 10 } => "Großer Kreis",
    Rechteck { Breite: var b, Höhe: var h } when b == h => "Quadrat",
    Dreieck { IstRechtwinklig: true } => "Rechtwinkliges Dreieck",
    _ => "Unbekannte Form"
};

// Top-Level-Anweisungen
using System;
Console.WriteLine("Hallo, Welt!"); // Keine explizite Main-Methode erforderlich
```

### Leistungsoptimierung
```csharp
// Span<T> für effiziente Speicheroperationen
public static void GroßesArrayVerarbeiten()
{
    byte[] großesArray = new byte[1000000];
    Span<byte> span = großesArray;
    
    // Effizientes Slicing ohne Allokation
    Span<byte> ausschnitt = span.Slice(0, 1000);
    
    // Direkte Speichermanipulation
    for (int i = 0; i < ausschnitt.Length; i++)
    {
        ausschnitt[i] = (byte)(i % 256);
    }
}

// Verwendung von ValueTask für Leistung
public async ValueTask<int> WertAbrufenAsync()
{
    if (_cache.TryGetValue("schlüssel", out var wert))
    {
        return (int)wert;
    }
    
    return await AufwändigeOperationAsync();
}
```

### Unit-Testing Best Practices
```csharp
[TestClass]
public class TaschenrechnerTests
{
    private Taschenrechner _taschenrechner;
    
    [TestInitialize]
    public void Aufsetzen()
    {
        _taschenrechner = new Taschenrechner();
    }
    
    [TestMethod]
    [DataRow(1, 2, 3)]
    [DataRow(-1, 1, 0)]
    [DataRow(0, 0, 0)]
    public void Addieren_SollteErwartetesErgebnisZurückgeben(
        int a, int b, int erwartet)
    {
        // Arrange
        // Act
        var ergebnis = _taschenrechner.Addieren(a, b);
        
        // Assert
        Assert.AreEqual(erwartet, ergebnis);
    }
    
    [TestMethod]
    [ExpectedException(typeof(DivideByZeroException))]
    public void Teilen_DurchNull_SollteAusnahmeWerfen()
    {
        _taschenrechner.Teilen(1, 0);
    }
}
```

### Design-Muster-Implementierung
```csharp
// Singleton-Muster
public sealed class Singleton
{
    private static readonly Lazy<Singleton> _instanz =
        new(() => new Singleton());
        
    public static Singleton Instanz => _instanz.Value;
    
    private Singleton() { }
}

// Fabrikmethoden-Muster
public abstract class DokumentFabrik
{
    public abstract IDokument DokumentErstellen();
}

public class PdfFabrik : DokumentFabrik
{
    public override IDokument DokumentErstellen()
    {
        return new PdfDokument();
    }
}

// Beobachter-Muster
public interface IBeobachter<T>
{
    void Aktualisieren(T daten);
}

public class Beobachtbar<T>
{
    private readonly List<IBeobachter<T>> _beobachter = new();
    
    public void Anhängen(IBeobachter<T> beobachter)
    {
        _beobachter.Add(beobachter);
    }
    
    public void Benachrichtigen(T daten)
    {
        foreach (var beobachter in _beobachter)
        {
            beobachter.Aktualisieren(daten);
        }
    }
}
```

## Best Practices und Tipps

### Code-Organisation
- Aussagekräftige Namen für Variablen, Methoden und Klassen verwenden
- Das Single-Responsibility-Prinzip befolgen
- Methoden klein und fokussiert halten
- Angemessene Ausnahmebehandlung implementieren
- Ordnungsgemäßes Logging implementieren
- Umfassende Unit-Tests schreiben
- Öffentliche APIs dokumentieren

### Leistungsüberlegungen
- Geeignete Sammlungstypen verwenden
- Ordnungsgemäße Entsorgungsmuster implementieren
- Werttypen für kleine, einfache Typen in Betracht ziehen
- async/await für I/O-Operationen verwenden
- Caching wo angemessen implementieren
- Code profilieren, um Engpässe zu identifizieren

### Sicherheits-Best-Practices
- Eingabevalidierung
- Ordnungsgemäße Ausnahmebehandlung
- Sichere Speicherung sensibler Daten
- Verschlüsselung wo notwendig verwenden
- Ordnungsgemäße Authentifizierung und Autorisierung implementieren
- Regelmäßige Sicherheitsaudits

## Beispielprojekte

### Web-API-Projektstruktur
```plaintext
MeineApi/
├── Controller/
│   ├── BenutzerController.cs
│   └── ProduktController.cs
├── Models/
│   ├── Benutzer.cs
│   └── Produkt.cs
├── Services/
│   ├── IBenutzerService.cs
│   └── BenutzerService.cs
├── Repositories/
│   ├── IRepository.cs
│   └── Repository.cs
└── Program.cs
```

### Konsolenanwendungsprojekt
```plaintext
KonsolenApp/
├── Models/
├── Services/
├── Utilities/
└── Program.cs
```

Dies schließt das umfassende C#-Tutorial ab. Jeder Abschnitt enthält praktische Beispiele und Erklärungen, die Ihnen helfen, C#-Konzepte effektiv zu verstehen und umzusetzen.
