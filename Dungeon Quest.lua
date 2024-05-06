local LibLoader = loadstring(game:HttpGet("https://raw.githubusercontent.com/BatuKvi123/PabloLibV3/main/PabloLibV3"))()
local window = LibLoader:Create("Dungeon Quest","Enabled","p")

local tab = window:CreateTab("global")
tab:CreateButton("Button Freezer", function()
	game:GetService("ReplicatedStorage").remotes.changeStartValue:FireServer()
end)

tab:CreateSlider("Speed Hack", 20, 40, function(arg)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = arg
end)

tab:CreateSlider("Fov", 0, 120, function(fovchanger)
	workspace.Camera.FieldOfView = fovchanger
end)

tab:CreateToggle("Kill Aura", function(State)
	game:GetService("RunService").Stepped:connect(
		function()
			if State then
				pcall(function()
					for i, v in next, game.workspace.dungeon:GetChildren() do
						if v:FindFirstChild("enemyFolder") and v.enemyFolder:FindFirstChildOfClass("Model") then
							for i, v in next, v.enemyFolder:GetChildren() do
								if
									v.ClassName == "Model" and v.Parent.Name == "enemyFolder" and
									v:FindFirstChild("HumanoidRootPart") and
                                	v:FindFirstChildOfClass("Humanoid") and
                                	v.Parent.Parent.Name ~= "bossRoom" and
                                	isnetworkowner(v.HumanoidRootPart) or
                                	v.Name == "Sand Giant"
                                	then
                                		v.Humanoid.Health = 0
                                	end
                                end
                            end
                        end
                    end)
			end
		end)
end)

local tab1 = window:CreateTab("misc")
tab1:CreateButton("Destroy Menu", function()
	LibLoader:Close()
end)

tab1:CreateButton("Hide Stats", function()
	game:GetService("Players").LocalPlayer.XP.Value = 666
	game:GetService("Players").LocalPlayer.XPNeeded.Value = 666
	game:GetService("Players").LocalPlayer.leaderstats.Level.Value = 666
	game:GetService("Players").LocalPlayer.leaderstats.Gold.Value = 666
	game:GetService("Players").LocalPlayer.PlayerGui.playerStatus.Frame.playerName.Text = 'Deen'
	game:GetService("Players").LocalPlayer.PlayerGui.playerStatus.Frame.healthFrame.health.Text = 'Winchester'
end)

tab1:CreateButton("Remote Spy", function()
local owner = "Hosvile"
local branch = "revision"

local function webImport(file)
    return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/MC-Hydroxide/%s/%s.lua"):format(owner, branch, file)), file .. '.lua')()
end

webImport("init")
webImport("ui/main")
end)

tab1:CreateButton("Explorer", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)