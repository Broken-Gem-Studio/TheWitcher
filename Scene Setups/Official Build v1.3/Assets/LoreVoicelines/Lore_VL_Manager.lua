function GetTableLore_VL_Manager()
local lua_table = {}
lua_table.System = Scripting.System()
lua_table.GO = Scripting.GameObject()
lua_table.Audio = Scripting.Audio()
lua_table.music_manager_UID = 0

local my_UID = 0



function lua_table:Awake()
    my_UID = lua_table.GO:GetMyUID()

    lua_table.music_manager_UID = lua_table.GO:FindGameObject("Music_Manager")

    if lua_table.music_manager_UID ~= 0 then
        lua_table.music_manager_script = lua_table.GO:GetScript(lua_table.music_manager_UID)
    end
end

function lua_table:Start()
end

function lua_table:Update()
end

function lua_table:PlayGuardLine()
    lua_table.Audio:PlayAudioEventGO("Play_Guard_Line", my_UID)
end

function lua_table:PlayD8LeadTheWay()
    lua_table.Audio:PlayAudioEventGO("Play_Dialogue_8", my_UID)
end

function lua_table:PlayD9KikiNest()
    lua_table.Audio:PlayAudioEventGO("Play_Dialogue_9", my_UID)
end

function lua_table:PlayD3BanditsArrived()
    lua_table.Audio:PlayAudioEventGO("Play_Dialogue_3", my_UID)
end

function lua_table:PlayWaveIncome()
    lua_table.Audio:PlayAudioEventGO("Play_Wave_Incoming", my_UID)
end

function lua_table:PlayGeraltChest()
    lua_table.Audio:PlayAudioEventGO("Play_Geralt_find_chest", my_UID)
end

function lua_table:PlayJaskierChest()
    lua_table.Audio:PlayAudioEventGO("Play_Jaskier_find_chest", my_UID)
end

function lua_table:PlayDoorLocked()
    lua_table.Audio:PlayAudioEventGO("Play_Locked_And_No_Key_In_Sight", my_UID)
end

function lua_table:HordesStart()
    lua_table.Audio:PlayAudioEventGO("Play_Wave_Incoming", my_UID)
end

function lua_table:PlayBossMusic()
    lua_table.System:LOG("About to PLAY BOSS_Check if null")
    if lua_table.music_manager_script ~= nil then
        lua_table.System:LOG("About to PLAY BOSS")
        lua_table.music_manager_script:PlayBoss()
    end
end

return lua_table
end