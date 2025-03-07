function GetTableHordasTutorial()
local lua_table = {}
lua_table.System = Scripting.System()
lua_table.GO = Scripting.GameObject()
lua_table.Physics = Scripting.Physics()
lua_table.UI = Scripting.Interface()

local survive = 0
local uid = 0

local hordas = 0
local hordas_script = 0

local round0 = 0
local round1 = 0
local round2 = 0
local round3 = 0
local round4 = 0
local round0_script = 0
local round1_script = 0
local round2_script = 0

local first = true
local begin = false
local flag0 = false
local flag1 = false
local flag2 = false

local counting = false
local count = 0
local time = 0

function lua_table:OnTriggerEnter()
    local collider = lua_table.Physics:OnTriggerEnter(uid)

    if lua_table.GO:GetLayerByID(collider) == 1 and first == true
    then        
        lua_table.GO:SetActiveGameObject(true, survive)
        counting = true
        count = hordas_script.delay_rounds
        time = 0
        first = false
    end
end

function lua_table:Awake()
    uid = lua_table.GO:GetMyUID()
    survive = lua_table.GO:FindGameObject("Survive")

    hordas = lua_table.GO:FindGameObject("HordasTutorial")
    if hordas > 0
    then
        hordas_script = lua_table.GO:GetScript(hordas)
    end

    round0 = lua_table.GO:FindGameObject("Round0")
    if round0 > 0
    then
        round0_script = lua_table.GO:GetScript(round0)
    end
    round1 = lua_table.GO:FindGameObject("Round1")
    if round1 > 0
    then
        round1_script = lua_table.GO:GetScript(round1)
    end
    round2 = lua_table.GO:FindGameObject("Round2")
    if round2 > 0
    then
        round2_script = lua_table.GO:GetScript(round2)
    end

    lua_table.GO:SetActiveGameObject(false, survive)
end

function lua_table:Start()
end

function lua_table:Update()
    time = time + lua_table.System:DT()

    if counting == true
    then
        if time >= 1
        then
            count = count - 1
            time = 0
        end
    end

    if first == false
    then
        if count <= 0
        then
            lua_table.GO:SetActiveGameObject(false, survive)

            if begin == false
            then
                hordas_script.begin = true
                begin = true
            else
                if round0_script.is_finished == true and round0_script.stop == true and flag0 == false
                then
                    lua_table.GO:SetActiveGameObject(true, survive)  
                    counting = true
                    count = hordas_script.delay_rounds
                    time = 0
                    flag0 = true
                end

                if round1_script.is_finished == true and round1_script.stop == true and flag1 == false
                then
                    lua_table.GO:SetActiveGameObject(true, survive)  
                    counting = true
                    count = hordas_script.delay_rounds
                    time = 0
                    flag1 = true
                end

                if round2_script.is_finished == true and round2_script.stop == true and flag2 == false
                then
                    flag2 = true
                    begin = false
                    win_level1 = true
                end
            end  
        end
    end
end

return lua_table
end