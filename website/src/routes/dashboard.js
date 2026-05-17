var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

router.get("/grafico/pokemon", function (req, res) {
    dashboardController.graficoPokemon(req, res);
});

router.get("/grafico/jogos", function (req, res) {
    dashboardController.graficoJogos(req, res);
});

router.get("/kpi/pokemon", function (req, res) {
    dashboardController.kpiPokemon(req, res);
});

router.get("/kpi/jogo", function (req, res) {
    dashboardController.kpiJogo(req, res);
});

router.get("/kpi/geracao", function (req, res) {
    dashboardController.kpiGeracao(req, res);
});

module.exports = router;