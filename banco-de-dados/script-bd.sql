CREATE DATABASE pokeverso;
USE pokeverso;

CREATE USER 'usr_pokeverso'@'localhost' IDENTIFIED BY 'Po158575';
GRANT ALL PRIVILEGES ON pokeverso.* TO 'usr_pokeverso'@'localhost';
FLUSH PRIVILEGES;

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
    email VARCHAR(45) UNIQUE NOT NULL,
    senha VARCHAR(45) NOT NULL,
    admin TINYINT DEFAULT 0 NOT NULL,
    id_pokemon_favorito INT,
    id_jogo_favorito INT,
    id_geracao_favorita INT,
    CONSTRAINT chCKAdmin CHECK (admin IN (0, 1)),
	CONSTRAINT chFkPokemonFavorito FOREIGN KEY (id_pokemon_favorito) REFERENCES pokemon(id_pokemon),
    CONSTRAINT chFkJogoFavorito FOREIGN KEY (id_jogo_favorito) REFERENCES jogos(id_jogo),
    CONSTRAINT chFkGeracaoFavorita FOREIGN KEY (id_geracao_favorita) REFERENCES geracoes(id_geracao)
);

INSERT INTO geracoes (nome, lancamento, qtd_pokemon) VALUES
	('Primeira Geração I', '1996-02-27', 151),
    ('Segunda Geração II', '1999-11-21', 100),
    ('Terceira Geração III', '2002-11-21', 135),
    ('Quarta Geração IV', '2006-09-28', 107),
    ('Quinta Geração V', '2010-09-18', 156),
    ('Sexta Geração VI', '2013-10-12', 72),
    ('Sétima Geração VII', '2016-11-18', 88),
    ('Oitava Geração VIII', '2019-11-15', 96),
    ('Nona Geração IX', '2022-11-18', 120);
    
SELECT * FROM geracoes;
    
INSERT INTO jogos (nome, lancamento, id_geracao) VALUES
	-- Gen 1
	('Pokémon Red', '1996-02-27', 1),
	('Pokémon Green', '1996-02-27', 1),
	('Pokémon Blue (JP)', '1996-10-15', 1),
	('Pokémon Yellow', '1998-09-12', 1),
	-- Gen 2
	('Pokémon Gold', '1999-11-21', 2),
	('Pokémon Silver', '1999-11-21', 2),
	('Pokémon Crystal', '2000-12-14', 2),
	-- Gen 3
	('Pokémon Ruby', '2002-11-21', 3),
	('Pokémon Sapphire', '2002-11-21', 3),
	('Pokémon FireRed', '2004-01-29', 3),
	('Pokémon LeafGreen', '2004-01-29', 3),
	('Pokémon Emerald', '2004-09-16', 3),
	-- Gen 4
	('Pokémon Diamond', '2006-09-28', 4),
	('Pokémon Pearl', '2006-09-28', 4),
	('Pokémon Platinum', '2008-09-13', 4),
	('Pokémon HeartGold', '2009-09-12', 4),
	('Pokémon SoulSilver', '2009-09-12', 4),
	-- Gen 5
	('Pokémon Black', '2010-09-18', 5),
	('Pokémon White', '2010-09-18', 5),
	('Pokémon Black 2', '2012-06-23', 5),
	('Pokémon White 2', '2012-06-23', 5),
	-- Gen 6
	('Pokémon X', '2013-10-12', 6),
	('Pokémon Y', '2013-10-12', 6),
	('Pokémon Omega Ruby', '2014-11-21', 6),
	('Pokémon Alpha Sapphire', '2014-11-21', 6),
	-- Gen 7
	('Pokémon Sun', '2016-11-18', 7),
	('Pokémon Moon', '2016-11-18', 7),
	('Pokémon Ultra Sun', '2017-11-17', 7),
	('Pokémon Ultra Moon', '2017-11-17', 7),
	('Pokémon Let''s Go Pikachu', '2018-11-16', 7),
	('Pokémon Let''s Go Eevee', '2018-11-16', 7),
	-- Gen 8
	('Pokémon Sword', '2019-11-15', 8),
	('Pokémon Shield', '2019-11-15', 8),
	('Pokémon Brilliant Diamond', '2021-11-19', 8),
	('Pokémon Shining Pearl', '2021-11-19', 8),
	('Pokémon Legends Arceus', '2022-01-28', 8),
	-- Gen 9
	('Pokémon Scarlet', '2022-11-18', 9),
	('Pokémon Violet', '2022-11-18', 9);
    
-- Primeira geração de pokemon
INSERT INTO pokemon (nome, tipagem_1, tipagem_2, foto_url, cor_principal, cor_secundaria, id_geracao) VALUES
	('Bulbasaur','Planta','Venenoso','https://img.pokemondb.net/artwork/avif/bulbasaur.avif','#78C850','#4E8234',1),
	('Ivysaur','Planta','Venenoso','https://img.pokemondb.net/artwork/avif/ivysaur.avif','#5FAF5A','#2E6B3A',1),
	('Venusaur','Planta','Venenoso','https://img.pokemondb.net/artwork/avif/venusaur.avif','#2E8B57','#1F4D36',1),
	('Charmander','Fogo',NULL,'https://img.pokemondb.net/artwork/avif/charmander.avif','#F08030','#C75B12',1),
	('Charmeleon','Fogo',NULL,'https://img.pokemondb.net/artwork/avif/charmeleon.avif','#D94A2B','#7A1F12',1),
	('Charizard','Fogo','Voador','https://img.pokemondb.net/artwork/avif/charizard.avif','#F08030','#2B2B2B',1),
	('Squirtle','Água',NULL,'https://img.pokemondb.net/artwork/avif/squirtle.avif','#6890F0','#2F5FA5',1),
	('Wartortle','Água',NULL,'https://img.pokemondb.net/artwork/avif/wartortle.avif','#4A7BD1','#1E3A70',1),
	('Blastoise','Água',NULL,'https://img.pokemondb.net/artwork/avif/blastoise.avif','#3A6FCF','#1C2F6B',1),
	('Caterpie','Inseto',NULL,'https://img.pokemondb.net/artwork/avif/caterpie.avif','#7AC74C','#2E6B1F',1),
	('Metapod','Inseto',NULL,'https://img.pokemondb.net/artwork/avif/metapod.avif','#6AA84F','#3D5F2A',1),
	('Butterfree','Inseto','Voador','https://img.pokemondb.net/artwork/avif/butterfree.avif','#C6B7E2','#6A5A8B',1),
	('Weedle','Inseto','Venenoso','https://img.pokemondb.net/artwork/avif/weedle.avif','#C2A23A','#5A3B00',1),
	('Kakuna','Inseto','Venenoso','https://img.pokemondb.net/artwork/avif/kakuna.avif','#B89A2F','#4F3A00',1),
	('Beedrill','Inseto','Venenoso','https://img.pokemondb.net/artwork/avif/beedrill.avif','#D4A017','#2B2B2B',1),
	('Pidgey','Normal','Voador','https://img.pokemondb.net/artwork/avif/pidgey.avif','#C6A26B','#6B4F2E',1),
	('Pidgeotto','Normal','Voador','https://img.pokemondb.net/artwork/avif/pidgeotto.avif','#B88A4A','#5A3A1F',1),
	('Pidgeot','Normal','Voador','https://img.pokemondb.net/artwork/avif/pidgeot.avif','#D89C4A','#5A2E1F',1),
	('Rattata','Normal',NULL,'https://img.pokemondb.net/artwork/avif/rattata.avif','#8A5A8A','#3B1F3B',1),
	('Raticate','Normal',NULL,'https://img.pokemondb.net/artwork/avif/raticate.avif','#A05A2C','#4A2A12',1),
	('Spearow','Normal','Voador','https://img.pokemondb.net/artwork/avif/spearow.avif','#8A4B2D','#3A1F12',1),
	('Fearow','Normal','Voador','https://img.pokemondb.net/artwork/avif/fearow.avif','#A86B3A','#4A2F1A',1),
	('Ekans','Venenoso',NULL,'https://img.pokemondb.net/artwork/avif/ekans.avif','#6A3D9A','#2E1A4F',1),
	('Arbok','Venenoso',NULL,'https://img.pokemondb.net/artwork/avif/arbok.avif','#7B3FA0','#2E1A4F',1),
	('Pikachu','Elétrico',NULL,'https://img.pokemondb.net/artwork/avif/pikachu.avif','#FFD700','#B8860B',1),
	('Raichu','Elétrico',NULL,'https://img.pokemondb.net/artwork/avif/raichu.avif','#E69500','#7A3E00',1),
	('Sandshrew','Terra',NULL,'https://img.pokemondb.net/artwork/avif/sandshrew.avif','#D2B48C','#8B7355',1),
	('Sandslash','Terra',NULL,'https://img.pokemondb.net/artwork/avif/sandslash.avif','#C2A06B','#6B4F2E',1),
	('Nidoran♀','Venenoso',NULL,'https://img.pokemondb.net/artwork/avif/nidoran-f.avif','#9B59B6','#4A235A',1),
	('Nidorina','Venenoso',NULL,'https://img.pokemondb.net/artwork/avif/nidorina.avif','#A569BD','#4A235A',1),
	('Nidoqueen','Venenoso','Terra','https://img.pokemondb.net/artwork/avif/nidoqueen.avif','#5DADE2','#1B4F72',1),
	('Nidoran♂','Venenoso',NULL,'https://img.pokemondb.net/artwork/avif/nidoran-m.avif','#5DADE2','#1B4F72',1),
	('Nidorino','Venenoso',NULL,'https://img.pokemondb.net/artwork/avif/nidorino.avif','#6C5CE7','#2C2C54',1),
	('Nidoking','Venenoso','Terra','https://img.pokemondb.net/artwork/avif/nidoking.avif','#6A5A8B','#2E2E33',1),
	('Clefairy','Fada',NULL,'https://img.pokemondb.net/artwork/avif/clefairy.avif','#F5B7B1','#C39BD3',1),
	('Clefable','Fada',NULL,'https://img.pokemondb.net/artwork/avif/clefable.avif','#F8C8DC','#D2B4DE',1),
	('Vulpix','Fogo',NULL,'https://img.pokemondb.net/artwork/avif/vulpix.avif','#E67E22','#6E2C00',1),
	('Ninetales','Fogo',NULL,'https://img.pokemondb.net/artwork/avif/ninetales.avif','#FDEBD0','#E67E22',1),
	('Jigglypuff','Normal','Fada','https://img.pokemondb.net/artwork/avif/jigglypuff.avif','#F8C8DC','#2E2E2E',1),
	('Wigglytuff','Normal','Fada','https://img.pokemondb.net/artwork/avif/wigglytuff.avif','#F5B7B1','#8E44AD',1),
	('Zubat','Venenoso','Voador','https://img.pokemondb.net/artwork/avif/zubat.avif','#2C3E50','#5DADE2',1),
	('Golbat','Venenoso','Voador','https://img.pokemondb.net/artwork/avif/golbat.avif','#5B2C6F','#85C1E9',1),
	('Oddish','Planta','Venenoso','https://img.pokemondb.net/artwork/avif/oddish.avif','#2ECC71','#1B4F72',1),
	('Gloom','Planta','Venenoso','https://img.pokemondb.net/artwork/avif/gloom.avif','#5B2C6F','#85C1E9',1),
	('Vileplume','Planta','Venenoso','https://img.pokemondb.net/artwork/avif/vileplume.avif','#C0392B','#F1C40F',1),
	('Paras','Inseto','Planta','https://img.pokemondb.net/artwork/avif/paras.avif','#E74C3C','#F1C40F',1),
	('Parasect','Inseto','Planta','https://img.pokemondb.net/artwork/avif/parasect.avif','#C0392B','#7D6608',1),
	('Venonat','Inseto','Venenoso','https://img.pokemondb.net/artwork/avif/venonat.avif','#8E44AD','#5DADE2',1),
	('Venomoth','Inseto','Venenoso','https://img.pokemondb.net/artwork/avif/venomoth.avif','#AF7AC5','#F8C8DC',1),
	('Diglett','Terra',NULL,'https://img.pokemondb.net/artwork/avif/diglett.avif','#A04000','#F5CBA7',1),
	('Dugtrio','Terra',NULL,'https://img.pokemondb.net/artwork/avif/dugtrio.avif','#8B4513','#F5CBA7',1),
	('Meowth','Normal',NULL,'https://img.pokemondb.net/artwork/avif/meowth.avif','#F8E5A3','#B7950B',1),
	('Persian','Normal',NULL,'https://img.pokemondb.net/artwork/avif/persian.avif','#F5CBA7','#7B241C',1),
	('Psyduck','Água',NULL,'https://img.pokemondb.net/artwork/avif/psyduck.avif','#F4D03F','#2E86C1',1),
	('Golduck','Água',NULL,'https://img.pokemondb.net/artwork/avif/golduck.avif','#2E86C1','#F4D03F',1),
	('Mankey','Lutador',NULL,'https://img.pokemondb.net/artwork/avif/mankey.avif','#D7CCC8','#4E342E',1),
	('Primeape','Lutador',NULL,'https://img.pokemondb.net/artwork/avif/primeape.avif','#F5F5F5','#3E2723',1),
	('Growlithe','Fogo',NULL,'https://img.pokemondb.net/artwork/avif/growlithe.avif','#E67E22','#FDEBD0',1),
	('Arcanine','Fogo',NULL,'https://img.pokemondb.net/artwork/avif/arcanine.avif','#D35400','#FDEBD0',1),
	('Poliwag','Água',NULL,'https://img.pokemondb.net/artwork/avif/poliwag.avif','#5DADE2','#2C3E50',1),
	('Poliwhirl','Água',NULL,'https://img.pokemondb.net/artwork/avif/poliwhirl.avif','#5DADE2','#2C3E50',1),
	('Poliwrath','Água','Lutador','https://img.pokemondb.net/artwork/avif/poliwrath.avif','#2E86C1','#F8F9F9',1),
	('Abra','Psíquico',NULL,'https://img.pokemondb.net/artwork/avif/abra.avif','#F4D03F','#6C3483',1),
	('Kadabra','Psíquico',NULL,'https://img.pokemondb.net/artwork/avif/kadabra.avif','#F1C40F','#5B2C6F',1),
	('Alakazam','Psíquico',NULL,'https://img.pokemondb.net/artwork/avif/alakazam.avif','#F39C12','#4A235A',1),
	('Machop','Lutador',NULL,'https://img.pokemondb.net/artwork/avif/machop.avif','#7FB3D5','#2C3E50',1),
	('Machoke','Lutador',NULL,'https://img.pokemondb.net/artwork/avif/machoke.avif','#5DADE2','#1B2631',1),
	('Machamp','Lutador',NULL,'https://img.pokemondb.net/artwork/avif/machamp.avif','#2E86C1','#17202A',1),
	('Bellsprout','Planta','Venenoso','https://img.pokemondb.net/artwork/avif/bellsprout.avif','#7DCEA0','#1E8449',1),
	('Weepinbell','Planta','Venenoso','https://img.pokemondb.net/artwork/avif/weepinbell.avif','#F4D03F','#1E8449',1),
	('Victreebel','Planta','Venenoso','https://img.pokemondb.net/artwork/avif/victreebel.avif','#D4AC0D','#145A32',1),
	('Tentacool','Água','Venenoso','https://img.pokemondb.net/artwork/avif/tentacool.avif','#85C1E9','#AF7AC5',1),
	('Tentacruel','Água','Venenoso','https://img.pokemondb.net/artwork/avif/tentacruel.avif','#5DADE2','#8E44AD',1),
	('Geodude','Pedra','Terra','https://img.pokemondb.net/artwork/avif/geodude.avif','#7B7D7D','#2E2E2E',1),
	('Graveler','Pedra','Terra','https://img.pokemondb.net/artwork/avif/graveler.avif','#626567','#1C1C1C',1),
	('Golem','Pedra','Terra','https://img.pokemondb.net/artwork/avif/golem.avif','#5D6D7E','#2C3E50',1),
	('Ponyta','Fogo',NULL,'https://img.pokemondb.net/artwork/avif/ponyta.avif','#F5CBA7','#E74C3C',1),
	('Rapidash','Fogo',NULL,'https://img.pokemondb.net/artwork/avif/rapidash.avif','#FDEBD0','#E74C3C',1),
	('Slowpoke','Água','Psíquico','https://img.pokemondb.net/artwork/avif/slowpoke.avif','#F5B7B1','#7D3C98',1),
	('Slowbro','Água','Psíquico','https://img.pokemondb.net/artwork/avif/slowbro.avif','#F1948A','#6C3483',1),
	('Magnemite','Elétrico','Aço','https://img.pokemondb.net/artwork/avif/magnemite.avif','#D5D8DC','#5D6D7E',1),
	('Magneton','Elétrico','Aço','https://img.pokemondb.net/artwork/avif/magneton.avif','#BDC3C7','#2C3E50',1),
	('Farfetch''d','Normal','Voador','https://img.pokemondb.net/artwork/avif/farfetchd.avif','#F0E68C','#2E8B57',1),
	('Doduo','Normal','Voador','https://img.pokemondb.net/artwork/avif/doduo.avif','#A04000','#F5CBA7',1),
	('Dodrio','Normal','Voador','https://img.pokemondb.net/artwork/avif/dodrio.avif','#8B4513','#F8C471',1),
	('Seel','Água',NULL,'https://img.pokemondb.net/artwork/avif/seel.avif','#ECF0F1','#5DADE2',1),
	('Dewgong','Água','Gelo','https://img.pokemondb.net/artwork/avif/dewgong.avif','#D6EAF8','#5DADE2',1),
	('Grimer','Venenoso',NULL,'https://img.pokemondb.net/artwork/avif/grimer.avif','#7D3C98','#2E2E2E',1),
	('Muk','Venenoso',NULL,'https://img.pokemondb.net/artwork/avif/muk.avif','#6C3483','#1C1C1C',1),
	('Shellder','Água',NULL,'https://img.pokemondb.net/artwork/avif/shellder.avif','#AF7AC5','#2E86C1',1),
	('Cloyster','Água','Gelo','https://img.pokemondb.net/artwork/avif/cloyster.avif','#8E44AD','#5DADE2',1),
	('Gastly','Fantasma','Venenoso','https://img.pokemondb.net/artwork/avif/gastly.avif','#2C2C54','#8E44AD',1),
	('Haunter','Fantasma','Venenoso','https://img.pokemondb.net/artwork/avif/haunter.avif','#4A235A','#AF7AC5',1),
	('Gengar','Fantasma','Venenoso','https://img.pokemondb.net/artwork/avif/gengar.avif','#5B2C6F','#2C2C54',1),
	('Onix','Pedra','Terra','https://img.pokemondb.net/artwork/avif/onix.avif','#566573','#1C2833',1),
	('Drowzee','Psíquico',NULL,'https://img.pokemondb.net/artwork/avif/drowzee.avif','#F4D03F','#6C3483',1),
	('Hypno','Psíquico',NULL,'https://img.pokemondb.net/artwork/avif/hypno.avif','#F1C40F','#4A235A',1),
	('Krabby','Água',NULL,'https://img.pokemondb.net/artwork/avif/krabby.avif','#E74C3C','#2E86C1',1),
	('Kingler','Água',NULL,'https://img.pokemondb.net/artwork/avif/kingler.avif','#C0392B','#5DADE2',1),
	('Voltorb','Elétrico',NULL,'https://img.pokemondb.net/artwork/avif/voltorb.avif','#E74C3C','#ECF0F1',1),
	('Electrode','Elétrico',NULL,'https://img.pokemondb.net/artwork/avif/electrode.avif','#ECF0F1','#E74C3C',1),
	('Exeggcute','Planta','Psíquico','https://img.pokemondb.net/artwork/avif/exeggcute.avif','#F5CBA7','#6C3483',1),
	('Exeggutor','Planta','Psíquico','https://img.pokemondb.net/artwork/avif/exeggutor.avif','#A9DFBF','#7B241C',1),
	('Cubone','Terra',NULL,'https://img.pokemondb.net/artwork/avif/cubone.avif','#F5CBA7','#5D4037',1),
	('Marowak','Terra',NULL,'https://img.pokemondb.net/artwork/avif/marowak.avif','#D7CCC8','#3E2723',1),
	('Hitmonlee','Lutador',NULL,'https://img.pokemondb.net/artwork/avif/hitmonlee.avif','#A04000','#2E2E2E',1),
	('Hitmonchan','Lutador',NULL,'https://img.pokemondb.net/artwork/avif/hitmonchan.avif','#8E44AD','#2E2E2E',1),
	('Lickitung','Normal',NULL,'https://img.pokemondb.net/artwork/avif/lickitung.avif','#F5B7B1','#8E44AD',1),
	('Koffing','Venenoso',NULL,'https://img.pokemondb.net/artwork/avif/koffing.avif','#AF7AC5','#2E2E2E',1),
	('Weezing','Venenoso',NULL,'https://img.pokemondb.net/artwork/avif/weezing.avif','#A569BD','#1C1C1C',1),
	('Rhyhorn','Terra','Pedra','https://img.pokemondb.net/artwork/avif/rhyhorn.avif','#7B7D7D','#2E2E2E',1),
	('Rhydon','Terra','Pedra','https://img.pokemondb.net/artwork/avif/rhydon.avif','#626567','#1C1C1C',1),
	('Chansey','Normal',NULL,'https://img.pokemondb.net/artwork/avif/chansey.avif','#FADBD8','#EC7063',1),
	('Tangela','Planta',NULL,'https://img.pokemondb.net/artwork/avif/tangela.avif','#2E86C1','#1B4F72',1),
	('Kangaskhan','Normal',NULL,'https://img.pokemondb.net/artwork/avif/kangaskhan.avif','#A1887F','#4E342E',1),
	('Horsea','Água',NULL,'https://img.pokemondb.net/artwork/avif/horsea.avif','#5DADE2','#1B4F72',1),
	('Seadra','Água',NULL,'https://img.pokemondb.net/artwork/avif/seadra.avif','#2E86C1','#154360',1),
	('Goldeen','Água',NULL,'https://img.pokemondb.net/artwork/avif/goldeen.avif','#F4D03F','#E74C3C',1),
	('Seaking','Água',NULL,'https://img.pokemondb.net/artwork/avif/seaking.avif','#F39C12','#C0392B',1),
	('Staryu','Água',NULL,'https://img.pokemondb.net/artwork/avif/staryu.avif','#F5B041','#8E44AD',1),
	('Starmie','Água','Psíquico','https://img.pokemondb.net/artwork/avif/starmie.avif','#9B59B6','#F1C40F',1),
	('Mr. Mime','Psíquico','Fada','https://img.pokemondb.net/artwork/avif/mr-mime.avif','#F5B7B1','#5DADE2',1),
	('Scyther','Inseto','Voador','https://img.pokemondb.net/artwork/avif/scyther.avif','#58D68D','#1E8449',1),
	('Jynx','Gelo','Psíquico','https://img.pokemondb.net/artwork/avif/jynx.avif','#8E44AD','#F5CBA7',1),
	('Electabuzz','Elétrico',NULL,'https://img.pokemondb.net/artwork/avif/electabuzz.avif','#F4D03F','#2E2E2E',1),
	('Magmar','Fogo',NULL,'https://img.pokemondb.net/artwork/avif/magmar.avif','#E74C3C','#F39C12',1),
	('Pinsir','Inseto',NULL,'https://img.pokemondb.net/artwork/avif/pinsir.avif','#8B4513','#2E2E2E',1),
	('Tauros','Normal',NULL,'https://img.pokemondb.net/artwork/avif/tauros.avif','#5D4037','#1C1C1C',1),
	('Magikarp','Água',NULL,'https://img.pokemondb.net/artwork/avif/magikarp.avif','#E74C3C','#F5CBA7',1),
	('Gyarados','Água','Voador','https://img.pokemondb.net/artwork/avif/gyarados.avif','#2E86C1','#154360',1),
	('Lapras','Água','Gelo','https://img.pokemondb.net/artwork/avif/lapras.avif','#5DADE2','#2C3E50',1),
	('Ditto','Normal',NULL,'https://img.pokemondb.net/artwork/avif/ditto.avif','#AF7AC5','#5B2C6F',1),
	('Eevee','Normal',NULL,'https://img.pokemondb.net/artwork/avif/eevee.avif','#A0522D','#3E2723',1),
	('Vaporeon','Água',NULL,'https://img.pokemondb.net/artwork/avif/vaporeon.avif','#3498DB','#1B4F72',1),
	('Jolteon','Elétrico',NULL,'https://img.pokemondb.net/artwork/avif/jolteon.avif','#F4D03F','#B7950B',1),
	('Flareon','Fogo',NULL,'https://img.pokemondb.net/artwork/avif/flareon.avif','#E67E22','#922B21',1),
	('Porygon','Normal',NULL,'https://img.pokemondb.net/artwork/avif/porygon.avif','#F5B7B1','#5DADE2',1),
	('Omanyte','Pedra','Água','https://img.pokemondb.net/artwork/avif/omanyte.avif','#5DADE2','#2E2E2E',1),
	('Omastar','Pedra','Água','https://img.pokemondb.net/artwork/avif/omastar.avif','#2E86C1','#1C1C1C',1),
	('Kabuto','Pedra','Água','https://img.pokemondb.net/artwork/avif/kabuto.avif','#A04000','#2E2E2E',1),
	('Kabutops','Pedra','Água','https://img.pokemondb.net/artwork/avif/kabutops.avif','#8B4513','#1C1C1C',1),
	('Aerodactyl','Pedra','Voador','https://img.pokemondb.net/artwork/avif/aerodactyl.avif','#7F8C8D','#2C3E50',1),
	('Snorlax','Normal',NULL,'https://img.pokemondb.net/artwork/avif/snorlax.avif','#2C3E50','#F5CBA7',1),
	('Articuno','Gelo','Voador','https://img.pokemondb.net/artwork/avif/articuno.avif','#AED6F1','#5DADE2',1),
	('Zapdos','Elétrico','Voador','https://img.pokemondb.net/artwork/avif/zapdos.avif','#F1C40F','#2E2E2E',1),
	('Moltres','Fogo','Voador','https://img.pokemondb.net/artwork/avif/moltres.avif','#E74C3C','#F39C12',1),
	('Dratini','Dragão',NULL,'https://img.pokemondb.net/artwork/avif/dratini.avif','#85C1E9','#2E86C1',1),
	('Dragonair','Dragão',NULL,'https://img.pokemondb.net/artwork/avif/dragonair.avif','#AED6F1','#5DADE2',1),
	('Dragonite','Dragão','Voador','https://img.pokemondb.net/artwork/avif/dragonite.avif','#F5B041','#8E44AD',1),
	('Mewtwo','Psíquico',NULL,'https://img.pokemondb.net/artwork/avif/mewtwo.avif','#D7BDE2','#6C3483',1),
	('Mew','Psíquico',NULL,'https://img.pokemondb.net/artwork/avif/mew.avif','#FADBD8','#F1948A',1);
    
INSERT INTO usuario (nome, email, senha, admin, id_pokemon_favorito, id_jogo_favorito, id_geracao_favorita) VALUES
	('Quagsire admin', 'admin@email.com', '@Senha242', 1, 195, 10, 1);

SELECT * FROM pokemon;
SELECT COUNT(*) FROM pokemon;

SELECT * FROM pokemon WHERE id_geracao = 1;
SELECT * FROM pokemon WHERE id_geracao = 2;
SELECT * FROM pokemon WHERE id_geracao = 3;
SELECT * FROM pokemon WHERE id_geracao = 4;
SELECT * FROM pokemon WHERE id_geracao = 5;
SELECT * FROM pokemon WHERE id_geracao = 6;
SELECT * FROM pokemon WHERE id_geracao = 7;
SELECT * FROM pokemon WHERE id_geracao = 8;
SELECT * FROM pokemon WHERE id_geracao = 9;

SELECT * FROM usuario;

use pokeverso;

SELECT 
u.nome nome_usuario,
u.email email_usuario,
p.nome pokemon_favorito,
j.nome jogo_favorito,
g.nome geracao_favorito
FROM usuario u
JOIN pokemon p
ON u.id_pokemon_favorito = p.id_pokemon
JOIN jogos j
ON u.id_jogo_favorito = j.id_jogo
JOIN geracoes g
ON u.id_geracao_favorita = g.id_geracao;
