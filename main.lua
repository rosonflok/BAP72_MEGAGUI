local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create GUI
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "ScriptHubGui"
screenGui.ResetOnSpawn = false

-- Main Frame
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0.6, 0, 0.7, 0)
mainFrame.Position = UDim2.new(0.2, 0, 0.15, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
mainFrame.Name = "MainFrame"

-- UICorner
local corner = Instance.new("UICorner", mainFrame)
corner.CornerRadius = UDim.new(0, 10)

-- UIGradient
local gradient = Instance.new("UIGradient", mainFrame)
gradient.Color = ColorSequence.new(Color3.new(0,0,0), Color3.new(0,0,0))
gradient.Transparency = NumberSequence.new(0.3)

-- Close, Hide, Fullscreen
local close = Instance.new("TextButton", mainFrame)
close.Size = UDim2.new(0, 40, 0, 40)
close.Position = UDim2.new(1, -45, 0, 5)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
close.Name = "CloseButton"

local hide = Instance.new("TextButton", mainFrame)
hide.Size = UDim2.new(0, 40, 0, 40)
hide.Position = UDim2.new(1, -90, 0, 5)
hide.Text = "-"
hide.BackgroundColor3 = Color3.fromRGB(255, 255, 80)
hide.Name = "HideButton"

local full = Instance.new("TextButton", mainFrame)
full.Size = UDim2.new(0, 40, 0, 40)
full.Position = UDim2.new(1, -135, 0, 5)
full.Text = "□"
full.BackgroundColor3 = Color3.fromRGB(80, 255, 80)
full.Name = "FullscreenButton"

-- Tab Buttons Frame
local tabButtons = Instance.new("Frame", mainFrame)
tabButtons.Size = UDim2.new(0, 100, 1, -50)
tabButtons.Position = UDim2.new(0, 0, 0, 50)
tabButtons.BackgroundTransparency = 1
tabButtons.Name = "TabButtons"

-- Script Container
local scriptContainer = Instance.new("Frame", mainFrame)
scriptContainer.Size = UDim2.new(1, -110, 1, -60)
scriptContainer.Position = UDim2.new(0, 110, 0, 50)
scriptContainer.BackgroundTransparency = 1
scriptContainer.Name = "ScriptContainer"

-- Tab Button + Script Frame Creator
local function createTab(name, color)
	local tab = Instance.new("TextButton", tabButtons)
	tab.Size = UDim2.new(1, 0, 0, 40)
	tab.Text = name
	tab.BackgroundColor3 = color
	tab.Name = name .. "Tab"

	local tabFrame = Instance.new("Frame", scriptContainer)
	tabFrame.Size = UDim2.new(1, 0, 1, 0)
	tabFrame.Visible = false
	tabFrame.Name = name .. "Scripts"

	local layout = Instance.new("UIListLayout", tabFrame)
	layout.Padding = UDim.new(0, 5)
	layout.SortOrder = Enum.SortOrder.LayoutOrder

	return tab, tabFrame
end

-- Sample Tabs
local playerTab, playerFrame = createTab("Player", Color3.fromRGB(100, 200, 255))
local visualTab, visualFrame = createTab("Visual", Color3.fromRGB(150, 255, 200))
playerFrame.Visible = true -- Default open

-- Tab Functionality
for _, tab in pairs(tabButtons:GetChildren()) do
	if tab:IsA("TextButton") then
		tab.MouseButton1Click:Connect(function()
			for _, frame in pairs(scriptContainer:GetChildren()) do
				if frame:IsA("Frame") then
					frame.Visible = frame.Name == tab.Name:gsub("Tab", "Scripts")
				end
			end
		end)
	end
end

-- Function to add script buttons
local function addScript(frame, buttonName, scriptFunc)
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(1, -10, 0, 40)
	btn.Text = buttonName
	btn.BackgroundColor3 = Color3.fromRGB(200, 255, 255)
	btn.MouseButton1Click:Connect(scriptFunc)
end

-- Add test scripts
addScript(playerFrame, "Infinite Jump", function()
	game:GetService("UserInputService").JumpRequest:Connect(function()
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
	end)
end)

addScript(visualFrame, "Fullbright", function()
	for _, v in pairs(game.Lighting:GetChildren()) do
		if v:IsA("PostEffect") then
			v.Enabled = false
		end
	end
	game.Lighting.Brightness = 5
end)

-- Buttons
close.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
end)

hide.MouseButton1Click:Connect(function()
	mainFrame.Visible = false -- You could add RightShift toggle to bring it back
end)

full.MouseButton1Click:Connect(function()
	if mainFrame.Size == UDim2.new(1, 0, 1, 0) then
		mainFrame.Size = UDim2.new(0.6, 0, 0.7, 0)
	else
		mainFrame.Size = UDim2.new(1, 0, 1, 0)
	end
end)
