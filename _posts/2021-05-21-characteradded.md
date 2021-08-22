---
layout: post
title: CharacterAdded
author: Thodor12
---

Often people use
```lua
local character = player.Character or player.CharacterAdded:Wait()
```
in order to fetch the character if it exists or wait until it exists.
This call however has some indirect consequences that you do not directly notice.

### Usage in StarterPlayerScripts:
Problem:  
The problem with using this statement inside StarterPlayerScripts is that the player scripts run when a player joins and do not run again when characters respawn.  
This means that you only fetch the character once at the start, and the `character` variable will then always point to the first character and never updates on respawn.  
This will cause problems when you then attempt to edit something using that character variable (because that character no longer exists).

Solution:  
Avoid defining the character globally. Make sure that you always fetch the character whenever you need it, this generally means putting it inside of events.

### Usage in StarterCharacterScripts:
Problem:  
In this case the statement is entirely unnecessary since StarterCharacterScripts run as soon as the character loads in.

Solution:  
Use `script.Parent` instead

### Usage in StarterGui
Problem:  
Code running in StarterGui is the same as StarterCharacterScripts, the lifetime of a GUI is the same as a character (depending on whether or not ResetOnSpawn is true). This however doesn't mean you should utilize this solution as scripts here still have the potential to run the same way like StarterPlayerScripts (when ResetOnSpawn is false).

Solution:  
See usage in [StarterPlayerScripts](#usage-in-starterplayerscripts)

### Usage in PlayerAdded
Problem:  
When used inside PlayerAdded this code will only run for the first time the player spawns in.

Solution:  
Use :Connect for your CharacterAdded event
```lua
game.Players.PlayerAdded:Connect(function(player)
  player.CharacterAdded:Connect(function(character)

  end)
end)
```

### Usage inside of event callbacks:
Problem:  
When you use this statement inside of events (for example in remotes) you will cause that thread to hang for some time, this becomes an even greater problem if you game does not have CharacterAutoLoads enabled. Events are meant to be processed as soon as possible and then stop execution.

Solution:  
Knowing that events should always stop execution as soon as possible it's recommended to abort the event if the condition for an existing character is not met
```lua
local character = player.Character
if not character then return end
```

This will abort the request as soon as it sees that there is no character, instead of waiting until there is a character present.