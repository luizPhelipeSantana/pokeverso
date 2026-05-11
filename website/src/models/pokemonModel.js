var database = require("../database/config");

function buscarPorId(id) {
  var instrucaoSql = `SELECT nome, tipagem_1, IFNULL(tipagem_2, 'Não tem') AS tipagem_2, foto_url, id_geracao FROM pokemon WHERE id_pokemon = '${id}'`;

  return database.executar(instrucaoSql);
}

function buscarPorNome(nome) {
  var instrucaoSql = `SELECT id_pokemon, nome, tipagem_1, IFNULL(tipagem_2, 'Não tem') AS tipagem_2, foto_url, id_geracao FROM pokemon WHERE nome = '${nome}'`;

  return database.executar(instrucaoSql);
}

function listar() {
  console.log("Model listar");
  var instrucaoSql = `SELECT * FROM pokemon`;

  return database.executar(instrucaoSql);
}

function pokemonUsuario(id) {
  var instrucaoSql = `SELECT cor_principal, cor_secundaria, foto_url FROM pokemon WHERE id_pokemon = ${id}`;

  return database.executar(instrucaoSql);
}

function autoComplete(nome) {
  var instrucaoSql = `SELECT nome, foto_url FROM pokemon WHERE nome LIKE '%${nome}%' LIMIT 10`;

  return database.executar(instrucaoSql);
}

module.exports = { listar, pokemonUsuario, autoComplete, buscarPorId, buscarPorNome };
