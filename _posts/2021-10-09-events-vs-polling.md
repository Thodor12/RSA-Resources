---
layout: post
title: Events vs polling
author: Thodor12
---

Roblox is an event-driven system, but what does this entail exactly?

### Event-driven vs polling
What does this mean exactly?

- Event-driven is when you rely on events to trigger certain pieces of code, for example callback functions.
- Polling is where you use continuous checks to see if a certain condition is met and then taking action.

Just from reading that it shouldn't be hard to guess that event-driven solutions are better because it simply won't require continuous checks.
However do note in some cases a polling system is necessary whether you like it or not.

### But how do I use events?
Say you need to update your text on a GUI based on a leaderstats value.
A polling example would look something like this:

```lua
local value = game:GetService("Players").LocalPlayer.leaderstats.MyValue

while true do
    script.Parent.Text = value.Value
    task.wait()
end
```

Although this works this has a big flaw, unnecessary updates. Most of the time your value likely isn't even updating, so you are continuously
setting the Text of your TextLabel even though there's no change at all, this is a waste of performance.
An event driven system can fix it by doing this:

```lua
local value = game:GetService("Players").LocalPlayer.leaderstats.MyValue

value.Changed:Connect(function()
    script.Parent.Text = value.Value
end)
```

This will only update the Text of the TextLabel whenever a change occurs in the value object. Roblox has events for this (they are called RBXScriptSignals)
and they have a `:Connect` method, `:Connect` takes a single argument, a callback function.
This function is fired by the Roblox engine whenever the event is fired either internally or by other means.

Events come in all sorts of forms, be it changed listeners on instances, events like `PlayerAdded`/`CharacterAdded` or even manually callable events like Remote/Bindable events.

Like I said before it's not always sunshine, there are cases where you most definitely need to do something continuously.
This comes mostly into play when working with physics, for example movement.

Roblox has a limit when it comes to changed events, they are only triggered on direct property assignments, but physics updates do not trigger changed events.
This means that if you need to check for changes in the `MoveDirection` of the `Humanoid` you will find yourself needing a polling solution to constantly
read out the `MoveDirection` property, you can do this either by using while loops, or preferably by using RunService.
For example:

```lua
-- Localscript inside of the character
local humanoid = script.Parent.Humanoid

humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function() -- this will never fire because it's updated through physics
end)

game:GetService("RunService").RenderStepped:Connect(function(step)
    print(humanoid.MoveDirection)
end)
```

Even though you must do something like this, it doesn't mean you can build an event-driven system on top of this if you really want to.
A changed event for example only has to check if the previous value doesn't match the current value, and then trigger a function.
For example:

```lua
-- Localscript inside of the character
local humanoid = script.Parent.Humanoid
local lastDirection = humanoid.MoveDirection

function moveDirectionUpdated()
    print("Move direction updated")
end

game:GetService("RunService").RenderStepped:Connect(function(step)
    if lastDirection ~= humanoid.MoveDirection then
        moveDirectionUpdated()
    end
    lastDirection = humanoid.MoveDirection
end)
```

Even though this is backed by a polling system you can still filter out the bulk of the work that needs to be done only when it's necessary.