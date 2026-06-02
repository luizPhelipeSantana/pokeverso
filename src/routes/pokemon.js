var express = require("express");
var router = express.Router();

var pokemonController = require("../controllers/pokemonController");

router.get("/listar", function (req, res) {
    pokemonController.listar(req, res);
});

router.get("/:id", function (req, res) {
    pokemonController.buscarPorId(req, res);
});

router.get("/quiz/:nome", function (req, res) {
    pokemonController.buscarPorNome(req, res);
});

router.get("/autocomplete/:nome", function (req, res) {
    console.log("Autocomplete");
    pokemonController.autoComplete(req, res);
});

module.exports = router;