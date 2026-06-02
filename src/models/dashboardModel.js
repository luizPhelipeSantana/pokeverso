var database = require("../database/config");

function graficoPokemon() {
  var instrucaoSql = `
    SELECT 
        p.nome AS pokemon,
        p.cor_principal,
        COUNT(u.id_usuario) AS quantidade
    FROM usuario u
    JOIN pokemon p
        ON u.id_pokemon_favorito = p.id_pokemon
    GROUP BY p.id_pokemon, p.nome, p.cor_principal
    ORDER BY quantidade DESC
    LIMIT 5
  `;

  return database.executar(instrucaoSql);
}

function graficoJogos() {
  var instrucaoSql = `
    SELECT 
        j.nome AS jogo,
        COUNT(u.id_usuario) AS quantidade
    FROM usuario u
    JOIN jogos j
        ON u.id_jogo_favorito = j.id_jogo
    GROUP BY j.id_jogo, j.nome
    ORDER BY quantidade DESC
    LIMIT 5
  `;

  return database.executar(instrucaoSql);
}

function kpiPokemon() {
  var instrucaoSql = `
      SELECT 
        p.nome AS pokemon
    FROM usuario u
    JOIN pokemon p
        ON u.id_pokemon_favorito = p.id_pokemon
    GROUP BY p.id_pokemon
    ORDER BY COUNT(u.id_usuario) DESC
    LIMIT 1
  `;

  return database.executar(instrucaoSql);
}

function kpiJogo() {
  var instrucaoSql = `
      SELECT 
          j.nome AS jogo
      FROM usuario u
      JOIN jogos j
          ON u.id_jogo_favorito = j.id_jogo
      GROUP BY j.id_jogo
      ORDER BY COUNT(u.id_usuario) DESC
      LIMIT 1
  `;

  return database.executar(instrucaoSql);
}

function kpiGeracao() {
  var instrucaoSql = `
      SELECT 
          g.nome AS geracao
      FROM usuario u
      JOIN geracoes g
          ON u.id_geracao_favorita = g.id_geracao
      GROUP BY g.id_geracao
      ORDER BY COUNT(u.id_usuario) DESC
      LIMIT 1;
  `;

  return database.executar(instrucaoSql);
}

module.exports = { 
  graficoPokemon, 
  graficoJogos,
  kpiPokemon,
  kpiJogo,
  kpiGeracao
};