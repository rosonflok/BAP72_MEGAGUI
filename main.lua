-- Wait for PlayerGui
repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "BAP72GUI"
screenGui.ResetOnSpawn = false

-- UI Main Frame
local main = Instance.new("Frame")
main.Name = "Main"
main.Parent = screenGui
main.Size = UDim2.new(0, 500, 0, 300)
main.Position = UDim2.new(0.25, 0, 0.25, 0)
main.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

-- Rounded corners
local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 12)

-- Gradient
local gradient = Instance.new("UIGradient", main)
gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 255))
}

-- Top bar
local topBar = Instance.new("TextLabel", main)
topBar.Size = UDim2.new(1, 0, 0, 30)
topBar.BackgroundTransparency = 1
topBar.Text = "BAP72 Mega GUI"
topBar.Font = Enum.Font.SourceSansBold
topBar.TextColor3 = Color3.new(1, 1, 1)
topBar.TextSize = 20

-- Buttons
local function createButton(name, text, pos, parent)
	local btn = Instance.new("TextButton")
	btn.Name = name
	btn.Text = text
	btn.Size = UDim2.new(0, 100, 0, 25)
	btn.Position = pos
	btn.BackgroundColor3 = Color3.new(0, 0, 0)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.SourceSans
	btn.TextSize = 14
	btn.Parent = parent
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
	return btn
end

local hideBtn = createButton("Hide", "Hide", UDim2.new(1, -110, 0, 35), main)
local fsBtn = createButton("Fullscreen", "Fullscreen", UDim2.new(1, -110, 0, 65), main)
local closeBtn = createButton("Close", "Close", UDim2.new(1, -110, 0, 95), main)

-- Tabs Frame
local tabsFrame = Instance.new("Frame", main)
tabsFrame.Name = "Tabs"
tabsFrame.Position = UDim2.new(0, 10, 0, 40)
tabsFrame.Size = UDim2.new(0, 120, 1, -50)
tabsFrame.BackgroundTransparency = 1

-- Content Frame
local content = Instance.new("Frame", main)
content.Name = "Content"
content.Position = UDim2.new(0, 140, 0, 40)
content.Size = UDim2.new(1, -150, 1, -50)
content.BackgroundColor3 = Color3.new(0, 0, 0)
Instance.new("UICorner", content).CornerRadius = UDim.new(0, 6)

-- Example Tabs
local function createTab(name)
	local tabBtn = Instance.new("TextButton", tabsFrame)
	tabBtn.Size = UDim2.new(1, 0, 0, 30)
	tabBtn.Text = name
	tabBtn.Font = Enum.Font.SourceSans
	tabBtn.TextSize = 14
	tabBtn.TextColor3 = Color3.new(1, 1, 1)
	tabBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	Instance.new("UICorner", tabBtn).CornerRadius = UDim.new(0, 6)

	local tabContent = Instance.new("ScrollingFrame", content)
	tabContent.Size = UDim2.new(1, 0, 1, 0)
	tabContent.Visible = false
	tabContent.CanvasSize = UDim2.new(0, 0, 5, 0)
	tabContent.BackgroundTransparency = 1
	tabContent.Name = name.."Tab"

	tabBtn.MouseButton1Click:Connect(function()
		for _, v in pairs(content:GetChildren()) do
			if v:IsA("ScrollingFrame") then
				v.Visible = false
			end
		end
		tabContent.Visible = true
	end)

	return tabContent
end

local scriptsTab = createTab("Scripts")
local funTab = createTab("Fun")
local otherTab = createTab("Other")
scriptsTab.Visible = true

-- Add sample script buttons
local function addScriptButton(tab, title, code)
	local btn = Instance.new("TextButton", tab)
	btn.Size = UDim2.new(0, 200, 0, 30)
	btn.Position = UDim2.new(0, 10, 0, #tab:GetChildren() * 35)
	btn.Text = title
	btn.Font = Enum.Font.SourceSans
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
	btn.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(code))()
	end)
end

addScriptButton(scriptsTab, "Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")

-- Hide system
local showButton = Instance.new("TextButton", screenGui)
showButton.Text = "Show GUI"
showButton.Size = UDim2.new(0, 100, 0, 30)
showButton.Position = UDim2.new(0, 10, 1, -40)
showButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
showButton.TextColor3 = Color3.new(1,1,1)
showButton.Visible = false
Instance.new("UICorner", showButton).CornerRadius = UDim.new(0, 6)

hideBtn.MouseButton1Click:Connect(function()
	main.Visible = false
	showButton.Visible = true
end)

showButton.MouseButton1Click:Connect(function()
	main.Visible = true
	showButton.Visible = false
end)

-- Fullscreen toggle
local isFull = false
fsBtn.MouseButton1Click:Connect(function()
	isFull = not isFull
	if isFull then
		main.Position = UDim2.new(0, 0, 0, 0)
		main.Size = UDim2.new(1, 0, 1, 0)
	else
		main.Position = UDim2.new(0.25, 0, 0.25, 0)
		main.Size = UDim2.new(0, 500, 0, 300)
	end
end)

-- Close button
closeBtn.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)
