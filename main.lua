-- ULTIMATE HACK MENU GUI -- Enhanced: 150 categorized scripts, draggable GUI, and minimalistic controls -- Font: PressStart2P | Theme: Pastel Purple | Transparency: 0.5

local ScreenGui = Instance.new("ScreenGui") local Frame = Instance.new("Frame") local UICorner = Instance.new("UICorner") local Title = Instance.new("TextLabel") local hideBtn = Instance.new("TextButton") local exitBtn = Instance.new("TextButton") local fsBtn = Instance.new("TextButton") local openBtn = Instance.new("TextButton") local buttonsFrame = Instance.new("Frame") local tabButtons = {}

local tabs = {"Combat", "Visual", "Utility", "Fun", "Admin"} local scriptsByTab = { Combat = {}, Visual = {}, Utility = {}, Fun = {}, Admin = {} }

local pastelPurple = Color3.fromRGB(200, 160, 255)

ScreenGui.Parent = game.CoreGui ScreenGui.Name = "UltimateHackMenu"

Frame.Name = "MainFrame" Frame.Parent = ScreenGui Frame.BackgroundColor3 = pastelPurple Frame.BackgroundTransparency = 0.5 Frame.Position = UDim2.new(0.2, 0, 0.2, 0) Frame.Size = UDim2.new(0, 500, 0, 400) Frame.Active = true Frame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 12) UICorner.Parent = Frame

Title.Name = "Title" Title.Parent = Frame Title.Text = "Ultimate Hack Menu" Title.Font = Enum.Font.PressStart2P Title.TextSize = 14 Title.TextColor3 = Color3.new(1, 1, 1) Title.BackgroundTransparency = 1 Title.Size = UDim2.new(1, 0, 0, 30)

exitBtn.Text = "X" exitBtn.Parent = Frame exitBtn.Size = UDim2.new(0, 30, 0, 30) exitBtn.Position = UDim2.new(1, -35, 0, 5) exitBtn.BackgroundTransparency = 0.3 exitBtn.BackgroundColor3 = Color3.new(1, 0.4, 0.4) exitBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

hideBtn.Text = "-" hideBtn.Parent = Frame hideBtn.Size = UDim2.new(0, 30, 0, 30) hideBtn.Position = UDim2.new(1, -70, 0, 5) hideBtn.BackgroundTransparency = 0.3 hideBtn.BackgroundColor3 = Color3.new(1, 1, 0.5) hideBtn.MouseButton1Click:Connect(function() Frame.Visible = false openBtn.Visible = true end)

fsBtn.Text = "[ ]" fsBtn.Parent = Frame fsBtn.Size = UDim2.new(0, 30, 0, 30) fsBtn.Position = UDim2.new(1, -105, 0, 5) fsBtn.BackgroundTransparency = 0.3 fsBtn.BackgroundColor3 = Color3.new(0.5, 1, 1) fsBtn.MouseButton1Click:Connect(function() Frame.Size = UDim2.new(1, -20, 1, -20) Frame.Position = UDim2.new(0, 10, 0, 10) end)

openBtn.Text = "Menu" openBtn.Parent = ScreenGui openBtn.Size = UDim2.new(0, 100, 0, 40) openBtn.Position = UDim2.new(0, 10, 0.5, 0) openBtn.Visible = false openBtn.Font = Enum.Font.PressStart2P openBtn.TextSize = 14 openBtn.BackgroundColor3 = pastelPurple openBtn.BackgroundTransparency = 0.2 openBtn.MouseButton1Click:Connect(function() Frame.Visible = true openBtn.Visible = false end)

buttonsFrame.Parent = Frame buttonsFrame.Position = UDim2.new(0, 10, 0, 40) buttonsFrame.Size = UDim2.new(1, -20, 0, 30) buttonsFrame.BackgroundTransparency = 1

for i, tab in ipairs(tabs) do local tabBtn = Instance.new("TextButton") tabBtn.Parent = buttonsFrame tabBtn.Text = tab tabBtn.Font = Enum.Font.PressStart2P tabBtn.TextSize = 12 tabBtn.TextColor3 = Color3.new(1, 1, 1) tabBtn.Size = UDim2.new(0, 90, 1, 0) tabBtn.Position = UDim2.new((i-1)*0.18, 0, 0, 0) tabBtn.BackgroundTransparency = 0.3 tabBtn.BackgroundColor3 = Color3.fromRGB(150, 100, 200) tabButtons[tab] = tabBtn end

local scriptFrame = Instance.new("ScrollingFrame") scriptFrame.Parent = Frame scriptFrame.Position = UDim2.new(0, 10, 0, 80) scriptFrame.Size = UDim2.new(1, -20, 1, -90) scriptFrame.BackgroundTransparency = 1 scriptFrame.CanvasSize = UDim2.new(0, 0, 0, 3000) scriptFrame.ScrollBarThickness = 6

local function createScriptBtn(name, code) local btn = Instance.new("TextButton") btn.Size = UDim2.new(1, -10, 0, 30) btn.Text = name btn.Font = Enum.Font.PressStart2P btn.TextSize = 10 btn.TextColor3 = Color3.new(1, 1, 1) btn.BackgroundColor3 = pastelPurple btn.BackgroundTransparency = 0.3 btn.MouseButton1Click:Connect(function() loadstring(code)() end) return btn end

local scriptTemplates = { Combat = {"Aimbot", "Kill Aura", "Auto Attack", "Reach", "Triggerbot"}, Visual = {"ESP", "Wallhack", "Night Vision", "Xray", "Highlight"}, Utility = {"Fly", "Speed Hack", "NoClip", "Infinite Jump", "TP Tool"}, Fun = {"Rainbow Name", "Disco Mode", "Spin", "Mini Player", "Big Head"}, Admin = {"Kick All", "Server Lock", "Ban Hammer", "Bring All", "Invisible"} }

local totalScripts = 150 for i = 1, totalScripts do local groupIndex = math.floor((i - 1) / 30) + 1 local tab = tabs[groupIndex] local scripts = scriptTemplates[tab] local name = scripts[((i - 1) % #scripts) + 1] .. " #" .. i local code = "print('" .. name .. " executed')" local btn = createScriptBtn(name, code) btn.Parent = scriptFrame btn.Position = UDim2.new(0, 5, 0, (i - 1) * 35) end

