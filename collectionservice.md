# **USE COLLECTIONSERVICE**!
CollectionService is a really underrated service and not many people seem to know about it, on it's own it honestly doesn't even look that special but when used correctly this service can improve your game tenfold. Theoretically this service can be used in whatever scenario you desire as it's versatility is amazing.

## **What does it do**?
CollectionService does nothing more than manage **tags**. These tags are just basic strings that can be given to any instance in your game. Through CollectionService you can get, add, remove tags, aswell as getting all instances in the game that have a given tag. This allows you to lookup all instances in a game which contain a given tag and quickly get them back as a table in your script, this can be really helpful in scenarios where you don't want to search through your whole game to find what you're looking for.

## **Examples**
I will give 3 short examples of what this can be used for

### *Kill bricks*
Ah yes, we all know our classic kill bricks, you step on em, you die. Many people tend to just put a script in the part, bind a Touched listener to the part, and just copy the part along with the script over and over. However now you need to change your script, oops I have to update a hundred scripts, not ideal. CollectionService can help with this by giving all your kill bricks a certain tag, let's say "KillBrick", now you only need 1 script which gets all instances in the game with the given tag, iterate all of those parts and give them a Touched listener, 1 script, only 1 place to edit, all killbricks have their implementation.

### *Getting all characters*
What if we want to quickly get all the characters, not just player characters but also NPC's, again we can use CollectionService to give a tag to all of our humanoids in the game. For players we can do this using CharacterAdded and for our NPC's we can give them a tag either in studio manually or whenever you create them. This allows you to later on in the code automatically find all humanoids that exist in the game with your tag, meaning you don't need to even put all NPC's together in a specific folder and use GetChildren() or something similar, you can just get the entire list in 1 go and be done with it.

### *Day/Night lighting*
Proper lighting is nice in games, even better if your lights adapt to the day night cycle, this is similar to kill bricks, you can give all your lights in your game a tag, whenever the time of day changes you can simply fetch all lights in the game by using CollectionService, iterate all of them and enable or disable all lights in 1 go, only 1 script needed.

Like this you can think of thousands of possible usecases for CollectionService, there's no end to them.

## **How do I start using it?**
Simple, all you have to do is include the service in your scripts using game:GetService("CollectionService") like you would do for any other service, you can find it's documentation [here](https://developer.roblox.com/en-us/api-reference/class/CollectionService).

Now you might be wondering, how do I actually give these instances tags, well one way is through CollectionService in the command bar like so:
```lua
for _, item in ipairs(game:GetService("Selection"):Get()) do 
  game:GetService("CollectionService"):AddTag(item, "YourTagName")
end
```
This would automatically add the tag with `YourTagName` to all the instances you have selected in the explorer window.

However this is not really ideal, it requires a lot of working, requires you to type out the code in the command bar all the time, etc.
Luckily the community isn't stupid and thanks to tiffany352 we have an amazing plugin called the [Tag Editor](https://devforum.roblox.com/t/tag-editor-plugin/101465).
This plugin allows you to manage all the tags in your game and easily apply them to whatever instance you want
___
Author: Thodor12  
Posted: 06/23/2021
