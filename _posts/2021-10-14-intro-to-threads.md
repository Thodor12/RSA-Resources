---
layout: post
title: Intro to threads
author: Pog Chonk
excerpt: "There's a lot of misconceptions about threads in Lua(u). This article will explain the major parts that you need to know about threads."
---

There's a lot of misconceptions about threads in Lua(u). This article will explain the major parts that you need to know about threads.  
  
Let's start off by what is a thread? You can think of a thread as a piece of paper and on this paper is instructions. These instructions are the code you wrote which then the employee will execute these instructions. The employee in our case is our VM ([Virtual Machine](https://en.wikipedia.org/wiki/Virtual_machine#Process_virtual_machines){:target="_blank"}).

### How do threads work?

In Lua, threads are ran concurrently not in parallel. This is the biggest misconception. Well, what's the difference?

**Concurrent Execution**: Execution of a thread at a single time while being able to switch thread execution.  
**Parallel Execution**: Execution of two or more threads at a single time.

Lua being Lua, it is single-threaded, running 1 thread at a time. Though, it seems as if it is running multiple threads at a time because of how fast its execution is. This is all done by internal magic. The internal magic relies on a "queue" of threads.

The first thread gets thread execution and executes until it *yields*, when it yields it pauses thread execution for that thread and throws it in the back of the line. Then the next thread comes up and starts executing. This process is repeated until all threads have finished executing, or pretty much when all threads have "died".

![Single threaded execution](https://upload.wikimedia.org/wikipedia/commons/a/a5/Multithreaded_process.svg)

In this example you can see that `Thread #1` was executing, it yielded, then passed execution over to `Thread #2`, it yielded or finished executing (died), and then passed execution back over to `Thread #1` to finish executing.

###### Fun Fact: Roblox has implemented a beta stage of their multithreaded attempts using the [Actor Model](https://en.wikipedia.org/wiki/Actor_model){:target="_blank"}.

### How do you make and run a thread?

In Luau, there are multiple ways of creating and running threads. In our case, we're going to focus on [coroutines](https://developer.roblox.com/en-us/api-reference/lua-docs/coroutine){:target="_blank"}.

Coroutines are the most common ways of creating a thread.
Simply by:

```lua
coroutine.create(function()
    print("Hello World!")
end)
```

Now, this only created the thread; it hasn't executed the thread yet.
To do this, we can use `task.spawn` or `coroutine.resume`.

```lua
local thread = coroutine.create(function()
    print("Hello World!")
end)

coroutine.resume(thread) --> Hello World!
task.spawn(thread)       --> Hello World!
```

**Tip**: With `task.spawn`, you don't *need* a thread, you can pass a function as well.

```lua
task.spawn(function()
    print("Hello World") --> Hello World!
end)
```

The difference here is that `coroutine.resume` is native to Vanilla Lua and that `task.spawn` communicates directly with the task scheduler and runs at 60hz.

There is a second method using coroutines, `coroutine.wrap`, the only thing with this function is that it propagates errors to the output coming from the calling thread which terminates the calling thread instead of the created thread.

E.x.

```lua
coroutine.wrap(function()
    print("Hello World!") --> Hello World!
end)()
```

You might be asking why are there two parentheses `()` at the end? Well, `coroutine.wrap` returns a function, more specifically a closure of the created thread which can be called to resume the thread.

Which you can then do..

```lua
local closure = coroutine.wrap(function()
    while true do
        print("Hello World!")
        coroutine.yield()
    end
end)

closure() --> Hello World!
closure() --> Hello World!
closure() --> Hello World!
```

Now, you might be asking "what is `coroutine.yield()` and why is it there?"

Well, the function name itself is self-explanatory. It will just yield the thread it was called in. This means that our thread is now `suspended` not `dead`. We do this because you cannot resume a dead thread. Once a thread is dead, it cannot be "revived" or resumed. Suspended threads, however, can by either calling the closure from `coroutine.wrap` or calling `coroutine.resume` passing in your thread.

When a yielded thread becomes resumed, either by Roblox or manually, it will resume where it was yielded.  
So in our case:

```lua
local thread = coroutine.create(function()
    while true do
        print("Hello World!")
        coroutine.yield() --// When thread is resumed, the thread execution will start here from where it was yielded.
    end
end)

coroutine.resume(thread) --> Hello World!
coroutine.resume(thread) --> Hello World!
coroutine.resume(thread) --> Hello World!
```

### Why multiple threads in one script?

Threads are useful for when you want blocking code to execute differently from the rest of your code. An example could be an infite `while true do` loop that constantly checks for a condition while the rest of your executes normally, not being blocked.

E.x.

```lua
local a = 0

local blockingCode = coroutine.create(function()
    while true do
        if a > 10 then
            print("Not there yet")
        else
            print("We're here!")
        end
        a += 1
        task.wait() -- task library's supersede of wait()
    end
end)

task.spawn(blockingCode)

--... // Rest of this code runs, while the "blockingCode" thread is yielding.
-- The "blockingCode" thread will resume execution whenever the main thread finishes its execution.
```
