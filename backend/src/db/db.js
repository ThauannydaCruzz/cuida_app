const fs = require('fs');
const path = require('path');

const DB_PATH = path.join(__dirname, 'mock_db.json');

const loadDatabase = () => {
  if (!fs.existsSync(DB_PATH)) {
    fs.writeFileSync(DB_PATH, JSON.stringify({ users: [] }, null, 2));
  }
  const data = fs.readFileSync(DB_PATH, 'utf-8');
  return JSON.parse(data);
};

const saveDatabase = (db) => {
  fs.writeFileSync(DB_PATH, JSON.stringify(db, null, 2));
};

module.exports = { loadDatabase, saveDatabase };