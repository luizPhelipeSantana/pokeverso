var express = require("express");
var router = express.Router();

var jogoController = require("../controllers/jogoController");

router.get("/listar", function (req, res) {
    jogoController.listar(req, res);
});

router.get("/autocomplete/:nome", function (req, res) {
    jogoController.autoComplete(req, res);
});

module.exports = router;