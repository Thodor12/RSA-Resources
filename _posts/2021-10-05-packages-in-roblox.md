---
layout: post
title: "Packages: What are they?"
author: TheePBHST
---

As your game continues to develop and get larger in assets, you may start to realize (or not) that you have the same scripts in different assets in your game, and once you begin to lose track of these assets keeping track of them will get very difficult soon.

So, how could you solve this problem? Well thankfully, Roblox has introduced us a feature called, **Packages**. And no, these aren't the packages that make you look nice and strong, but these are the packages that allow you to make commits to your scripts (or even physical objects) and be able to publish to other places, update other packages, and view the changes to these packages.

In this post, I'll be showing you how to use packages, why should you use them, and other cases for them.

*disclaimer: this post was referenced off of the [Roblox Packages – Reusable Game Assets](https://developer.roblox.com/en-us/articles/roblox-packages){:target="_blank"} article provided by the Roblox Developer Resources site.*

### Setting Up Your Workspace
1. Open up a new empty **Baseplate**. *(optional: set ClockTime to 0)*
2. Create three new [`Parts`](https://developer.roblox.com/en-us/api-reference/class/Part){:target="_blank"}
    - Name your either of your three parts to **Red**, **Green**, and **Blue**. *(optional: space them out at least 10 studs)*
    - Change the colors of the parts to either **Really red**,  **Lime green**, or **Really blue**.
    - Insert a [`SurfaceLight`](https://developer.roblox.com/en-us/api-reference/class/SurfaceLight){:target="_blank"} into each part and apply these changes to its properties.
        - Angle: 10
        - Brightness: 20
        - Range: 6
3. Create a [`Script`](https://developer.roblox.com/en-us/api-reference/class/Script){:target="_blank"} inside of the `Red` part.

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
    - Press **Submit**.
3. Once you've submitted, you should see something called **PackageLink** inside the script. That's a way to know you've successfully created your own package!

### Accessing Your Packages and Inserting Them
There are two places where you can access your packages, [`Toolbox`](https://developer.roblox.com/en-us/resources/studio/Toolbox){:target="_blank"} or the **Packages** folder located in [`Asset Manager`](https://developer.roblox.com/en-us/resources/studio/Asset-Manager){:target="_blank"}.

Now for our convienience, we'll be accessing our packages via **Asset Manager**. If you don't know where it is, right-click on the ribbon (if not there, Ctrl + F1), and click on **Asset Manager**.

Access the new package inside of the **Packages** folder and you should be able to see the package that you just created. From here, delete the scripts located in the other two parts which do not have a **PackageLink** inside of them, and then insert the package into each part.

### Committing Changes to Packages
It doesn't matter which package you edit from as long as it's the same as the others. Now that we have multiple packages, let's figure out how to commit changes to all of the packages in the game. *(you can also update packages in other games as long they're the same and the permissions are met)*

First, let's add some revisions to our code. Open the package and edit the code to this.

```lua
local Part = script.Parent
local Light = Part.SurfaceLight

Part.Color = Light.Color
Part.Material = Enum.Material.Neon
Part.Size = Vector3.new(5, 5, 5)
Part.Transparency = 0.8

Light.Brightness = 40
```

As you edit the code, you'll start to see an **orange dot** ![Package-Outdated-Icon_23x22](https://user-images.githubusercontent.com/24928894/136131342-20b28a1d-cf0b-46e5-ae57-a7c81df2e652.png){:target="_blank"}
 on the left of the package's name in the **Toolbox**. This indicates that there has been a change made to the code and it's most likely different from the current published version of the package.

Exit out of the script tab and let's start commiting these changes.
1. Right-click the edited package.
2. Click `Publish Changes to Package`.
3. A prompt will appear noticing you about the change you are about to publish.
    - If you don't want to see this dialog everytime you publish a change to a package, tick the box. *(not recommended)*
4. Press Publish when you are ready.

Congratulations, you've successfully published your first package.

### Updating Packages
Once you've updated a package, you want to also update the other packages now that they are considered outdated ![Package-Sync-Icon_25x22](https://user-images.githubusercontent.com/24928894/136132003-d13ab93b-3917-48c9-b1ac-9c04a3994886.png){:target="_blank"}.
There are two methods to updating your packages. Method 1 being updating all of them at once and Method 2 is updating the other packages one at a time.

#### Method One
1. Right-click a package that has been updated to the latest version.
2. Click `Update All`.
3. You will see a dialog appear.
    - There are four things to discuss here. (Version, Published On, Places, and Submit/Cancel)
        - Version: Shows the current version number.
        - Published On: Shows when the current version was last published.
        - Places: These are the places that have the current package inside the game. You have the option to publish these packages in those games.
        - Submit/Cancel: Self-explanatory.
4. Submit the update.

#### Method Two
1. Locate the outdated package ![Package-Sync-Icon_25x22](https://user-images.githubusercontent.com/24928894/136132573-6a3eab06-902a-4883-82f9-2ad0b0887f56.png){:target="_blank"}
 you'd like to update.
2. Right-click the package.
3. Click `Get Latest Package`.
4. A prompt will appear. *(read the notice in **Committing Changes to Packages**)*
5. Click `Get Latest`.

You've successfully updated your packages. Congrats!

### Viewing the Changes on a Package
Let's say somebody in your team, or you wanted to know what changes were made to the package. Well you can see what changes you've made with a few simple steps.
1. Right-click the unpublished package **or** outdated package. *(you'll know if a package is unpublished by the orange dot ![Package-Outdated-Icon_23x22](https://user-images.githubusercontent.com/24928894/136131478-53f345b2-7d8f-47c7-8ec2-2518071bd66d.png){:target="_blank"}
/ sync ![Package-Sync-Icon_25x22](https://user-images.githubusercontent.com/24928894/136131465-490ad49c-88be-417f-9189-9614193de825.png){:target="_blank"}
 indicator)*
2. Click `View Script Changes...`.

That was pretty simple, but what are we looking at?
    - Anything highlighted in red means that it was taken out or modified.
    - Anything highlighted in green means it was added in or modified.

### Conclusion
Well it's been a long read but that covers the basics of packages. There's not much left other than reverting changes to a package(s). Let's cover what you were able to do.

1. Create a package.
2. Update a package and the methods to do so.
3. View changes in a package.

If you have any questions regarding packages, don't be afraid to ask in the Discord. Thank you for reading and have fun programming!
