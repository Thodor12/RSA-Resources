---
layout: post
title: Properties not updating
category: scripting
author: Thodor12
---

Sometimes we see people that do things like setting the Text of a TextLabel recusively, wanting it to constantly update it's value based on a leaderstats value or something similar, however the GUI doesn't show a single update despite changing the value of the leaderstats.

An example of this is like this:

```lua
local value = game.Players.LocalPlayer.leaderstats.MyLeaderStat.Value

while true do
  game.Players.LocalPlayer.PlayerGui.MyLeaderstatsGui.TextLabel.Text = value
  wait()
end
```

If you have code like this the text will never update because the variable called `value` will always contain the same value, the one it got when the script started running.
Luckily there's an easy way to solve this. It's better when you keep the leaderstats value object itself in a variable and instead check the `.Value` everytime the loop runs, example:
```lua
local myLeaderStatsObject = game.Players.LocalPlayer.leaderstats.MyLeaderStat

while true do
  game.Players.LocalPlayer.PlayerGui.MyLeaderstatsGui.TextLabel.Text = myLeaderStatsObject.Value
  wait()
end
```

This will work just fine, however we can improve it one step further, generally it's not even needed to put things like this in a while loop, it's just wasted performance, you're running this code even if there are no updates in the value, this can be solved if we use a Changed listener on the leaderstats values, example:
```lua
local myLeaderStatsObject = game.Players.LocalPlayer.leaderstats.MyLeaderStat

myLeaderStatsObject.Changed:Connect(function(value)
  game.Players.LocalPlayer.PlayerGui.MyLeaderstatsGui.TextLabel.Text = value
end)
```

This code will only run when a change in the value would be detected, greatly increasing the performance of the script.

This example given the updating of Text is just one example, the exact same idea applies to other cases aswell.