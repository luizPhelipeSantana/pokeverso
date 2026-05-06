var express = require("express");
var router = express.Router();

var jogoController = require("../controllers/jogoController");

router.get("/listar", function (req, res) {
    jogoController.listar(req, res);
})

module.exports = router;