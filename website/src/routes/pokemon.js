var express = require("express");
var router = express.Router();

var pokemonController = require("../controllers/pokemonController");

router.get("/listar", function (req, res) {
    pokemonController.listar(req, res);
})

module.exports = router;