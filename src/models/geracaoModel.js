var database = require("../database/config");

function listar() {
  var instrucaoSql = `SELECT * FROM geracoes`;

  return database.executar(instrucaoSql);
}

function autoComplete(nome) {
  var instrucaoSql = `SELECT nome FROM geracoes WHERE nome LIKE '%${nome}%' LIMIT 10`;

  return database.executar(instrucaoSql);
}


module.exports = { listar, autoComplete };
