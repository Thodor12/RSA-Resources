---
layout: post
title: Using StarterGui
category: Scripting
author: Thodor12
---

StarterGui is a service which lets you clone GUI's to any player their PlayerGui folders, however you should avoid using it in code directly.

### How does StarterGui work?
StarterGui itself doesn't actually contain the GUI's that the player gets to see. StarterGui is purely a container which is there to clone
all it's contents to the `Player` their `PlayerGui` everytime they spawn in.

These GUI's are essentially templates and nothing more.

### Why should I not use them in my code?
Sometimes people want to manipulate something on their GUI, but they don't see the changes appearing, why?

Most of the time this is due to people manipulating the GUI inside StarterGui, as said before these are only templates.
The changes are not being made to your actual current GUI but to the template, this means you'll only see the changes if you die and respawn.
If that happens the GUI gets cloned again from StarterGui back to your `PlayerGui`, at which point you'll see the changes.

### The solution
It's actually really easy, we discussed before that StarterGui gets cloned to `PlayerGui`, so when you want to manipulate the GUI you have to
find the current GUI inside your own player it's `PlayerGui`.

For example you can replace:

```lua
local myGui = game:GetService("StarterGui").MyGui
```

with:

```lua
local myGui = game:GetService("Players").LocalPlayer.PlayerGui.MyGui
```

There's also an alternative, this is to simply keep the scripts that manipulate the GUI inside of your actual GUI instance.
This way you can just refer to the GUI and any descendants of the GUI by using `script.Parent`, which is relative to your script.
Localscripts only run when they are a descendant of the player, not if they are inside StarterGui. Which means it doesn't attempt to mess
with your GUI's inside StarterGui.