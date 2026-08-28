-- =====================================
-- SISTEMA DE MONEY - LOCAL SCRIPT
-- Local: StarterGui > MoneyLabel (dentro do TextLabel)
-- =====================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Encontrar o TextLabel do Money
local moneyLabel = playerGui:WaitForChild("MoneyLabel")

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

-- Esperar os leaderstats serem criados
local leaderstats = player:WaitForChild("leaderstats")
local money = leaderstats:WaitForChild("Money")

-- Atualizar o label quando o money muda
money.Changed:Connect(function(novoValor)
	moneyLabel.Text = "🪙 $" .. formatarDinheiro(novoValor)
	print("✓ Money atualizado: $" .. formatarDinheiro(novoValor))
end)

-- Inicializar com o valor atual
moneyLabel.Text = "🪙 $" .. formatarDinheiro(money.Value)
print("✓ Sistema de Money carregado!")
