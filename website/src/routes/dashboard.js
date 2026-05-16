var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

router.get("/grafico/pokemon", function (req, res) {
    dashboardController.graficoPokemon(req, res);
});

router.get("/grafico/jogos", function (req, res) {
    dashboardController.graficoJogos(req, res);
});

module.exports = router;