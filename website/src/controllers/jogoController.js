var jogoModel = require("../models/jogoModel");

function listar(req, res) {
    jogoModel.listar().then((resultado) => {
        res.status(200).json(resultado);
      });
}

function autoComplete(req, res) {
    let nome = req.params.nome;

    jogoModel.autoComplete(nome)
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
            console.log("Houve um erro ao buscar os jogos: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

module.exports = {
    listar,
    autoComplete
}