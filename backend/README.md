# CUIDA - Back-end de Autenticação e Cadastro

Este é o back-end do módulo de autenticação e cadastro do projeto CUIDA. Ele foi desenvolvido para gerenciar o acesso de funcionários à plataforma de gestão, oferecendo endpoints seguros para registro e login.

---

## 🚀 Tecnologias Utilizadas

* **Node.js**: Ambiente de execução JavaScript.
* **Express**: Framework web para construir a API.
* **bcryptjs**: Biblioteca para criptografia segura de senhas.
* **jsonwebtoken (JWT)**: Para gerar tokens de acesso e autenticar usuários.
* **Nodemon**: Ferramenta para reinício automático do servidor durante o desenvolvimento.

## 📁 Estrutura do Projeto

O código está organizado da seguinte forma para facilitar a manutenção e a integração:

Sim, com certeza. Formatar como um README.md é a melhor maneira de documentar um projeto.

Aqui está o texto que você pode copiar e colar diretamente em um novo arquivo chamado README.md na pasta backend.

Markdown

# CUIDA - Back-end de Autenticação e Cadastro

Este é o back-end do módulo de autenticação e cadastro do projeto CUIDA. Ele foi desenvolvido para gerenciar o acesso de funcionários à plataforma de gestão, oferecendo endpoints seguros para registro e login.

---

## 🚀 Tecnologias Utilizadas

* **Node.js**: Ambiente de execução JavaScript.
* **Express**: Framework web para construir a API.
* **bcryptjs**: Biblioteca para criptografia segura de senhas.
* **jsonwebtoken (JWT)**: Para gerar tokens de acesso e autenticar usuários.
* **Nodemon**: Ferramenta para reinício automático do servidor durante o desenvolvimento.

## 📁 Estrutura do Projeto

O código está organizado da seguinte forma para facilitar a manutenção e a integração:


/backend
├─── src/
│    ├─── controllers/
│    │    └─── authController.js     # Contém a lógica principal das requisições.
│    ├─── models/
│    │    └─── User.js               # Define o modelo de usuário e a lógica de acesso aos dados.
│    ├─── routes/
│    │    └─── authRoutes.js         # Define os endpoints da API (/cadastro, /login).
│    ├─── db/
│    │    └─── db.js                 # Simulação de um banco de dados em um arquivo JSON.
│    │    └─── mock_db.json          # Arquivo de armazenamento de dados dos usuários (mock).
│    └─── server.js                 # Ponto de entrada da aplicação.
├─── .env                          # Variáveis de ambiente (PORTA, segredo JWT).
├─── package.json                  # Lista de dependências e scripts do projeto.


## ⚙️ Como Executar o Back-end

1.  **Instale as dependências:**
    ```sh
    npm install
    ```

2.  **Inicie o servidor de desenvolvimento:**
    ```sh
    npm run dev
    ```
    O servidor será iniciado na porta `3001` e reiniciará automaticamente a cada alteração nos arquivos.

## 🎯 Endpoints da API

A API expõe dois endpoints principais para autenticação:

### 1. `POST /api/auth/cadastro`

* **Descrição**: Registra um novo funcionário no sistema.
* **Corpo da Requisição (JSON):**
    ```json
    {
      "nome": "string",
      "email": "string",
      "password": "string"
    }
    ```
* **Respostas**:
    * `201 Created`: Sucesso no cadastro.
    * `400 Bad Request`: Campos obrigatórios ausentes.
    * `409 Conflict`: E-mail já cadastrado.

### 2. `POST /api/auth/login`

* **Descrição**: Autentica um funcionário existente.
* **Corpo da Requisição (JSON):**
    ```json
    {
      "email": "string",
      "password": "string"
    }
    ```
* **Respostas**:
    * `200 OK`: Login bem-sucedido. O corpo da resposta inclui um token JWT.
    * `400 Bad Request`: E-mail ou senha incorretos.

### 🔑 Autenticação (JWT)

Após um cadastro ou login bem-sucedido, o back-end retorna um **JSON Web Token (JWT)**. Este token é a chave para acessar rotas protegidas. O front-end deve armazená-lo e enviá-lo no cabeçalho `Authorization` de futuras requisições para rotas que exigem autenticação.

Formato do cabeçalho de autenticação:
`Authorization: Bearer <seu_token_jwt_aqui>`

---

Este back-end pode ser testado de forma independente com ferramentas como `cURL`, Postman ou Insomnia antes da integração com o front-end.