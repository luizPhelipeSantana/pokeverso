var pokemonModel = require("../models/pokemonModel");

function buscarPorId(req, res) {
    let id = req.params.id;

    pokemonModel.buscarPorId(id)
        .then((resultado) => {
            res.status(200).json(resultado);
        })
        .catch(function (erro) {
            console.log(erro);
            console.log("Houve um erro ao buscar o pokémon: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        })
}

function buscarPorNome(req, res) {
    let nome = req.params.nome;

    pokemonModel.buscarPorNome(nome)
        .then((resultado) => {
            res.status(200).json(resultado);
        })
        .catch(function (erro) {
            console.log(erro);
            console.log("Houve um erro ao buscar o pokémon: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        })
}

function listar(req, res) {
    console.log("Controller listar")
     pokemonModel.listar().then(function (resultado) {
        console.log(resultado);
        return res.status(200).json(resultado);
      });
}


function autoComplete(req, res) {
    let nome = req.params.nome;

    pokemonModel.autoComplete(nome)
        .then((resultado) => {
            res.status(200).json(resultado);
        })
        .catch(function (erro) {
            console.log(erro);
            console.log("Houve um erro ao buscar os pokémon: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

module.exports = {
    listar,
    autoComplete,
    buscarPorNome,
    buscarPorId,
}