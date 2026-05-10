var pokemonModel = require("../models/pokemonModel");

function buscarPorId(req, res) {
    let id = req.params.id;

    pokemonModel.buscarPorId(id)
        .then((resultado) => {
            if (resultado.length > 0) {
                console.log(resultado);
                res.status(200).json(resultado);
            }
            else {
                res.status(204).json([]);
            }
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
            if (resultado.length > 0) {
                console.log(resultado);
                res.status(200).json(resultado);
            }
            else {
                res.status(204).json([]);
            }
        })
        .catch(function (erro) {
            console.log(erro);
            console.log("Houve um erro ao buscar o pokémon: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        })
}

function listar(req, res) {
     pokemonModel.listar().then((resultado) => {
        console.log(resultado);
        res.status(200).json(resultado);
      });
}

function autoComplete(req, res) {
    let nome = req.params.nome;

    pokemonModel.autoComplete(nome)
        .then((resultado) => {
            if (resultado.length > 0) {
                console.log(resultado);
                res.status(200).json(resultado);
            }
            else {
                res.status(204).json([]);
            }
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
    buscarPorId
}