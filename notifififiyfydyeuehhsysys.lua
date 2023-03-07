local entitiesFolder = game.Workspace.Entities
local existingParts = {}
for _, part in ipairs(entitiesFolder:GetChildren()) do
    existingParts[part] = true
end

entitiesFolder.ChildAdded:Connect(function(part)
    if not existingParts[part] then
                game.StarterGui:SetCore("SendNotification", {
            Title = part.Name .. " Has spawned!",
            Text = "Hide!",
            Duration = 5
        })
        print("Entity Spawned", part.Name)
        existingParts[part] = true
    end
end)

local entitiesFolder = game.Workspace.Entities
local existingParts = {}
for _, part in ipairs(entitiesFolder:GetChildren()) do
    existingParts[part] = true
end

entitiesFolder.ChildRemoved:Connect(function(part)
    if not existingParts[part] then
                game.StarterGui:SetCore("SendNotification", {
            Title = part.Name .. " Has Despawned!",
            Text = "Safe",
            Duration = 5
        })
        print("New part added:", part.Name)
        existingParts[part] = true
    end
end)
