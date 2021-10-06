---
layout: post
title: Packages: What are they?
author: TheePBHST
---

As your game continues to develop and get larger in assets, you may start to realize (or not) that you have the same scripts in different assets in your game, and once you begin to lose track of these assets keeping track of them will get very difficult soon.

So, how could you solve this problem? Well thankfully, Roblox has introduced us a feature called, **Packages**. And no, these aren't the packages that make you look nice and strong, but these are the packages that allow you to make commits to your scripts (or even physical objects) and be able to update, revert, and view the changes to these packages.

In this post, I'll be showing you how to use packages, why should you use them, and other cases for them.

*disclaimer: this post was referenced off of the [Roblox Packages – Reusable Game Assets](https://developer.roblox.com/en-us/articles/roblox-packages) article provided by the Roblox Developer Resources site.*

### Setting Up Your Workspace
1. Open up a new empty **Baseplate**. *(optional: set ClockTime to 0)*
2. Create three new [`Parts`](https://developer.roblox.com/en-us/api-reference/class/Part)
    - Name your either of your three parts to **Red**, **Green**, and **Blue**. *(optional: space them out at least 10 studs)*
    - Change the colors of the parts to either **Really red**,  **Lime green**, or **Really blue**.
    - Insert a [`SurfaceLight`](https://developer.roblox.com/en-us/api-reference/class/SurfaceLight) into each part and apply these changes to its properties.
        - Angle: 10
        - Brightness: 20
        - Range: 6
3. Create a [`Script`](https://developer.roblox.com/en-us/api-reference/class/Script) inside of the `Red` part.

### Editing the Example Script
So in this new script we've created in the `Red` part, we're going to add a simple piece code.

```lua
local Part = script.Parent
local Light = Part.SurfaceLight

Part.Color = Light.Color
```
*simple, right?*

Go ahead and press `Run` (or F8) and check that the code works, if not, check the instructions below. Then copy the script and paste it into the other two parts, Green and Blue. Press `Run` again to ensure all the **SurfaceLights** match up with the part's color.

Then, in the `Red` part, open the script again and add these changes.

```lua
local Part = script.Parent
local Light = Part.SurfaceLight

Part.Color = Light.Color
Part.Material = Enum.Material.Neon
Part.Size = Vector3.new(5, 5, 5)
```

Just like before, press `Run` and ensure the code works and after that copy the modified script and overwrite the previous scripts inside of the other two parts.

### Creating a Package
Now that we've gotten the easy part out of way, you may begin to see how tedious this process could be, manually updating every script and keeping track of them. That's why packages will come in handy when these type of situations happen as you develop your game.

So let's create our first package! *(keep in mind that packages save into your inventory)*
1. Right-click the script located in the **Red** part. *(or either of the three, just know that it'll be the script you'll create changes inside of)*
2. Click `Convert to Package...` from the menu.
    - As you do that, a dialog window will appear. Fill out the **Title** to `Test Package` or anything you'd like.
    - Press **Submit**
3. Once you've submitted, you should see something called **PackageLink** inside the script. That's a way to know you've successfully created your own package!

### Accessing Your Packages and Inserting Them
There are two places where you can access your packages, [`Toolbox`](https://developer.roblox.com/en-us/resources/studio/Toolbox) or the **Packages** folder located in [`Asset Manager`](https://developer.roblox.com/en-us/resources/studio/Asset-Manager).

Now for our convienience, we'll be accessing our packages via **Asset Manager**. If you don't know where it is, right-click on the ribbon (if not there, Ctrl + F1), and click on **Asset Manager**.

Access the new package inside of the **Packages** folder and you should be able to see the package that you just created. From here, delete the Scripts in the other two parts where that doesn't have a **PackageLink** inside of them and then insert the package into each part.

### Commiting Changes to Packages
It doesn't matter which package you edit from as long as it's the same as the others.
