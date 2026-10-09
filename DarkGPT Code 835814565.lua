-- [[ DarkGPT Cyberpunk Aura & Glow Script ]] --
-- Letakkan script ini di ServerScriptService (Server Script)

local Players = game:GetService("Players")

local function applyCyberpunkStyle(character)
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
	if not humanoidRootPart then return end

	-- 1. Buat Efek Neon Red Glow (Highlight)
	local highlight = Instance.new("Highlight")
	highlight.Name = "CyberHighlight"
	highlight.Adornee = character
	highlight.FillColor = Color3.fromRGB(255, 0, 60) -- Merah Cyber
	highlight.OutlineColor = Color3.fromRGB(0, 0, 0)   -- Hitam
	highlight.FillTransparency = 0.5
	highlight.OutlineTransparency = 0
	highlight.Parent = character

	-- 2. Buat Partikel Energi Merah di Kaki / Badan
	local attachment = Instance.new("Attachment")
	attachment.Name = "CyberAttachment"
	attachment.Parent = humanoidRootPart

	local emitter = Instance.new("ParticleEmitter")
	emitter.Name = "CyberSparks"
	emitter.Color = ColorSequence.new(Color3.fromRGB(255, 0, 60), Color3.fromRGB(50, 0, 10))
	emitter.Size = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.4),
		NumberSequenceKeypoint.new(1, 0)
	})
	emitter.Texture = "rbxassetid://258123240" -- Partikel kilat/bunga api
	emitter.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.2),
		NumberSequenceKeypoint.new(1, 1)
	})
	emitter.Lifetime = NumberRange.new(0.5, 1)
	emitter.Rate = 25
	emitter.Speed = NumberRange.new(2, 5)
	emitter.SpreadAngle = Vector2.new(45, 45)
	emitter.Parent = attachment

	-- 3. Tambahkan Efek Kecepatan & Lompat (Cyber Enhancement)
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid.WalkSpeed = 20 -- Sedikit lebih cepat dari default (16)
		humanoid.JumpPower = 60 -- Lompatan lebih tinggi
	end
end

-- Event saat pemain bergabung
Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		task.wait(1) -- Tunggu karakter selesai loading
		applyCyberpunkStyle(character)
	end)
end)