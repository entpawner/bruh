---====== Define spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "Ripper",
    Model = "rbxassetid://12262768551", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
    Speed = 59,
    MoveDelay = 2,
    HeightOffset = 0,
    CanKill = true,
    KillRange = 100,
    SpawnInFront = false,
    ShatterLights = false,
    FlickerLights = {
        Enabled = true,
        Duration = 2
    },
    Cycles = {
        Min = 1,
        Max = 1,
        Delay = 2
    },
    CamShake = {
        Enabled = true,
        Values = {1.5, 20, 0.1, 1},
        Range = 100
    },
    ResistCrucifix = false,
    BreakCrucifix = true,
    DeathMessage = {"wait you died to rioper?", "he trick you into thinking hes gone", "just", "in case", "dont leave too EARLY."},
    IsCuriousLight = false
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    local room = workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")]
		if color == Color3.fromRGB(89, 69, 72) then
			room.LightBase.SurfaceLight.Enabled = true
			room.LightBase.SurfaceLight.Color = Color3.fromRGB(255, 0, 0)
			for _, thing in pairs(room.Assets:GetDescendants()) do
				if thing:FindFirstChild"LightFixture" then
					thing.LightFixture.Neon.Color = Color3.fromRGB(255, 0, 0)
					for _, light in pairs(thing.LightFixture:GetChildren()) do
						if light:IsA("SpotLight") or light:IsA("PointLight") then
							light.Color = Color3.fromRGB(255, 0, 0)
						end
					end
				end
			end
			return
		end
		room.LightBase.SurfaceLight.Enabled = true
		room.LightBase.SurfaceLight.Color = color
		for _, thing in pairs(room.Assets:GetDescendants()) do
			if thing:FindFirstChild"LightFixture" then
				thing.LightFixture.Neon.Color = color
				for _, light in pairs(thing.LightFixture:GetChildren()) do
					if light:IsA("SpotLight") or light:IsA("PointLight") then
						light.Color = color
					end
				end
			end
		end
	end
})

end

entity.Debug.OnEntityDespawned = function()
    print("Entity has despawned")
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
    print("Player looking at entity")
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
