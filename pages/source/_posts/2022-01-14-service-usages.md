---
layout: post
title: Service usages
category: Studio
author: Thodor12
links: [
    "https://developer.roblox.com/en-us/api-reference/class/Sky",
    "https://developer.roblox.com/en-us/api-reference/class/Atmosphere",
    "https://developer.roblox.com/en-us/articles/post-processing-effects",
    "https://developer.roblox.com/en-us/api-reference/class/Script",
    "https://developer.roblox.com/en-us/api-reference/class/ModuleScript",
    "https://developer.roblox.com/en-us/api-reference/class/LocalScript",
    "https://developer.roblox.com/en-us/articles/Intro-to-GUIs",
    "https://developer.roblox.com/en-us/api-reference/class/ScreenGui",
    "https://developer.roblox.com/en-us/api-reference/class/BillboardGui",
    "https://developer.roblox.com/en-us/api-reference/class/SurfaceGui",
    "https://developer.roblox.com/en-us/api-reference/class/Player",
    "https://developer.roblox.com/en-us/api-reference/class/Humanoid",
    "https://developer.roblox.com/en-us/api-reference/class/Model",
    "https://developer.roblox.com/en-us/api-reference/class/Team",
    "https://developer.roblox.com/en-us/api-reference/class/Sound",
    "https://developer.roblox.com/en-us/api-reference/class/SoundEffect",
    "https://developer.roblox.com/en-us/api-reference/class/SoundGroup",
    "https://developer.roblox.com/en-us/articles/Lua-Chat-System",
    "https://developer.roblox.com/en-us/articles/Introduction-to-Localization-on-Roblox",
    "https://developer.roblox.com/en-us/api-reference/class/LocalizationTable",
    "https://devforum.roblox.com/t/1583158"
]
---

The explorer in Roblox Studio contains a lot of "top level services", all of those services have a specific function and are sometimes not used correctly.
I'm going over all these services and define what they are supposed to be used for.

# Workspace
Probably doesn't need a whole lot of explaining, the `Workspace` is the visual representation of the game, this is where you put all the instances that have to be rendered
in the actual game.

# Players
This container holds all of the player instances at runtime, this service should not be used for anything else.

# Lighting
This container holds all information about the game it's lighting information, back in the day this service was often used to store random pieces of game information, however in present day we have [ReplicatedStorage](#replicatedstorage) for this.
The only things that should be stored in `Lighting` are:
- [Sky](#link1)
- [Atmosphere](#link2)
- [PostProcessingEffects](#link3)

# MaterialService
This service is part of the [Custom Materials API](#link21). **Note that this is currently in BETA and does not work in live games**

This should be used to insert custom materials you want to use in your game.

# ReplicatedFirst
This service is similar to [ReplicatedStorage](#replicatedstorage) except that the contents of `ReplicatedFirst` always are replicated **before** [ReplicatedStorage](#replicatedstorage).

This service is ideal for making things that must run directly at the game startup, mainly loading screens.

Theoretically any asset can be placed in here but take care about what you place in here, not everything has to be given this kind of priority.

# ReplicatedStorage
This service is your general "dump" container, you can store anything you want in here. Note that this service unlike [ServerStorage](#serverstorage) is available to **both the server and the client**.

Examples are:
- Tools that you want to give players when you want to, but not in the [StarterPack](#starterpack)
- GUIs that you want to clone into the PlayerGui of any player from the client.
- RemoteEvents/RemoteFunctions

# ServerScriptService
This service is used to hold all of your [Scripts](#link4) that have to run.
I'm not going deep into whether you should put your scripts into here or in the [Workspace](#workspace), but my recommendation is keep anything that doesn't have to interact with the game inside `ServerScriptService` and anything related to the physical world (e.x. Touched interactions) inside [Workspace](#workspace).

You can also store all of the [ModuleScripts](#link5) in here, [ServerStorage](#serverstorage) or [ReplicatedStorage](#replicatedstorage) if you want but again this is a design choice, just keep in mind how your module itself replicates based on the service it's in.

# ServerStorage
This service is your general "dump" container, you can store anything you want in here. Note that this service unlike [ReplicatedStorage](#replicatestorage) is available to **only to the server**.

Examples are:
- Reusable ModuleScripts
- Server side assets you want to clone elsewhere which the client is not allowed to see

# StarterGui
This container is used to store all of the [GUIs](#link7) your game uses. These are:
- [ScreenGui](#link8)
- [BillboardGui](#link9)
- [SurfaceGui](#link10)

Nothing else should be put into this container, often people store [LocalScripts](#link6) in here aswell but we have [StarterPlayerScripts](#starterplayerscripts) for this.

Note: The contents are cloned to `Players/{Player}/PlayerGui`

# StarterPack
This container holds all of the tools that **all players** obtain when they spawn in. Therefore this container should only contain tools, nothing else.

There's also a subfolder inside the [Player](#link11) called `StarterGear`, this is used in combination with `StarterPack` and is able to provide **player specific** gear.

Note: The contents are cloned to `Players/{Player}/Backpack`

# StarterPlayer
This service accomodates two subfolders which have two respective tasks, however this service itself also has a couple of functions. Firstly it defines all of the settings related to players when they spawn in, for example camera settings, standard walking speed and jump power, movement modes and much more.

Additionally you can also insert two instances into here.
- [Humanoid](#link12) (Specifically named `StarterHumanoid`, used as the default `Humanoid` instance inside characters)
- [Model](#link13) (Specifically named `StarterCharacter`, used as the default character model)

## StarterPlayerScripts
This is a subservice of [StarterPlayer](#starterplayer) and contains [LocalScripts](#link6) which start to run when the player joins the game.

Note: The contents are cloned to `Players/{Player}/PlayerScripts`

## StarterCharacterScripts
This is a subservice of [StarterPlayer](#starterplayer) and contains [LocalScripts](#link6) which start to run everytime you respawn.

Note: The contents are cloned to `Workspace/{Player}` (the player character)

# Teams
This service it's sole purpose is to define [Teams](#link14). Teams subdivide the players into groups of players. Nothing else should be put into this service.

# SoundScape
This service contains sounds for the game that play independently of the [Workspace](#workspace), for example this can be used for cinematic background music that plays regardless of where you are on the map.

You can insert [SoundGroups](#link17) and [Sounds](#link15) into here, [SoundGroups](#link17) are used to control settings like the Volume of all [Sounds](#link15) directly below it.

Every [Sound](#link15) and [SoundGroup](#link17) is then able to include one or more [SoundEffects](#link16).

# Chat
This service is used to modify/extend the [Lua Chat System](#link18).

Normally you shouldn't have to edit anything inside of here as the chat modules are all inserted at runtime, you can however copy the chat system and manually place it inside `Chat` in order to fork it and make changes, do note that this means you will lose out on any updates Roblox makes to it.

The chat system allows you to extend it by using `ChatModules`, there's two folders called `ChatModules` and `ClientChatModules`.
You can insert these folders into the `Chat` and then provide custom extensions for the chat system.

**Important: Make sure you create a BoolValue called `InsertDefaultModules` inside these two folders and set it's value to true or none of the default chat modules Roblox provides will be loaded!**

___

# Other services that may appear
There are some more vague services that can appear in the list which I will give a quick mention aswell.

## NetworkClient
This only appears in Team Create instances and is only used to connect developers together to enable them to build together, this service can be ignored otherwise.

## LocalizationService
This service can be used to insert [LocalizationTables](#link20). These tables can either be manually uploaded through Studio but the intended use is to use the [localization portal](#link19) in the website.

## TestService
This service is used by Roblox Engineers to perform analytical testing on the game. It can be used by developers but the functionality is very limited.
The idea is you insert scripts into TestService which can be executed to check if certain conditions are correct.

___

# Remarks
Note that if you want to insert anything into the explorer you can use the plus symbol next to whatever you're trying to insert to and Roblox will give you one or more recommendations to insert into the given container, keep an eye on this as this will help you find the correct place to store your instances in.
