var database = require("../database/config");

function listar() {
  var instrucaoSql = `SELECT * FROM jogos`;

  return database.executar(instrucaoSql);
}


module.exports = { listar };
