var database = require("../database/config");

function listar() {
  var instrucaoSql = `SELECT * FROM pokemon`;

  return database.executar(instrucaoSql);
}

module.exports = { listar };
