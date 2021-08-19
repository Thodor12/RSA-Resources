---
title: Task Library
---

#### [< Back](/)

---

## Task library, new wait function  
Along with the update of the [Task Library](https://devforum.roblox.com/t/task-library-now-available/1387845){target="_blank"}, we got a new set of functions for task scheduling, along with a new and improved `wait()` function, namely `task.wait()`.

This function is the new equivalent of doing `RunService.Heartbeat:Wait()` which was always considered a better option.

Along with the new Find and Replace window Roblox recently introduced it's now very easy to convert to this new function by use of a regex operation:
- Fill in in the find bar: `(?<![\S\.])wait\(`
- Enable regex searching (third icon next to find bar, the dot with the star)
- Fill in the replace bar: `task.wait(`

What this does it looks for all occurences of `wait(` with a couple of additional checks
- It does not catch cases that are preceded by any other non whitespace character (means it won't alter things like variables or functions which are trailing with `wait(`
- It does not catch cases that are preceded by a dot (this means it won't accidently overwrite any occurences of existing `task.wait(`

---

Author: Thodor12  
Posted: 08/15/2021
