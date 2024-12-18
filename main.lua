-- Lado del Servidor
local RemoteFunction = Instance.new("RemoteFunction")
RemoteFunction.Name = "RemoteFunction"
RemoteFunction.Parent = game.ReplicatedStorage

-- Conectar el evento para recibir y ejecutar funciones
RemoteFunction.OnServerInvoke = function(player, func)
    local success, result = pcall(func)
    return result
end

-- Lado del Cliente
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

-- Crear el HUB
local hub = Instance.new("ScreenGui")
hub.Name = "DexExplorerAgencyEdition"
hub.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local homeFrame = Instance.new("Frame")
homeFrame.Size = UDim2.new(0.8, 0, 0.8, 0)
homeFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
homeFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
homeFrame.Parent = hub

local scriptsFrame = Instance.new("Frame")
scriptsFrame.Size = UDim2.new(0.8, 0, 0.8, 0)
scriptsFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
scriptsFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
scriptsFrame.Visible = false
scriptsFrame.Parent = hub

local homeButton = Instance.new("TextButton")
homeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
homeButton.Position = UDim2.new(0.05, 0, 0.05, 0)
homeButton.Text = "Home"
homeButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
homeButton.Parent = scriptsFrame

local scriptsButton = Instance.new("TextButton")
scriptsButton.Size = UDim2.new(0.1, 0, 0.1, 0)
scriptsButton.Position = UDim2.new(0.05, 0, 0.05, 0)
scriptsButton.Text = "Scripts"
scriptsButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
scriptsButton.Parent = homeFrame

-- Funciones del HUB
homeButton.MouseButton1Click:Connect(function()
    scriptsFrame.Visible = false
    homeFrame.Visible = true
end)

scriptsButton.MouseButton1Click:Connect(function()
    homeFrame.Visible = false
    scriptsFrame.Visible = true
end)

-- Función para cerrar el HUB
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.B then -- Presionar la tecla B para cerrar el HUB
        hub:Destroy()
    end
end)

-- Ejemplo de botones para scripts populares
local function addScriptButton(frame, requireId, functionName, name)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.1, 0, 0.1, 0)
    button.Position = UDim2.new(0.1, 0, (frame:GetChildren():Length() + 1) * 0.15, 0)
    button.Text = name
    button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    button.Parent = frame

    button.MouseButton1Click:Connect(function()
        ReplicatedStorage:FindFirstChild("RemoteFunction"):InvokeServer(function()
            local code = string.format("require(%s).%s('EwiltsTumblr')", requireId, functionName)
            local func = loadstring(code)
            func()
        end)
    end)
end

-- Agregar botones para cada script
addScriptButton(scriptsFrame, "5887966886", "EH", "Ethereal Hub")
addScriptButton(scriptsFrame, "4851033180", "", "iy")
addScriptButton(scriptsFrame, "6116140725", "", "PAN")
addScriptButton(scriptsFrame, "5872716468", "yes", "scp guns and stuff")
addScriptButton(scriptsFrame, "6102116865", "Player", "big gun")
addScriptButton(scriptsFrame, "4651756194", "Fire", "Grab Knife")
addScriptButton(scriptsFrame, "5206691559", "", "Grab Knife Premium")
addScriptButton(scriptsFrame, "6316621153", "", "RPG Script")
addScriptButton(scriptsFrame, "5844085889", "", "TOPCAKE, mod for TOPK3K")
addScriptButton(scriptsFrame, "6284238423", "L0AD", "model spawning thing")
addScriptButton(scriptsFrame, "4967315171", "load", "syrian soldier")
addScriptButton(scriptsFrame, "6207101927", "gunz", "G13 Haze")
addScriptButton(scriptsFrame, "4497715977", "Lmao", "Personal SS gui")
addScriptButton(scriptsFrame, "5098054474", "", "IDK")
addScriptButton(scriptsFrame, "4649145907", "oCAG", "mr bean admin")
addScriptButton(scriptsFrame, "4559977647", "load", "Baseball bat")
addScriptButton(scriptsFrame, "4160338123", "load", "Ice cream sword")
addScriptButton(scriptsFrame, "3420796356", "load", "Boo")
addScriptButton(scriptsFrame, "6133482274", "Anime", "Anime Hub")
addScriptButton(scriptsFrame, "5304789800", "load", "goku ssj3 r6")
addScriptButton(scriptsFrame, "5304856085", "load", "goku db super r6")
addScriptButton(scriptsFrame, "5305299304", "load", "Vegito SSJ Blue")
addScriptButton(scriptsFrame, "5305659324", "load", "Beerus")
addScriptButton(scriptsFrame, "5306868468", "load", "Goku ssj1 ssj2 ssj3 kaioken")
addScriptButton(scriptsFrame, "5303661239", "load", "Black Goku Super Saiyan Rose")
addScriptButton(scriptsFrame, "5330579725", "load", "Black goku normal and rose")
addScriptButton(scriptsFrame, "3563652201", "l0l", "ServerSided Plane")
addScriptButton(scriptsFrame, "5884593844", "load", "ultimate gui x cracked no key system")
addScriptButton(scriptsFrame, "5239955586", "Dark", "Siren Head")
addScriptButton(scriptsFrame, "5135561394", "load", "ServerSided CMD-X")