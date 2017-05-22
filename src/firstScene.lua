--[[
  * As example to all scenes
]]--
-- First you should creates a main object that will be a container for all your code
firstScene = {}
-- Is not obrigatory, but you can use this load() function and it will run every time scene is opened.
--[[
  * Remember that,now you code is a lua module, if just declare a variable as global, all variables will be globals and can be accessed between scenes. If you do want to declare a local variable to a scene, just type as below. Don't create a local variable inside load() function. ]]--
local myVar = 1
-- Or use this second method, you can just set a variable to object container.
firstScene.secondVar = 2
function firstScene:load()
-- Its possible to declare a variable using self,  but just inside a function. Remember that load() function will be throw at every call of current scene and whether a value would attached to it, will be attached always load() is called(being more specific, to each openScene,previousScene or nextScene, load() function of this scene is called).
  self.thirdVar = 3
end
-- Whole game logic is here.Before, you would use love.update() to game logic, instead, create a update function and attach to your main object, all game logic from scene should be in this function.
function firstScene:update()

end
-- 
function firstScene:draw()
  love.graphics.setBackgroundColor(255,0,0)
  love.graphics.print("First View: ",50,50)
end
-- Don't forget to return main object, this is a LUA module now, should be returned
return firstScene