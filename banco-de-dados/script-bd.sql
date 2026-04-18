CREATE DATABASE pokeverso;
USE pokeverso;

CREATE TABLE geracoes (
	id_geracao INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    lancamento DATE NOT NULL,
    qtd_pokemon INT NOT NULL
);

CREATE TABLE jogos (
	id_jogo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    lancamento DATE NOT NULL,
    id_geracao INT NOT NULL,
    CONSTRAINT chFkGeracaoJogo FOREIGN KEY (id_geracao) REFERENCES geracoes(id_geracao)
);

CREATE TABLE pokemon (
	id_pokemon INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    tipagem_1 VARCHAR(45) NOT NULL,
    tipagem_2 VARCHAR(45),
    foto_url VARCHAR(255) NOT NULL,
    cor_principal CHAR(7) NOT NULL,
    cor_secundaria CHAR(7) NOT NULL,
    id_geracao INT,
    CONSTRAINT chFkGeracaoPokemon FOREIGN KEY (id_geracao) REFERENCES geracoes(id_geracao)
);

CREATE TABLE usuario (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    senha VARCHAR(45) NOT NULL,
    admin TINYINT DEFAULT 0 NOT NULL,
    id_pokemon_favorito INT,
    id_jogo_favorito INT,
    id_geracao_favorita INT,
	CONSTRAINT chFkPokemonFavorito FOREIGN KEY (id_pokemon_favorito) REFERENCES pokemon(id_pokemon),
    CONSTRAINT chFkJogoFavorito FOREIGN KEY (id_jogo_favorito) REFERENCES jogos(id_jogo),
    CONSTRAINT chFkGeracaoFavorita FOREIGN KEY (id_geracao_favorito) REFERENCES geracoes(id_geracao)
);