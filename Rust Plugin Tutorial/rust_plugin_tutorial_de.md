# Vollständiges Rust Plugin-Entwicklungstutorial

## Inhaltsverzeichnis
1. [Einrichtung und Voraussetzungen](#einrichtung-und-voraussetzungen)
2. [Grundlegende Plugin-Struktur](#grundlegende-plugin-struktur)
3. [Plugin-Konfiguration](#plugin-konfiguration)
4. [Spielerdatenverwaltung](#spielerdatenverwaltung)
5. [Integration des Itemsystems](#integration-des-itemsystems)
6. [Spielmechanik](#spielmechanik)
7. [UI-System](#ui-system)
8. [Auto-Update-System](#auto-update-system)
9. [Struktur des Berechtigungssystems](#struktur-des-berechtigungssystems)
10. [C# Grundlagen für Rust Plugin-Entwicklung](#c-grundlagen-für-rust-plugin-entwicklung)
11. [Best Practices](#best-practices)
12. [Fehlerbehandlung und Protokollierung](#fehlerbehandlung-und-protokollierung)
13. [Plugin-Zusammenfassung: AutopickupOxideLamify](#plugin-zusammenfassung-autopickupoxidelamify)

## Einrichtung und Voraussetzungen

### Erforderliche Software
1. Visual Studio Code oder Visual Studio
2. .NET SDK
3. Oxide/uMod für Rust-Server
4. Referenz-DLLs von deinem Rust-Server:
   - Assembly-CSharp.dll
   - Oxide.Core.dll
   - Oxide.Rust.dll
   - UnityEngine.dll

### Projektsetup
1. Erstelle einen neuen Ordner für dein Plugin
2. Erstelle eine neue .cs-Datei mit deinem Plugin-Namen
3. Füge Referenzen zu den erforderlichen DLLs in deinem Projekt hinzu
4. Richte die grundlegende Plugin-Struktur ein (siehe unten)

### Tipps zur Entwicklungsumgebung
- Verwende Visual Studio Code mit C#-Erweiterung für besseres IntelliSense
- Richte Snippets für häufige Rust-Plugin-Muster ein
- Verwende einen Testserver für die Entwicklung

## Grundlegende Plugin-Struktur

Hier ist eine grundlegende Vorlage für ein Rust-Plugin:

```csharp
using Oxide.Core;
using Oxide.Core.Plugins;
using System.Collections.Generic;
using UnityEngine;

namespace Oxide.Plugins
{
    [Info("PluginName", "YourName", "1.0.0")]
    public class PluginName : RustPlugin
    {
        #region Felder
        private const string PermissionUse = "pluginname.use";
        #endregion

        #region Oxide-Hooks
        private void Init()
        {
            // Initialisiere dein Plugin
            permission.RegisterPermission(PermissionUse, this);
        }

        private void OnServerInitialized()
        {
            // Wird aufgerufen, wenn der Server vollständig gestartet ist
            LoadConfig();
        }

        void Unload()
        {
            // Aufräumen, wenn das Plugin entladen wird
        }
        #endregion
    }
}
```

## Plugin-Konfiguration

Konfigurationsmanagement ist entscheidend für jedes Plugin. So implementierst du es:


```csharp
#region Konfiguration
private Configuration config;

public class Configuration
{
    public bool EnableFeature { get; set; }
    public float CooldownTime { get; set; }
    public Dictionary<string, object> Settings { get; set; }

    public static Configuration DefaultConfig()
    {
        return new Configuration
        {
            EnableFeature = true,
            CooldownTime = 300f,
            Settings = new Dictionary<string, object>()
        };
    }
}

protected override void LoadConfig()
{
    base.LoadConfig();
    try
    {
        config = Config.ReadObject<Configuration>();
        if (config == null)
        {
            LoadDefaultConfig();
        }
    }
    catch
    {
        LoadDefaultConfig();
    }
    SaveConfig();
}

protected override void LoadDefaultConfig()
{
    config = Configuration.DefaultConfig();
}

protected override void SaveConfig()
{
    Config.WriteObject(config);
}
#endregion
```

## Spielerdatenverwaltung

Effektive Verwaltung von Spieldaten:


```csharp
#region Spielerdaten
private Dictionary<ulong, PlayerData> playerData = new Dictionary<ulong, PlayerData>();

public class PlayerData
{
    public string LastLocation { get; set; }
    public float LastLoginTime { get; set; }
    public Dictionary<string, int> Statistics { get; set; }

    public PlayerData()
    {
        Statistics = new Dictionary<string, int>();
    }
}

private void SavePlayerData()
{
    Interface.Oxide.DataFileSystem.WriteObject("PluginName/player_data", playerData);
}

private void LoadPlayerData()
{
    playerData = Interface.Oxide.DataFileSystem.ReadObject<Dictionary<ulong, PlayerData>>("PluginName/player_data") 
                ?? new Dictionary<ulong, PlayerData>();
}
```

## Integration des Itemsystems

Arbeiten mit Items und Inventaren:

```csharp
#region Itemverwaltung
private void GiveItem(BasePlayer player, string itemName, int amount)
{
    if (player == null || string.IsNullOrEmpty(itemName)) return;
    
    Item item = ItemManager.CreateByName(itemName, amount);
    if (item == null) return;

    if (!player.inventory.GiveItem(item))
    {
        item.Drop(player.GetDropPosition(), player.GetDropVelocity());
    }
}

private bool HasItem(BasePlayer player, string itemName, int amount)
{
    if (player == null || string.IsNullOrEmpty(itemName)) return false;
    
    return player.inventory.GetAmount(ItemManager.FindItemDefinition(itemName).itemid) >= amount;
}
```

## Spielmechanik

Implementierung gängiger Spielmechaniken:

```csharp
#region Spielmechanik
// Kampfsystem
private void OnEntityTakeDamage(BaseCombatEntity entity, HitInfo info)
{
    if (entity == null || info == null) return;
    
    BasePlayer attacker = info.InitiatorPlayer;
    BasePlayer victim = entity as BasePlayer;
    
    if (attacker == null || victim == null) return;
    
    // Deine Kampf-Logik hier
}

// Bewegungssystem
private void OnPlayerInput(BasePlayer player, InputState input)
{
    if (player == null || input == null) return;
    
    // Spielerbewegung handhaben
}

// Ressourcensammlung
private void OnDispenserGather(ResourceDispenser dispenser, BaseEntity entity, Item item)
{
    if (dispenser == null || entity == null || item == null) return;
    
    // Deine Sammel-Logik hier
}
```

## UI-System

### Grundlegende UI-Komponenten
```csharp
// UI-Container-Klasse zur Verwaltung aller UI-Elemente
private class UIManager
{
    private readonly string UIName = "MyPluginUI";
    private readonly Plugin Plugin;

    public UIManager(Plugin plugin)
    {
        Plugin = plugin;
    }

    public void CreateMainMenu(BasePlayer player)
    {
        // Erstelle Container
        var container = new CuiElementContainer();

        // Füge Panel hinzu
        container.Add(new CuiPanel
        {
            Image = { Color = "0 0 0 0.8" },
            RectTransform = { AnchorMin = "0.2 0.2", AnchorMax = "0.8 0.8" },
            CursorEnabled = true
        }, "Overlay", UIName);

        // Füge Titel hinzu
        container.Add(new CuiLabel
        {
            Text = { Text = "My Plugin Menu", FontSize = 20, Align = TextAnchor.MiddleCenter },
            RectTransform = { AnchorMin = "0 0.9", AnchorMax = "1 1" }
        }, UIName);

        // Füge Buttons hinzu
        AddButton(container, "Button 1", "0.1 0.7", "0.9 0.8", "mycommand 1");
        AddButton(container, "Button 2", "0.1 0.6", "0.9 0.7", "mycommand 2");

        // Zeige UI dem Spieler
        CuiHelper.DestroyUi(player, UIName);
        CuiHelper.AddUi(player, container);
    }

    private void AddButton(CuiElementContainer container, string text, string min, string max, string command)
    {
        var button = new CuiButton
        {
            Button = { Color = "0.7 0.7 0.7 0.8", Command = command },
            RectTransform = { AnchorMin = min, AnchorMax = max },
            Text = { Text = text, FontSize = 14, Align = TextAnchor.MiddleCenter }
        };
        container.Add(button, UIName);
    }
}
```

### Erweiterte UI-Funktionen
```csharp
public class AdvancedUIManager
{
    // Eingabefelder
    private void AddInputField(CuiElementContainer container, string name)
    {
        container.Add(new CuiElement
        {
            Parent = UIName,
            Components = {
                new CuiInputFieldComponent
                {
                    FontSize = 14,
                    Command = $"mycommand.input {name}",
                    Text = ""
                },
                new CuiRectTransformComponent
                {
                    AnchorMin = "0.1 0.5",
                    AnchorMax = "0.9 0.6"
                }
            }
        });
    }

    // Bilder-Panels
    private void AddImage(CuiElementContainer container, string imageUrl)
    {
        container.Add(new CuiElement
        {
            Parent = UIName,
            Components = {
                new CuiRawImageComponent { Url = imageUrl },
                new CuiRectTransformComponent
                {
                    AnchorMin = "0.1 0.1",
                    AnchorMax = "0.9 0.4"
                }
            }
        });
    }

    // Scrollbare Liste
    private void AddScrollableList(CuiElementContainer container, List<string> items)
    {
        float itemHeight = 0.05f;
        float currentY = 0.9f;

        foreach (var item in items)
        {
            container.Add(new CuiLabel
            {
                Text = { Text = item, FontSize = 12, Align = TextAnchor.MiddleLeft },
                RectTransform = 
                {
                    AnchorMin = $"0.1 {currentY - itemHeight}",
                    AnchorMax = $"0.9 {currentY}"
                }
            }, UIName);
            currentY -= itemHeight;
        }
    }
}
```

### Erweiterte UI-Systeme
1. **Leistung**
```csharp
// UI-Elemente zwischenspeichern
private readonly Dictionary<ulong, CuiElementContainer> _cachedUIs = 
    new Dictionary<ulong, CuiElementContainer>();

// Wiederverwenden von UI-Elementen
private CuiElementContainer GetOrCreateUI(BasePlayer player)
{
    if (_cachedUIs.TryGetValue(player.userID, out var container))
        return container;
        
    container = CreateNewUI();
    _cachedUIs[player.userID] = container;
    return container;
}
```

2. **Reponsive Design**
```csharp
// Positionen basierend auf Bildschirmgröße berechnen
private string GetResponsivePosition(float baseMin, float baseMax, float screenWidth)
{
    float adjustedMin = baseMin * (1920f / screenWidth);
    float adjustedMax = baseMax * (1920f / screenWidth);
    return $"{adjustedMin} {adjustedMax}";
}
```

3. **UI-Zustandsverwaltung**
```csharp
private class UIState
{
    public string CurrentPage { get; set; }
    public Dictionary<string, object> Data { get; set; }
    public float ScrollPosition { get; set; }

    public UIState()
    {
        Data = new Dictionary<string, object>();
    }
}

private readonly Dictionary<ulong, UIState> _uiStates = 
    new Dictionary<ulong, UIState>();
```

### Beispiel für die vollstückende UI-Implementierung
```csharp
public class PluginUI
{
    private const string MainUI = "MyPlugin_Main";
    private const string InventoryUI = "MyPlugin_Inventory";
    private readonly Plugin _plugin;
    private readonly Dictionary<ulong, UIState> _states;

    public PluginUI(Plugin plugin)
    {
        _plugin = plugin;
        _states = new Dictionary<ulong, UIState>();
    }

    public void ShowMainMenu(BasePlayer player)
    {
        var container = new CuiElementContainer();

        // Hauptpanel
        container.Add(new CuiPanel
        {
            Image = { Color = "0 0 0 0.8" },
            RectTransform = { AnchorMin = "0.2 0.2", AnchorMax = "0.8 0.8" },
            CursorEnabled = true
        }, "Overlay", MainUI);

        // Titel
        container.Add(new CuiLabel
        {
            Text = { Text = "Hauptmenü", FontSize = 20, Align = TextAnchor.MiddleCenter },
            RectTransform = { AnchorMin = "0 0.9", AnchorMax = "1 1" }
        }, MainUI);

        // Navigationsbuttons
        AddButton(container, "Inventar", "0.1 0.8", "0.45 0.9", 
            $"ui.switchpage {player.UserIDString} inventory");
        AddButton(container, "Einstellungen", "0.55 0.8", "0.9 0.9", 
            $"ui.switchpage {player.UserIDString} settings");

        // Inhaltsbereich
        var state = GetState(player);
        switch (state.CurrentPage)
        {
            case "inventory":
                ShowInventoryPage(container);
                break;
            case "settings":
                ShowSettingsPage(container);
                break;
            default:
                ShowWelcomePage(container);
                break;
        }

        // UI anzeigen
        CuiHelper.DestroyUi(player, MainUI);
        CuiHelper.AddUi(player, container);
    }

    private void ShowInventoryPage(CuiElementContainer container)
    {
        // Inventar-Gitter hinzufügen
        for (int i = 0; i < 24; i++)
        {
            int row = i / 6;
            int col = i % 6;
            float xMin = 0.1f + (col * 0.13f);
            float xMax = xMin + 0.12f;
            float yMin = 0.7f - (row * 0.13f);
            float yMax = yMin + 0.12f;

            container.Add(new CuiPanel
            {
                Image = { Color = "0.5 0.5 0.5 0.8" },
                RectTransform = { 
                    AnchorMin = $"{xMin} {yMin}", 
                    AnchorMax = $"{xMax} {yMax}" 
                }
            }, MainUI, $"slot_{i}");
        }
    }

    private void ShowSettingsPage(CuiElementContainer container)
    {
        // Steuerungen für die Einstellungen
        AddInputField(container, "Name", "0.1 0.7", "0.9 0.8", "settings.name");
        AddToggle(container, "Benachrichtigungen aktivieren", "0.1 0.6", "0.9 0.7", "settings.notifications");
        AddSlider(container, "Lautstärke", "0.1 0.5", "0.9 0.6", "settings.volume");
    }

    private UIState GetState(BasePlayer player)
    {
        if (!_states.TryGetValue(player.userID, out var state))
        {
            state = new UIState();
            _states[player.userID] = state;
        }
        return state;
    }

    // Hilfsmethoden für UI-Elemente...
}
```

### UI-Befehle und Hooks
```csharp
[ChatCommand("menu")]
private void CommandMenu(BasePlayer player, string command, string[] args)
{
    _ui.ShowMainMenu(player);
}

[ConsoleCommand("ui.switchpage")]
private void ConsoleCommandSwitchPage(ConsoleSystem.Arg arg)
{
    var player = arg.Player();
    if (player == null) return;

    string page = arg.GetString(1);
    var state = _ui.GetState(player);
    state.CurrentPage = page;
    _ui.ShowMainMenu(player);
}
```

## Auto-Update-System

Implementierung der Versionsüberprüfung und Auto-Updates:

```csharp
#region Auto-Update
private const string ApiUrl = "https://your-api.com/version.json";

private void CheckForUpdates()
{
    webrequest.Enqueue(ApiUrl, "", (code, response) =>
    {
        if (code != 200 || string.IsNullOrEmpty(response)) return;
        
        // Analysiere Versionsinformationen und aktualisiere bei Bedarf
        // Beispiel: JsonConvert.DeserializeObject<VersionInfo>(response);
    }, this);
}
```

## Struktur des Berechtigungssystems

Das Verständnis und die Implementierung eines ordnungsgemäßen Berechtigungssystems sind entscheidend für jedes Rust-Plugin. Hier ist eine umfassende Anleitung zur Erstellung und Verwaltung von Berechtigungen:

### Basic Berechtigungsstruktur
```csharp
#region Berechtigungen
private const string PermissionUse = "pluginname.use";
private const string PermissionAdmin = "pluginname.admin";
private const string PermissionVIP = "pluginname.vip";

private void RegisterPermissions()
{
    // Registriere alle Berechtigungen während der Plugin-Initialisierung
    permission.RegisterPermission(PermissionUse, this);
    permission.RegisterPermission(PermissionAdmin, this);
    permission.RegisterPermission(PermissionVIP, this);
}

// Rufe dies in deiner Init()-Methode auf
private void Init()
{
    RegisterPermissions();
}
```

### Methoden zur Berechtigungsprüfung
```csharp
#region Berechtigungsprüfung
private bool HasPermission(BasePlayer player, string perm)
{
    if (player == null || string.IsNullOrEmpty(perm))
        return false;
        
    return permission.UserHasPermission(player.UserIDString, perm);
}

// Überprüfe mehrere Berechtigungen (irgendeine)
private bool HasAnyPermission(BasePlayer player, params string[] perms)
{
    if (player == null || perms == null)
        return false;
        
    foreach (string perm in perms)
    {
        if (HasPermission(player, perm))
            return true;
    }
    return false;
}

// Überprüfe mehrere Berechtigungen (alle)
private bool HasAllPermissions(BasePlayer player, params string[] perms)
{
    if (player == null || perms == null)
        return false;
        
    foreach (string perm in perms)
    {
        if (!HasPermission(player, perm))
            return false;
    }
    return true;
}
#endregion
```

### Implementierungsbeispiele
```csharp
#region Verwendung von Berechtigungen
// Beispielbefehl mit Berechtigungsprüfung
[ChatCommand("example")]
private void ExampleCommand(BasePlayer player, string command, string[] args)
{
    if (!HasPermission(player, PermissionUse))
    {
        SendMessage(player, "Du hast keine Berechtigung, diesen Befehl zu verwenden!");
        return;
    }
    
    // Befehl-Logik hier
}

// Beispiel mit mehreren Berechtigungsebenen
[ChatCommand("admin")]
private void AdminCommand(BasePlayer player, string command, string[] args)
{
    if (!HasPermission(player, PermissionAdmin))
    {
        SendMessage(player, "Dieser Befehl erfordert Administrationsberechtigungen!");
        return;
    }
    
    // Admin-Befehl-Logik hier
}

// Beispiel mit VIP-Funktionen
private void OnGatherItem(BasePlayer player, Item item)
{
    if (HasPermission(player, PermissionVIP))
    {
        // VIP-Spieler erhalten doppelte Ressourcen
        item.amount *= 2;
    }
}

// Beispiel mit mehreren Berechtigungsüberprüfungen
[ChatCommand("special")]
private void SpecialCommand(BasePlayer player, string command, string[] args)
{
    if (HasAnyPermission(player, PermissionVIP, PermissionAdmin))
    {
        // Besondere Funktion für VIP- oder Admin-Spieler
    }
    else
    {
        SendMessage(player, "Diese Funktion erfordert VIP- oder Admin-Berechtigungen!");
    }
}
#endregion
```

### Gruppenbasierte Berechtigungen
```csharp
#region Gruppenberechtigungen
// Füge einen Spieler zu einer Gruppe hinzu
private void AddToGroup(BasePlayer player, string group)
{
    if (player == null || string.IsNullOrEmpty(group))
        return;
        
    permission.AddUserGroup(player.UserIDString, group);
}

// Entferne einen Spieler aus einer Gruppe
private void RemoveFromGroup(BasePlayer player, string group)
{
    if (player == null || string.IsNullOrEmpty(group))
        return;
        
    permission.RemoveUserGroup(player.UserIDString, group);
}

// Überprüfe, ob ein Spieler in einer Gruppe ist
private bool IsInGroup(BasePlayer player, string group)
{
    if (player == null || string.IsNullOrEmpty(group))
        return false;
        
    return permission.UserHasGroup(player.UserIDString, group);
}
#endregion
```

### Hilfsmethoden zur Berechtigungsverwaltung
```csharp
#region Berechtigungshelfer
// Hole alle Berechtigungen für einen Spieler
private List<string> GetPlayerPermissions(BasePlayer player)
{
    if (player == null)
        return new List<string>();
        
    return permission.GetUserPermissions(player.UserIDString);
}

// Hole alle Gruppen für einen Spieler
private List<string> GetPlayerGroups(BasePlayer player)
{
    if (player == null)
        return new List<string>();
        
    return permission.GetUserGroups(player.UserIDString);
}

// Gewähre temporäre Berechtigung
private void GrantTemporaryPermission(BasePlayer player, string perm, float duration)
{
    if (player == null || string.IsNullOrEmpty(perm))
        return;
        
    permission.GrantUserPermission(player.UserIDString, perm, this);
    timer.Once(duration, () => 
    {
        permission.RevokeUserPermission(player.UserIDString, perm);
    });
}
#endregion
```

### Best Praktiken für Berechtigungen

1. **Namenkonvention**
   - Verwende kleine Buchstaben für alle Berechtigungen
   - Folge dem Format: `pluginname.permissiontype`
   - Beispiel: `harvester.use`, `harvester.admin`, `harvester.vip`

2. **Berechtigungsverzeichnis**
   - Erstelle eine grundlegende Berechtigungsstruktur
   - Berücksichtige diese Standardlevel:
     - `.use` - Grundlegende Plugin-Nutzung
     - `.admin` - Administrativen Funktionen
     - `.vip` - Spezielle Funktionen für VIP Spieler

3. **Dokumentation**
   - Dokumentiere deine Berechtigungen immer in deiner Plugin-README oder -Konfiguration
   - Beispiel:
```markdown
## Berechtigungen
- `pluginname.use` - Erlaubt grundlegende Plugin-Nutzung
- `pluginname.admin` - Erlaubt Zugriff auf Admin-Befehle
- `pluginname.vip` - Gewährt Zugriff auf VIP-Funktionen
```

4. **Berechtigungsprüfungen**
   - Überprüfe immer die Berechtigungen, bevor du eingeschränkte Befehle ausführst
   - Verwende Hilfsmethoden, um die Berechtigungsprüfung übersichtlicher zu gestalten
   - Ziehe in Betracht, Berechtigungsresultate zu cachen, um háufig überprüfte Berechtigungen zu optimieren

## C# Grundlagen für Rust Plugin-Entwicklung

In diesem Abschnitt werden die grundlegenden C#-Konzepte behandelt, die du für die Rust-Plugin-Entwicklung wissen musst.

### 1. Variablen und Datentypen
```csharp
// Häufig verwendete Datentypen in Rust-Plugins
private int playerId = 12345;                // Ganze Zahlen
private float distance = 10.5f;              // Dezimalzahlen (beachte das 'f'-Suffix)
private string playerName = "Player123";      // Text
private bool isAdmin = false;                // Wahr/Falsch-Werte
private Vector3 position = new Vector3(0, 0, 0); // 3D-Koordinaten
private Dictionary<ulong, PlayerData> players = new Dictionary<ulong, PlayerData>(); // Schlüssel-Wert-Paare

// Konstanten (Werte, die sich nie ändern)
private const string PERMISSION_USE = "plugin.use";
```

### 2. 2. Kollektionen und Listen
```csharp
// Liste - Dynamisches Array von Elementen
private List<BasePlayer> activePlayers = new List<BasePlayer>();
activePlayers.Add(player);                   // Element hinzufügen
activePlayers.Remove(player);                // Element entfernen
bool hasPlayer = activePlayers.Contains(player); // Überprüfen, ob vorhanden

// Dictionary - Schlüssel-Wert-Paare
private Dictionary<ulong, PlayerData> playerData = new Dictionary<ulong, PlayerData>();
playerData[player.userID] = new PlayerData(); // Hinzufügen oder aktualisieren
playerData.Remove(player.userID);            // Entfernen
bool exists = playerData.ContainsKey(player.userID); // Überprüfen, ob vorhanden

// HashSet - Einzigartige Sammlung von Elementen (schneller als Liste bei Nachschlägen)
private HashSet<ulong> uniquePlayerIds = new HashSet<ulong>();
uniquePlayerIds.Add(player.userID);          // Element hinzufügen
uniquePlayerIds.Remove(player.userID);       // Element entfernen
```

### 3. Klassen und Objekte
```csharp
// Grundlegende Klassenstruktur
public class PlayerData
{
    // Eigenschaften
    public string Name { get; set; }
    public Vector3 LastPosition { get; set; }
    public float LastSeen { get; set; }
    
    // Konstruktor
    public PlayerData(string name)
    {
        Name = name;
        LastSeen = Time.time;
    }
    
    // Methode
    public void UpdatePosition(Vector3 newPosition)
    {
        LastPosition = newPosition;
        LastSeen = Time.time;
    }
}

// Verwendung der Klasse
PlayerData player = new PlayerData("Player123");
player.UpdatePosition(new Vector3(100, 0, 100));
```

### 4. Methoden und Funktionen
```csharp
// Grundlegende Methodensyntax
private void HandlePlayer(BasePlayer player, string action)
{
    if (player == null) return;  // Frühe Rückkehr bei ungültiger Eingabe
    
    switch (action)
    {
        case "heal":
            player.Heal(100f);
            break;
        case "kill":
            player.Die();
            break;
    }
}

// Methode mit Rückgabewert
private bool IsPlayerEligible(BasePlayer player)
{
    if (player == null) return false;
    return player.IsAdmin || HasPermission(player, PERMISSION_USE);
}

// Methode mit optionalen Parametern
private void GiveResources(BasePlayer player, int amount = 100, string resourceType = "wood")
{
    // amount und resourceType haben Standardwerte, wenn nicht spezifiziert
}
```

### 5. Nullüberprüfung und Sicherheit
```csharp
// Sichere Nullüberprüfung
private void ProcessPlayer(BasePlayer player)
{
    // Frühe Rückkehr, wenn null
    if (player == null) return;
    
    // Nullbedingter Operator
    string playerName = player?.displayName ?? "Unknown";
    
    // Sichere Dictionary-Zugriffe
    PlayerData data;
    if (playerData.TryGetValue(player.userID, out data))
    {
        // Verwende Daten sicher
    }
}
```

### 6. String-Operationen
```csharp
// String-Formatierung
string message = string.Format("Spieler {0} hat {1} Punkte", playerName, points);
string message2 = $"Spieler {playerName} hat {points} Punkte"; // String-Interpolation

// String-Manipulation
string lowercaseCmd = command.ToLower();
string[] args = command.Split(' ');
bool isCommand = command.StartsWith("/");
string cleaned = command.Trim();
```

### 7. Timer und Coroutinen
```csharp
// Einmal-Timer
timer.Once(5f, () => {
    // Code, der nach 5 Sekunden ausgeführt wird
});

// Wiederholter Timer
timer.Repeat(1f, 0, () => {
    // Code, der jede Sekunde ausgeführt wird (0 bedeutet unendliche Wiederholungen)
});

// Timer mit Abbrechen
Timer myTimer = timer.Once(10f, () => {
    // Code, der ausgeführt wird
});
myTimer?.Destroy(); // Timer bei Bedarf abbrechen
```

### 8. Fehlerbehandlung
```csharp
// Try-Catch-Blöcke
private void SafeOperation()
{
    try
    {
        // Riskanter Code hier
        Item item = ItemManager.CreateByName("wood", 1000);
        player.GiveItem(item);
    }
    catch (Exception ex)
    {
        // Fehler behandeln
        PrintError($"Geben von Gegenständen fehlgeschlagen: {ex.Message}");
    }
}
```

### 9. LINQ (Language Integrated Query)
```csharp
// Nützliche LINQ-Operationen für Sammlungen
private void LinqExamples()
{
    // Finde Spieler im Umkreis
    var nearbyPlayers = BasePlayer.activePlayerList
        .Where(p => Vector3.Distance(p.transform.position, position) <= range)
        .ToList();
    
    // Hole Online-Spieler mit Berechtigung
    var admins = BasePlayer.activePlayerList
        .Where(p => HasPermission(p, "admin"))
        .ToList();
    
    // Finde ersten passenden Spieler
    var player = BasePlayer.activePlayerList
        .FirstOrDefault(p => p.displayName == targetName);
}
```

### 10. Async/Await-Muster
```csharp
// Asynchrone Webanfragen
private void FetchData(string url)
{
    webrequest.Enqueue(url, null, (code, response) =>
    {
        if (code != 200)
        {
            PrintError($"Datenabfrage fehlgeschlagen: {code}");
            return;
        }
        
        // Verarbeite die Antwort
        ProcessData(response);
    }, this);
}
```

### Best Practices für C# in Rust-Plugins

1. **Immer auf Null überprüfen**
   ```csharp
   if (player == null) return;
   ```

2. **Frühe Rückgaben verwenden**
   ```csharp
    private void ProcessCommand(BasePlayer player, string[] args)
    {
    if (player == null) return;
    if (args == null || args.Length == 0) return;
    // Hauptlogik hier
    }
   ```

3. **Ressourcen bereitstellen**
   ```csharp
    private void CleanupResources()
    {
    foreach (var timer in _timers)
        timer?.Destroy();
    _timers.Clear();
    }
   ```

4. **Verwende Konstanten für magische Zahlen/Strings**
   ```csharp
    private const float RELOAD_TIME = 3.0f;
    private const string PERMISSION_PREFIX = "myplugin";
   ```

5. **Richtige Namenskonventionen**
   ```csharp
   // Private Felder beginnen mit Unterstrich
    private Dictionary<ulong, PlayerData> _playerData;

    // Öffentliche Eigenschaften verwenden PascalCase
    public float ReloadTime { get; set; }

    // Methoden verwenden PascalCase
    private void HandlePlayerSpawn(BasePlayer player)
   ```

## Fehlerbehandlung und Protokollierung

### Effektive Protokollierungsstrategien
```csharp
public class MyPlugin : RustPlugin
{
    // Protokollstufen
    private void LogDebug(string message) => Puts($"[Debug] {message}");
    private void LogInfo(string message) => Puts($"[Info] {message}");
    private void LogWarning(string message) => PrintWarning($"[Warning] {message}");
    private void LogError(string message) => PrintError($"[Error] {message}");

    // Detailliertes Protokollieren mit Kontext
    private void LogWithContext(string context, string message, string level = "Info")
    {
        var timestamp = DateTime.Now.ToString("HH:mm:ss");
        Puts($"[{timestamp}][{level}][{context}] {message}");
    }

    // Leistungsprotokollierung
    private void LogPerformance(string operation, Action action)
    {
        var sw = System.Diagnostics.Stopwatch.StartNew();
        try
        {
            action();
        }
        finally
        {
            sw.Stop();
            LogInfo($"{operation} dauerte {sw.ElapsedMilliseconds}ms");
        }
    }
}
```

### Ausnahmebehandlung Best Practices
```csharp
public class ExceptionHandling : RustPlugin
{
    // Methodebene Try-Catch
    private void SafeExecute(Action action)
    {
        try
        {
            action();
        }
        catch (Exception ex)
        {
            // Protokolliere die vollständigen Ausnahme-Details
            LogError($"Fehlerdetails: {ex.Message}\nStacktrace: {ex.StackTrace}");
            
            // Benutzerfreundliche Nachricht an den Spieler
            SendMessage(player, "Ein Fehler ist aufgetreten. Bitte versuche es später erneut.");
        }
    }

    // Validierungschecks
    private bool ValidateInput(BasePlayer player, Item item)
    {
        if (player == null)
        {
            LogError("Spieler ist null");
            return false;
        }

        if (item == null)
        {
            LogError($"Gegenstand ist null für Spieler {player.displayName}");
            return false;
        }

        return true;
    }

    // Wiederherstellung des Zustands
    private void RecoverFromError(BasePlayer player)
    {
        // Säubere temporären Zustand
        _temporaryData.Remove(player.userID);
        
        // Zurücksetzen des Spielerstatus
        player.inventory.SendUpdatedInventory();
        
        // Protokolliere den Rückversuch
        LogInfo($"Wiederherstellung nach Fehler für Spieler {player.displayName}");
    }
}
```

### Debug Logging System
```csharp
public class DebugSystem : RustPlugin
{
    private Configuration _config;
    
    public class Configuration
    {
        public bool DebugMode { get; set; }
        public List<string> DebugComponents { get; set; }
    }

    private void Debug(string component, string message)
    {
        if (!_config.DebugMode) return;
        if (!_config.DebugComponents.Contains(component)) return;
        
        LogDebug($"[{component}] {message}");
    }

    // Usage example
    private void OnPlayerConnected(BasePlayer player)
    {
        Debug("PlayerSystem", $"Player {player.displayName} connected with ID {player.userID}");
        Debug("Inventory", $"Player has {player.inventory.containerMain.itemList.Count} items");
    }
}
```

## Plugin-Zusammenfassung: AutopickupOxideLamify

Lass uns das Auto Pickup Barrel-Plugin aufschlüsseln und jeden Bestandteil verstehen:

### 1. Header und Importe
```csharp
// Notwendige Namespaces importieren
using System;  // Erforderlich für grundlegende C#-Funktionalität wie Ausnahmebehandlung
using System.Collections.Generic;  // Erforderlich für List<T> und Dictionary<TKey,TValue>
using UnityEngine;  // Erforderlich für Unity-Typen wie Vector3
using Oxide.Core;   // Kern-Oxide-Funktionalität
using Oxide.Core.Plugins;  // Erforderlich für die RustPlugin-Basisklasse
```

### 2. Namespace und Klassendeklaration
```csharp
namespace Oxide.Plugins  // Standardnamespace für Oxide-Plugins
{
    // Plugin-Informationsattribut
    [Info("Auto Pickup Barrel", // Plugin-Name wie im Oxide angezeigt
          "Lamify",            // Autorname
          "1.0.1")]            // Versionsnummer
    
    // Hauptplugin-Klasse, erbt von RustPlugin
    public class AutopickupOxideLamify : RustPlugin
}
```

### 3. Konstanten und Felder
```csharp
// Maximale Entfernung (in Unity-Einheiten), in der ein Spieler sich von einem Barrel befinden kann, um es automatisch aufzuheben
private const float PICKUP_RADIUS = 6f;  

// Berechtigung, die Spieler benötigen, um dieses Plugin zu nutzen
private const string USE_PERMISSION = "autopickupoxidelamify.use";

// Array von Strings zur Identifizierung verschiedener Barrelltypen im Spiel
private static readonly string[] BARREL_IDENTIFIERS = { 
    "barrel",         // Standardtonne
    "loot-barrel",    // Besondere Loottonne
    "barrel.prefab",  // Referenz der Barrell-Präfabrizierung
    "loot_barrel"     // Alternative Barrell-Bezeichnung
};
```

### 4. Serverinitialisierung
```csharp
// Wird aufgerufen, wenn der Server startet
private void OnServerInitialized()
{
    // Registriere unsere Berechtigung im Berechtigungssystem von Oxide
    permission.RegisterPermission(USE_PERMISSION, this);
}
```

### 5. Berechtigungsprüfungs-Methode
```csharp
// Methode, um zu überprüfen, ob ein Spieler die Berechtigung hat, das Plugin zu verwenden
private bool HasAccess(BasePlayer player)
{
    return player != null &&  // Zunächst überprüfen, ob der Spieler existiert
           permission.UserHasPermission(player.UserIDString, USE_PERMISSION);  // Dann Berechtigung überprüfen
}
```

### 6. Hauptereignishandler
```csharp
// Wird aufgerufen, wenn eine Entität im Spiel stirbt
private void OnEntityDeath(BaseCombatEntity entity, HitInfo info)
{
    try  // Verpacke alles in try-catch für die Fehlerbehandlung
    {
        // VALIDIERUNGSABSCHNITT
        
        // Überprüfen, ob:
        // - die Entität existiert
        // - die Hit-Informationen existieren und einen Spieler haben
        // - der Spieler die Berechtigung hat
        if (entity == null || info?.InitiatorPlayer == null || !HasAccess(info.InitiatorPlayer)) 
            return;  // Verlasse, wenn eine Überprüfung fehlschlägt

        // Versuche die Entität auf einen LootContainer (Barrel) zu casten
        var barrel = entity as LootContainer;
        
        // Überprüfen, ob:
        // - der Cast erfolgreich war
        // - der Entitätsname mit unseren Barrel-Identifiers übereinstimmt
        if (barrel == null || !IsBarrel(barrel.PrefabName)) 
            return;  // Verlasse, wenn es sich nicht um ein gültiges Barrel handelt

        // Überprüfe die Entfernung zwischen dem Spieler und dem Barrel
        if (Vector3.Distance(info.InitiatorPlayer.transform.position, 
                           barrel.transform.position) > PICKUP_RADIUS)
            return;  // Verlasse, wenn das Barrel zu weit weg ist

        // ELEMENT-SAMMLUNGSABSCHNITT
        
        // Speichere die Spielerinformationen für die Verwendung nach NextTick
        var playerId = info.InitiatorPlayer.userID;
        var playerPos = info.InitiatorPlayer.transform.position;

        // Erstelle eine Liste zum Speichern der Gegenstands-Informationen
        var itemsToGive = new List<ItemInfo>();
        
        // Überprüfe, ob das Barrel ein Inventar hat
        if (barrel.inventory != null)
        {
            // Durchlaufe jedes Element im Barrel
            foreach (var item in barrel.inventory.itemList)
            {
                // Wenn das Element existiert, speichere seine Information
                if (item != null)
                {
                    itemsToGive.Add(new ItemInfo 
                    { 
                        ItemId = item.info.itemid,  // Welche Art von Objekt
                        Amount = item.amount,        // Wie viele
                        Skin = item.skin            // Welches Skin
                    });
                }
            }
        }

        // BARREL-AUFRÄUMUNG
        
        // Verhindere, dass das Barrel gespeichert wird, um Duplikate zu vermeiden
        barrel.EnableSaving(false);
        
        // Entferne das Barrel aus dem Spiel
        barrel.Kill(BaseNetworkable.DestroyMode.None);

        // ELEMENT-DISTRIBUTIONSABSCHNITT
        
        // Fahre nur fort, wenn wir Gegenstände zu vergeben haben
        if (itemsToGive.Count > 0)
        {
            // Plane die Elementverteilung für den nächsten Server-Tick
            NextTick(() => 
            {
                try
                {
                    // Finde den Spieler erneut (er könnte die Verbindung getrennt haben)
                    var player = BasePlayer.FindByID(playerId);
                    
                    // Verlasse, wenn der Spieler verschwunden oder getrennt ist
                    if (player == null || !player.IsConnected)
                        return;

                    // Verarbeite jedes Element, das wir gespeichert haben
                    foreach (var itemInfo in itemsToGive)
                    {
                        // Erstelle eine neue Instanz des Elements
                        var item = ItemManager.CreateByItemID(
                            itemInfo.ItemId,   // Objektart
                            itemInfo.Amount,   // Stapelgröße
                            itemInfo.Skin      // Objekt-Skin
                        );

                        // Wenn das Element erfolgreich erstellt wurde
                        if (item != null)
                        {
                            // INVENTARPLATZIERUNGSPROBEN

                            // 1. Versuche zuerst das Hauptinventar
                            if (player.inventory.GiveItem(item))
                                continue;  // Erfolg - gehe zum nächsten Element

                            // 2. Versuche den Rucksack, wenn das Inventar voll ist
                            var wear = player.inventory.containerWear;
                            
                            // Suche nach entweder Rucksack-Typ
                            // -907422733 = Erster Rucksacktyp
                            // 2068884361 = Alternativer Rucksack
                            var backpack = wear.FindItemByItemID(-907422733) ?? 
                                         wear.FindItemByItemID(2068884361);

                            // Wenn der Rucksack existiert und Platz hat
                            if (backpack?.contents != null && 
                                item.MoveToContainer(backpack.contents))
                                continue;  // Erfolg - gehe zum nächsten Element

                            // 3. Letzte Hoffnung - lasse es auf den Füßen des Spielers fallen
                            item.Drop(
                                playerPos + new Vector3(0, 0.1f, 0),  // Etwas über dem Boden
                                Vector3.zero  // Keine Wurfgeschwindigkeit
                            );
                        }
                    }

                    // Aktualisiere das Inventar-UI des Spielers
                    player.SendNetworkUpdate();
                }
                catch (Exception ex)
                {
                    // Protokolliere alle Fehler während der Elementverteilung
                    PrintError($"Fehler beim Geben von Gegenständen: {ex.Message}");
                }
            });
        }
    }
    catch (Exception ex)
    {
        // Protokolliere alle Fehler in der Hauptlogik
        PrintError($"Fehler in OnEntityDeath: {ex.Message}");
    }
}
```

### 7. Hilfsmethoden
```csharp
// Methode um zu überprüfen, ob ein Präfabname zu einem Barrel gehört
private bool IsBarrel(string prefabName)
{
    // Frühe Rückkehr, wenn der Name null oder leer ist
    if (string.IsNullOrEmpty(prefabName))
        return false;
    
    // Konvertiere zu Kleinbuchstaben für die Groß-/Kleinschreibung
    prefabName = prefabName.ToLower();
    
    // Überprüfe, ob der Name einen unserer Barrel-Identifier enthält
    foreach (var identifier in BARREL_IDENTIFIERS)
        if (prefabName.Contains(identifier)) 
            return true;
    
    // Ist kein Barrel, wenn wir hier sind
    return false;
}

// Klasse zur Speicherung von Gegenstandsinformationen zwischen Ticks
private class ItemInfo
{
    public int ItemId { get; set; }    // Art-ID des Gegenstands
    public int Amount { get; set; }     // Stapelgröße
    public ulong Skin { get; set; }     // Skin-ID des Gegenstands
}
```

### 8. Plugin-Ausführungsfluss

1. **Plugin-Laden**
   ```csharp
    // Server startet → OnServerInitialized wird aufgerufen
    // Berechtigung registriert → USE_PERMISSION wird zu Oxide hinzugefügt
   ```

2. **Spieler bricht Barrel**
   ```csharp
    // Entität stirbt → OnEntityDeath wird ausgelöst
    // Validierungsprüfungen werden ausgeführt
    // Entfernung wird überprüft
   ```

3. **Elementverarbeitung**
   ```csharp
    // Elemente werden vom Barrel gesammelt
    // Barrel wird aus dem Spiel entfernt
    // Elemente werden in der itemsToGive-Liste gespeichert
   ```

4. **Next Tick Verarbeitung**
   ```csharp
    // Nächster Tick wird ausgelöst
    // Spieler wird validiert
    // Elemente werden erstellt und verteilt
    // Inventar wird aktualisiert
   ```

### 9. Fehlerfälle

1. **Ungültige Entität**
   ```csharp
   if (entity == null) return;  // Leise verlassen
   ```

2. **Kein Spieler**
   ```csharp
   if (info?.InitiatorPlayer == null) return;  // Leise verlassen
   ```

3. **Keine Berechtigung**
   ```csharp
   if (!HasAccess(info.InitiatorPlayer)) return;  // Leise verlassen
   ```

4. **Zu weit weg**
   ```csharp
   if (Vector3.Distance(...) > PICKUP_RADIUS) return;  // Leise verlassen
   ```

5. **Elementerstellungsfehler**
   ```csharp
   if (item != null)  // Nur fortfahren, wenn das Element erfolgreich erstellt wurde
   ```

6. **Inventar voll**
   ```csharp
    // Hauptinventar zunächst versuchen
    // Rucksack versuchen
    // Schließlich auf den Boden werfen
   ```

### 10. Leistungsüberlegungen

1. **Asynchrone Operationen**
   ```csharp
   NextTick(() => { ... });  // Verhindert Serververzögerung
   ```

2. **Frühe Rückgaben**
   ```csharp
   if (condition) return;  // Frühe Rückkehr bei Ungültigkeit
   ```

3. **Effiziente Überprüfungen**
   ```csharp
   string.IsNullOrEmpty(prefabName)  // Einzelne Prüfung anstelle von zwei
   ```

4. **Speicherverwaltung**
   ```csharp
   barrel.EnableSaving(false)  // Verhindert unnötige Speicherung
   ```

{{ ... }}
