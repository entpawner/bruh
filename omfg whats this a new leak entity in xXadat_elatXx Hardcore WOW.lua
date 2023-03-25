---====== Define spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "Angry Munci",
    Model = "rbxassetid://10957184278", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
    Speed = 59,
    MoveDelay = 2,
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    SpawnInFront = false,
    ShatterLights = false,
    FlickerLights = {
        Enabled = true,
        Duration = 1
    },
    Cycles = {
        Min = 1,
        Max = 50,
        Delay = 0
    },
    CamShake = {
        Enabled = true,
        Values = {1.5, 20, 0.1, 1},
        Range = 100
    },
    ResistCrucifix = false,
    BreakCrucifix = true,
    DeathMessage = {"Custom", "death", "message", "goes", "here."},
    IsCuriousLight = false
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    firesignal(game.ReplicatedStorage.EntityInfo.Caption.OnClientEvent, 'ITS NICE TO MEET YO HAHAHE')
end

entity.Debug.OnEntityDespawned = function()
    firesignal(game.ReplicatedStorage.EntityInfo.Caption.OnClientEvent, 'IT WAS NICE PLAYING WITH YOU HAHA')
end

entity.Debug.OnEntityStartMoving = function()
    print("Entity started moving")
end

entity.Debug.OnEntityFinishedRebound = function()
    print("Entity finished rebound")
end

entity.Debug.OnEntityEnteredRoom = function(room)
    print("Entity entered room:", room)
end

entity.Debug.OnLookAtEntity = function()
    print("Player has sleeping on floor")
end

entity.Debug.OnDeath = function()
    print("Player has died")
end

--[[
    NOTE: By overwriting 'OnUseCrucifix', the default crucifixion will be ignored and this function will be called instead

    entity.Debug.OnUseCrucifix = function()
        print("Custom crucifixion script here")
    end
]]--

---====== Run entity ======---

Spawner.runEntity(entity)
