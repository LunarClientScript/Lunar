--// Services

local RunService = game:GetService("RunService")

--// Variables

local DebrisHolder = workspace.DebrisHolder

--// Functions

local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua'))()
local ThemeManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
	Title = 'Lunar Client',
	Center = true,
	AutoShow = true,
	TabPadding = 8,
	MenuFadeTime = 0.2
})

local Tabs = {
	Combat = Window:AddTab('Combat'),
	Visuals = Window:AddTab('Visuals'),
	Misc = Window:AddTab('Misc'),
	Settings = Window:AddTab('Settings'),
}

local Sections = {
	Utility = Tabs.Combat:AddLeftGroupbox('Utility Panel')
}

local Configuration = {
	Combat = {
		MeleeSlash = {
			Enabled = false,
			Sizes = {
				X = 1,
				Z = 1,
			}
		}
	}	
}

do
	Sections.Utility:AddToggle('ToggleSlashSize', {
		Text = 'Toggle Slash Size',
		Default = false,
		Tooltip = nil,
		Callback = function(Value)
			Configuration.Combat.MeleeSlash.Enabled = Value
		end,
	})
	
	Sections.Utility:AddSlider('HorizontalPosition', {
		Text = 'Horizontal Position',
		Default = 10,
		Min = 0,
		Max = 1000,
		Rounding = 1,
		Compact = false,
		Callback = function(Value)
			Configuration.Combat.MeleeSlash.Sizes.X = Value
		end
	})
	
	Sections.Utility:AddSlider('Depth Position', {
		Text = 'Depth Position',
		Default = 10,
		Min = 0,
		Max = 1000,
		Rounding = 1,
		Compact = false,
		Callback = function(Value)
			Configuration.Combat.MeleeSlash.Sizes.Z = Value
		end
	})
end

RunService.RenderStepped:Connect(function()
	do
		for _, v in ipairs(DebrisHolder:GetChildren()) do
			if v.Name == "MeleeSlash" and Configuration.Combat.MeleeSlash.Enabled then
				v.Size = Vector3.new(Configuration.Combat.MeleeSlash.Sizes.X, 1, Configuration.Combat.MeleeSlash.Sizes.Z)
			end
		end
	end
	task.wait(0.1)
end)
