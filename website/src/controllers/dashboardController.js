var dashboardModel = require("../models/dashboardModel");

function graficoPokemon(req, res) {
     dashboardModel.graficoPokemon().then(function (resultado) {
        console.log(resultado);
        return res.status(200).json(resultado);
      });
}

function graficoJogos(req, res) {
     dashboardModel.graficoJogos().then(function (resultado) {
        console.log(resultado);
        return res.status(200).json(resultado);
      });
}


module.exports = {
    graficoPokemon,
    graficoJogos
}