# 💰 Sistema de Money - Roblox Studio Lite

Sistema completo de dinheiro para Roblox Studio Lite desenvolvido em **Luau**, com **leaderstats**, **formatação automática** e **ganho passivo**.

---

## 📋 Funcionalidades

✅ **Money System Completo**
- Player começa com $0
- Ganha $50 automaticamente a cada 1 minuto
- Valores formatados automaticamente (K, M, B, etc)

✅ **GUI de Money**
- TextLabel mostrando: 🪙 $0
- Cor verde
- Atualização em tempo real
- Compatível com celular e PC

✅ **Leaderboard**
- Integração com leaderstats
- Mostra Money dos players
- Valores salvos enquanto estão no servidor

✅ **Formatação Automática**
- 1.000 → 1K
- 10.000 → 10K
- 100.000 → 100K
- 1.000.000 → 1M
- 10.000.000 → 10M
- 100.000.000 → 100M
- Bilhões, trilhões, etc.

---

## 📁 Estrutura de Instalação

```
Roblox Studio Lite
├── ServerScriptService
│   └── MoneySystem (Script)
│       └── MoneySystem_ServerScript.lua
└── StarterGui
    └── MoneyLabel (ScreenGui)
        ├── MoneyLabel (TextLabel) ← Aqui vai o Local Script!
        │   └── MoneySystem (LocalScript)
        │       └── MoneySystem_LocalScript.lua
```

---

## 🚀 Passo a Passo de Instalação

### PASSO 1: Criar o Script do Server

1. Abra **Roblox Studio Lite**
2. Vá para **View** → **Explorer** (se não estiver visível)
3. Na árvore do Explorer, procure por **ServerScriptService**
4. Clique com botão direito em **ServerScriptService**
5. Selecione **Insert Object** → **Script**
6. Um novo **Script** será criado dentro de ServerScriptService
7. Renomeie o script para `MoneySystem` (opcional mas recomendado)
8. **Copie todo o código** do arquivo `MoneySystem_ServerScript.lua`
9. **Cole dentro** do Script que você criou
10. ✅ Pronto! O Server Script está instalado

---

### PASSO 2: Criar o TextLabel no StarterGui

1. Na árvore do Explorer, procure por **StarterGui**
2. Clique com botão direito em **StarterGui**
3. Selecione **Insert Object** → **ScreenGui**
4. Uma nova **ScreenGui** será criada
5. Renomeie para `MoneyLabel` (IMPORTANTE!)
6. Clique com botão direito em **MoneyLabel** (ScreenGui)
7. Selecione **Insert Object** → **TextLabel**
8. Uma nova **TextLabel** será criada
9. **Renomeie para `MoneyLabel`** (EXATAMENTE ESTE NOME!)

---

### PASSO 3: Configurar o TextLabel

Agora você vai configurar o visual do TextLabel. Siga estes passos:

1. Clique na **TextLabel** que você criou
2. Na janela **Properties** (lado direito), configure:

| Propriedade | Valor |
|------------|-------|
| **Name** | `MoneyLabel` ✅ |
| **Text** | `🪙 $0` |
| **TextSize** | `24` |
| **Font** | `GothamBold` |
| **TextColor3** | Verde `0, 200, 0` |
| **BackgroundColor3** | Preto `0, 0, 0` |
| **BackgroundTransparency** | `0.5` |
| **BorderSizePixel** | `0` |
| **Size** | `UDim2.new(0.2, 0, 0.08, 0)` |
| **Position** | `UDim2.new(0.05, 0, 0.02, 0)` |

**Resultado esperado:**
- Um retângulo preto com texto verde no canto superior esquerdo
- Mostrando: 🪙 $0

---

### PASSO 4: Criar o Local Script

1. Clique com botão direito na **TextLabel** chamada `MoneyLabel`
2. Selecione **Insert Object** → **LocalScript**
3. Um novo **LocalScript** será criado dentro da TextLabel
4. **Copie todo o código** do arquivo `MoneySystem_LocalScript.lua`
5. **Cole dentro** do LocalScript
6. ✅ Pronto! O Local Script está instalado

---

## ✅ Verificar Instalação

Após instalar os dois scripts, faça o seguinte:

1. Clique no botão **Play** (▶️) no Roblox Studio
2. Procure pelo TextLabel com o dinheiro (🪙 $0)
3. Espere **1 minuto** para ver o valor aumentar para $50
4. Verifique se mostra **🪙 $50** (em verde)
5. Procure no **Leaderboard** (canto superior direito) e veja o Money

Se tudo está funcionando, parabéns! ✨

---

## 🎨 Personalizar o Visor de Money

Você pode mudar o visual do TextLabel conforme quiser:

### Mudar cor do texto
Na aba **Properties** do TextLabel:
- **TextColor3** → Escolha a cor desejada

### Mudar tamanho
- **TextSize** → Aumentar ou diminuir (padrão: 24)

### Mudar posição
- **Position** → Arrastar na tela ou editar manualmente
- `UDim2.new(X, 0, Y, 0)` onde X e Y são valores de 0 a 1

### Mudar fundo
- **BackgroundColor3** → Cor do fundo
- **BackgroundTransparency** → 0 = totalmente opaco, 1 = totalmente transparente

---

## 💾 Como Funciona o Sistema

### Server Script (MoneySystem_ServerScript.lua)

```lua
✓ Cria leaderstats quando player entra
✓ Cria uma IntValue chamada "Money" com valor inicial 0
✓ A cada 60 segundos (1 minuto), adiciona $50
✓ Formata o dinheiro automaticamente (1000 → 1K)
✓ Remove o player quando ele sai
```

### Local Script (MoneySystem_LocalScript.lua)

```lua
✓ Encontra o TextLabel chamado "MoneyLabel"
✓ Escuta mudanças no valor de Money
✓ Atualiza o TextLabel em tempo real
✓ Mantém o formato: 🪙 $valor
```

---

## 📊 Formatação de Dinheiro

O sistema formata automaticamente:

```
$0 - $999           → $0 até $999
$1.000 - $9.999     → $1K até $9K
$10.000 - $99.999   → $10K até $99K
$100.000 - $999.999 → $100K até $999K
$1.000.000+         → $1M, $10M, $100M, $1B, etc
```

---

## ⚙️ Modificações Possíveis

### Mudar quantidade de dinheiro ganho por minuto

No **Server Script**, encontre esta linha:

```lua
ganharDinheiro(player, 50)
```

Troque `50` pela quantia desejada. Ex: `ganharDinheiro(player, 100)` para ganhar $100/min

### Mudar intervalo de tempo

No **Server Script**, encontre:

```lua
wait(60)
```

Troque `60` pelo tempo desejado em **segundos**:
- `wait(30)` = ganha a cada 30 segundos
- `wait(120)` = ganha a cada 2 minutos
- `wait(600)` = ganha a cada 10 minutos

### Mudar emoji

No **Local Script**, encontre:

```lua
moneyLabel.Text = "🪙 $" .. formatarDinheiro(novoValor)
```

Troque `🪙` por outro emoji:
- `💰` = saco de dinheiro
- `💵` = nota de dólar
- `💳` = cartão de crédito
- `🏆` = troféu

---

## 🐛 Troubleshooting

### Problema: TextLabel não atualiza
**Solução**: Verifique se o TextLabel se chama exatamente `MoneyLabel`

### Problema: Dinheiro não aparece no Leaderboard
**Solução**: O Server Script deve estar em **ServerScriptService** e funcionar primeiro

### Problema: O script diz que não encontra MoneyLabel
**Solução**: 
1. Verifique o nome exato (case-sensitive)
2. Certifique-se de que está em **StarterGui**
3. Reinicie o Play

### Problema: O valor não muda a cada minuto
**Solução**:
1. Verifique se o Server Script está rodando (deve aparecer na Output)
2. Espere exatamente 60 segundos
3. Verifique se o console mostra erros

### Problema: TextLabel aparece com fundo preto opaco
**Solução**: Altere **BackgroundTransparency** para valores maiores (0.5 ou 0.7)

---

## 📝 Nomes Exatos Necessários

```
ScreenGui:    MoneyLabel
TextLabel:    MoneyLabel
LocalScript:  (pode ser qualquer nome)
ServerScript: (pode ser qualquer nome)
```

---

## 🎯 Próximos Passos

Após instalar o sistema de Money, você pode:

1. **Adicionar formas de ganhar dinheiro**
   - Completar quests
   - Derrotar inimigos
   - Explorar o mapa
   - Vender itens

2. **Criar loja**
   - Comprar upgrades
   - Comprar skins
   - Comprar habilidades

3. **Adicionar banco**
   - Sacar dinheiro
   - Depositar dinheiro
   - Saques com juro

4. **Sistema de gastos**
   - Custo de respawn
   - Custo de habilidades
   - Custo de viagens

---

## 📞 Dúvidas Frequentes

**P: O dinheiro salva quando o player sai?**
R: Enquanto o player está no servidor, sim. Para persistência permanente, você precisaria de DataStore.

**P: Posso dar dinheiro manualmente para um player?**
R: Sim! Você pode criar scripts adicionais que chamam `ganharDinheiro(player, quantia)`

**P: O sistema funciona com múltiplos players?**
R: Sim! Cada player tem seu próprio Money e TextLabel.

**P: Preciso fazer alguma configuração no Studio?**
R: Não! É plug-and-play. Basta copiar os scripts e criar o TextLabel.

---

## 📜 Licença

Livre para usar e modificar em seus projetos Roblox!

---

**Desenvolvido com ❤️ para Roblox Studio Lite**

Versão: 1.0
Data: 2026-08-28