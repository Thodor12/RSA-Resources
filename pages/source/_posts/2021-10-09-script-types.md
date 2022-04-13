---
layout: post
title: Script types
category: Studio
author: Thodor12
links: [
    "https://developer.roblox.com/en-us/api-reference/function/Players/CreateLocalPlayer",
    "https://devforum.roblox.com/t/a-current-explanation-of-normal-identities-and-security-tags/219471",
    "https://raw.githubusercontent.com/MaximumADHD/Roblox-Client-Tracker/roblox/API-Dump.json"
]
---

Roblox has multiple different script types, understanding the differences and where you can use them is essential for developing your games.

# All script types
Roblox has three main script types that you need to know:

## Script
The first one is the simple Script, also sometimes referred to as ServerScript or NormalScript.
These scripts run on the server, indepently of all clients. They start running as soon a server is started.

Scripts can run in the following places:
- Workspace
- Players (inside a specific player, for example the backpack)
- ServerScriptService

## LocalScript
A LocalScript is the opposite of your regular Script, this one runs on the client (per player) as opposed to the server.
These scripts are able to access `game:GetService("Players").LocalPlayer` to know which client (player) the script is running for.

LocalScripts can run in the following places:
- Workspace (as a child of the player it's character)
- Players (inside a specific player, for example the backpack)
- ReplicatedFirst

LocalScripts also have two services that they are unable to read/access:
- ServerScriptService
- ServerStorage

Both of these services are not replicated to the client and thus the client can't see anything in these services.

## ModuleScript
ModuleScripts are a special case, these scripts cannot run on their own and have to be `require`d by either a Script or a LocalScript in order to run.
It doesn't matter where you save these scripts but the general consensus is to put them either inside ServerStorage or ReplicatedStorage, the only thing that matters
is that the script which is supposed to `require` the module can actually access it (for example LocalScripts cannot require modules inside ServerStorage, as they cannot see this service).

As discussed before both script types also have some restrictions on what they are able to do (for example LocalPlayer).
ModuleScripts inherit these restrictions based on what type of script they are required by, we'll delve deeper into this in the next section.

## CoreScript
Although these scripts cannot be created and are managed by Roblox, it's good to know that they exist because they also come with their own permission level
and have a more broad API which a lot of them normal scripts cannot access, for example [CreateLocalPlayer](#link1).

# Permission levels
Each script type comes with a different set of permissions, this is how the API distinquishes which script is able to use certain services or methods.
For example only Scripts have access to DataStoreService and HttpService, whereas only LocalScripts can use UserInputService and ContextActionService.

These permission levels can for the most part be found on the API documentation, where sometimes it says "xxxSecurity". For example on the previously shown [CreateLocalPlayer](#link1) page you can see on the top it says "LocalUserSecurity". This means it can only be called by the core or the command bar. Not inside (Local)Scripts nor plugins.

You can find in-depth information about all permission levels [here](#link2).

Additionally you can find the entire API dump here so you can quickly see the security read & write permissions that are needed for the entire API [here](#link3).