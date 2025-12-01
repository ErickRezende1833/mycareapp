
# MyCareApp - MVP Funcional

## Resumo do Aplicativo

O MyCareApp é um **MVP (Produto Mínimo Viável)** de um aplicativo mobile para a área da saúde, focado em auxiliar o usuário no gerenciamento de sua rotina de medicamentos e no acompanhamento de dados vitais e agendamentos. É uma interface simples e funcional para o controle de saúde diário.

O projeto original, que serviu como base, foi transformado em um aplicativo funcional com 8 telas, navegação completa, funcionalidades essenciais e um design system coeso, seguindo os critérios definidos.

## Lista de Funcionalidades

O MyCareApp inclui as seguintes funcionalidades essenciais:

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
    *   **9 Telas Funcionais:** Medicamentos (Home), Adicionar Medicamento, Dados Vitais, Registrar Dados Vitais, Agenda, Lembretes, Perfil, Login e Ajuda.
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

1.  **Clonar o repositório:**
    
    https://github.com/ErickRezende1833/mycareapp.git
    

2.  **Instale as dependências do projeto:**
    
    flutter pub get
    

3.  **Execute o aplicativo:**
    
    flutter run
    
    *Aguarde a compilação e a instalação no dispositivo/emulador selecionado.*


