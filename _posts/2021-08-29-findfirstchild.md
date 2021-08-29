---
layout: post
title: FindFirstChild and WaitForChild
author: Thodor12
---

There's some pretty big differences between `FindFirstChild` and `WaitForChild` which you have to understand in order to properly use them.

## FindFirstChild
When using `FindFirstChild` you are not guaranteed to actually get a result, this is because it attempts to find the first child with the given name.
If this child does not exist it returns `nil`. Note that this method also doesn't wait for a child to appear. If the child isn't present at the time `FindFirstChild` runs
it's either just not present at all, or if you assume it has to be present it could be it's not replicated from the server yet.

This means that constructions where you directly access the result of `FindFirstChild` like:
```lua
print(parent:FindFirstChild("Child").Name)
```
are not guaranteed to work and can potentially run into errors at runtime.

You need to make sure that you properly check if the result is not nil before using the result:
```lua
local child = parent:FindFirstChild("Child")
if child ~= nil then
  print(child.Name)
end
```

## WaitForChild
Unlike `FindFirstChild`, `WaitForChild` is guaranteed to always return an instance, however it yields the current thread until a child with the given name is present.

`WaitForChild` also allows you to pass a number as the second argument which defines the timeout. This means `WaitForChild` will only wait for an x amount of seconds.
If you use this parameter then `WaitForChild` can return `nil` too, just like `FindFirstChild`.

Additionaly `WaitForChild` also drops warnings in the output: "Infinite yield possible ...", this means `WaitForChild` has already been yielding for **5** seconds already without
being able to get a result already. Most of the time this means that the instance you were expecting to load doesn't actually exist.
In some rare cases it's actually possible that it would take more than 5 seconds to load.

Note that this warning is not thrown when you provide the timeout parameter.

## API references
You can read more on the individual methods here:  
https://developer.roblox.com/en-us/api-reference/function/Instance/FindFirstChild  
https://developer.roblox.com/en-us/api-reference/function/Instance/WaitForChild  
