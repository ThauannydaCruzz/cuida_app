const Funcionario = require('../models/funcionario'); 
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');

const register = async (req, res) => {
  try {
    const { nome, email, password, matricula, departamento, cargo } = req.body;

    if (!nome || !email || !password || !matricula || !departamento || !cargo) {
      return res.status(400).json({ mensagem: "Preencha todos os campos obrigatórios!" });
    }

    const existingUser = Funcionario.findByEmail(email); 
    if (existingUser) {
      return res.status(409).json({ mensagem: "Usuário já cadastrado!" });
    }

    const newUser = await Funcionario.create({ nome, email, password, matricula, departamento, cargo }); 

    const token = jwt.sign(
      { id: newUser.id, nome: newUser.nome, role: newUser.role },
      process.env.JWT_SECRET,
      { expiresIn: '1h' }
    );

    return res.status(201).json({ mensagem: "Usuário cadastrado com sucesso!", token });
  } catch (error) {
    console.error(error);
    res.status(500).json({ mensagem: "Erro interno do servidor." });
  }
};

const login = async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = Funcionario.findByEmail(email);
    if (!user) {
      return res.status(400).json({ mensagem: "E-mail ou senha incorretos." });
    }

    const isPasswordValid = await bcrypt.compare(password, user.password);
    if (!isPasswordValid) {
      return res.status(400).json({ mensagem: "E-mail ou senha incorretos." });
    }

    const token = jwt.sign(
      { id: user.id, nome: user.nome, role: user.role },
      process.env.JWT_SECRET,
      { expiresIn: '1h' }
    );

    res.json({ mensagem: "Login bem-sucedido!", token });
  } catch (error) {
    console.error(error);
    res.status(500).json({ mensagem: "Erro interno do servidor." });
  }
};

module.exports = { register, login };