--[[
    init.lua
    Created: 08/24/2023 19:56:34
    Description: Autogenerated script file for the map end_treacherous_mountain.
]]--
-- Commonly included lua functions and data
require 'origin.common'

-- Package name
local end_treacherous_mountain = {}

-- Local, localized strings table
-- Use this to display the named strings you added in the strings files for the map!
-- Ex:
--      local localizedstring = STRINGS.MapStrings['SomeStringName']


-------------------------------
-- Map Callbacks
-------------------------------
---end_treacherous_mountain.Init(map)
--Engine callback function
function end_treacherous_mountain.Init(map)

  --This will fill the localized strings table automatically based on the locale the game is 
  -- currently in. You can use the MapStrings table after this line!


end

---end_treacherous_mountain.Enter(map)
--Engine callback function
function end_treacherous_mountain.Enter(map)

  if SV.treacherous_mountain.BossPhase == 4 then
    end_treacherous_mountain.EmptyReturn()
  elseif SV.treacherous_mountain.BossPhase == 3 then
    end_treacherous_mountain.PostBattle()
  elseif SV.treacherous_mountain.BossPhase == 1 then
    end_treacherous_mountain.PreBattle(true)
  else
    end_treacherous_mountain.PreBattle(false)
  end
end


function end_treacherous_mountain.PreBattle(shortened)

  local player = CH("PLAYER")
  local enemy = CH("Salamence")
  
  GAME:CutsceneMode(true)
  
  GAME:MoveCamera(252, 216, 1, false)
  
  GROUND:Unhide("Salamence")
  
  
  UI:WaitShowTitle(GAME:GetCurrentGround().Name:ToLocal(), 20)
  GAME:WaitFrames(30)
  UI:WaitHideTitle(20)
  
  GAME:FadeIn(20)
  GROUND:MoveToPosition(player, 244, 216, false, 2)
  
  if shortened == false then
  
    UI:SetSpeaker(enemy)
    UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['Expo_Cutscene_Line_001']))
    
    SOUND:PlayBGM("Threat.ogg", false)
    
    UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['Expo_Cutscene_Line_002']))
    UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['Expo_Cutscene_Line_003']))
  
  else
    SOUND:PlayBGM("Threat.ogg", false)
    UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['Expo_Cutscene_Short']))
  end
  
  
  SOUND:PlayBGM("Boss Battle 2.ogg", false)
  
  UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['Expo_Cutscene_Line_004']))
  
  GAME:WaitFrames(30)
  
  COMMON.BossTransition(true)
  
  GAME:CutsceneMode(false)
  
  GAME:ContinueDungeon('treacherous_mountain', 3, 0, 0)
  
end


function end_treacherous_mountain.PostBattle()

  local player = CH("PLAYER")
  local enemy = CH("Salamence")
  
  GAME:CutsceneMode(true)
  
  GROUND:Unhide("Salamence")
  
  GAME:MoveCamera(252, 216, 1, false)
  
  GROUND:TeleportTo(player, 244, 216, Direction.Up)
  
  GAME:FadeIn(20)
  
  GAME:WaitFrames(60)
  
  UI:SetSpeaker(enemy)
  
  UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['Ending_Cutscene_Line_001']))
  
  GAME:FadeOut(false, 20)
  
  GAME:CutsceneMode(false)
  
  SV.treacherous_mountain.BossPhase = 4
  COMMON.EndDungeonDay(RogueEssence.Data.GameProgress.ResultType.Cleared, 'guildmaster_island', -1, 6, 0)
  
end

function end_treacherous_mountain.EmptyReturn()

  local player = CH("PLAYER")
  
  GAME:CutsceneMode(true)
  
  UI:WaitShowTitle(GAME:GetCurrentGround().Name:ToLocal(), 20)
  GAME:WaitFrames(30)
  UI:WaitHideTitle(20)
    
  GAME:MoveCamera(252, 216, 1, false)
  
  GAME:FadeIn(20)
  
  GAME:WaitFrames(60)
  
  GROUND:MoveToPosition(player, 244, 216, false, 2)
  
  UI:ResetSpeaker(false)
  UI:SetCenter(true)
  
  STRINGS:Format(RogueEssence.StringKey("DLG_DUNGEON_DEAD_END"):ToLocal())
  
  GAME:FadeOut(false, 20)
  
  GAME:CutsceneMode(false)
  
  COMMON.EndDungeonDay(RogueEssence.Data.GameProgress.ResultType.Cleared, 'guildmaster_island', -1, 6, 0)
  
end


---end_treacherous_mountain.Exit(map)
--Engine callback function
function end_treacherous_mountain.Exit(map)


end

---end_treacherous_mountain.Update(map)
--Engine callback function
function end_treacherous_mountain.Update(map)


end

---end_treacherous_mountain.GameSave(map)
--Engine callback function
function end_treacherous_mountain.GameSave(map)


end

---end_treacherous_mountain.GameLoad(map)
--Engine callback function
function end_treacherous_mountain.GameLoad(map)

  GAME:FadeIn(20)

end

-------------------------------
-- Entities Callbacks
-------------------------------


return end_treacherous_mountain

