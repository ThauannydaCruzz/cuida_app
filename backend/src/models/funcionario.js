const { loadDatabase, saveDatabase } = require('../db/db');
const bcrypt = require('bcryptjs');

const findByEmail = (email) => {
  const db = loadDatabase();
  return db.users.find(user => user.email === email);
};

const create = async ({ nome, email, password, matricula, departamento, cargo, role = 'funcionario' }) => {
  const db = loadDatabase();
  const hashedPassword = await bcrypt.hash(password, 10);
  const newUser = {
    id: db.users.length + 1,
    nome,
    email,
    password: hashedPassword,
    matricula,
    departamento,
    cargo,
    role
  };
  db.users.push(newUser);
  saveDatabase(db);
  return newUser;
};

module.exports = { findByEmail, create };