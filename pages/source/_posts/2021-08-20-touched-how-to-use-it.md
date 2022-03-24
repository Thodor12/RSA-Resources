---
layout: post
title: Touched, how to use it and it's limitations
category: Scripting
author: Thodor12
---

Touched is an event which you can use to detect whenever a part gets touched by a different part, however people often claim this is too inaccurate and that's for a good reason.

# Usage

Like said before, Touched is an event, which means you have to use `:Connect` in order to use it, here's an example:
```lua
local part = script.Parent

part.Touched:Connect(function(otherPart)
  print(part .. " got touched by " .. otherPart)
end)
```
Now this isn't very difficult and very simple to use, however it's more important on what parts you set your Touched listeners on, we'll go deeper into this at the limitations.
Sometimes parts don't always trigger the Touched event, take for example a part you are supposed to jump on top of,
it's important to to know that if you want Touched to fire more reliably you have to make bigger parts surrounding the actual part, hitbox parts.
You do this to give Touched some more breathing room to be able to fire properly.

# Limitations

As said before Touched isn't perfect, but that's most of the time due to improper usage or absurd expectations from the developer side.
A Touched event has to rely on two or more instances intersecting during the physics calculation step of the current frame.
That condition doesn't seem too difficult to hit, however take into consideration that for you, the end user, everything in the game looks smooth,
however for the engine itself that's not the case.

When the engine calculates the intersections it just takes the current known position of the part, it doesn't check every viable position since the last known position in the
previous frame and attempts to find intersection points.
This means that if parts move too fast an intersection can be missed, see the image below.

![When Touched fails](/assets/images/TouchedNonWorkingCases.png)

For clarification the gray parts are parts with Touched listeners.  
The black lines are trajectories of parts moving around in the workspace.
The red lines are when a physics step occurs, the places where an intersection is calculated.

Now what really goes on in this image, the black line is basically what we see, we assume by looking at the black line that we get an intersection.
However in truth this doesn't happen, as we explained before intersections are calculated during the physics steps (the red lines).
The engine doesn't take into consideration where it previously came from or the part it travelled, it only knows the current point it's at.
Therefore it's possible that at the time the physics step takes place, there's no ongoing intersection between two parts.  
This can be caused by 3 common issues:
 - Too small parts
 - Too high velocity
 - No big enough intersection area

In case of the first one the parts are not big enough in order to get an intersection, this goes hand in hand with the second one, velocity.
When parts move too fast the distance between the red lines becomes longer, meaning there's more potential for intersections to get skipped.
The last one applies to the left side of the image, when there's practically no intersection area (surface touch), it gives Touched almost no capability to fire.

# How to fix these issues
We've already named the fixes in the previous section. You have to make sure your parts are big enough and don't travel too fast so they have a chance to intersect with other parts.
Additionally you can also make sure the parts have to be Touched are bigger, that way you can improve your chances too.