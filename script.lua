-- KILLUA HUB × Arsenal Mobile
-- ESP Only + Dummy UI (x2zu)

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Variables
local ESPEnabled = true

-- UI Library (Dummy UI)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/x2zu/OPEN-SOURCE-UI-ROBLOX/refs/heads/main/X2ZU%20UI%20ROBLOX%20OPEN%20SOURCE/DummyUi-leak-by-x2zu/fetching-main/Tools/Framework.luau"))()
local Window = Library:Window({
    Title = "KILLUA HUB × Arsenal",
    Desc = "ESP Only",
    Theme = "Dark",
    Config = {Keybind = Enum.KeyCode.LeftControl, Size = UDim2.new(0,500,0,400)}
})

-- ====================
-- ESP
-- ====================
spawn(function()
    while task.wait(0.5) do
        for _,player in pairs(Players:GetPlayers()) do
            if ESPEnabled and player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                if not player.Character.Head:FindFirstChild("ESP") then
                    local bg = Instance.new("BillboardGui", player.Character.Head)
                    bg.Name = "ESP"
                    bg.Size = UDim2.new(0,200,0,40)
                    bg.StudsOffset = Vector3.new(0,2.5,0)
                    bg.AlwaysOnTop = true
                    local lbl = Instance.new("TextLabel", bg)
                    lbl.BackgroundTransparency = 1
                    lbl.Size = UDim2.new(1,0,1,0)
                    lbl.Font = Enum.Font.GothamBold
                    lbl.Text = player.Name
                    lbl.TextScaled = true
                    lbl.TextColor3 = Color3.fromRGB(255,255,255)
                end
            else
                if player.Character and player.Character:FindFirstChild("Head") then
                    local esp = player.Character.Head:FindFirstChild("ESP")
                    if esp then esp:Destroy() end
                end
            end
        end
    end
end)

-- ====================
-- UI Controls (แท็บ ESP)
-- ====================
local MainTab = Window:Tab({Title="ESP", Icon="eye"})

MainTab:Toggle({
    Title = "Enable ESP",
    Value = true,
    Callback = function(state)
        ESPEnabled = state
    end
})

-- ====================
-- Notify
-- ====================
Window:Notify({Title="KILLUA HUB", Desc="ESP Loaded", Time=5})
