-- =====================================
-- SISTEMA DE MONEY - SERVER SCRIPT
-- Local: ServerScriptService
-- =====================================

local Players = game:GetService("Players")

-- Função para formatar o dinheiro com abreviações
local function formatarDinheiro(valor)
	if valor >= 1000000000 then
		return string.format("%.1f", valor / 1000000000):gsub("%.0$", "") .. "B"
	elseif valor >= 1000000 then
		return string.format("%.1f", valor / 1000000):gsub("%.0$", "") .. "M"
	elseif valor >= 1000 then
		return string.format("%.1f", valor / 1000):gsub("%.0$", "") .. "K"
	else
		return tostring(valor)
	end
end

-- Função para criar leaderstats
local function criarLeaderstats(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	local money = Instance.new("IntValue")
	money.Name = "Money"
	money.Value = 0
	money.Parent = leaderstats
	
	return money
end

-- Função para ganhar dinheiro
local function ganharDinheiro(player, quantia)
	if not player.Parent then return end
	
	local leaderstats = player:FindFirstChild("leaderstats")
	if not leaderstats then return end
	
	local money = leaderstats:FindFirstChild("Money")
	if not money then return end
	
	money.Value = money.Value + quantia
	print("✓ Player " .. player.Name .. " ganhou $" .. quantia .. "! Total: $" .. formatarDinheiro(money.Value))
end

-- Quando um player entra
Players.PlayerAdded:Connect(function(player)
	-- Criar leaderstats
	local money = criarLeaderstats(player)
	print("✓ " .. player.Name .. " entrou! Leaderstats criado. Saldo: $0")
	
	-- Iniciar ganho automático de $50 a cada 1 minuto
	local thread = task.spawn(function()
		while player.Parent do
			wait(60) -- Espera 1 minuto (60 segundos)
			
			if player.Parent then
				ganharDinheiro(player, 50)
			end
		end
	end)
end)

-- Quando um player sai
Players.PlayerRemoving:Connect(function(player)
	print("✓ " .. player.Name .. " saiu do jogo.")
end)

print("✓ Sistema de Money iniciado!")
