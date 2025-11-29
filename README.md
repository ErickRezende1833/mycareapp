> **Nota:** Este README foi gerado e atualizado por um agente de IA (Manus) para refletir o estado do MVP funcional.

# MyCareApp - MVP Funcional

## Resumo do Aplicativo

O MyCareApp é um **MVP (Produto Mínimo Viável)** de um aplicativo mobile para a área da saúde, focado em auxiliar o usuário no gerenciamento de sua rotina de medicamentos e no acompanhamento de dados vitais e agendamentos. O objetivo é fornecer uma interface simples e funcional para o controle de saúde diário.

O projeto original, que serviu como base, foi transformado em um aplicativo funcional com 8 telas, navegação completa, funcionalidades essenciais e um design system coeso, seguindo os critérios definidos.

## Lista de Funcionalidades

O MVP funcional do MyCareApp inclui as seguintes funcionalidades essenciais:

1.  **Gerenciamento de Medicamentos (Tela Principal):**
    *   Visualização da lista de medicamentos e horários.
    *   Registro de ação (Tomado/Não Tomado) para cada medicamento com feedback visual (SnackBar).
    *   Remoção de medicamentos da lista com feedback visual.
    *   Visualização do histórico de ações (Tomado/Não Tomado).
2.  **Adicionar Medicamento (Formulário):**
    *   Formulário para adicionar novos medicamentos (Nome, Dose, Horário).
    *   Validação de campos obrigatórios para garantir a integridade dos dados.
    *   Feedback visual durante o salvamento (indicador de carregamento) e após (mensagem de sucesso).
3.  **Navegação e Estrutura:**
    *   **8 Telas Funcionais:** Medicamentos (Home), Adicionar Medicamento, Lembretes, Dados Vitais, Agenda, Perfil, Configurações e Ajuda.
    *   Fluxo de navegação completo via `BottomNavigationBar` para as seções principais.
    *   Menu lateral (`Drawer`) para acesso a telas secundárias como Perfil, Configurações e Ajuda.
4.  **Design System e Aderência:**
    *   Implementação de um `AppTheme` centralizado para garantir consistência visual (cores, tipografia, botões, etc.).
    *   Componentes reutilizáveis (Cards, Botões, Campos de Texto) que seguem o design system.
    *   Uso de armazenamento de dados simples (lista local em memória), conforme especificado para o MVP.

## Capturas de Tela ou Vídeo de Demonstração

*(Esta seção deve ser preenchida manualmente com capturas de tela do aplicativo em execução para a entrega final.)*

**Exemplos de Telas a Serem Capturadas:**

*   **Tela Principal (Medicamentos):** Mostrando a lista de medicamentos e o histórico.
*   **Tela Adicionar Medicamento:** Exibindo o formulário de adição com o seletor de horário.
*   **Menu Lateral (Drawer):** Apresentando as opções de navegação secundárias.
*   **Feedback ao Usuário:** Captura de uma SnackBar de sucesso ou erro.

## Passo a Passo de Como Executar

O projeto foi desenvolvido utilizando o framework **Flutter**.

### Pré-requisitos

*   **Flutter SDK** instalado e configurado (o projeto usa a versão 3.9.2 do SDK Dart).
*   Um emulador Android/iOS ou um dispositivo físico conectado.

### Instruções de Execução

1.  **Clone o repositório:**
    ```bash
    git clone https://github.com/ErickRezende1833/mycareapp.git
    cd mycareapp
    ```

2.  **Instale as dependências do projeto:**
    ```bash
    flutter pub get
    ```

3.  **Execute o aplicativo:**
    ```bash
    flutter run
    ```
    *Aguarde a compilação e a instalação no dispositivo/emulador selecionado.*

## Kanban Atualizado

O Kanban abaixo detalha as tarefas realizadas para a conclusão do MVP.

| Tarefa | Quem Realizou | Status | Evidência |
| :--- | :--- | :--- | :--- |
| Estrutura Inicial do Projeto (Flutter) | ErickRezende1833 | Concluído | Commit inicial no repositório |
| Definição de Modelos (Medicacao, HistoricoAcao) | ErickRezende1833 | Concluído | Arquivos em `lib/models/` |
| Tela Principal (ViewMedicacao) - Base | ErickRezende1833 | Concluído | `lib/view/viewMedicacao.dart` (versão inicial) |
| Tela Adicionar Medicamento - Base | ErickRezende1833 | Concluído | `lib/view/viewAddMedicacao.dart` (versão inicial) |
| **Análise e Planejamento do MVP** | Manus (Agente AI) | Concluído | Plano de fases interno |
| **Criação das 8 Telas do MVP** | Manus (Agente AI) | Concluído | Arquivos em `lib/view/` |
| **Implementação da Navegação (BottomBar/Drawer)** | Manus (Agente AI) | Concluído | `lib/main.dart`, `lib/utils/app_routes.dart` |
| **Implementação de Formulários e Validação** | Manus (Agente AI) | Concluído | `lib/view/viewAddMedicacao.dart` |
| **Implementação de Feedback ao Usuário** | Manus (Agente AI) | Concluído | `lib/view/viewMedicacao.dart`, `lib/view/viewAddMedicacao.dart` |
| **Refatoração do Design System (Theme)** | Manus (Agente AI) | Concluído | `lib/theme/appTheme.dart` e componentes |
| **Criação da Documentação (README)** | Manus (Agente AI) | Concluído | `README.md` |
| **Entrega Final do Código** | Manus (Agente AI) | Concluído | Geração do arquivo .zip com o projeto |
