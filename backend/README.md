CUIDA - Back-end de Autenticação e Cadastro
Este back-end serve como a API principal para o projeto CUIDA, gerenciando o cadastro e a autenticação tanto de funcionários quanto de cidadãos (pacientes). Ele foi desenvolvido para funcionar como um serviço independente que pode ser consumido por aplicações web ou mobile.

🚀 Tecnologias Utilizadas
Node.js: Ambiente de execução JavaScript.

Express: Framework web para construir a API.

bcryptjs: Utilizado para criptografia segura de senhas.

jsonwebtoken (JWT): Para gerar tokens de acesso e autenticar usuários.

Nodemon: Ferramenta para reinício automático do servidor em desenvolvimento.

📁 Estrutura do Projeto
A estrutura de pastas está organizada para facilitar o entendimento e a modularidade do código.

/backend
├─── src/
│    ├─── controllers/
│    │    └─── authController.js     # Lógica para login e cadastro de funcionários.
│    │    └─── publicController.js   # Lógica para login e cadastro de cidadãos.
│    ├─── models/
│    │    └─── funcionario.js        # Modelo de dados e funções para funcionários.
│    │    └─── cidadao.js            # Modelo de dados e funções para cidadãos.
│    ├─── routes/
│    │    └─── authRoutes.js         # Define os endpoints para autenticação de funcionários.
│    │    └─── publicRoutes.js       # Define os endpoints para autenticação de cidadãos.
│    ├─── db/
│    │    └─── db.js                 # Lógica para simular o banco de dados.
│    │    └─── mock_db.json          # Arquivo de armazenamento dos dados (simulação).
│    └─── server.js                 # Ponto de entrada da aplicação.
├─── .env                          # Variáveis de ambiente.
├─── package.json                  # Dependências e scripts do projeto.


⚙️ Como Executar o Back-end
Para colocar o back-end para rodar localmente:

Abra o terminal na pasta backend.

Instale as dependências do projeto com o comando:

npm install

Inicie o servidor em modo de desenvolvimento:

npm run dev

servidor estará rodando na porta 3001 e pronto para receber requisições.


🎯 Endpoints da API
A API oferece os seguintes endpoints para as aplicações web e mobile:

1. Para Funcionários:
POST /api/auth/cadastro

Descrição: Registra um novo funcionário ou gestor.

Corpo da Requisição (JSON):

{
  "nome": "string",
  "email": "string",
  "password": "string",
  "matricula": "string",
  "departamento": "string",
  "cargo": "string"
}

POST /api/auth/login

Descrição: Autentica um funcionário.

Corpo da Requisição (JSON):

{
  "email": "string",
  "password": "string"
}

. Para Cidadãos (Pacientes):
POST /api/publico/cadastro-cidadao

Descrição: Registra um novo cidadão (paciente).

Corpo da Requisição (JSON):

{
  "nome": "string",
  "idade": "number",
  "endereco": "string",
  "cpf": "string",
  "rg": "string",
  "email": "string",
  "telefone": "string",
  "carteirinha": "string",
  "tipoSanguineo": "string",
  "medicamentosRestritos": "string",
  "diagnosticos": "string",
  "password": "string"
}

POST /api/publico/login-cidadao

Descrição: Autentica um cidadão (paciente).

Corpo da Requisição (JSON):

{
  "email": "string",
  "password": "string"
}

As rotas de autenticação retornam um token JWT em caso de sucesso, que deve ser usado para acessar rotas protegidas.