var usuarioModel = require("../models/usuarioModel");
var pokemonModel = require("../models/pokemonModel");

function autenticar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {

        usuarioModel.autenticar(email, senha)
            .then(
                function (resultadoAutenticar) {
                    console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`);

                    if (resultadoAutenticar.length == 1) {
                        console.log(resultadoAutenticar);

                        pokemonModel.pokemonUsuario(resultadoAutenticar[0].id_pokemon_favorito)
                            .then(
                                function (resultadoPokemon) {
                                if (resultadoPokemon.length == 1) {
                                    res.json({
                                        id: resultadoAutenticar[0].id_usuario,
                                        email: resultadoAutenticar[0].email,
                                        nome: resultadoAutenticar[0].nome,
                                        senha: resultadoAutenticar[0].senha,
                                        admin: resultadoAutenticar[0].admin,
                                        cor_principal: resultadoPokemon[0].cor_principal,
                                        cor_secundaria: resultadoPokemon[0].cor_secundaria,
                                        foto_url: resultadoPokemon[0].foto_url
                                    });
                                }
                                else {
                                    res.status(400).json({ });  
                                }
                            })
                    } else if (resultadoAutenticar.length == 0) {
                        res.status(403).send("Email e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}

function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nome = req.body.nome;
    var email = req.body.email;
    var senha = req.body.senha;
    var id_pokemon_favorito = req.body.id_pokemon_favorito;
    var id_jogo_favorito = req.body.id_jogo_favorito;
    var id_geracao_favorita = req.body.id_geracao_favorita;

    // Faça as validações dos valores
    if (nome == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está undefined!");
    } else if (id_pokemon_favorito == undefined) {
        res.status(400).send("Seu pokemon favorito está undefined!");
    }
    else if (id_jogo_favorito == undefined) {
        res.status(400).send("Seu jogo favorito está undefined!");
    }
    else if (id_geracao_favorita == undefined) {
        res.status(400).send("Sua geração favorita está undefined!");
    } else {
        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrar(nome, email, senha, id_pokemon_favorito, id_jogo_favorito, id_geracao_favorita)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function listarEmail(req, res) {
    let email = req.params.email;

    usuarioModel.listarEmail(email)
        .then((resultado) => {
            res.status(200).json(resultado);
        });
}

module.exports = {
    autenticar,
    cadastrar,
    listarEmail
}
