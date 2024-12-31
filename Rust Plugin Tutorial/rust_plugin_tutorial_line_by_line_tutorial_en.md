# Complete Rust Plugin Development Tutorial - Line by Line Explanation

## Table of Contents
// This section provides quick navigation through the tutorial
1. [Setup and Prerequisites](#setup-and-prerequisites)  // Essential software and tools needed
2. [Basic Plugin Structure](#basic-plugin-structure)    // Core plugin architecture
3. [Plugin Configuration](#plugin-configuration)        // How to handle plugin settings
4. [Player Data Management](#player-data-management)    // Managing player-specific data
5. [Item System Integration](#item-system-integration)  // Working with game items
6. [Game Mechanics](#game-mechanics)                   // Implementing gameplay features
7. [UI System](#ui-system)                            // Creating user interfaces
8. [Auto-Update System](#auto-update-system)          // Keeping plugins up to date
9. [Permission System Structure](#permission-system-structure)  // Managing access control
10. [C# Basics for Rust Plugin Development](#c-basics-for-rust-plugin-development)  // Essential C# concepts
11. [Best Practices](#best-practices)                  // Development guidelines
12. [Error Handling and Logging](#error-handling-and-logging)  // Managing errors
13. [Plugin Breakdown: AutopickupOxideLamify](#plugin-breakdown-autopickupoxidelamify)  // Real-world example
14. [Best Practices Deep Dive](#best-practices-deep-dive)  // Detailed exploration of development best practices
15. [Advanced Topics](#advanced-topics)                // In-depth exploration of advanced topics
16. [Conclusion](#conclusion)                          // Final thoughts and recommendations
17. [Advanced Error Handling](#advanced-error-handling)  // Comprehensive error handling patterns
18. [Best Practices Summary](#best-practices-summary)  // Key takeaways and recommendations

## Setup and Prerequisites
// This section outlines everything needed to start development

### Required Software
// List of essential tools and software
1. Visual Studio Code or Visual Studio  // IDE for writing code
2. .NET SDK                            // Required for C# development
3. Oxide/uMod for Rust server          // Plugin framework
4. Reference DLLs from Rust server:    // Required game libraries
   - Assembly-CSharp.dll               // Core game assembly
   - Oxide.Core.dll                    // Oxide framework core
   - Oxide.Rust.dll                    // Rust-specific Oxide components
   - UnityEngine.dll                   // Unity engine components

### Project Setup
// Steps to create a new plugin project
1. Create a new folder for your plugin  // Organize your workspace
2. Create a new .cs file               // Your plugin's source file
3. Add references to required DLLs      // Link necessary libraries
4. Set up basic plugin structure        // Initial code template

### Development Environment Tips
// Best practices for development setup
- Use Visual Studio Code with C# extension  // Enhanced development experience
- Set up snippets for common patterns       // Improve coding efficiency
- Use a test server for development         // Safe testing environment

## Basic Plugin Structure
// Core plugin template and explanation

```csharp
using Oxide.Core;                // Import core Oxide functionality
using Oxide.Core.Plugins;        // Import plugin-specific features
using System.Collections.Generic; // Import C# collections
using UnityEngine;               // Import Unity engine features

namespace Oxide.Plugins          // Standard namespace for all Oxide plugins
{
    [Info("PluginName", "YourName", "1.0.0")]  // Plugin metadata
    public class PluginName : RustPlugin        // Main plugin class
    {
        #region Fields
        private const string PermissionUse = "pluginname.use";  // Permission definition
        #endregion

        #region Oxide Hooks
        private void Init()                     // Called when plugin loads
        {
            permission.RegisterPermission(PermissionUse, this);  // Register permissions
        }

        private void OnServerInitialized()      // Called when server starts
        {
            LoadConfig();                       // Load plugin configuration
        }

        void Unload()                          // Called when plugin unloads
        {
            // Cleanup code here
        }
        #endregion
    }
}
```

## Plugin Configuration
// Managing plugin settings

```csharp
#region Configuration
private Configuration config;    // Configuration instance

public class Configuration      // Configuration class definition
{
    public bool EnableFeature { get; set; }     // Toggle feature flag
    public float CooldownTime { get; set; }     // Numeric setting
    public Dictionary<string, object> Settings { get; set; }  // Dynamic settings

    public static Configuration DefaultConfig()  // Default configuration factory
    {
        return new Configuration
        {
            EnableFeature = true,               // Default to enabled
            CooldownTime = 300f,                // 5 minutes default
            Settings = new Dictionary<string, object>()  // Empty settings dictionary
        };
    }
}

protected override void LoadConfig()            // Configuration loading method
{
    base.LoadConfig();                          // Call base implementation
    try
    {
        config = Config.ReadObject<Configuration>();  // Read config file
        if (config == null)                          // Check if config exists
        {
            LoadDefaultConfig();                     // Load defaults if needed
        }
    }
    catch
    {
        LoadDefaultConfig();                         // Load defaults on error
    }
    SaveConfig();                                   // Save configuration
}
```

## Player Data Management
// Managing player-specific information

```csharp
#region Player Data
private Dictionary<ulong, PlayerData> playerData = new Dictionary<ulong, PlayerData>();  // Player data storage

public class PlayerData                         // Player data structure
{
    public string LastLocation { get; set; }    // Store player location
    public float LastLoginTime { get; set; }    // Track login time
    public Dictionary<string, int> Statistics { get; set; }  // Player stats

    public PlayerData()                         // Constructor
    {
        Statistics = new Dictionary<string, int>();  // Initialize stats
    }
}

private void SavePlayerData()                   // Save data to disk
{
    Interface.Oxide.DataFileSystem.WriteObject("PluginName/data", playerData);
}

private void LoadPlayerData()                   // Load data from disk
{
    try
    {
        playerData = Interface.Oxide.DataFileSystem.ReadObject<Dictionary<ulong, PlayerData>>("PluginName/data");
    }
    catch
    {
        playerData = new Dictionary<ulong, PlayerData>();  // Create new if load fails
    }
}
#endregion
```

## Item System Integration
// Working with game items

```csharp
#region Item System
private void OnItemAdded(Item item)            // Called when item is added
{
    // Handle item addition
}

private void OnItemRemoved(Item item)          // Called when item is removed
{
    // Handle item removal
}

private void OnItemUpdated(Item item)          // Called when item is updated
{
    // Handle item update
}
#endregion
```

## Game Mechanics
// Implementing gameplay features

```csharp
#region Game Mechanics
private void OnPlayerDeath(BasePlayer player)  // Called when player dies
{
    // Handle player death
}

private void OnPlayerRespawn(BasePlayer player)  // Called when player respawns
{
    // Handle player respawn
}

private void OnPlayerBuild(Construction construction)  // Called when player builds
{
    // Handle player building
}
#endregion
```

## UI System
// Creating user interfaces

```csharp
#region UI System
private void OnUIOpen(UI ui)                  // Called when UI is opened
{
    // Handle UI open
}

private void OnUIClose(UI ui)                 // Called when UI is closed
{
    // Handle UI close
}

private void OnUIButtonClick(UI ui, string button)  // Called when UI button is clicked
{
    // Handle UI button click
}
#endregion
```

## UI System Extended
// Comprehensive UI system implementation with explanations

### Complete UI Manager Implementation
```csharp
#region UI System
public class UIManager
{
    private readonly string UIName = "MyPluginUI";  // Unique identifier for UI elements
    private readonly Plugin _plugin;                // Reference to main plugin
    private readonly Dictionary<ulong, UIState> _states;  // Store UI state per player
    
    public UIManager(Plugin plugin)                 // Constructor with dependency injection
    {
        _plugin = plugin;                          // Store plugin reference
        _states = new Dictionary<ulong, UIState>(); // Initialize state storage
    }

    // Main menu creation with all components
    public void ShowMainMenu(BasePlayer player)     // Show main menu to player
    {
        var container = new CuiElementContainer(); // Create UI container
        
        // Main panel with semi-transparent background
        container.Add(new CuiPanel
        {
            Image = { Color = "0 0 0 0.8" },      // Semi-transparent black
            RectTransform = { AnchorMin = "0.2 0.2", AnchorMax = "0.8 0.8" },  // Center position
            CursorEnabled = true                   // Enable mouse cursor
        }, "Overlay", UIName);                     // Add to overlay layer

        // Title section
        container.Add(new CuiLabel
        {
            Text = { Text = "Main Menu", FontSize = 20, Align = TextAnchor.MiddleCenter },
            RectTransform = { AnchorMin = "0 0.9", AnchorMax = "1 1" }  // Top of panel
        }, UIName);

        // Navigation buttons
        AddButton(container, "Inventory", "0.1 0.8", "0.45 0.9", 
            $"ui.switchpage {player.UserIDString} inventory");  // Inventory button
        AddButton(container, "Settings", "0.55 0.8", "0.9 0.9", 
            $"ui.switchpage {player.UserIDString} settings");   // Settings button

        // Dynamic content based on current page
        var state = GetState(player);              // Get player's UI state
        switch (state.CurrentPage)                 // Show appropriate page
        {
            case "inventory":
                ShowInventoryPage(container);      // Show inventory content
                break;
            case "settings":
                ShowSettingsPage(container);       // Show settings content
                break;
            default:
                ShowWelcomePage(container);        // Show welcome content
                break;
        }

        // Display UI to player
        CuiHelper.DestroyUi(player, UIName);      // Remove existing UI
        CuiHelper.AddUi(player, container);       // Show new UI
    }

    // Inventory grid implementation
    private void ShowInventoryPage(CuiElementContainer container)  // Show inventory page
    {
        // Create 6x4 inventory grid
        for (int i = 0; i < 24; i++)              // 24 inventory slots
        {
            int row = i / 6;                       // Calculate row
            int col = i % 6;                       // Calculate column
            float xMin = 0.1f + (col * 0.13f);    // X position
            float xMax = xMin + 0.12f;            // Width
            float yMin = 0.7f - (row * 0.13f);    // Y position
            float yMax = yMin + 0.12f;            // Height

            // Add inventory slot
            container.Add(new CuiPanel
            {
                Image = { Color = "0.5 0.5 0.5 0.8" },  // Slot background
                RectTransform = { 
                    AnchorMin = $"{xMin} {yMin}", 
                    AnchorMax = $"{xMax} {yMax}" 
                }
            }, UIName, $"slot_{i}");              // Unique slot identifier
        }
    }

    // Settings page with controls
    private void ShowSettingsPage(CuiElementContainer container)  // Show settings page
    {
        // Add settings controls
        AddInputField(container, "Name", "0.1 0.7", "0.9 0.8", "settings.name");  // Name input
        AddToggle(container, "Enable Notifications", "0.1 0.6", "0.9 0.7", 
            "settings.notifications");             // Notification toggle
        AddSlider(container, "Volume", "0.1 0.5", "0.9 0.6", 
            "settings.volume");                    // Volume slider
    }

    // Helper method for adding buttons
    private void AddButton(CuiElementContainer container, string text, 
        string min, string max, string command)    // Add button to UI
    {
        container.Add(new CuiButton
        {
            Button = { Color = "0.7 0.7 0.7 0.8", Command = command },  // Button style
            RectTransform = { AnchorMin = min, AnchorMax = max },       // Position
            Text = { Text = text, FontSize = 14, Align = TextAnchor.MiddleCenter }  // Text
        }, UIName);                               // Add to main panel
    }

    // Input field creation
    private void AddInputField(CuiElementContainer container, string name, 
        string min, string max, string command)    // Add input field
    {
        container.Add(new CuiElement
        {
            Parent = UIName,                       // Add to main panel
            Components = {
                new CuiInputFieldComponent
                {
                    FontSize = 14,                 // Text size
                    Command = $"{command}",        // Command on input
                    Text = ""                      // Initial text
                },
                new CuiRectTransformComponent
                {
                    AnchorMin = min,              // Position
                    AnchorMax = max
                }
            }
        });
    }

    // Toggle button implementation
    private void AddToggle(CuiElementContainer container, string text, 
        string min, string max, string command)    // Add toggle switch
    {
        var state = GetState(null);               // Get current state
        var isEnabled = state.GetSetting(command, false);  // Get toggle state

        container.Add(new CuiButton
        {
            Button = { 
                Color = isEnabled ? "0.7 1 0.7 0.8" : "1 0.7 0.7 0.8",  // Color based on state
                Command = $"{command} {!isEnabled}"  // Toggle command
            },
            RectTransform = { AnchorMin = min, AnchorMax = max },
            Text = { Text = $"{text}: {(isEnabled ? "ON" : "OFF")}" }  // Show state
        }, UIName);
    }

    // Slider control implementation
    private void AddSlider(CuiElementContainer container, string text, 
        string min, string max, string command)    // Add slider control
    {
        var state = GetState(null);               // Get current state
        var value = state.GetSetting(command, 0.5f);  // Get slider value

        // Slider background
        container.Add(new CuiPanel
        {
            Image = { Color = "0.5 0.5 0.5 0.8" },
            RectTransform = { AnchorMin = min, AnchorMax = max }
        }, UIName, $"{command}_slider");          // Unique slider ID

        // Slider handle
        container.Add(new CuiPanel
        {
            Image = { Color = "0.7 0.7 0.7 1" },
            RectTransform = { 
                AnchorMin = $"{value} 0", 
                AnchorMax = $"{value + 0.05} 1" 
            }
        }, $"{command}_slider");                  // Add to slider panel
    }

    // State management per player
    private UIState GetState(BasePlayer player)    // Get player's UI state
    {
        if (player == null) return new UIState(); // Return new state if no player

        if (!_states.TryGetValue(player.userID, out var state))  // Try get existing state
        {
            state = new UIState();                // Create new state
            _states[player.userID] = state;       // Store state
        }
        return state;                             // Return state
    }
}

// UI state tracking
public class UIState                              // Track UI state
{
    public string CurrentPage { get; set; }       // Current page name
    public Dictionary<string, object> Data { get; set; }  // Page data
    public float ScrollPosition { get; set; }     // Scroll position

    public UIState()                              // Constructor
    {
        Data = new Dictionary<string, object>();  // Initialize data
        CurrentPage = "welcome";                  // Default page
    }

    public T GetSetting<T>(string key, T defaultValue)  // Get setting with type
    {
        if (!Data.ContainsKey(key))              // Check if exists
            return defaultValue;                  // Return default if not

        try
        {
            return (T)Data[key];                 // Return typed value
        }
        catch
        {
            return defaultValue;                 // Return default on error
        }
    }
}
```

### UI Command Handling
```csharp
#region UI Commands
[ChatCommand("menu")]                           // Chat command to open menu
private void CommandMenu(BasePlayer player, string command, string[] args)
{
    if (!HasPermission(player, "menu"))        // Check permission
    {
        SendMessage(player, "No permission");   // Send error message
        return;                                 // Early return
    }
    
    _ui.ShowMainMenu(player);                  // Show menu to player
}

[ConsoleCommand("ui.switchpage")]              // Console command for page switching
private void ConsoleCommandSwitchPage(ConsoleSystem.Arg arg)
{
    var player = arg.Player();                 // Get player
    if (player == null) return;                // Check player exists
    
    string page = arg.GetString(1);            // Get page name
    var state = _ui.GetState(player);          // Get player's state
    state.CurrentPage = page;                  // Update page
    _ui.ShowMainMenu(player);                  // Refresh UI
}

[ConsoleCommand("ui.setting")]                 // Console command for settings
private void ConsoleCommandSetting(ConsoleSystem.Arg arg)
{
    var player = arg.Player();                 // Get player
    if (player == null) return;                // Check player exists
    
    string setting = arg.GetString(1);         // Get setting name
    string value = arg.GetString(2);           // Get new value
    
    var state = _ui.GetState(player);          // Get player's state
    state.Data[setting] = value;               // Update setting
    _ui.ShowMainMenu(player);                  // Refresh UI
}
#endregion
```

## Auto-Update System
// Keeping plugins up to date

```csharp
#region Auto-Update System
private void OnUpdateAvailable(string version)  // Called when update is available
{
    // Handle update availability
}

private void OnUpdateDownloaded(string version)  // Called when update is downloaded
{
    // Handle update download
}

private void OnUpdateInstalled(string version)  // Called when update is installed
{
    // Handle update installation
}
#endregion
```

## Permission System Structure
// Managing access control

```csharp
#region Permission System
private void OnPermissionAdded(string permission)  // Called when permission is added
{
    // Handle permission addition
}

private void OnPermissionRemoved(string permission)  // Called when permission is removed
{
    // Handle permission removal
}

private void OnPermissionUpdated(string permission)  // Called when permission is updated
{
    // Handle permission update
}
#endregion
```

## Permission System Extended
// Comprehensive permission system implementation

### Complete Permission Manager
```csharp
#region Permission System
public class PermissionManager
{
    private readonly Plugin _plugin;                // Plugin reference
    private readonly Dictionary<string, HashSet<string>> _groupPermissions;  // Group permissions
    private readonly Dictionary<ulong, HashSet<string>> _playerPermissions;  // Player permissions
    
    public PermissionManager(Plugin plugin)         // Constructor
    {
        _plugin = plugin;                          // Store plugin reference
        _groupPermissions = new Dictionary<string, HashSet<string>>();  // Initialize groups
        _playerPermissions = new Dictionary<ulong, HashSet<string>>();  // Initialize players
    }

    // Register all plugin permissions
    public void RegisterPermissions()               // Register all permissions
    {
        // Basic permissions
        RegisterPermission("use", "Basic plugin usage");  // Basic usage
        RegisterPermission("admin", "Administrative access");  // Admin access
        RegisterPermission("vip", "VIP features");  // VIP features
        
        // Feature-specific permissions
        RegisterPermission("item.give", "Give items");  // Item giving
        RegisterPermission("item.remove", "Remove items");  // Item removal
        RegisterPermission("teleport", "Teleportation");  // Teleporting
    }

    // Permission registration with description
    private void RegisterPermission(string name, string description)  // Register permission
    {
        var permName = $"{_plugin.Name.ToLower()}.{name}";  // Full permission name
        _plugin.permission.RegisterPermission(permName, _plugin);  // Register with oxide
        
        // Log registration
        _plugin.LogInfo($"Registered permission: {permName} - {description}");
    }

    // Check player permission
    public bool HasPermission(BasePlayer player, string permission)  // Check permission
    {
        if (player == null) return false;          // No player = no permission
        
        // Full permission name
        var permName = $"{_plugin.Name.ToLower()}.{permission}";  // Format name
        
        // Check oxide permission system
        return _plugin.permission.UserHasPermission(player.UserIDString, permName);
    }

    // Grant temporary permission
    public void GrantTemporary(BasePlayer player, string permission, 
        float duration)                            // Grant temp permission
    {
        if (player == null) return;                // Check player exists
        
        var permName = $"{_plugin.Name.ToLower()}.{permission}";  // Format name
        _plugin.permission.GrantUserPermission(player.UserIDString, permName, _plugin);  // Grant
        
        // Schedule removal
        _plugin.timer.Once(duration, () =>         // Create timer
        {
            _plugin.permission.RevokeUserPermission(player.UserIDString, permName);  // Revoke
        });
    }

    // Group management
    public void AddToGroup(BasePlayer player, string group)  // Add to group
    {
        if (player == null) return;                // Check player exists
        
        _plugin.permission.AddUserGroup(player.UserIDString, group);  // Add to group
        
        // Grant group permissions
        if (_groupPermissions.TryGetValue(group, out var permissions))  // Get permissions
        {
            foreach (var permission in permissions)  // For each permission
            {
                _plugin.permission.GrantUserPermission(player.UserIDString, permission, _plugin);
            }
        }
    }

    // Remove from group
    public void RemoveFromGroup(BasePlayer player, string group)  // Remove from group
    {
        if (player == null) return;                // Check player exists
        
        _plugin.permission.RemoveUserGroup(player.UserIDString, group);  // Remove from group
        
        // Revoke group permissions
        if (_groupPermissions.TryGetValue(group, out var permissions))  // Get permissions
        {
            foreach (var permission in permissions)  // For each permission
            {
                _plugin.permission.RevokeUserPermission(player.UserIDString, permission);
            }
        }
    }

    // Get player's permissions
    public HashSet<string> GetPlayerPermissions(BasePlayer player)  // Get permissions
    {
        if (player == null)                        // Check player exists
            return new HashSet<string>();          // Return empty set
            
        return new HashSet<string>(
            _plugin.permission.GetUserPermissions(player.UserIDString)  // Get from oxide
        );
    }

    // Get player's groups
    public List<string> GetPlayerGroups(BasePlayer player)  // Get groups
    {
        if (player == null)                        // Check player exists
            return new List<string>();             // Return empty list
            
        return _plugin.permission.GetUserGroups(player.UserIDString);  // Get from oxide
    }
}
```

### Permission Commands
```csharp
#region Permission Commands
[ChatCommand("perm")]                           // Permission management command
private void CommandPermission(BasePlayer player, string command, string[] args)
{
    if (!HasPermission(player, "admin"))       // Check admin permission
    {
        SendMessage(player, "No permission");   // Send error
        return;                                 // Early return
    }
    
    if (args.Length < 2)                       // Check arguments
    {
        SendMessage(player, "Usage: /perm <add|remove> <player> [permission]");
        return;                                // Early return
    }
    
    var action = args[0].ToLower();            // Get action
    var target = BasePlayer.Find(args[1]);     // Find target player
    
    if (target == null)                        // Check target exists
    {
        SendMessage(player, "Player not found");
        return;                                // Early return
    }
    
    switch (action)                            // Process action
    {
        case "add":                            // Add permission
            if (args.Length < 3)               // Check permission specified
            {
                SendMessage(player, "Specify permission to add");
                return;                        // Early return
            }
            _permissions.GrantTemporary(target, args[2], 3600f);  // Grant for 1 hour
            SendMessage(player, $"Granted {args[2]} to {target.displayName}");
            break;
            
        case "remove":                         // Remove permission
            if (args.Length < 3)               // Check permission specified
            {
                SendMessage(player, "Specify permission to remove");
                return;                        // Early return
            }
            _plugin.permission.RevokeUserPermission(target.UserIDString, args[2]);
            SendMessage(player, $"Revoked {args[2]} from {target.displayName}");
            break;
            
        case "list":                           // List permissions
            var perms = _permissions.GetPlayerPermissions(target);  // Get permissions
            SendMessage(player, $"Permissions for {target.displayName}:");
            foreach (var perm in perms)        // List all permissions
            {
                SendMessage(player, $"- {perm}");
            }
            break;
            
        default:                               // Unknown action
            SendMessage(player, "Invalid action. Use add, remove, or list");
            break;
    }
}
#endregion
```

## C# Basics for Rust Plugin Development
// Essential C# concepts

```csharp
#region C# Basics
private void OnCSharpBasics()                 // Called when C# basics are needed
{
    // Handle C# basics
}
#endregion
```

## Best Practices
// Development guidelines

```csharp
#region Best Practices
private void OnBestPractices()                // Called when best practices are needed
{
    // Handle best practices
}
#endregion
```

## Error Handling and Logging
// Managing errors

```csharp
#region Error Handling and Logging
private void OnError(string error)            // Called when error occurs
{
    // Handle error
}

private void OnLog(string log)                // Called when log is written
{
    // Handle log
}
#endregion
```

## Plugin Breakdown: AutopickupOxideLamify
// Real-world example

```csharp
#region Plugin Breakdown
private void OnPluginBreakdown()              // Called when plugin breakdown is needed
{
    // Handle plugin breakdown
}
#endregion
```

## Best Practices Deep Dive
// Detailed exploration of development best practices

### Code Organization
```csharp
#region Code Organization
// Keep related functionality together
private class WeaponSystem     // Weapon-related functionality
{
    private readonly Dictionary<string, WeaponData> _weapons;  // Weapon storage
    private readonly Plugin _plugin;                          // Plugin reference

    public WeaponSystem(Plugin plugin)          // Constructor with dependency injection
    {
        _plugin = plugin;                       // Store plugin reference
        _weapons = new Dictionary<string, WeaponData>();  // Initialize storage
    }
}

// Use regions for better code organization
#region Weapon Management
private void AddWeapon() { }                    // Add new weapon
private void RemoveWeapon() { }                 // Remove existing weapon
private void UpdateWeapon() { }                 // Update weapon properties
#endregion

#region Weapon Stats
private void CalculateDamage() { }              // Calculate weapon damage
private void UpdateStats() { }                  // Update weapon statistics
#endregion
```

### Performance Optimization
```csharp
#region Performance
// Cache frequently used values
private readonly Dictionary<ulong, PlayerInfo> _playerCache;  // Player data cache

// Use efficient data structures
private readonly HashSet<ulong> _activePlayers;  // Fast lookup for active players

// Implement pooling for frequently created objects
private readonly Stack<Projectile> _projectilePool;  // Object pool

// Use early returns to avoid deep nesting
private bool ProcessPlayer(BasePlayer player)
{
    if (player == null) return false;           // Early return on null
    if (!player.IsConnected) return false;      // Early return if disconnected
    if (player.IsSleeping()) return false;      // Early return if sleeping
    
    // Main processing here
    return true;
}
```

### Error Prevention
```csharp
#region Error Prevention
// Validate all inputs
private void GiveItem(BasePlayer player, string itemName, int amount)
{
    // Input validation
    if (player == null)                         // Check player exists
        throw new ArgumentNullException(nameof(player));
    
    if (string.IsNullOrEmpty(itemName))         // Check item name
        throw new ArgumentException("Item name cannot be empty");
        
    if (amount <= 0)                            // Check amount is positive
        throw new ArgumentOutOfRangeException(nameof(amount));
        
    // Safe to proceed with operation
}

// Use defensive programming
private void ProcessInventory(BasePlayer player)
{
    try
    {
        var inventory = player?.inventory;       // Null conditional operator
        if (inventory == null) return;           // Safety check
        
        var items = inventory.containerMain?.itemList;  // Another null check
        if (items == null) return;               // Safety check
        
        // Process items safely
    }
    catch (Exception ex)
    {
        LogError($"Error processing inventory: {ex.Message}");  // Log errors
    }
}
```

### Memory Management
```csharp
#region Memory Management
// Implement IDisposable for cleanup
public class ResourceManager : IDisposable
{
    private bool _disposed;                      // Track disposal state
    
    public void Dispose()                        // Implement disposal
    {
        if (_disposed) return;                   // Prevent double disposal
        
        // Clean up resources
        _disposed = true;                        // Mark as disposed
    }
}

// Clear collections when done
private void CleanupCollections()
{
    _playerCache?.Clear();                       // Clear cache
    _activePlayers?.Clear();                    // Clear active players
    _projectilePool?.Clear();                   // Clear object pool
}
```

## Advanced Topics

### Command System
```csharp
#region Commands
// Register chat commands
[ChatCommand("give")]                           // Chat command attribute
private void GiveCommand(BasePlayer player, string command, string[] args)
{
    if (!HasPermission(player, "give"))         // Check permission
    {
        SendMessage(player, "No permission");    // Send error message
        return;                                  // Early return
    }
    
    if (args.Length < 2)                        // Check arguments
    {
        SendMessage(player, "Usage: /give <item> <amount>");  // Show usage
        return;                                  // Early return
    }
    
    // Process command
    string itemName = args[0];                   // Get item name
    int amount = int.Parse(args[1]);            // Get amount
    
    GiveItem(player, itemName, amount);         // Give item to player
}

// Register console commands
[ConsoleCommand("admin.give")]                  // Console command attribute
private void ConsoleGiveCommand(ConsoleSystem.Arg arg)
{
    var player = arg.Player();                  // Get player
    if (player == null) return;                 // Check player exists
    
    // Similar processing as chat command
}
```

### Event System
```csharp
#region Events
// Custom event system
public class EventManager
{
    private readonly Dictionary<string, Action<object>> _handlers;  // Event handlers
    
    public void Subscribe(string eventName, Action<object> handler)
    {
        if (!_handlers.ContainsKey(eventName))   // Check if event exists
            _handlers[eventName] = handler;      // Add handler
        else
            _handlers[eventName] += handler;     // Add to existing handlers
    }
    
    public void Unsubscribe(string eventName, Action<object> handler)
    {
        if (_handlers.ContainsKey(eventName))    // Check if event exists
            _handlers[eventName] -= handler;     // Remove handler
    }
    
    public void Trigger(string eventName, object data)
    {
        if (_handlers.TryGetValue(eventName, out var handler))  // Get handler
            handler?.Invoke(data);               // Invoke if exists
    }
}
```

### Network Communication
```csharp
#region Networking
// Handle network messages
private void OnNetworkMessage(BasePlayer player, string message)
{
    try
    {
        var data = JsonConvert.DeserializeObject<NetworkMessage>(message);  // Parse message
        
        switch (data.Type)                       // Process by type
        {
            case "request":
                HandleRequest(player, data);      // Handle request
                break;
            case "response":
                HandleResponse(player, data);     // Handle response
                break;
            default:
                LogError($"Unknown message type: {data.Type}");  // Log error
                break;
        }
    }
    catch (Exception ex)
    {
        LogError($"Error processing network message: {ex.Message}");  // Log error
    }
}

// Send network messages
private void SendToPlayer(BasePlayer player, string type, object data)
{
    var message = new NetworkMessage            // Create message
    {
        Type = type,                            // Set type
        Data = data                             // Set data
    };
    
    var json = JsonConvert.SerializeObject(message);  // Serialize
    player.SendNetworkUpdate(json);             // Send to player
}
```

### Data Persistence
```csharp
#region Data Persistence
// Save data to disk
private void SaveData<T>(string filename, T data)
{
    try
    {
        var json = JsonConvert.SerializeObject(data, Formatting.Indented);  // Serialize
        System.IO.File.WriteAllText(                // Write to file
            $"data/{filename}.json",                // File path
            json                                    // JSON data
        );
    }
    catch (Exception ex)
    {
        LogError($"Error saving data: {ex.Message}");  // Log errors
    }
}

// Load data from disk
private T LoadData<T>(string filename) where T : new()
{
    try
    {
        var path = $"data/{filename}.json";         // File path
        if (!System.IO.File.Exists(path))          // Check file exists
            return new T();                        // Return new instance
            
        var json = System.IO.File.ReadAllText(path);  // Read file
        return JsonConvert.DeserializeObject<T>(json);  // Deserialize
    }
    catch (Exception ex)
    {
        LogError($"Error loading data: {ex.Message}");  // Log errors
        return new T();                            // Return new instance
    }
}
```

### Testing and Debugging
```csharp
#region Testing
// Debug logging
private void DebugLog(string message, [CallerMemberName] string caller = null)
{
    if (!config.DebugMode) return;               // Check debug mode
    
    LogInfo($"[DEBUG][{caller}] {message}");     // Log with caller info
}

// Performance monitoring
private class PerformanceMonitor
{
    private readonly Dictionary<string, Stopwatch> _timers;  // Performance timers
    
    public void StartTimer(string operation)
    {
        _timers[operation] = Stopwatch.StartNew();  // Start timer
    }
    
    public void StopTimer(string operation)
    {
        if (_timers.TryGetValue(operation, out var timer))  // Get timer
        {
            timer.Stop();                        // Stop timer
            LogInfo($"{operation} took {timer.ElapsedMilliseconds}ms");  // Log time
        }
    }
}
```

## Conclusion
// Final thoughts and recommendations

### Key Takeaways
1. Always validate input                         // Prevent errors
2. Use proper error handling                     // Maintain stability
3. Implement efficient data structures           // Optimize performance
4. Follow best practices                         // Write maintainable code
5. Document your code                            // Help other developers

### Next Steps
1. Join the Rust modding community              // Get support
2. Contribute to open source plugins             // Learn from others
3. Keep learning and improving                   // Stay updated
4. Share your knowledge                          // Help others
5. Build amazing plugins!                        // Have fun

## Advanced Error Handling
// Comprehensive error handling patterns

### Error Handler Implementation
```csharp
#region Error Handling
public class ErrorHandler
{
    private readonly Plugin _plugin;                             // Plugin reference
    private readonly Dictionary<string, int> _errorCounts;       // Error tracking
    private readonly Queue<LogEntry> _recentErrors;             // Recent errors
    private const int MAX_RECENT_ERRORS = 100;                  // Error limit
    
    public ErrorHandler(Plugin plugin)                          // Constructor
    {
        _plugin = plugin;                                       // Store reference
        _errorCounts = new Dictionary<string, int>();          // Initialize tracking
        _recentErrors = new Queue<LogEntry>();                 // Initialize queue
    }

    // Log error with context
    public void LogError(string context, Exception ex, 
        Dictionary<string, object> metadata = null)             // Log error
    {
        try
        {
            // Create error entry
            var entry = new LogEntry                           // Create entry
            {
                Timestamp = DateTime.UtcNow,                   // Current time
                Context = context,                             // Error context
                Message = ex.Message,                          // Error message
                StackTrace = ex.StackTrace,                    // Stack trace
                Metadata = metadata ?? new Dictionary<string, object>()  // Metadata
            };

            // Track error count
            var errorKey = $"{context}:{ex.GetType().Name}";   // Error key
            _errorCounts.TryGetValue(errorKey, out var count);  // Get count
            _errorCounts[errorKey] = count + 1;                // Increment

            // Add to recent errors
            _recentErrors.Enqueue(entry);                      // Add entry
            if (_recentErrors.Count > MAX_RECENT_ERRORS)       // Check limit
                _recentErrors.Dequeue();                       // Remove old

            // Log to console
            _plugin.LogError($"[{context}] {ex.Message}");     // Console log
            
            // Check for critical errors
            if (IsCriticalError(errorKey))                     // Check critical
                HandleCriticalError(entry);                    // Handle critical
        }
        catch (Exception logEx)
        {
            // Fallback logging
            _plugin.LogError($"Error in error handler: {logEx.Message}");
        }
    }

    // Check if error is critical
    private bool IsCriticalError(string errorKey)              // Check critical
    {
        if (_errorCounts.TryGetValue(errorKey, out var count))  // Get count
        {
            // Critical conditions
            if (count >= 10)                                   // Too many errors
                return true;
            
            // Check recent frequency
            var recentCount = _recentErrors.Count(e =>         // Count recent
                e.Context == errorKey.Split(':')[0] &&         // Same context
                e.Timestamp >= DateTime.UtcNow.AddMinutes(-5)  // Last 5 minutes
            );
            
            return recentCount >= 5;                          // Too frequent
        }
        return false;                                         // Not critical
    }

    // Handle critical errors
    private void HandleCriticalError(LogEntry entry)           // Handle critical
    {
        // Notify admins
        var admins = BasePlayer.activePlayerList              // Get players
            .Where(p => _plugin.permission                    // Filter admins
                .UserHasPermission(p.UserIDString, "admin"));

        foreach (var admin in admins)                         // Notify each
        {
            _plugin.SendMessage(admin,                        // Send message
                $"[Critical Error] {entry.Context}: {entry.Message}");
        }

        // Log to file
        var logPath = $"oxide/logs/critical_{_plugin.Name}.txt";  // Log path
        LogToFile("critical", $"[{entry.Timestamp}] " +      // Write log
            $"{entry.Context}: {entry.Message}\n" +
            $"Stack: {entry.StackTrace}\n" +
            $"Metadata: {string.Join(", ", entry.Metadata.Select(kvp => $"{kvp.Key}={kvp.Value}"))}");
    }

    // Error log entry
    private class LogEntry                                     // Log structure
    {
        public DateTime Timestamp { get; set; }               // Error time
        public string Context { get; set; }                   // Error context
        public string Message { get; set; }                   // Error message
        public string StackTrace { get; set; }                // Stack trace
        public Dictionary<string, object> Metadata { get; set; }  // Extra data
    }
}
#endregion
```

### Usage Examples
```csharp
#region Error Handling Examples
// Example usage in plugin
private void OnPlayerConnected(BasePlayer player)              // Connection handler
{
    try
    {
        // Process connection
        ProcessPlayerConnection(player);                       // Process player
    }
    catch (Exception ex)
    {
        // Log with context
        _errorHandler.LogError("PlayerConnection",            // Log error
            ex,
            new Dictionary<string, object>                    // Add metadata
            {
                ["PlayerId"] = player.userID,
                ["Name"] = player.displayName,
                ["IP"] = player.net?.connection?.ipaddress
            });
    }
}

// Example with custom error
private void ProcessPlayerConnection(BasePlayer player)        // Process connection
{
    if (!player.IsConnected)                                  // Check connection
        throw new InvalidOperationException(                  // Throw error
            "Player disconnected during processing");

    if (player.IsSleeping())                                 // Check state
        throw new InvalidOperationException(                  // Throw error
            "Cannot process sleeping player");

    // Process player...
}
#endregion
```

## Best Practices Summary
// Key takeaways and recommendations

### Code Organization
1. **Modular Design**
   - Split functionality into focused classes
   - Use dependency injection for better testing
   - Keep methods small and single-purpose

2. **Error Handling**
   - Always use try-catch blocks
   - Log errors with context
   - Handle edge cases gracefully

3. **Performance**
   - Cache frequently used data
   - Use appropriate data structures
   - Minimize database operations

4. **Security**
   - Validate all input
   - Use permission system properly
   - Sanitize player input

5. **Maintenance**
   - Comment code thoroughly
   - Use consistent naming
   - Keep documentation updated

### Common Pitfalls
1. **Memory Leaks**
   - Unsubscribe from events
   - Dispose resources properly
   - Clear cached data periodically

2. **Performance Issues**
   - Avoid expensive operations in loops
   - Use coroutines for heavy tasks
   - Batch updates when possible

3. **Security Vulnerabilities**
   - Never trust client input
   - Check permissions consistently
   - Validate all parameters

4. **Stability Problems**
   - Handle null references
   - Check for disconnected players
   - Validate game state

### Development Tips
1. **Testing**
   - Test in different scenarios
   - Use debug logging
   - Create test cases

2. **Debugging**
   - Use proper error logging
   - Add debug commands
   - Monitor performance

3. **Updates**
   - Keep dependencies updated
   - Follow API changes
   - Test after updates

4. **Community**
   - Share knowledge
   - Learn from others
   - Contribute back

This concludes our comprehensive Rust plugin development tutorial. Remember to always follow best practices, handle errors gracefully, and keep security in mind. Happy coding!