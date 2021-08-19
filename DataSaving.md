#### [< Back](/)

---

## Why does my data not save?
Too often we see people that combine PlayerAdded/PlayerRemoving to make datastore saving scripts.  
In theory this looks fine but in practice it doesn't save your data half of the time, why?

### When does the game exit?
The game stops running under any of 3 conditions
- All players have left the game
- A server shutdown was requested from the game page
- A game wide server migration was issued (basically server shutdown and teleport)

When inside of studio you're always alone, thus if you leave the game, the server will immediately kill itself since the last player left.  

### Asynchronous
It's important to remember that requests to the datastores are made asychronously, it takes time to complete them, they're not done just immediately.  
Knowing that the game immediately exits after the last player has left and that a datastore request takes time to complete, it's obvious that the server shuts down before the datastore request can finish, at this point is when dataloss occurs.  

### How to fix it?
Roblox provides a way that you can run code before the server immediately exits, game:BindToClose, you can bind any amount of functions to right before the game closes, these functions can run for at most 30 seconds before the server kills itself anyway.  
The way we use this is to save the data for all remaining players to make sure everything is saved before we exit the server.  
Example:
```lua
function SaveData(player)
  -- implement your saving logic here
end

game.Players.PlayerRemoving:Connect(SaveData)
game:BindToClose(function()
  for _, player in ipairs(game.Players:GetPlayers()) do
    SaveData(player)
  end
end)
```

#### I get a weird warning in the console saying "Datastore request was added to the queue".

This is because you're making two simultaneous write requests, 1 issued by PlayerRemoving and the other one issued by BindToClose. You can safely ignore this warning because Roblox can only write to the same datastore key every 6 seconds anyway.

---

Author: Thodor12  
Posted: 05/26/2021
