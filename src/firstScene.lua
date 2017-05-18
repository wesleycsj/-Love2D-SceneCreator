--[[
  * As example to all scenes
]]--
-- First you should creates a main object that will be a container for all your code
firstScene = {}
-- Is not obrigatory, but you can use this load() function and it will run every time scene is opened.
function firstScene:load()
  
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