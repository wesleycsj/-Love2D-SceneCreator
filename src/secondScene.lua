-- This is a scene example.To see how create a new scene, see firstScene.lua
secondScene = {}
function secondScene:load()
  
end

function secondScene:update()
  
end

function secondScene:draw()
  love.graphics.setBackgroundColor(0,255,0)
  love.graphics.print("Second View:",50,50)
end

return secondScene