---
layout: post
title: CFrame Constructors
category: scripting
author: Pog Chonk
---

There's 2 main constructors for `CFrame`'s. `CFrame.new()` and `CFrame.lookAt()`, these serve similar but different purposes.  
They both have 2 arguments, except `lookAt` has 3 arguments.

For `CFrame.new()` , the first argument being the Position (Vector3) of the CFrame. The second one being optional, which is the Position (Vector3) to have it's LookVector face towards. If the second argument is not set, then default orientation is automatically assigned (0,0,0).  
For example: `CFrame.new(Vector3.new(0,0,0), Vector3.new(0,10,0))` or `CFrame.new(Vector3.new(0,0,0))`.  
The difference is that the first one sets the position *and* where to look at. The second one just sets the position and gives default orientation.

For `CFrame.lookAt()`, the first argument being the Position (Vector3) of the CFrame. The second one ***not*** being optional, which is the Position (Vector3) to have it's LookVector look at. The third one *is* optional though, which is the UpVector (Vector3). By default it's `Vector3.new(0,1,0)`.  
For example: `CFrame.lookAt(Vector3.new(1,1,1), Vector3.new(1,10,1))` works fine. If you remove the `Vector3.new(1,10,1)` it'll warn you that you didn't define a `lookAt` position and that you need to assign one.

CFrames have 3 more properties than Vector3s. Those being `LookVector`, `UpVector`, and `RightVector` (labeled below).

```
-Z -> Forward -> CFrame.new(0,0,-1)
Z -> Backward -> CFrame.new(0,0,1)

Y -> Up -> CFrame.new(0,1,0)
-Y -> Down -> CFrame.new(0,-1,0)

X -> Right -> CFrame.new(1,0,0)
-X -> Left -> CFrame.new(-1,0,0)
```

```
All of these are some Vector3's in the range [-1,1]

LookVector -> Forward
-LookVector -> Backward

UpVector -> Up
-UpVector -> Down

RightVector -> Right
-RightVector -> Left
```