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

module.exports = { graficoPokemon, graficoJogos };