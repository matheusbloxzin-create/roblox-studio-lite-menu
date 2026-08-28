-- =====================================
-- SUBSTITUIÇÃO DE IDLE ANIMATION
-- Local: StarterPlayer > StarterCharacterScripts
-- =====================================

local humanoid = script.Parent:WaitForChild("Humanoid")
local rootPart = script.Parent:WaitForChild("HumanoidRootPart")

-- ⚠️ COLOQUE SEU ID DE ANIMAÇÃO AQUI!
local IDLE_ANIMATION_ID = "rbxassetid://0" -- Altere o 0 para seu ID!

print("✓ Script de Idle iniciado")
print("ID da animação: " .. IDLE_ANIMATION_ID)

-- Criar a animação personalizada
local idleAnim = Instance.new("Animation")
idleAnim.AnimationId = IDLE_ANIMATION_ID

-- Carregar a animação no humanoid
local idleAnimTrack = humanoid:LoadAnimation(idleAnim)
idleAnimTrack.Looped = true
idleAnimTrack.Priority = Enum.AnimationPriority.Core

print("✓ Animação carregada com sucesso")

-- Evento quando o humanoid está parado (Idle)
local isPlaying = false

humanoid.StateChanged:Connect(function(oldState, newState)
	if newState == Enum.HumanoidStateType.Landed or newState == Enum.HumanoidStateType.Running then
		-- Parou de se mover
		if not isPlaying and humanoid.MoveVector.Magnitude == 0 then
			if idleAnimTrack then
				idleAnimTrack:Play()
				isPlaying = true
				print("✓ Idle começou")
			end
		end
	end
end)

-- Monitorar movimento contínuo
game:GetService("RunService").RenderStepped:Connect(function()
	if humanoid.MoveVector.Magnitude > 0 then
		-- Player está se movimentando
		if isPlaying and idleAnimTrack then
			idleAnimTrack:Stop()
			isPlaying = false
			print("✓ Idle parou (player movimentando)")
		end
	elseif humanoid.MoveVector.Magnitude == 0 and not isPlaying then
		-- Player não está se movimentando
		if idleAnimTrack and humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
			idleAnimTrack:Play()
			isPlaying = true
			print("✓ Idle iniciado")
		end
	end
end)

print("✓ Sistema de Idle 100% operacional!")
