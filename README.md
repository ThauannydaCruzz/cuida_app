# CUIDA App 🩺💙

<img src="assets/images/logo.png" alt="Logo do CUIDA" width="300"/> **Consulta Unificada e Inteligente para Disponibilidade e Acesso**

O **CUIDA** é um aplicativo mobile de gestão de estoque, desenvolvido em Flutter, focado em otimizar e modernizar o controle de medicamentos e insumos em unidades de saúde públicas. A plataforma é uma ferramenta para gestores e funcionários, garantindo eficiência, agilidade e precisão no gerenciamento do almoxarifado.

---

## ✨ Funcionalidades Principais

O aplicativo oferece um ecossistema completo para a gestão de saúde, com funcionalidades robustas e intuitivas:

* **📱 Autenticação Segura:** Telas de boas-vindas, login e cadastro com validação de dados (e-mail corporativo, confirmação de senha, etc.).
* **📊 Dashboard Inteligente:** Uma tela inicial que apresenta um resumo do status do estoque, alertas importantes e acesso rápido às principais funções do sistema.
* **📦 Gestão de Estoque Completa:**
    * Visualização detalhada do estoque da unidade do funcionário.
    * Leitura de **código de barras** para dar entrada (NF) e baixa (entrega/uso) de medicamentos.
    * Ajuste manual de quantidade com registro de justificativa obrigatória para auditoria.
* **🗺️ Mapa Inter-unidades em Tempo Real:**
    * Visualize todas as unidades de saúde da cidade em um mapa interativo.
    * Filtre o mapa por nome de medicamento para encontrar unidades com estoque disponível.
    * Clique em uma unidade para ver seu estoque e solicitar transferências.
* **🚚 Solicitação de Entregas:** Um fluxo completo para solicitar a transferência de medicamentos entre unidades, com formulário de agendamento (data e hora) e acompanhamento de status (`Em análise`, `Em rota`, `Entregue`).
* **📄 Central de Documentos e Relatórios:** Páginas dedicadas para a busca de documentos (como notas fiscais) e para a geração de relatórios detalhados de movimentação de estoque.

---

## 🛠️ Tecnologias Utilizadas

Este projeto é construído com tecnologias modernas, visando uma experiência de usuário fluida e um desenvolvimento escalável.

* **Frontend (Mobile):**
    * [Flutter](https://flutter.dev/) - Framework principal para o desenvolvimento multiplataforma.
    * [Dart](https://dart.dev/) - Linguagem de programação.
    * `flutter_map` - Pacote para a criação de mapas interativos.
    * `mobile_scanner` - Pacote para a leitura de códigos de barras.
    * `iconsax` - Biblioteca de ícones para um design moderno.
* **Backend (Simulado/Planejado):**
    * [Node.js](https://nodejs.org/) - Ambiente de execução do servidor.
    * [Express.js](https://expressjs.com/) - Framework para a construção da API.
    * [PostgreSQL](https://www.postgresql.org/) - Banco de dados relacional para persistência dos dados.
    * `bcryptjs` & `jsonwebtoken` - Para segurança de senhas e autenticação.

---

## 🚀 Como Rodar o Projeto

Para executar este projeto localmente, siga os passos abaixo.

### Pré-requisitos

Você precisa ter o seguinte software instalado na sua máquina:

* **Flutter SDK:** Versão 3.0 ou superior. ([Guia de Instalação](https://flutter.dev/docs/get-started/install))
* **Node.js:** Para o backend (se aplicável). ([Download](https://nodejs.org/))
* **Um editor de código:** Recomenda-se o **VS Code** com as extensões do Flutter e Dart.
* **Um emulador Android** (configurado via Android Studio) ou um dispositivo físico.

### Instalação e Execução

1.  **Clone o repositório:**
    ```sh
    git clone [https://github.com/seu-usuario/cuida_app.git](https://github.com/seu-usuario/cuida_app.git)
    ```

2.  **Navegue até a pasta do projeto:**
    ```sh
    cd cuida_app
    ```

3.  **Instale as dependências do Flutter:**
    ```sh
    flutter pub get
    ```

4.  **Execute o aplicativo:**
    * Certifique-se de que um emulador esteja rodando ou um dispositivo esteja conectado.
    * Execute o comando:
    ```sh
    flutter run
    ```
    * Alternativamente, pressione `F5` no VS Code para iniciar a depuração.

---

## 🏗️ Estrutura do Projeto

O projeto segue uma arquitetura limpa, separando as responsabilidades em diferentes camadas:

```
lib/
└── src/
    ├── core/           # Configurações centrais (tema, cores, etc.)
    ├── features/       # Cada funcionalidade principal do app em sua própria pasta
    │   ├── auth/       # Telas de login, cadastro, boas-vindas
    │   ├── documents/  # Tela de documentos
    │   ├── home/       # O dashboard principal
    │   ├── map/        # A tela do mapa e de solicitação de entrega
    │   ├── reports/    # A tela de relatórios
    │   └── stock/      # A tela de gestão de estoque
    │
    └── shared/         # Widgets e lógicas reutilizáveis
        └── widgets/
            └── scanner_screen.dart
```

---

## 🤝 Contribuição

Contribuições são o que tornam a comunidade de código aberto um lugar incrível para aprender, inspirar e criar. Qualquer contribuição que você fizer será **muito apreciada**.

1.  Faça um Fork do Projeto
2.  Crie sua Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Faça o Commit de suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4.  Faça o Push para a Branch (`git push origin feature/AmazingFeature`)
5.  Abra um Pull Request

---

Desenvolvido com ❤️ por Thauanny da Cruz.
