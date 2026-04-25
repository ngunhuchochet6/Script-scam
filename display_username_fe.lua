-- Roblox FE Username Display Script
-- Place this Script in ServerScriptService.

local Players = game:GetService("Players")

local function createNameTag(character, player)
    local head = character:FindFirstChild("Head") or character:WaitForChild("Head", 5)
    if not head then
        return
    end

    local existing = head:FindFirstChild("FEUsernameTag")
    if existing then
        existing:Destroy()
    end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "FEUsernameTag"
    billboard.Size = UDim2.new(0, 220, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 2.6, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 120
    billboard.Parent = head

    local label = Instance.new("TextLabel")
    label.Size = UDim2.fromScale(1, 1)
    label.BackgroundTransparency = 1
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextStrokeTransparency = 0.35
    label.Text = string.format("@%s", player.Name)
    label.Parent = billboard
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        createNameTag(character, player)
    end)

    if player.Character then
        createNameTag(player.Character, player)
    end
end)

for _, player in ipairs(Players:GetPlayers()) do
    if player.Character then
        createNameTag(player.Character, player)
    end

    player.CharacterAdded:Connect(function(character)
        createNameTag(character, player)
    end)
end
