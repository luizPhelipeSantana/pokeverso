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

function kpiPokemon(req, res) {
  dashboardModel.kpiPokemon()
    .then(function (resultado) {
      console.log(resultado);
      return res.status(200).json(resultado);
    })
}

function kpiJogo(req, res) {
  dashboardModel.kpiJogo()
    .then(function (resultado) {
      console.log(resultado);
      return res.status(200).json(resultado);
    })
}

function kpiGeracao(req, res) {
  dashboardModel.kpiGeracao()
    .then(function (resultado) {
      console.log(resultado);
      return res.status(200).json(resultado);
    })
}

module.exports = {
    graficoPokemon,
    graficoJogos,
    kpiPokemon,
    kpiJogo,
    kpiGeracao
}