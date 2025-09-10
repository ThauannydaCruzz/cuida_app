const { loadDatabase, saveDatabase } = require('../db/db');

const create = ({ nome, email, cpf, rg, endereco, telefone, dataNascimento, responsavel, tipoSanguineo, medicamentosAlergia, diagnostico }) => {
  const db = loadDatabase();
  const newClient = {
    id: db.clients.length + 1,
    nome,
    email,
    cpf,
    rg,
    endereco,
    telefone,
    dataNascimento,
    responsavel,
    tipoSanguineo,
    medicamentosAlergia,
    diagnostico
  };
  db.clients.push(newClient);
  saveDatabase(db);
  return newClient;
};

module.exports = { create };