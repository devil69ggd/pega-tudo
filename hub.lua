local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local FarmTab = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "ProfessionalFarmHub"

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 260, 0, 420)
Frame.Position = UDim2.new(0.4, 0, 0.3, 0)
Frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
Frame.Active = true
Frame.Draggable = true

Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(35,35,35)
Title.Text = "Farm Hub"
Title.TextColor3 = Color3.new(1,1,1)

MinimizeButton.Parent = Frame
MinimizeButton.Size = UDim2.new(0, 30, 0, 25)
MinimizeButton.Position = UDim2.new(1, -35, 0, 5)
MinimizeButton.Text = "-"
MinimizeButton.BackgroundColor3 = Color3.fromRGB(60,60,60)
MinimizeButton.TextColor3 = Color3.new(1,1,1)

local minimized = false
local fullSize = UDim2.new(0, 260, 0, 420)

MinimizeButton.MouseButton1Click:Connect(function()
	minimized = not minimized
	if minimized then
		Frame.Size = UDim2.new(0, 260, 0, 35)
	else
		Frame.Size = fullSize
	end
end)

FarmTab.Parent = Frame
FarmTab.Size = UDim2.new(0, 220, 0, 30)
FarmTab.Position = UDim2.new(0, 20, 0, 45)
FarmTab.Text = "Farm"
FarmTab.BackgroundColor3 = Color3.fromRGB(45,45,45)
FarmTab.TextColor3 = Color3.new(1,1,1)

local resources = {
	{"Stone Quarry", 85},
	{"Lumberyard", 130},
	{"Potato Farm", 175},
	{"Iron Mine", 220},
	{"Gold Mine", 265},
	{"Orchard", 310}
}

for _, data in pairs(resources) do
	local name = data[1]
	local pos = data[2]
	
	local btn = Instance.new("TextButton")
	btn.Parent = Frame
	btn.Size = UDim2.new(0, 220, 0, 35)
	btn.Position = UDim2.new(0, 20, 0, pos)
	btn.Text = "Collect "..name
	btn.BackgroundColor3 = Color3.fromRGB(55,55,55)
	btn.TextColor3 = Color3.new(1,1,1)
	
	btn.MouseButton1Click:Connect(function()
		for _, plot in pairs(workspace.plots:GetChildren()) do
			local itemHolder = plot:FindFirstChild("itemHolder")
			if itemHolder then
				for _, item in pairs(itemHolder:GetChildren()) do
					if string.find(item.Name, name) then
						game.ReplicatedStorage.signals.remotes.events.requestCollection:FireServer(item)
					end
				end
			end
		end
	end)
end

local AllButton = Instance.new("TextButton")
AllButton.Parent = Frame
AllButton.Size = UDim2.new(0, 220, 0, 35)
AllButton.Position = UDim2.new(0, 20, 0, 355)
AllButton.Text = "Collect All Resources"
AllButton.BackgroundColor3 = Color3.fromRGB(70,70,70)
AllButton.TextColor3 = Color3.new(1,1,1)

AllButton.MouseButton1Click:Connect(function()
	for _, plot in pairs(workspace.plots:GetChildren()) do
		local itemHolder = plot:FindFirstChild("itemHolder")
		if itemHolder then
			for _, item in pairs(itemHolder:GetChildren()) do
				if string.find(item.Name, "Stone Quarry") or string.find(item.Name, "Lumberyard") or string.find(item.Name, "Potato Farm") or string.find(item.Name, "Iron Mine") or string.find(item.Name, "Gold Mine") or string.find(item.Name, "Orchard") then
					game.ReplicatedStorage.signals.remotes.events.requestCollection:FireServer(item)
				end
			end
		end
	end
end)
