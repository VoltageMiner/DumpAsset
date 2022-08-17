--[[
    init.lua
    Created: 08/16/2022 21:22:36
    Description: Autogenerated script file for the map training_maze.
]]--
-- Commonly included lua functions and data
require 'common'

-- Package name
local training_maze = {}

-- Local, localized strings table
-- Use this to display the named strings you added in the strings files for the map!
-- Ex:
--      local localizedstring = MapStrings['SomeStringName']
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
---training_maze.Init
--Engine callback function
function training_maze.Init(map)
  PrintInfo("=>> Init_training_maze Map")

  --This will fill the localized strings table automatically based on the locale the game is 
  -- currently in. You can use the MapStrings table after this line!
  MapStrings = COMMON.AutoLoadLocalizedStrings()

end

---training_maze.Enter
--Engine callback function
function training_maze.Enter(map)

  GAME:FadeIn(20)

end

---training_maze.Exit
--Engine callback function
function training_maze.Exit(map)

  

end

---training_maze.Update
--Engine callback function
function training_maze.Update(map)


end

---training_maze.GameSave
--Engine callback function
function training_maze.GameSave(map)


end

---training_maze.GameLoad
--Engine callback function
function training_maze.GameLoad(map)

  GAME:FadeIn(20)

end

-------------------------------
-- Entities Callbacks
-------------------------------

function training_maze.NewObject_Touch(obj, activator)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  
  training_maze.Test()
  GAME:EnterZone("training_maze", 0, 4, 0)
end


function training_maze.Test()
  PrintInfo("=>> training_maze Test Map")
end

return training_maze

