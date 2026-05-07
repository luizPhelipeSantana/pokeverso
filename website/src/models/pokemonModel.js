var database = require("../database/config");

function listar() {
  var instrucaoSql = `SELECT * FROM pokemon`;

  return database.executar(instrucaoSql);
}

function pokemonUsuario(id) {
  var instrucaoSql = `SELECT cor_principal, cor_secundaria, foto_url FROM pokemon WHERE id_pokemon = ${id}`;

  return database.executar(instrucaoSql);
}

function autoComplete(nome) {
  var instrucaoSql = `SELECT nome FROM pokemon WHERE nome LIKE '${nome}%' LIMIT 10`;

  return database.executar(instrucaoSql);
}

module.exports = { listar, pokemonUsuario, autoComplete };
