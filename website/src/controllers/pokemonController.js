var pokemonModel = require("../models/pokemonModel");

function listar(req, res) {
     pokemonModel.listar().then((resultado) => {
        console.log(resultado);
        res.status(200).json(resultado);
      });
}

module.exports = {
    listar
}