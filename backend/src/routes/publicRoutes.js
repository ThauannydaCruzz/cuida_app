const express = require('express');
const { registerClient } = require('../controllers/publicController');

const router = express.Router();

router.post('/cadastro-cidadao', registerClient);

module.exports = router;