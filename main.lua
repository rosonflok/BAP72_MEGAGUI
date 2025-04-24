local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local buttonExit = Instance.new("TextButton")
local buttonHide = Instance.new("TextButton")
local buttonFullscreen = Instance.new("TextButton")
local scriptListFrame = Instance.new("Frame")
local scriptButton1 = Instance.new("TextButton")

-- Set up the ScreenGui
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Set up the main frame
frame.Parent = screenGui
frame.Size = UDim2.new(0, 600, 0, 400)
frame.Position = UDim2.new(0.5, -300, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(186, 85, 211) -- Pastel purple
frame.BackgroundTransparency = 0.5
frame.BorderSizePixel = 0
frame.Draggable = true

-- Set up the exit button
buttonExit.Parent = frame
buttonExit.Size = UDim2.new(0, 100, 0, 50)
buttonExit.Position = UDim2.new(0, 10, 0, 10)
buttonExit.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red
buttonExit.Text = "Exit"
buttonExit.Font = Enum.Font.SourceSans
buttonExit.TextSize = 18
buttonExit.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Set up the hide button
buttonHide.Parent = frame
buttonHide.Size = UDim2.new(0, 100, 0, 50)
buttonHide.Position = UDim2.new(0, 120, 0, 10)
buttonHide.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green
buttonHide.Text = "Hide"
buttonHide.Font = Enum.Font.SourceSans
buttonHide.TextSize = 18
buttonHide.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Set up the full screen button
buttonFullscreen.Parent = frame
buttonFullscreen.Size = UDim2.new(0, 100, 0, 50)
buttonFullscreen.Position = UDim2.new(0, 230, 0, 10)
buttonFullscreen.BackgroundColor3 = Color3.fromRGB(0, 0, 255) -- Blue
buttonFullscreen.Text = "Full Screen"
buttonFullscreen.Font = Enum.Font.SourceSans
buttonFullscreen.TextSize = 18
buttonFullscreen.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Set up the script list frame
scriptListFrame.Parent = frame
scriptListFrame.Size = UDim2.new(1, -20, 1, -80)
scriptListFrame.Position = UDim2.new(0, 10, 0, 60)
scriptListFrame.BackgroundTransparency = 1

-- Create a list of buttons for 100 scripts (simplified here with just one example)
for i = 1, 100 do
    local scriptButton = Instance.new("TextButton")
    scriptButton.Parent = scriptListFrame
    scriptButton.Size = UDim2.new(1, 0, 0, 30)
    scriptButton.Position = UDim2.new(0, 0, 0, (i-1) * 35)
    scriptButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    scriptButton.Text = "Script " .. i
    scriptButton.Font = Enum.Font.SourceSans
    scriptButton.TextSize = 16
    scriptButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    
    scriptButton.MouseButton1Click:Connect(function()
        -- Example action for script execution (replace with actual logic)
        print("Executing Script " .. i)
    end)
end

-- Exit button functionality
buttonExit.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Hide button functionality
buttonHide.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)

-- Fullscreen button functionality
buttonFullscreen.MouseButton1Click:Connect(function()
    if game:GetService("GuiService"):GetScreenResolution().X == 1920 then
        frame.Size = UDim2.new(0, 600, 0, 400)
    else
        frame.Size = UDim2.new(0, 1920, 0, 1080) -- Fullscreen size (replace with proper resolution logic)
    end
end)
