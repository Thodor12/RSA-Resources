---
layout: post
title: Understanding Scope
category: Scripting
author: Pog Chonk
---

A scope is a section of code where a variable is defined, in a valid state, and the variable is visible.  
e.x.

```lua
do
  local x = "banana"
             --| X was declared in this scope, cannot be accessed in outer scopes, but can be accessed in inner scopes.
  print(x) --> banana
end

print(x) --> nil
```

# Global VS Local Variables
A local variable has the lifetime of the scope they're declared in and are locked to that scope and inner scopes.  
A global variables lifetime is the time the script is running; it is not locked to any scope.  
e.x.
```lua
do
  local x = "banana" -- Local Variable
  -- X's lifetime is dependent on this scope since it's declared here.
  y = "apple" -- Global Variable
  -- Y's lifetime is only dependent on the runtime of the script.
end

print(x) --> nil
print(y) --> apple
```
 
This applies with functions too, functions declared via `local function foo()` is *almost* like doing `local foo = function() end`.  
e.x.
```lua
local function foo()      --  function foo()
                          --
end                       --  end

-- Similar too

local foo
foo = function()          -- foo = function()
                          --
end                       -- end
```

# Nesting Scopes
```lua
do
  local x = "banana"
  y = "apple"

  do
    local z = "tomato"
    t = "pear"
    print(x, y, z, t) --> banana  apple  tomato  pear
  end

  print(x, y, z, t) --> banana  apple  nil  pear
end

print(x, y, z, t) --> nil  apple  nil  pear
```

# Shadowing
Shadowing a variable is when you redefine what the value is later down in the same scope or an inner scope and results in unwanted behavior. A reason why `globals` should be avoided.

e.x. You have a variable `x` and you define another one in a different scope `y`, but you named it `x` instead.
```lua
local x = "banana"

do
  local x = "apple"
  print(x, y) --> apple (expected banana)  nil (expected apple - shadowed outer variable `x`)
end

print(x) --> banana
```