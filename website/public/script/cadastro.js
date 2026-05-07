function cadastro(nome, email, senha) {
    let usuario = {
        nome: nome,
        email: email,
        senha: senha
    };

    localStorage.setItem("usuario", JSON.stringify(usuario));
}

function favorito(pokemon_favorito, jogo_favorito, geracao_favorita) {
    fetch("/pokemon/listar")
        .then(resposta => resposta.json())
        .then(listaPokemon => {
            let pokemon_id = -1;

            for (let i = 0; i < listaPokemon.length; i++) {
                if (listaPokemon[i].nome == pokemon_favorito) {
                    pokemon_id = Number(listaPokemon[i].id_pokemon);
                    break;
                }
            }

            if (pokemon_id < 0) {
                alert("Pokémon não existe!");
                return; 
            }

            fetch("/jogo/listar")
                .then(resposta => resposta.json())
                .then(listaJogos => {
                    let jogo_id = -1;

                    for (let i = 0; i < listaJogos.length; i++) {
                        if (listaJogos[i].nome == jogo_favorito) {
                            jogo_id = Number(listaJogos[i].id_jogo);
                            break;
                        }
                    }

                    if (jogo_id < 0) {
                        alert("Jogo não existe!");
                        return;
                    }

                    fetch("/geracao/listar")
                        .then(resposta => resposta.json())
                        .then(listaGeracoes => {
                            let geracao_id = -1;

                            for (let i = 0; i < listaGeracoes.length; i++) {
                                if (listaGeracoes[i].nome == geracao_favorita) {
                                    geracao_id = Number(listaGeracoes[i].id_geracao);
                                    break;
                                }
                            }

                            if (geracao_id < 0) {
                                alert("Geração não existe!");
                                return;
                            }

                            let favoritos = {
                                id_pokemon_favorito: pokemon_id,
                                id_jogo_favorito: jogo_id,
                                id_geracao_favorita: geracao_id
                            };

                            localStorage.setItem("favoritos", JSON.stringify(favoritos));
                            cadastrar();
                        });
                });
        })
        .catch(erro => {
            console.log(`#ERRO: ${erro}`);
        });
}

function cadastrar() {
    let usuarioStorage = JSON.parse(localStorage.getItem("usuario")) || {
        nome: null,
        email: null,
        senha: null,
    };

    let favoritosStorage = JSON.parse(localStorage.getItem("favoritos")) || {
        id_pokemon_favorito: null,
        id_jogo_favorito: null,
        id_geracao_favorita: null
    };

    fetch("/usuarios/cadastrar", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            nome: usuarioStorage.nome,
            email: usuarioStorage.email,
            senha: usuarioStorage.senha,
            id_pokemon_favorito: Number(favoritosStorage.id_pokemon_favorito),
            id_jogo_favorito: Number(favoritosStorage.id_jogo_favorito),
            id_geracao_favorita: Number(favoritosStorage.id_geracao_favorita)

        }),
    })
    .then(function (resposta) {
    console.log("resposta: ", resposta);

    if (resposta.ok) {
        alert("Cadastrou");

         window.location = "./login.html";
    } else {
        throw "Houve um erro ao tentar realizar o cadastro!";
    }
    })
    .catch(function (resposta) {
        console.log(`#ERRO: ${resposta}`);
    });

    console.log(usuarioStorage, favoritosStorage);
}
