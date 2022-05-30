-- Gui to Lua
-- Version: 3.2

-- Instances:

local Time = Instance.new("ScreenGui")
local mainFrame = Instance.new("ImageLabel")
local mainLabel = Instance.new("TextLabel")

--Properties:

Time.Name = "Time"
Time.Parent = game.CoreGui.RobloxGui
Time.ResetOnSpawn = false

mainFrame.Name = "mainFrame"
mainFrame.Parent = Time
mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mainFrame.BackgroundTransparency = 1.000
mainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.Position = UDim2.new(0.312447786, 0, 0.532883644, 0)
mainFrame.Size = UDim2.new(0, 300, 0, 50)
mainFrame.Image = "rbxassetid://3570695787"
mainFrame.ImageColor3 = Color3.fromRGB(32, 32, 32)
mainFrame.ScaleType = Enum.ScaleType.Slice
mainFrame.SliceCenter = Rect.new(100, 100, 100, 100)
mainFrame.SliceScale = 0.050

mainLabel.Name = "mainLabel"
mainLabel.Parent = mainFrame
mainLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mainLabel.BackgroundTransparency = 1.000
mainLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
mainLabel.BorderSizePixel = 0
mainLabel.Size = UDim2.new(0, 300, 0, 50)
mainLabel.Font = Enum.Font.GothamSemibold
mainLabel.Text = "Server Up Time:"
mainLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
mainLabel.TextSize = 15.000

-- Scripts:

local function ZJYMYKV_fake_script() -- mainLabel.mainScript 
	local script = Instance.new('LocalScript', mainLabel)

	local startTimer = coroutine.create(function()
		while wait() do
			local seconds = math.floor(game.Workspace.DistributedGameTime)
			local minutes = math.floor(game.Workspace.DistributedGameTime / 60)
			local hours = math.floor(game.Workspace.DistributedGameTime / 60 / 60)
			local seconds = seconds - (minutes * 60)
			local minutes = minutes - (hours * 60)
	
			if hours < 1 then
				if minutes < 1 then
					script.Parent.Text = "Server Age : "..seconds.."s"
				else
					script.Parent.Text = "Server Age : "..minutes.."m"
				end
			else
				script.Parent.Text = "Server Age : " .. hours .. "h ".. minutes.. "m " .. seconds .. "s"
			end
		end
	end)
	
	coroutine.resume(startTimer)
end
coroutine.wrap(ZJYMYKV_fake_script)()
local function WKFXIFB_fake_script() -- mainFrame.draggableScript 
	local script = Instance.new('LocalScript', mainFrame)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(WKFXIFB_fake_script)()
