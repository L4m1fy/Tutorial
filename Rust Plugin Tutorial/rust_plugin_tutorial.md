# Complete Rust Plugin Development Tutorial

## Table of Contents
1. [Setup and Prerequisites](#setup-and-prerequisites)
2. [Basic Plugin Structure](#basic-plugin-structure)
3. [Plugin Configuration](#plugin-configuration)
4. [Player Data Management](#player-data-management)
5. [Item System Integration](#item-system-integration)
6. [Game Mechanics](#game-mechanics)
7. [UI System](#ui-system)
8. [Auto-Update System](#auto-update-system)
9. [Permission System Structure](#permission-system-structure)
10. [C# Basics for Rust Plugin Development](#c-basics-for-rust-plugin-development)
11. [Best Practices](#best-practices)
12. [Error Handling and Logging](#error-handling-and-logging)
13. [Plugin Breakdown: AutopickupOxideLamify](#plugin-breakdown-autopickupoxidelamify)

## Setup and Prerequisites

### Required Software
1. Visual Studio Code or Visual Studio
2. .NET SDK
3. Oxide/uMod for Rust server
4. Reference DLLs from your Rust server:
   - Assembly-CSharp.dll
   - Oxide.Core.dll
   - Oxide.Rust.dll
   - UnityEngine.dll

### Project Setup
1. Create a new folder for your plugin
2. Create a new .cs file with your plugin name
3. Add references to the required DLLs in your project
4. Set up basic plugin structure (shown below)

### Development Environment Tips
- Use Visual Studio Code with C# extension for better IntelliSense
- Set up snippets for common Rust plugin patterns
- Use a test server for development

## Basic Plugin Structure

Here's a basic template for a Rust plugin:

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
        #region Fields
        private const string PermissionUse = "pluginname.use";
        #endregion

        #region Oxide Hooks
        private void Init()
        {
            // Initialize your plugin
            permission.RegisterPermission(PermissionUse, this);
        }

        private void OnServerInitialized()
        {
            // Called when the server has fully started
            LoadConfig();
        }

        void Unload()
        {
            // Cleanup when plugin is unloaded
        }
        #endregion
    }
}
```

## Plugin Configuration

Configuration management is crucial for any plugin. Here's how to implement it:

```csharp
#region Configuration
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

## Player Data Management

Managing player data effectively:

```csharp
#region Player Data
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
#endregion
```

## Item System Integration

Working with items and inventories:

```csharp
#region Item Management
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
#endregion
```

## Game Mechanics

Implementing common game mechanics:

```csharp
#region Game Mechanics
// Combat System
private void OnEntityTakeDamage(BaseCombatEntity entity, HitInfo info)
{
    if (entity == null || info == null) return;
    
    BasePlayer attacker = info.InitiatorPlayer;
    BasePlayer victim = entity as BasePlayer;
    
    if (attacker == null || victim == null) return;
    
    // Your combat logic here
}

// Movement System
private void OnPlayerInput(BasePlayer player, InputState input)
{
    if (player == null || input == null) return;
    
    // Handle player movement
}

// Resource Gathering
private void OnDispenserGather(ResourceDispenser dispenser, BaseEntity entity, Item item)
{
    if (dispenser == null || entity == null || item == null) return;
    
    // Your gathering logic here
}
#endregion
```

## UI System

### Basic UI Components
```csharp
// UI Container class to manage all UI elements
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
        // Create container
        var container = new CuiElementContainer();

        // Add panel
        container.Add(new CuiPanel
        {
            Image = { Color = "0 0 0 0.8" },
            RectTransform = { AnchorMin = "0.2 0.2", AnchorMax = "0.8 0.8" },
            CursorEnabled = true
        }, "Overlay", UIName);

        // Add title
        container.Add(new CuiLabel
        {
            Text = { Text = "My Plugin Menu", FontSize = 20, Align = TextAnchor.MiddleCenter },
            RectTransform = { AnchorMin = "0 0.9", AnchorMax = "1 1" }
        }, UIName);

        // Add buttons
        AddButton(container, "Button 1", "0.1 0.7", "0.9 0.8", "mycommand 1");
        AddButton(container, "Button 2", "0.1 0.6", "0.9 0.7", "mycommand 2");

        // Show UI to player
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

### Advanced UI Features
```csharp
public class AdvancedUIManager
{
    // Input Fields
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

    // Image Panels
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

    // Scrollable List
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

### UI Best Practices
1. **Performance**
```csharp
// Cache UI elements
private readonly Dictionary<ulong, CuiElementContainer> _cachedUIs = 
    new Dictionary<ulong, CuiElementContainer>();

// Reuse UI elements
private CuiElementContainer GetOrCreateUI(BasePlayer player)
{
    if (_cachedUIs.TryGetValue(player.userID, out var container))
        return container;
        
    container = CreateNewUI();
    _cachedUIs[player.userID] = container;
    return container;
}
```

2. **Responsive Design**
```csharp
// Calculate positions based on screen size
private string GetResponsivePosition(float baseMin, float baseMax, float screenWidth)
{
    float adjustedMin = baseMin * (1920f / screenWidth);
    float adjustedMax = baseMax * (1920f / screenWidth);
    return $"{adjustedMin} {adjustedMax}";
}
```

3. **UI State Management**
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

### Example Complete UI Implementation
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

        // Main panel
        container.Add(new CuiPanel
        {
            Image = { Color = "0 0 0 0.8" },
            RectTransform = { AnchorMin = "0.2 0.2", AnchorMax = "0.8 0.8" },
            CursorEnabled = true
        }, "Overlay", MainUI);

        // Title
        container.Add(new CuiLabel
        {
            Text = { Text = "Main Menu", FontSize = 20, Align = TextAnchor.MiddleCenter },
            RectTransform = { AnchorMin = "0 0.9", AnchorMax = "1 1" }
        }, MainUI);

        // Navigation buttons
        AddButton(container, "Inventory", "0.1 0.8", "0.45 0.9", 
            $"ui.switchpage {player.UserIDString} inventory");
        AddButton(container, "Settings", "0.55 0.8", "0.9 0.9", 
            $"ui.switchpage {player.UserIDString} settings");

        // Content area
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

        // Show UI
        CuiHelper.DestroyUi(player, MainUI);
        CuiHelper.AddUi(player, container);
    }

    private void ShowInventoryPage(CuiElementContainer container)
    {
        // Add inventory grid
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
        // Add settings controls
        AddInputField(container, "Name", "0.1 0.7", "0.9 0.8", "settings.name");
        AddToggle(container, "Enable Notifications", "0.1 0.6", "0.9 0.7", "settings.notifications");
        AddSlider(container, "Volume", "0.1 0.5", "0.9 0.6", "settings.volume");
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

    // Helper methods for UI elements...
}
```

### UI Commands and Hooks
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

## Auto-Update System

Implementing version checking and auto-updates:

```csharp
#region Auto-Update
private const string ApiUrl = "https://your-api.com/version.json";

private void CheckForUpdates()
{
    webrequest.Enqueue(ApiUrl, "", (code, response) =>
    {
        if (code != 200 || string.IsNullOrEmpty(response)) return;
        
        // Parse version info and update if necessary
        // Example: JsonConvert.DeserializeObject<VersionInfo>(response);
    }, this);
}
#endregion
```

## Permission System Structure

Understanding and implementing a proper permission system is crucial for any Rust plugin. Here's a comprehensive guide on how to create and manage permissions:

### Basic Permission Structure
```csharp
#region Permissions
private const string PermissionUse = "pluginname.use";
private const string PermissionAdmin = "pluginname.admin";
private const string PermissionVIP = "pluginname.vip";

private void RegisterPermissions()
{
    // Register all permissions during plugin initialization
    permission.RegisterPermission(PermissionUse, this);
    permission.RegisterPermission(PermissionAdmin, this);
    permission.RegisterPermission(PermissionVIP, this);
}

// Call this in your Init() method
private void Init()
{
    RegisterPermissions();
}
#endregion
```

### Permission Checking Methods
```csharp
#region Permission Checking
private bool HasPermission(BasePlayer player, string perm)
{
    if (player == null || string.IsNullOrEmpty(perm))
        return false;
        
    return permission.UserHasPermission(player.UserIDString, perm);
}

// Check multiple permissions (any)
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

// Check multiple permissions (all)
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

### Implementation Examples
```csharp
#region Permission Usage Examples
// Example command with permission check
[ChatCommand("example")]
private void ExampleCommand(BasePlayer player, string command, string[] args)
{
    if (!HasPermission(player, PermissionUse))
    {
        SendMessage(player, "You don't have permission to use this command!");
        return;
    }
    
    // Command logic here
}

// Example with multiple permission levels
[ChatCommand("admin")]
private void AdminCommand(BasePlayer player, string command, string[] args)
{
    if (!HasPermission(player, PermissionAdmin))
    {
        SendMessage(player, "This command requires admin permissions!");
        return;
    }
    
    // Admin command logic here
}

// Example with VIP features
private void OnGatherItem(BasePlayer player, Item item)
{
    if (HasPermission(player, PermissionVIP))
    {
        // Give VIP players double resources
        item.amount *= 2;
    }
}

// Example with multiple permission checks
[ChatCommand("special")]
private void SpecialCommand(BasePlayer player, string command, string[] args)
{
    if (HasAnyPermission(player, PermissionVIP, PermissionAdmin))
    {
        // Special feature for VIP or Admin players
    }
    else
    {
        SendMessage(player, "This feature requires VIP or Admin permissions!");
    }
}
#endregion
```

### Group-Based Permissions
```csharp
#region Group Permissions
// Add a player to a group
private void AddToGroup(BasePlayer player, string group)
{
    if (player == null || string.IsNullOrEmpty(group))
        return;
        
    permission.AddUserGroup(player.UserIDString, group);
}

// Remove a player from a group
private void RemoveFromGroup(BasePlayer player, string group)
{
    if (player == null || string.IsNullOrEmpty(group))
        return;
        
    permission.RemoveUserGroup(player.UserIDString, group);
}

// Check if player is in a group
private bool IsInGroup(BasePlayer player, string group)
{
    if (player == null || string.IsNullOrEmpty(group))
        return false;
        
    return permission.UserHasGroup(player.UserIDString, group);
}
#endregion
```

### Helper Methods for Permission Management
```csharp
#region Permission Helpers
// Get all permissions for a player
private List<string> GetPlayerPermissions(BasePlayer player)
{
    if (player == null)
        return new List<string>();
        
    return permission.GetUserPermissions(player.UserIDString);
}

// Get all groups for a player
private List<string> GetPlayerGroups(BasePlayer player)
{
    if (player == null)
        return new List<string>();
        
    return permission.GetUserGroups(player.UserIDString);
}

// Grant temporary permission
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

### Best Practices for Permissions

1. **Naming Convention**
   - Use lowercase for all permission names
   - Follow the format: `pluginname.permissiontype`
   - Example: `harvester.use`, `harvester.admin`, `harvester.vip`

2. **Permission Hierarchy**
   - Create a basic permission structure
   - Consider having these standard levels:
     - `.use` - Basic plugin usage
     - `.admin` - Administrative functions
     - `.vip` - Special features for VIP players

3. **Documentation**
   - Always document your permissions in your plugin's README or configuration
   - Example:
```markdown
## Permissions
- `pluginname.use` - Allows basic plugin usage
- `pluginname.admin` - Allows access to admin commands
- `pluginname.vip` - Grants access to VIP features
```

4. **Permission Checking**
   - Always check permissions before executing restricted commands
   - Use helper methods to make permission checking cleaner
   - Consider caching permission results for frequently checked permissions

## C# Basics for Rust Plugin Development

This section covers the essential C# concepts you need to know for Rust plugin development.

### 1. Variables and Data Types
```csharp
// Common data types used in Rust plugins
private int playerId = 12345;                // Whole numbers
private float distance = 10.5f;              // Decimal numbers (note the 'f' suffix)
private string playerName = "Player123";      // Text
private bool isAdmin = false;                // True/False values
private Vector3 position = new Vector3(0, 0, 0); // 3D coordinates
private Dictionary<ulong, PlayerData> players = new Dictionary<ulong, PlayerData>(); // Key-value pairs

// Constants (values that never change)
private const string PERMISSION_USE = "plugin.use";
```

### 2. Collections and Lists
```csharp
// List - Dynamic array of items
private List<BasePlayer> activePlayers = new List<BasePlayer>();
activePlayers.Add(player);                   // Add item
activePlayers.Remove(player);                // Remove item
bool hasPlayer = activePlayers.Contains(player); // Check if exists

// Dictionary - Key-value pairs
private Dictionary<ulong, PlayerData> playerData = new Dictionary<ulong, PlayerData>();
playerData[player.userID] = new PlayerData(); // Add or update
playerData.Remove(player.userID);            // Remove
bool exists = playerData.ContainsKey(player.userID); // Check if exists

// HashSet - Unique collection of items (faster than List for lookups)
private HashSet<ulong> uniquePlayerIds = new HashSet<ulong>();
uniquePlayerIds.Add(player.userID);          // Add item
uniquePlayerIds.Remove(player.userID);       // Remove item
```

### 3. Classes and Objects
```csharp
// Basic class structure
public class PlayerData
{
    // Properties
    public string Name { get; set; }
    public Vector3 LastPosition { get; set; }
    public float LastSeen { get; set; }
    
    // Constructor
    public PlayerData(string name)
    {
        Name = name;
        LastSeen = Time.time;
    }
    
    // Method
    public void UpdatePosition(Vector3 newPosition)
    {
        LastPosition = newPosition;
        LastSeen = Time.time;
    }
}

// Using the class
PlayerData player = new PlayerData("Player123");
player.UpdatePosition(new Vector3(100, 0, 100));
```

### 4. Methods and Functions
```csharp
// Basic method structure
private void HandlePlayer(BasePlayer player, string action)
{
    if (player == null) return;  // Early return for invalid input
    
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

// Method with return value
private bool IsPlayerEligible(BasePlayer player)
{
    if (player == null) return false;
    return player.IsAdmin || HasPermission(player, PERMISSION_USE);
}

// Method with optional parameters
private void GiveResources(BasePlayer player, int amount = 100, string resourceType = "wood")
{
    // amount and resourceType have default values if not specified
}
```

### 5. Null Checking and Safety
```csharp
// Safe null checking
private void ProcessPlayer(BasePlayer player)
{
    // Early return if null
    if (player == null) return;
    
    // Null conditional operator
    string playerName = player?.displayName ?? "Unknown";
    
    // Safe dictionary access
    PlayerData data;
    if (playerData.TryGetValue(player.userID, out data))
    {
        // Use data safely
    }
}
```

### 6. String Operations
```csharp
// String formatting
string message = string.Format("Player {0} has {1} points", playerName, points);
string message2 = $"Player {playerName} has {points} points"; // String interpolation

// String manipulation
string lowercaseCmd = command.ToLower();
string[] args = command.Split(' ');
bool isCommand = command.StartsWith("/");
string cleaned = command.Trim();
```

### 7. Timers and Coroutines
```csharp
// One-time timer
timer.Once(5f, () => {
    // Code to run after 5 seconds
});

// Repeating timer
timer.Repeat(1f, 0, () => {
    // Code to run every second (0 means infinite repeats)
});

// Timer with cancellation
Timer myTimer = timer.Once(10f, () => {
    // Code to run
});
myTimer?.Destroy(); // Cancel timer if needed
```

### 8. Error Handling
```csharp
// Try-catch blocks
private void SafeOperation()
{
    try
    {
        // Risky code here
        Item item = ItemManager.CreateByName("wood", 1000);
        player.GiveItem(item);
    }
    catch (Exception ex)
    {
        // Handle error
        PrintError($"Failed to give items: {ex.Message}");
    }
}
```

### 9. LINQ (Language Integrated Query)
```csharp
// Useful LINQ operations for collections
private void LinqExamples()
{
    // Find players within range
    var nearbyPlayers = BasePlayer.activePlayerList
        .Where(p => Vector3.Distance(p.transform.position, position) <= range)
        .ToList();
    
    // Get online players with permission
    var admins = BasePlayer.activePlayerList
        .Where(p => HasPermission(p, "admin"))
        .ToList();
    
    // Find first matching player
    var player = BasePlayer.activePlayerList
        .FirstOrDefault(p => p.displayName == targetName);
}
```

### 10. Async/Await Pattern
```csharp
// Asynchronous web requests
private void FetchData(string url)
{
    webrequest.Enqueue(url, null, (code, response) =>
    {
        if (code != 200)
        {
            PrintError($"Failed to fetch data: {code}");
            return;
        }
        
        // Process response
        ProcessData(response);
    }, this);
}
```

### Best Practices for C# in Rust Plugins

1. **Always Check for Null**
   ```csharp
   if (player == null) return;
   ```

2. **Use Early Returns**
   ```csharp
   private void ProcessCommand(BasePlayer player, string[] args)
   {
       if (player == null) return;
       if (args == null || args.Length == 0) return;
       // Main logic here
   }
   ```

3. **Dispose of Resources**
   ```csharp
   private void CleanupResources()
   {
       foreach (var timer in _timers)
           timer?.Destroy();
       _timers.Clear();
   }
   ```

4. **Use Constants for Magic Numbers/Strings**
   ```csharp
   private const float RELOAD_TIME = 3.0f;
   private const string PERMISSION_PREFIX = "myplugin";
   ```

5. **Proper Naming Conventions**
   ```csharp
   // Private fields start with underscore
   private Dictionary<ulong, PlayerData> _playerData;
   
   // Public properties use PascalCase
   public float ReloadTime { get; set; }
   
   // Methods use PascalCase
   private void HandlePlayerSpawn(BasePlayer player)
   ```

## Error Handling and Logging

### Effective Logging Strategies
```csharp
public class MyPlugin : RustPlugin
{
    // Log levels
    private void LogDebug(string message) => Puts($"[Debug] {message}");
    private void LogInfo(string message) => Puts($"[Info] {message}");
    private void LogWarning(string message) => PrintWarning($"[Warning] {message}");
    private void LogError(string message) => PrintError($"[Error] {message}");

    // Detailed logging with context
    private void LogWithContext(string context, string message, string level = "Info")
    {
        var timestamp = DateTime.Now.ToString("HH:mm:ss");
        Puts($"[{timestamp}][{level}][{context}] {message}");
    }

    // Performance logging
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
            LogInfo($"{operation} took {sw.ElapsedMilliseconds}ms");
        }
    }
}
```

### Exception Handling Best Practices
```csharp
public class ExceptionHandling : RustPlugin
{
    // Method level try-catch
    private void SafeExecute(Action action)
    {
        try
        {
            action();
        }
        catch (Exception ex)
        {
            // Log the full exception details
            LogError($"Error details: {ex.Message}\nStack trace: {ex.StackTrace}");
            
            // User-friendly message to player
            SendMessage(player, "An error occurred. Please try again later.");
        }
    }

    // Validation checks
    private bool ValidateInput(BasePlayer player, Item item)
    {
        if (player == null)
        {
            LogError("Player is null");
            return false;
        }

        if (item == null)
        {
            LogError($"Item is null for player {player.displayName}");
            return false;
        }

        return true;
    }

    // State recovery
    private void RecoverFromError(BasePlayer player)
    {
        // Clean up any temporary state
        _temporaryData.Remove(player.userID);
        
        // Reset player state
        player.inventory.SendUpdatedInventory();
        
        // Log recovery attempt
        LogInfo($"Recovered from error for player {player.displayName}");
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

## Plugin Breakdown: AutopickupOxideLamify

Let's break down the Auto Pickup Barrel plugin and understand each component:

### 1. File Header and Imports
```csharp
// Import necessary namespaces
using System;  // Required for basic C# functionality like Exception handling
using System.Collections.Generic;  // Required for List<T> and Dictionary<TKey,TValue>
using UnityEngine;  // Required for Unity types like Vector3
using Oxide.Core;   // Core Oxide functionality
using Oxide.Core.Plugins;  // Required for RustPlugin base class
```

### 2. Namespace and Class Declaration
```csharp
namespace Oxide.Plugins  // Standard namespace for Oxide plugins
{
    // Plugin information attribute
    [Info("Auto Pickup Barrel", // Plugin name as shown in oxide
          "Lamify",            // Author name
          "1.0.1")]            // Version number
    
    // Main plugin class, inherits from RustPlugin
    public class AutopickupOxideLamify : RustPlugin
    {
```

### 3. Constants and Fields
```csharp
// Maximum distance (in Unity units) that a player can be from a barrel to auto-pickup
private const float PICKUP_RADIUS = 6f;  

// Permission string that players need to use this plugin
private const string USE_PERMISSION = "autopickupoxidelamify.use";

// Array of strings used to identify different types of barrels in the game
private static readonly string[] BARREL_IDENTIFIERS = { 
    "barrel",         // Standard barrel
    "loot-barrel",    // Special loot barrel
    "barrel.prefab",  // Barrel prefab reference
    "loot_barrel"     // Alternative barrel name
};
```

### 4. Server Initialization
```csharp
// Called when the server starts up
private void OnServerInitialized()
{
    // Register our permission with Oxide's permission system
    permission.RegisterPermission(USE_PERMISSION, this);
}
```

### 5. Permission Check Method
```csharp
// Method to check if a player has permission to use the plugin
private bool HasAccess(BasePlayer player)
{
    return player != null &&  // First check if player exists
           permission.UserHasPermission(player.UserIDString, USE_PERMISSION);  // Then check permission
}
```

### 6. Main Event Handler
```csharp
// Called whenever any entity dies in the game
private void OnEntityDeath(BaseCombatEntity entity, HitInfo info)
{
    try  // Wrap everything in try-catch for error handling
    {
        // VALIDATION SECTION
        
        // Check if:
        // - entity exists
        // - hit info exists and has a player
        // - player has permission
        if (entity == null || info?.InitiatorPlayer == null || !HasAccess(info.InitiatorPlayer)) 
            return;  // Exit if any check fails

        // Try to cast the entity to a LootContainer (barrel)
        var barrel = entity as LootContainer;
        
        // Check if:
        // - cast was successful
        // - entity name matches our barrel identifiers
        if (barrel == null || !IsBarrel(barrel.PrefabName)) 
            return;  // Exit if not a valid barrel

        // Check distance between player and barrel
        if (Vector3.Distance(info.InitiatorPlayer.transform.position, 
                           barrel.transform.position) > PICKUP_RADIUS)
            return;  // Exit if barrel is too far away

        // ITEM COLLECTION SECTION
        
        // Store player information for use after NextTick
        var playerId = info.InitiatorPlayer.userID;
        var playerPos = info.InitiatorPlayer.transform.position;

        // Create list to store item information
        var itemsToGive = new List<ItemInfo>();
        
        // Check if barrel has an inventory
        if (barrel.inventory != null)
        {
            // Loop through each item in the barrel
            foreach (var item in barrel.inventory.itemList)
            {
                // If item exists, store its information
                if (item != null)
                {
                    itemsToGive.Add(new ItemInfo 
                    { 
                        ItemId = item.info.itemid,  // What type of item
                        Amount = item.amount,        // How many
                        Skin = item.skin            // What skin
                    });
                }
            }
        }

        // BARREL CLEANUP SECTION
        
        // Prevent barrel from being saved to avoid duplicates
        barrel.EnableSaving(false);
        
        // Remove the barrel from the game
        barrel.Kill(BaseNetworkable.DestroyMode.None);

        // ITEM DISTRIBUTION SECTION
        
        // Only proceed if we have items to give
        if (itemsToGive.Count > 0)
        {
            // Schedule item distribution for next server tick
            NextTick(() => 
            {
                try
                {
                    // Find player again (they might have disconnected)
                    var player = BasePlayer.FindByID(playerId);
                    
                    // Exit if player is gone or disconnected
                    if (player == null || !player.IsConnected)
                        return;

                    // Process each item we stored
                    foreach (var itemInfo in itemsToGive)
                    {
                        // Create new instance of the item
                        var item = ItemManager.CreateByItemID(
                            itemInfo.ItemId,   // Item type
                            itemInfo.Amount,   // Stack size
                            itemInfo.Skin      // Item skin
                        );

                        // If item was created successfully
                        if (item != null)
                        {
                            // INVENTORY PLACEMENT ATTEMPTS
                            
                            // 1. Try main inventory first
                            if (player.inventory.GiveItem(item))
                                continue;  // Success - move to next item

                            // 2. Try backpack if inventory is full
                            var wear = player.inventory.containerWear;
                            
                            // Look for either type of backpack
                            // -907422733 = First backpack type
                            // 2068884361 = Alternative backpack
                            var backpack = wear.FindItemByItemID(-907422733) ?? 
                                         wear.FindItemByItemID(2068884361);

                            // If backpack exists and has space
                            if (backpack?.contents != null && 
                                item.MoveToContainer(backpack.contents))
                                continue;  // Success - move to next item

                            // 3. Last resort - drop at player's feet
                            item.Drop(
                                playerPos + new Vector3(0, 0.1f, 0),  // Slightly above ground
                                Vector3.zero  // No throw velocity
                            );
                        }
                    }

                    // Update player's inventory UI
                    player.SendNetworkUpdate();
                }
                catch (Exception ex)
                {
                    // Log any errors during item distribution
                    PrintError($"Error giving items: {ex.Message}");
                }
            });
        }
    }
    catch (Exception ex)
    {
        // Log any errors in main logic
        PrintError($"Error in OnEntityDeath: {ex.Message}");
    }
}
```

### 7. Helper Methods
```csharp
// Method to check if a prefab name belongs to a barrel
private bool IsBarrel(string prefabName)
{
    // Exit early if name is null or empty
    if (string.IsNullOrEmpty(prefabName))
        return false;
    
    // Convert to lowercase for case-insensitive comparison
    prefabName = prefabName.ToLower();
    
    // Check if name contains any of our barrel identifiers
    foreach (var identifier in BARREL_IDENTIFIERS)
        if (prefabName.Contains(identifier)) 
            return true;
    
    // Not a barrel if we get here
    return false;
}

// Class to store item information between ticks
private class ItemInfo
{
    public int ItemId { get; set; }    // Item type ID
    public int Amount { get; set; }     // Stack size
    public ulong Skin { get; set; }     // Item skin ID
}
```

### 8. Plugin Execution Flow

1. **Plugin Load**
   ```csharp
   // Server starts → OnServerInitialized called
   // Permission registered → USE_PERMISSION added to Oxide
   ```

2. **Player Breaks Barrel**
   ```csharp
   // Entity dies → OnEntityDeath triggered
   // Validation checks run
   // Distance checked
   ```

3. **Item Processing**
   ```csharp
   // Items collected from barrel
   // Barrel removed from game
   // Items stored in itemsToGive list
   ```

4. **Next Tick Processing**
   ```csharp
   // NextTick triggered
   // Player validated
   // Items created and distributed
   // Inventory updated
   ```

### 9. Error Cases

1. **Invalid Entity**
   ```csharp
   if (entity == null) return;  // Exit silently
   ```

2. **No Player**
   ```csharp
   if (info?.InitiatorPlayer == null) return;  // Exit silently
   ```

3. **No Permission**
   ```csharp
   if (!HasAccess(info.InitiatorPlayer)) return;  // Exit silently
   ```

4. **Too Far Away**
   ```csharp
   if (Vector3.Distance(...) > PICKUP_RADIUS) return;  // Exit silently
   ```

5. **Item Creation Failure**
   ```csharp
   if (item != null)  // Only proceed if item created successfully
   ```

6. **Inventory Full**
   ```csharp
   // Try main inventory
   // Try backpack
   // Finally drop on ground
   ```

### 10. Performance Considerations

1. **Async Operations**
   ```csharp
   NextTick(() => { ... });  // Prevents server lag
   ```

2. **Early Returns**
   ```csharp
   if (condition) return;  // Exit early if invalid
   ```

3. **Efficient Checks**
   ```csharp
   string.IsNullOrEmpty(prefabName)  // Single check instead of two
   ```

4. **Memory Management**
   ```csharp
   barrel.EnableSaving(false)  // Prevent unnecessary saves
   ```

{{ ... }}
