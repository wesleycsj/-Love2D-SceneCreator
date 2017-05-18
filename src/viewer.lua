--[[
  - Scene viewer creator for Love2D
  ** A simple scene logic for use to create games with Love2D
  * Author: WesleyCSJ - wesleyjr10@gmail.com
  
  The MIT License (MIT)

  Copyright (c) 2017 WesleyCSJ

  Permission is hereby granted, free of charge, to any person obtaining a copy of
  this software and associated documentation files (the "Software"), to deal in
  the Software without restriction, including without limitation the rights to
  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
  the Software, and to permit persons to whom the Software is furnished to do so,
  subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]--
viewer = {
  __init = false,
  actualScene = 1,
  scenes = {}
}
function viewer:addScene(scene)
  --[[ Test if is a string or a table as support to both entries
      * First entry form => addScene('myScene')
      * Second entry form => addScene({'FirstScene','SecondScene'})
  ]]--
  if type(scene) == 'string' then
    local file = assert(loadfile('src/' .. scene .. '.lua'))()
    table.insert(self.scenes, {scene,file})
  elseif type(scene) == 'table' and #scene then
    for key,value in pairs(scene) do
      local file = assert(loadfile('src/' .. value .. '.lua'))()
      table.insert(self.scenes, {value,file})
    end
  else
    error('Error: Invalid scene value.')
  end
  -- Flag to first time occurrence of code to call load() function from scene table. 
  if not __init then
    self.scenes[self.actualScene][2]:load()
    __init = true
  end
end

function viewer:openScene(sceneToGo)
  --[[ Test if is a number or string to support both entry forms
       * First entry form => openScene(1)
       * Second entry form => openScene('mySceneName')
  ]]--
  if type(sceneToGo) == 'number' and (sceneToGo > 0 and sceneToGo <= #self.scenes) then
    self.actualScene = sceneToGo
  elseif type(sceneToGo) == 'string' then
    -- This flag throws an error if a non existent(in scenes table) scene is called.
    local find = false
    for key,value in pairs(self.scenes) do
      if sceneToGo == self.scenes[key][1] then
        self.actualScene = key
        find = true
      end
    end
    if not find then
      error('Tried to open `' .. sceneToGo .. '` but it does not exists in scenes table.')
    end
  else
    error('Scene value out of range. Actual range is [1..' .. #self.scenes .. '].')
  end
  self.scenes[self.actualScene][2]:load()
end

function viewer:previousScene()
  if self.actualScene > 1 then
    viewer:openScene(self.actualScene - 1)
  end
end

function viewer:nextScene()
  if self.actualScene < #self.scenes then
    viewer:openScene(self.actualScene + 1)
  end
end

function viewer:update()
  self.scenes[self.actualScene][2]:update()
end

function viewer:draw()
  self.scenes[self.actualScene][2]:draw()
end

return viewer