var database = require("../database/config");

function listar() {
  var instrucaoSql = `SELECT * FROM geracoes`;

  return database.executar(instrucaoSql);
}


module.exports = { listar };
