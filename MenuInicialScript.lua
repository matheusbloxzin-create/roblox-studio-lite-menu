-- =====================================
-- MENU INICIAL COMPLETO - ROBLOX STUDIO LITE
-- Compatível com Celular e PC
-- =====================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- =====================================
-- CONFIGURAÇÕES PADRÃO
-- =====================================
local Config = {
	SuperRealistico = true,
	Sons = true,
	Sombras = true,
	Efeitos = true,
	Nametags = true,
	Volume = 50
}

-- =====================================
-- FUNÇÃO: CRIAR GUI PRINCIPAL
-- =====================================
local function criarGuiPrincipal()
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "MenuPrincipal"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = playerGui
	
	return screenGui
end

-- =====================================
-- FUNÇÃO: CRIAR MENU INICIAL
-- =====================================
local function criarMenuInicial(screenGui)
	-- Container do menu
	local menuContainer = Instance.new("Frame")
	menuContainer.Name = "MenuContainer"
	menuContainer.Size = UDim2.new(1, 0, 1, 0)
	menuContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	menuContainer.BorderSizePixel = 0
	menuContainer.Parent = screenGui
	
	-- Logo "1x0 STUDIOS"
	local logoLabel = Instance.new("TextLabel")
	logoLabel.Name = "Logo"
	logoLabel.Size = UDim2.new(1, 0, 0.3, 0)
	logoLabel.Position = UDim2.new(0, 0, 0.2, 0)
	logoLabel.BackgroundTransparency = 1
	logoLabel.TextSize = 60
	logoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	logoLabel.Font = Enum.Font.GothamBold
	logoLabel.Text = "1x0 STUDIOS"
	logoLabel.Parent = menuContainer
	
	-- Container dos botões
	local buttonsContainer = Instance.new("Frame")
	buttonsContainer.Name = "ButtonsContainer"
	buttonsContainer.Size = UDim2.new(0.8, 0, 0.4, 0)
	buttonsContainer.Position = UDim2.new(0.1, 0, 0.55, 0)
	buttonsContainer.BackgroundTransparency = 1
	buttonsContainer.Parent = menuContainer
	
	-- UIListLayout para organizar botões
	local listLayout = Instance.new("UIListLayout")
	listLayout.Padding = UDim.new(0, 20)
	listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	listLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	listLayout.Parent = buttonsContainer
	
	-- Botão JOGAR
	local botaoJogar = Instance.new("TextButton")
	botaoJogar.Name = "BotaoJogar"
	botaoJogar.Size = UDim2.new(0.8, 0, 0.35, 0)
	botaoJogar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	botaoJogar.TextColor3 = Color3.fromRGB(255, 255, 255)
	botaoJogar.TextSize = 40
	botaoJogar.Font = Enum.Font.GothamBold
	botaoJogar.Text = "JOGAR"
	botaoJogar.BorderSizePixel = 0
	botaoJogar.Parent = buttonsContainer
	
	-- Efeito hover no botão JOGAR
	local funcaoHoverJogar = function(mouse)
		botaoJogar.MouseEnter:Connect(function()
			botaoJogar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		end)
		
		botaoJogar.MouseLeave:Connect(function()
			botaoJogar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		end)
	end
	
	-- Botão CONFIGURAÇÕES
	local botaoConfig = Instance.new("TextButton")
	botaoConfig.Name = "BotaoConfig"
	botaoConfig.Size = UDim2.new(0.8, 0, 0.35, 0)
	botaoConfig.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	botaoConfig.TextColor3 = Color3.fromRGB(255, 255, 255)
	botaoConfig.TextSize = 40
	botaoConfig.Font = Enum.Font.GothamBold
	botaoConfig.Text = "CONFIGURAÇÕES"
	botaoConfig.BorderSizePixel = 0
	botaoConfig.Parent = buttonsContainer
	
	-- Efeito hover no botão CONFIGURAÇÕES
	botaoConfig.MouseEnter:Connect(function()
		botaoConfig.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	end)
	
	botaoConfig.MouseLeave:Connect(function()
		botaoConfig.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	end)
	
	-- Cantos arredondados nos botões
	local cornerJogar = Instance.new("UICorner")
	cornerJogar.CornerRadius = UDim.new(0, 15)
	cornerJogar.Parent = botaoJogar
	
	local cornerConfig = Instance.new("UICorner")
	cornerConfig.CornerRadius = UDim.new(0, 15)
	cornerConfig.Parent = botaoConfig
	
	return {
		container = menuContainer,
		botaoJogar = botaoJogar,
		botaoConfig = botaoConfig
	}
end

-- =====================================
-- FUNÇÃO: CRIAR TELA DE CARREGAMENTO
-- =====================================
local function criarTelaCarregamento()
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "TelaCarregamento"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = playerGui
	
	-- Fundo preto
	local fundoFrame = Instance.new("Frame")
	fundoFrame.Size = UDim2.new(1, 0, 1, 0)
	fundoFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	fundoFrame.BorderSizePixel = 0
	fundoFrame.Parent = screenGui
	
	-- Container central
	local container = Instance.new("Frame")
	container.Size = UDim2.new(0.6, 0, 0.3, 0)
	container.Position = UDim2.new(0.2, 0, 0.35, 0)
	container.BackgroundTransparency = 1
	container.Parent = screenGui
	
	-- Texto "CARREGANDO"
	local textCarregando = Instance.new("TextLabel")
	textCarregando.Name = "TextCarregando"
	textCarregando.Size = UDim2.new(1, 0, 0.4, 0)
	textCarregando.BackgroundTransparency = 1
	textCarregando.TextSize = 50
	textCarregando.TextColor3 = Color3.fromRGB(255, 255, 255)
	textCarregando.Font = Enum.Font.GothamBold
	textCarregando.Text = "CARREGANDO"
	textCarregando.Parent = container
	
	-- Texto com o percentual
	local textPorcentagem = Instance.new("TextLabel")
	textPorcentagem.Name = "TextPorcentagem"
	textPorcentagem.Size = UDim2.new(1, 0, 0.3, 0)
	textPorcentagem.Position = UDim2.new(0, 0, 0.45, 0)
	textPorcentagem.BackgroundTransparency = 1
	textPorcentagem.TextSize = 40
	textPorcentagem.TextColor3 = Color3.fromRGB(255, 255, 255)
	textPorcentagem.Font = Enum.Font.Gotham
	textPorcentagem.Text = "0%"
	textPorcentagem.Parent = container
	
	-- Barra de progresso (fundo)
	local barraFundo = Instance.new("Frame")
	barraFundo.Name = "BarraFundo"
	barraFundo.Size = UDim2.new(1, 0, 0.08, 0)
	barraFundo.Position = UDim2.new(0, 0, 0.8, 0)
	barraFundo.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	barraFundo.BorderSizePixel = 0
	barraFundo.Parent = container
	
	local cornerBarra = Instance.new("UICorner")
	cornerBarra.CornerRadius = UDim.new(0, 10)
	cornerBarra.Parent = barraFundo
	
	-- Barra de progresso (preenchimento)
	local barraProgresso = Instance.new("Frame")
	barraProgresso.Name = "BarraProgresso"
	barraProgresso.Size = UDim2.new(0, 0, 1, 0)
	barraProgresso.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
	barraProgresso.BorderSizePixel = 0
	barraProgresso.Parent = barraFundo
	
	local cornerBarraProgresso = Instance.new("UICorner")
	cornerBarraProgresso.CornerRadius = UDim.new(0, 10)
	cornerBarraProgresso.Parent = barraProgresso
	
	return {
		gui = screenGui,
		textPorcentagem = textPorcentagem,
		barraProgresso = barraProgresso
	}
end

-- =====================================
-- FUNÇÃO: ANIMAR CARREGAMENTO
-- =====================================
local function animarCarregamento(telaCarregamento)
	local tempoTotal = 5
	local tempoDecorrido = 0
	
	while tempoDecorrido < tempoTotal do
		tempoDecorrido = tempoDecorrido + 0.05
		local porcentagem = math.floor((tempoDecorrido / tempoTotal) * 100)
		
		if porcentagem > 100 then porcentagem = 100 end
		
		telaCarregamento.textPorcentagem.Text = porcentagem .. "%"
		telaCarregamento.barraProgresso.Size = UDim2.new(porcentagem / 100, 0, 1, 0)
		
		wait(0.05)
	end
	
	-- Garantir 100%
	telaCarregamento.textPorcentagem.Text = "100%"
	telaCarregamento.barraProgresso.Size = UDim2.new(1, 0, 1, 0)
	wait(0.5)
	
	telaCarregamento.gui:Destroy()
end

-- =====================================
-- FUNÇÃO: APLICAR CONFIGURAÇÕES
-- =====================================
local function aplicarConfiguracoes()
	if Config.SuperRealistico then
		game.Lighting.Brightness = 2
		game.Lighting.Ambient = Color3.fromRGB(200, 200, 200)
		game.Lighting.OutdoorAmbient = Color3.fromRGB(200, 200, 200)
	else
		game.Lighting.Brightness = 1
		game.Lighting.Ambient = Color3.fromRGB(128, 128, 128)
		game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
	end
	
	game.Lighting.GlobalShadows = Config.Sombras
	
	-- Aplicar volume em sons
	for _, som in ipairs(workspace:FindDescendants()) do
		if som:IsA("Sound") then
			som.Volume = Config.Sons and (Config.Volume / 100) or 0
		end
	end
end

-- =====================================
-- FUNÇÃO: CRIAR TELA DE CONFIGURAÇÕES
-- =====================================
local function criarTelaConfiguracoes(screenGui)
	local configContainer = Instance.new("Frame")
	configContainer.Name = "ConfigContainer"
	configContainer.Size = UDim2.new(1, 0, 1, 0)
	configContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	configContainer.BorderSizePixel = 0
	configContainer.Parent = screenGui
	
	-- Botão X para voltar
	local botaoVoltar = Instance.new("TextButton")
	botaoVoltar.Name = "BotaoVoltar"
	botaoVoltar.Size = UDim2.new(0.1, 0, 0.08, 0)
	botaoVoltar.Position = UDim2.new(0.05, 0, 0.02, 0)
	botaoVoltar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	botaoVoltar.TextColor3 = Color3.fromRGB(255, 255, 255)
	botaoVoltar.TextSize = 30
	botaoVoltar.Font = Enum.Font.GothamBold
	botaoVoltar.Text = "X"
	botaoVoltar.BorderSizePixel = 0
	botaoVoltar.Parent = configContainer
	
	local cornerVoltar = Instance.new("UICorner")
	cornerVoltar.CornerRadius = UDim.new(0, 10)
	cornerVoltar.Parent = botaoVoltar
	
	-- Título
	local titulo = Instance.new("TextLabel")
	titulo.Name = "Titulo"
	titulo.Size = UDim2.new(1, 0, 0.1, 0)
	titulo.Position = UDim2.new(0, 0, 0.05, 0)
	titulo.BackgroundTransparency = 1
	titulo.TextSize = 45
	titulo.TextColor3 = Color3.fromRGB(255, 255, 255)
	titulo.Font = Enum.Font.GothamBold
	titulo.Text = "CONFIGURAÇÕES"
	titulo.Parent = configContainer
	
	-- Container de opções
	local optionsContainer = Instance.new("Frame")
	optionsContainer.Name = "OptionsContainer"
	optionsContainer.Size = UDim2.new(0.9, 0, 0.75, 0)
	optionsContainer.Position = UDim2.new(0.05, 0, 0.18, 0)
	optionsContainer.BackgroundTransparency = 1
	optionsContainer.Parent = configContainer
	
	local listLayout = Instance.new("UIListLayout")
	listLayout.Padding = UDim.new(0, 15)
	listLayout.Parent = optionsContainer
	
	-- ========== OPÇÃO: MODO SUPER REALISTA ==========
	local function criarOpcaoToggle(nomeOpcao, textoOpcao, valorPadrao)
		local opcaoFrame = Instance.new("Frame")
		opcaoFrame.Name = nomeOpcao .. "Frame"
		opcaoFrame.Size = UDim2.new(1, 0, 0.12, 0)
		opcaoFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		opcaoFrame.BorderSizePixel = 0
		opcaoFrame.Parent = optionsContainer
		
		local cornerOpcao = Instance.new("UICorner")
		cornerOpcao.CornerRadius = UDim.new(0, 10)
		cornerOpcao.Parent = opcaoFrame
		
		local textLabel = Instance.new("TextLabel")
		textLabel.Name = "Text"
		textLabel.Size = UDim2.new(0.6, 0, 1, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.TextSize = 28
		textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		textLabel.Font = Enum.Font.Gotham
		textLabel.Text = textoOpcao
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.Parent = opcaoFrame
		
		local toggleButton = Instance.new("TextButton")
		toggleButton.Name = "Toggle"
		toggleButton.Size = UDim2.new(0.25, 0, 0.7, 0)
		toggleButton.Position = UDim2.new(0.7, 0, 0.15, 0)
		toggleButton.BackgroundColor3 = valorPadrao and Color3.fromRGB(100, 200, 100) or Color3.fromRGB(100, 100, 100)
		toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		toggleButton.TextSize = 18
		toggleButton.Font = Enum.Font.GothamBold
		toggleButton.Text = valorPadrao and "ATIVADO" or "DESATIVADO"
		toggleButton.BorderSizePixel = 0
		toggleButton.Parent = opcaoFrame
		
		local cornerToggle = Instance.new("UICorner")
		cornerToggle.CornerRadius = UDim.new(0, 8)
		cornerToggle.Parent = toggleButton
		
		toggleButton.MouseButton1Click:Connect(function()
			Config[nomeOpcao] = not Config[nomeOpcao]
			toggleButton.Text = Config[nomeOpcao] and "ATIVADO" or "DESATIVADO"
			toggleButton.BackgroundColor3 = Config[nomeOpcao] and Color3.fromRGB(100, 200, 100) or Color3.fromRGB(100, 100, 100)
			aplicarConfiguracoes()
		end)
		
		toggleButton.MouseEnter:Connect(function()
			toggleButton.BackgroundColor3 = Config[nomeOpcao] and Color3.fromRGB(120, 220, 120) or Color3.fromRGB(120, 120, 120)
		end)
		
		toggleButton.MouseLeave:Connect(function()
			toggleButton.BackgroundColor3 = Config[nomeOpcao] and Color3.fromRGB(100, 200, 100) or Color3.fromRGB(100, 100, 100)
		end)
		
		return toggleButton
	end
	
	-- Criar todas as opções
	criarOpcaoToggle("SuperRealistico", "Modo Super Realista", Config.SuperRealistico)
	criarOpcaoToggle("Sons", "Sons", Config.Sons)
	criarOpcaoToggle("Sombras", "Sombras", Config.Sombras)
	criarOpcaoToggle("Efeitos", "Efeitos", Config.Efeitos)
	criarOpcaoToggle("Nametags", "Nametags/Nomes dos Players", Config.Nametags)
	
	-- ========== OPÇÃO: VOLUME ==========
	local volumeFrame = Instance.new("Frame")
	volumeFrame.Name = "VolumeFrame"
	volumeFrame.Size = UDim2.new(1, 0, 0.12, 0)
	volumeFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	volumeFrame.BorderSizePixel = 0
	volumeFrame.Parent = optionsContainer
	
	local cornerVolume = Instance.new("UICorner")
	cornerVolume.CornerRadius = UDim.new(0, 10)
	cornerVolume.Parent = volumeFrame
	
	local textVolume = Instance.new("TextLabel")
	textVolume.Name = "Text"
	textVolume.Size = UDim2.new(0.2, 0, 1, 0)
	textVolume.BackgroundTransparency = 1
	textVolume.TextSize = 28
	textVolume.TextColor3 = Color3.fromRGB(255, 255, 255)
	textVolume.Font = Enum.Font.Gotham
	textVolume.Text = "Volume"
	textVolume.TextXAlignment = Enum.TextXAlignment.Left
	textVolume.Parent = volumeFrame
	
	-- Slider de volume
	local sliderFundo = Instance.new("Frame")
	sliderFundo.Name = "SliderFundo"
	sliderFundo.Size = UDim2.new(0.5, 0, 0.4, 0)
	sliderFundo.Position = UDim2.new(0.4, 0, 0.3, 0)
	sliderFundo.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	sliderFundo.BorderSizePixel = 0
	sliderFundo.Parent = volumeFrame
	
	local cornerSlider = Instance.new("UICorner")
	cornerSlider.CornerRadius = UDim.new(0, 8)
	cornerSlider.Parent = sliderFundo
	
	local sliderPreenchimento = Instance.new("Frame")
	sliderPreenchimento.Name = "SliderPreenchimento"
	sliderPreenchimento.Size = UDim2.new(Config.Volume / 100, 0, 1, 0)
	sliderPreenchimento.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
	sliderPreenchimento.BorderSizePixel = 0
	sliderPreenchimento.Parent = sliderFundo
	
	local cornerPreenchimento = Instance.new("UICorner")
	cornerPreenchimento.CornerRadius = UDim.new(0, 8)
	cornerPreenchimento.Parent = sliderPreenchimento
	
	local textVolumeValor = Instance.new("TextLabel")
	textVolumeValor.Name = "Valor"
	textVolumeValor.Size = UDim2.new(0.15, 0, 1, 0)
	textVolumeValor.Position = UDim2.new(0.91, 0, 0, 0)
	textVolumeValor.BackgroundTransparency = 1
	textVolumeValor.TextSize = 24
	textVolumeValor.TextColor3 = Color3.fromRGB(255, 255, 255)
	textVolumeValor.Font = Enum.Font.GothamBold
	textVolumeValor.Text = Config.Volume .. "%"
	textVolumeValor.Parent = volumeFrame
	
	-- Evento de clique no slider
	sliderFundo.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then return end
		
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			local mouse = player:GetMouse()
			local conexao
			conexao = mouse.Move:Connect(function()
				local tamanhoSlider = sliderFundo.AbsoluteSize.X
				local posicaoMouse = mouse.X - sliderFundo.AbsolutePosition.X
				local porcentagem = math.max(0, math.min(1, posicaoMouse / tamanhoSlider))
				
				Config.Volume = math.floor(porcentagem * 100)
				sliderPreenchimento.Size = UDim2.new(porcentagem, 0, 1, 0)
				textVolumeValor.Text = Config.Volume .. "%"
				aplicarConfiguracoes()
			end)
			
			UserInputService.InputEnded:Connect(function(input2, gameProcessed2)
				if input2.UserInputType == Enum.UserInputType.MouseButton1 then
					conexao:Disconnect()
				end
			end)
		end
	end)
	
	return configContainer, botaoVoltar
end

-- =====================================
-- FUNÇÃO PRINCIPAL
-- =====================================
local function iniciarMenu()
	local screenGui = criarGuiPrincipal()
	local menu = criarMenuInicial(screenGui)
	
	-- Evento do botão JOGAR
	menu.botaoJogar.MouseButton1Click:Connect(function()
		screenGui:Destroy()
		
		local telaCarregamento = criarTelaCarregamento()
		animarCarregamento(telaCarregamento)
		
		-- Aqui o jogo começa!
		print("Jogo iniciado! Player pode jogar agora.")
	end)
	
	-- Evento do botão CONFIGURAÇÕES
	menu.botaoConfig.MouseButton1Click:Connect(function()
		menu.container:Destroy()
		
		local configContainer, botaoVoltar = criarTelaConfiguracoes(screenGui)
		
		-- Evento do botão X (voltar)
		botaoVoltar.MouseButton1Click:Connect(function()
			configContainer:Destroy()
			
			local novoMenu = criarMenuInicial(screenGui)
			
			novoMenu.botaoJogar.MouseButton1Click:Connect(function()
				screenGui:Destroy()
				
				local telaCarregamento = criarTelaCarregamento()
				animarCarregamento(telaCarregamento)
			end)
			
			novoMenu.botaoConfig.MouseButton1Click:Connect(function()
				novoMenu.container:Destroy()
				
				local configContainer2, botaoVoltar2 = criarTelaConfiguracoes(screenGui)
				
				botaoVoltar2.MouseButton1Click:Connect(function()
					configContainer2:Destroy()
					iniciarMenu()
				end)
			end)
		end)
	end)
end

-- Iniciar o menu quando o game carrega
iniciarMenu()
print("✓ Menu iniciado com sucesso!")