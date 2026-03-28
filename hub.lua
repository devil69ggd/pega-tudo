local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Button = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "StoneHub"

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 220, 0, 230)
Frame.Position = UDim2.new(0.4, 0, 0.35, 0)
Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
Frame.Active = true
Frame.Draggable = true

Button.Parent = Frame
Button.Size = UDim2.new(0, 180, 0, 40)
Button.Position = UDim2.new(0, 20, 0, 40)
Button.Text = "Collect All Stone Quarry"
Button.BackgroundColor3 = Color3.fromRGB(60,60,60)
Button.TextColor3 = Color3.new(1,1,1)

Button.MouseButton1Click:Connect(function()
	for _, plot in pairs(workspace.plots:GetChildren()) do
		local itemHolder = plot:FindFirstChild("itemHolder")
		
		if itemHolder then
			for _, item in pairs(itemHolder:GetChildren()) do
				if string.find(item.Name, "Stone Quarry") then
					game.ReplicatedStorage.signals.remotes.events.requestCollection:FireServer(item)
				end
			end
		end
	end
end)

local WoodButton = Instance.new("TextButton")
WoodButton.Parent = Frame
WoodButton.Size = UDim2.new(0, 180, 0, 40)
WoodButton.Position = UDim2.new(0, 20, 0, 85)
WoodButton.Text = "Collect All Lumberyard"
WoodButton.BackgroundColor3 = Color3.fromRGB(60,60,60)
WoodButton.TextColor3 = Color3.new(1,1,1)

WoodButton.MouseButton1Click:Connect(function()
	for _, plot in pairs(workspace.plots:GetChildren()) do
		local itemHolder = plot:FindFirstChild("itemHolder")
		
		if itemHolder then
			for _, item in pairs(itemHolder:GetChildren()) do
				if string.find(item.Name, "Lumberyard") then
					game.ReplicatedStorage.signals.remotes.events.requestCollection:FireServer(item)
				end
			end
		end
	end
end)

local PotatoButton = Instance.new("TextButton")
PotatoButton.Parent = Frame
PotatoButton.Size = UDim2.new(0, 180, 0, 40)
PotatoButton.Position = UDim2.new(0, 20, 0, 130)
PotatoButton.Text = "Collect All Potato Farm"
PotatoButton.BackgroundColor3 = Color3.fromRGB(60,60,60)
PotatoButton.TextColor3 = Color3.new(1,1,1)

PotatoButton.MouseButton1Click:Connect(function()
	for _, plot in pairs(workspace.plots:GetChildren()) do
		local itemHolder = plot:FindFirstChild("itemHolder")
		
		if itemHolder then
			for _, item in pairs(itemHolder:GetChildren()) do
				if string.find(item.Name, "Potato Farm") then
					game.ReplicatedStorage.signals.remotes.events.requestCollection:FireServer(item)
				end
			end
		end
	end
end)

local AllButton = Instance.new("TextButton")
AllButton.Parent = Frame
AllButton.Size = UDim2.new(0, 180, 0, 40)
AllButton.Position = UDim2.new(0, 20, 0, 175)
AllButton.Text = "Collect All Resources"
AllButton.BackgroundColor3 = Color3.fromRGB(60,60,60)
AllButton.TextColor3 = Color3.new(1,1,1)

AllButton.MouseButton1Click:Connect(function()
	for _, plot in pairs(workspace.plots:GetChildren()) do
		local itemHolder = plot:FindFirstChild("itemHolder")
		
		if itemHolder then
			for _, item in pairs(itemHolder:GetChildren()) do
				if string.find(item.Name, "Stone Quarry") or string.find(item.Name, "Lumberyard") or string.find(item.Name, "Potato Farm") then
					game.ReplicatedStorage.signals.remotes.events.requestCollection:FireServer(item)
				end
			end
		end
	end
end)
