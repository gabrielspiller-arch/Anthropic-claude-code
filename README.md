# DietTracker - App iOS de Rastreamento de Dieta

App iOS completo para rastreamento de dieta com integração Whoop, push notifications e metas calóricas diárias.

## Funcionalidades

### Dashboard
- Anel de progresso calórico diário
- Resumo de macronutrientes (proteína, carboidratos, gordura, fibra)
- Dados do Whoop em tempo real (strain, recovery, calorias gastas)
- Controle de hidratação com botões rápidos
- Visão geral das refeições do dia

### Alimentação
- Base de dados com 30+ alimentos brasileiros pré-cadastrados
- Busca e filtro por categoria (Proteínas, Carboidratos, Vegetais, etc.)
- 6 tipos de refeição: Café da Manhã, Lanche da Manhã, Almoço, Lanche da Tarde, Jantar, Ceia
- Seletor de quantidade com porções fracionadas
- Cadastro de alimentos personalizados
- Sistema de favoritos

### Metas Diárias
- Meta de consumo calórico (kcal)
- Meta de gasto calórico (kcal) - integrada com Whoop
- Metas de macronutrientes (proteína, carboidratos, gordura, fibra)
- Meta de hidratação (litros)
- Cálculo automático baseado em TMB/TDEE (Harris-Benedict)
- Sugestões inteligentes baseadas no progresso

### Integração Whoop
- OAuth2 completo com a API Whoop Developer
- Importação de dados: strain, recovery, HRV, FC repouso, calorias gastas
- Detalhamento de atividades (tipo, duração, calorias, FC)
- Dados de sono (horas, performance)
- Balanço calórico: Consumido vs Gasto vs Déficit
- Tendência semanal

### Push Notifications
- Lembretes configuráveis para cada refeição
- Resumo diário às 22h
- Notificação ao sincronizar dados do Whoop
- Alertas de progresso da meta calórica
- Categorias com ações rápidas (Registrar Refeição, Ver Progresso)

### Perfil e Configurações
- Dados pessoais (peso, altura, idade, sexo)
- Nível de atividade física
- Objetivo (Perder Peso, Manter, Ganhar Massa)
- Cálculo automático de TMB e TDEE
- Gerenciamento de notificações

## Requisitos
- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

## Configuração do Whoop
1. Acesse [developer.whoop.com](https://developer.whoop.com) e crie uma aplicação
2. Configure o redirect URI: `diettracker://whoop/callback`
3. Substitua `YOUR_WHOOP_CLIENT_ID` e `YOUR_WHOOP_CLIENT_SECRET` em `WhoopService.swift`

## Estrutura do Projeto
```
DietTracker/
├── App/                    # Entry point e TabView
├── Models/                 # FoodItem, MealEntry, DailyGoal, WhoopData, UserProfile
├── Views/
│   ├── Dashboard/          # Dashboard principal com rings e resumos
│   ├── FoodLog/            # Registro de refeições e criação de alimentos
│   ├── Goals/              # Metas diárias e edição
│   ├── Whoop/              # Integração e visualização Whoop
│   ├── Settings/           # Perfil, notificações, configurações
│   └── Components/         # Componentes reutilizáveis
├── Services/               # WhoopService, NotificationService
├── Persistence/            # PersistenceController (UserDefaults)
├── Extensions/             # Date, Color, Double extensions
└── Resources/              # Info.plist, Entitlements
```
