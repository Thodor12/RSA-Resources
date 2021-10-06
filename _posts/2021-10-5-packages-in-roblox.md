---
layout: post
title: Packages: What are they?
author: TheePBHST
---

As your game continues to develop and get larger in assets, you may start to realize (or not) that you have the same scripts in different
assets in your game, and once you begin to lose track of these assets keeping track of them will get very difficult soon.

So, how could you solve this problem? Well thankfully, Roblox has introduced us a feature called, [Packages](https://developer.roblox.com/en-us/articles/roblox-packages).
And no, these aren't the packages that make you look nice and strong, but these are the packages that allow you to
make commits to your scripts (or even physical objects) and be able to revert, update, and view the changes to these packages.

In this post, I'll be showing you how to use packages, why should you use them, and other cases for them.

### Setting Up Your Workspace
1. Open up a new empty **Baseplate**. *(optional: set ClockTime to 0)*
2. Create three new **Parts**
    - Name your either of your three parts to **Red**, **Green**, and **Blue**. *(optional: space them out at least 10 studs)*
    - Insert a `SurfaceLight` into each part and apply these changes to its properties.
        - Angle: 10
        - Brightness: 20
        - Range: 6
3. Create three a **Script** inside of the `Red` part.

### Creating the Example Script
So in this new script we've created
