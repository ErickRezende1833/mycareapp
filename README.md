
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

## Capturas de Tela

<img width="502" height="912" alt="AddDadosVitais" src="https://github.com/user-attachments/assets/729d602e-947b-48c1-8aa7-d8d642834051" />
<img width="501" height="916" alt="AddAgenda" src="https://github.com/user-attachments/assets/8b2e38c5-0bcd-47d0-808a-aaa981a4b985" />
<img width="503" height="915" alt="Perfil" src="https://github.com/user-attachments/assets/6720bac6-61df-4ce8-8a3c-432a87087daa" />
<img width="503" height="918" alt="Medicacao" src="https://github.com/user-attachments/assets/3001a07e-ec7e-499e-8091-6f6d6a810600" />
<img width="501" height="914" alt="Login" src="https://github.com/user-attachments/assets/aff6c2be-493d-4311-8e75-7cee824575fd" />
<img width="503" height="919" alt="DadosVitais" src="https://github.com/user-attachments/assets/90fe5404-0058-4403-94a3-ca22b8fc8a85" />
<img width="499" height="917" alt="Ajuda" src="https://github.com/user-attachments/assets/1e85c670-7169-493d-8f43-3f15d453de4f" />
<img width="501" height="911" alt="Agenda" src="https://github.com/user-attachments/assets/936a6f3f-a570-4360-b93a-a64529e3bf48" />
<img width="502" height="919" alt="AddMedicacao" src="https://github.com/user-attachments/assets/90657301-5d05-4140-a9e0-9d722f35aa7d" />

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


