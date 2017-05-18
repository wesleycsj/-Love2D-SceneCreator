-- First one, require the viewer script
require 'viewer'

function love.load()
  --[[ * You can add scenes using addScene function, addScene receives a table with the name of scripts .lua, each is a scene, to be added. Scenes will just run after you call them in below.
  ]]--
  viewer:addScene({'firstScene','secondScene'})
  -- Or just add a unique scene by file name.
  viewer:addScene('thirdScene')
end

function love.update()
  -- This update() function should be here, else, scene update() function won't work.
  viewer:update()
end

function love.draw()
  -- This draw() function should be here, else, scene draw() function won't be rendered.
  viewer:draw()
end

function love.keyreleased(key)
  -- previousScene() and nextScene() functions can back and forward through scenes if they do exists
   if key == 'left' then
      viewer:previousScene()
   elseif key == 'right' then
      viewer:nextScene()
   elseif key == 'space' then
    -- openScene() can receive a integer corresponding with position of scene given in order to addScene() function
    -- Otherwise, openScene() receives a string with name of scene and, if exists, open it.
      viewer:openScene(1)
   elseif key == 'a' then
      viewer:openScene('secondScene')
   end
  
end