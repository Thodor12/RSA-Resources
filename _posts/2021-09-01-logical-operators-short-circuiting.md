---
layout: post
title: Logical operators, and their short circuiting behavior
author: steve15
---

A key part into learning how to use pseudo ternaries in Lua(u) is understanding how each part of it works, and this was written especially for that. But, before we get into the workings of logical operators and their short circuiting behavior, the truthyness and falsyness of values needs to be covered first.

### What does it mean for something to be truthy or falsy?
Since the truthyness and falsyness of values in Lua(u) should be understood before diving into the world of logical operators, the following is a brief overview:

- **Falsy** For something to be considered falsy, it has to evaluate to `nil` or `false`. If you're not sure of what `nil` is, it's a data type that represents nothing. The only examples of falsy values are `nil` and `false`.

- **Truthy** For something to be considered truthy, it must not be falsy. Examples of truthy values are numbers, strings, tables, and **anything else that's not falsy**.

Do keep in mind that **the truthyness and falsyness of values vary depending on the programming language you’re working with**. That is, a value considered truthy in one programming language may be falsy in another and vice versa.

### What are the logical operators?
Usually, an operator has at least one value it operates on, which are its operands. For example, in the expression `1 + 14`, `1` and `14` are the operands. And if you aren't already aware, there's three logical operators you can work with:

- `<firstOperand> or <secondOperand>` The logical `or` operator operates on two operands. `or` **only wants one of its operands to be truthy**. If the `<firstOperand>` is truthy, then it's evaluated and returned, without evaluating the `<secondOperand>`. However, if the `<firstOperand>` is falsy, then the `<secondOperand>` is evaluated and returned. Here's some examples:

```lua
-- 15 is <firstOperand>.
-- 16 is <secondOperand>.
print(15 or 16) -- Prints 15 because 15 is truthy.

-- false is <firstOperand>.
-- 15 is <secondOperand>.
print(false or 15) -- Prints 15 because false is falsy.

-- CHALLENGE #1:
-- Can you figure out what this would print?
print(false or (16 or 15))
```

- `<firstOperand> and <secondOperand>` Likewise to `or`, the logical `and` operator operates on two operands as well. The difference being that `and` **wants both of its operands to be truthy**. If the `<firstOperand>` is truthy, then the `<secondOperand>` is evaluated and returned. However, if the `<firstOperand>` is falsy, then it’s evaluated and returned, without evaluating the `<secondOperand>`. Here’s another set of examples:

```lua
-- 14 is <firstOperand>.
-- 15 is <secondOperand>.
print(14 and 15) -- Prints 15 because 14 and 15 are truthy.

-- nil is <firstOperand>.
-- 16 is <secondOperand>.
print(nil and 16) -- Prints nil because nil is falsy.

-- CHALLENGE #2:
-- Can you figure out what this would print?
print(("Cool." and "Epic.") and "You’re cool and epic!")
```

- `not <operand>` Unlike the others, the logical `not` operator only operates a single `<operand>`. Being the simplest of them all, all `not` does is invert its `<operand>`.  If the `<operand>` is truthy, then not `<operand>` returns `false`. However, if the `<operand>` is falsy, then not `<operand>` returns `true`. Here’s the last set of examples:

```lua
-- 15 is <operand>.
print(not 15) -- Prints false because 15 is truthy.

-- nil is <operand>.
print(not nil) -- Prints true because nil is falsy.  

-- CHALLENGE #3:
-- Can you figure out what this would print?
print(not (not (false and 15)))
```

### Example usage of NOT
Let’s say you have a `guiObject` which you want to toggle its `Visible` property’s value on and off each time a `guiButton` is clicked. A naive solution would be:

```lua
guiButton.MouseButton1Click:Connect(function()
    if guiObject.Visible then
        guiObject.Visible = false
    else
        guiObject.Visible = true
    end
end)
```

An alternative and more concise solution, however, would be:

```lua
guiButton.MouseButton1Click:Connect(function()
    guiObject.Visible = not guiObject.Visible
end)
```

The example above would work because let’s say that the `guiObject.Visible` property’s value starts off as `true`, meaning it’s visible. If you click the `guiButton`, `not` would invert `true` and the result would be `false` because `true` is truthy. Then, the `guiObject.Visible` property’s value is set to `false`, meaning it’s invisible. If you click the `guiButton` again, `not` would invert `false` and the result would be `true` because `false` is falsy.

```lua
-- guiObject.Visible’s value starts off true.
-- FIRST CLICK:
guiObject.Visible = not guiObject.Visible

-- Which becomes:
guiObject.Visible = not true

-- Which becomes:
guiObject.Visible = false


-- SECOND CLICK:
guiObject.Visible = not guiObject.Visible

-- Which becomes:
guiObject.Visible = not false

-- Which becomes:
guiObject.Visible = true
```

So as you click the `guiButton`, this pattern repeats.

### Short circuiting with logical operators

As mentioned earlier, when the `<firstOperand>` of `or` is truthy, it’s evaluated and returned, **without evaluating the `<secondOperand>`**. And it was also mentioned, when the `<firstOperand>` of `and` is falsy, it’s evaluated and returned, without evaluating the `<secondOperand>`. This idea of `or` and `and` only evaluating what it needs depending on the truthyness or falsyness of its operands is called **short circuit evaluation** or **short circuiting**, for short. 

An important thing to keep in mind is that although this section focuses on short circuiting with the logical operators, **short circuiting isn’t just limited to them**. That is, [if-elseif statements can also short circuit their conditions.](https://devforum.roblox.com/t/does-short-circuiting-an-if-statement-exist-in-lua/234677){:target="_blank"}

### Pseudo Ternary
Some programming languages provide direct support for something called the ternary `?` operator, or ternary, for short. However, Lua(u) doesn’t. Nonetheless, you can think of the ternary as a shorthand, for using if-else statements, that operates on three operands. Here’s its general syntax:

```lua
-- <firstOperand> ? <secondOperand> : <thirdOperand>
-- Where:
-- <firstOperand> is the condition being tested.

-- <secondOperand> is the expression that’s evaluated 
-- and returned if the condition is truthy.

-- <thirdOperand> is the expression that’s evaluated
-- and returned if the condition is falsy.
```

So its syntax can also be expressed as:

```lua
-- <conditionExpression> ? <truthyExpression> : <falsyExpression>
```

Now, as mentioned before, Lua(u) doesn’t provide direct support for the ternary. However, by using the logical `and` and `or` operators and their short circuiting behavior, together, it’s possible to get behavior similar to the ternary. Pseudo just means fake. So, this is why it’s called the **pseudo ternary operator** or **pseudo ternary**, for short. Here’s what its syntax looks like:

```lua
-- <firstOperand> and <secondOperand> or <thirdOperand>

-- Or if you prefer:
-- <conditionExpression> and <truthyExpression> or <falsyExpression>
```

As you can see, the pseudo ternary syntax is not far from the actual ternary syntax. So, once again, here’s the way it works:
If the `<firstOperand>` or `<conditionExpression>` is truthy, then the `<secondOperand>` or `<truthyExpression>` **is evaluated and returned as the first operand of `or`**. Since the `<secondOperand>` or `<truthyExpression>` is expected to be truthy, it’s evaluated and returned. 

However, if the `<firstOperand>` or `<conditionExpression>` is falsy, then **it’s also evaluated and returned as the first operand of `or`**. But here’s where things change. Since the first operand of `or` is falsy, the `<thirdOperand>` or `<falsyExpression>` is evaluated and returned. Here’s some examples:

```lua
local x = 15

-- x == 15 is <firstOperand> or <conditionExpression>.
-- “15 is a cool number.” is <secondOperand> or <truthyExpression>.
-- “But this number is cooler” is <thirdOperand> or <falsyExpression>.
-- Prints “15 is a cool number.” if x == 15.
print(x == 15 and "15 is a cool number." or "But this number is cooler.")

-- CHALLENGE #4:
-- Can you figure out what this would print if part.Anchored == true?
print(part.Anchored and "Anchored" or "Unanchored")
```

### Caveats

#### Why pseudo ternaries won’t always work
Unfortunately, pseudo ternaries will never work the exact same way as the actual ternary is because when the `<secondOperand>` or `<truthyExpression>` is falsy, the `<thirdOperand>` or `<falsyExpression>` is evaluated and returned which is because of how `or` works.

For this reason, it’s recommended that **when you have a falsy expression in the place of the `<secondOperand>` or `<truthyExpression>` that you use if statements instead.**

As an alternative solution, you can use not to invert the `<secondOperand>` or `<truthyExpression>` so that it’s a truthy expression, as it’s expected to be. However, doing that would only add the complexity of the issue. Therefore, the first solution is better.

#### Pseudo ternaries vs if statements
A lot of the time if statements can be replaced by pseudo ternaries, however, this doesn’t mean that you should always do this. Overusing pseudo ternaries for the sake of reducing the amount of if statements (and for this reason, the amount of lines) is a bad practice to follow.

Use pseudo ternaries in places where it would improve the readability of your code to you, your future self and other programmers as well. Because at the end of the day, **your code's readability should generally be prioritized over its size.**
