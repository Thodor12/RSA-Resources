---
layout: post
title: Pairs vs IPairs
category: Scripting
author: Pog Chonk
---

`pairs` internally uses `next` (in Base Lua, in Luau they use a custom internal iterator).  
`pairs` works on `array`'s and `dictionary`'s since it doesn't have a determined order.

`ipairs` numerically indices the table (`1, 2, 3, ..., n`: where `n` is the length of the table), which is why it only works on tables with numeric indices (or array's).  
`ipairs` **STOPS** on `nil` values.

The iterator for `pairs` looks like.. (in Vanilla Lua, we don't know about Luau because they haven't released their internal iterator)
```lua
function pairs(t)
    return next, t, nil --// `nil` is generally avoided since it increases the performance of the loop
end
```

The iterator for `ipairs` looks like..
```lua
function iter(a, i)
    i = i + 1
    local v = a[i]
    if v ~= nil then
        return i, v
    end
end
    
function ipairs(a)
    return iter, a, 0
end
```

Fun Fact: If you manually set the array-type indices, Lua will think of it as a dictionary instead when iterating with `pairs`. Still behaves like an array though.

```lua
local array = {
  [1] = "A",
  [2] = "B"
}

print(#array) --> 2

for index, value in pairs(array) do
  print(index, value)
end

--[[
2 B 
1 A

Instead of

1 A
2 B
]]--
```
