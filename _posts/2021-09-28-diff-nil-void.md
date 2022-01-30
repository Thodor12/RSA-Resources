---
layout: post
title: The difference between nil and "void"
category: scripting
author: artblart
---

A common misconception in Lua is that functions have an implicit return value. This is not true. Functions have an implicit return *instruction*, meaning a function will always return after execution even if no return is specified. This implicit return instruction will never carry any value.

This is not to be confused with `nil`, however. For the sake of explanation, we will call this complete absence of value `void`. The source code for Lua 5.1 refers to it as `None` but `void` is a much more common term in the world of programming.

The difference between the two comes from the way emptiness is represented in Lua. `nil` is a value that represents the absence of a value. It is possible to work with `nil` in Lua because it is a native datatype. For the sake of the analogy we will call `nil` a "tangible nothing." It is a value that we can use that represents nothing. `void` on the other hand, is an "intangible nothing." Lua does not comprehend this lack of value because it was designed to use `nil` as a lack of value. The only way to detect this nothingness is through C functions. Take this for example:

```lua
local function returnsVoid()
	-- nothing here! return instruction is auto generated.
end

local function returnsNil()
	return nil
end

print(select("#", returnsVoid())) --> 0
print(select("#", returnsNil())) --> 1
```

`select` is a function with some overloads, the one we're using simply counts the number of arguments passed to it and returns it.

As we can see, there is a detectable difference. However, in most cases this `void` will end up being coerced into `nil` because it makes more sense to the user. This begs the question, "If void is coerced into nil most of the time, why does it matter?" This is the beautiful part. For the most part, it really doesn't matter! There is a few cases where it can come back to bite you though.

Let's reuse the functions we defined earlier for this next example.

```lua
local t = {1,2,3}

table.insert(t, returnsNil()) --> while generally useless, this code is safe and causes no issues.

table.insert(t, returnsVoid()) --> this will error during runtime because table.insert is an overloaded function! 
-- it expects 2 or 3 arguments but since void is a complete absence of value, it only sees table.insert(t)
```

A Roblox related example of this difference is in the function `Instance:GetAttribute()`. It has the capability to return `void` which comes with the same problems as the above example.