CREATE DATABASE SOMATIVA_2_BDD;

USE SOMATIVA_2_BDD;

CREATE TABLE regiao (
    cod_regiao BIGINT PRIMARY KEY,
    nome_regiao VARCHAR(100),
    descricao_regiao TEXT
);


CREATE TABLE vinicola (
    cod_vinicola BIGINT PRIMARY KEY,
    nome_vinicola VARCHAR(100),
    descricao_vinicola TEXT,
    fone_vinicola VARCHAR(15),
    cod_regiao BIGINT,
    FOREIGN KEY (cod_regiao) REFERENCES regiao (cod_regiao)
);


CREATE TABLE vinho (
    cod_vinho BIGINT PRIMARY KEY,
    nome_vinho VARCHAR(100),
    tipo_vinho VARCHAR(30),
    ano_vinho INT,
    descricao_vinho TEXT,
    cod_vinicola BIGINT,
    FOREIGN KEY (cod_vinicola) REFERENCES vinicola (cod_vinicola)
);



INSERT INTO regiao (cod_regiao, nome_regiao, descricao_regiao)
VALUES
    (1, 'Vale do Douro', 'Região vinícola do norte de Portugal'),
    (2, 'Napa Valley', 'Famosa região vinícola da Califórnia, EUA'),
    (3, 'Toscana', 'Região vinícola da Itália'),
    (4, 'Mendoza', 'Principal região vinícola da Argentina'),
    (5, 'Bordeaux', 'Famosa região vinícola da França');


INSERT INTO vinicola (cod_vinicola, nome_vinicola, descricao_vinicola, fone_vinicola, cod_regiao)
VALUES
    (1, 'Quinta do Noval', 'Vinícola histórica no Vale do Douro', '123-456-7890', 1),
    (2, 'Robert Mondavi Winery', 'Vinícola icônica em Napa Valley', '987-654-3210', 2),
    (3, 'Castello Banfi', 'Vinícola de destaque na Toscana', '111-222-3333', 3),
    (4, 'Bodega Catena Zapata', 'Produtor de vinhos argentinos de alta qualidade', '555-666-7777', 4),
    (5, 'Château Margaux', 'Vinícola renomada em Bordeaux', '999-888-7777', 5);


INSERT INTO vinho (cod_vinho, nome_vinho, tipo_vinho, ano_vinho, descricao_vinho, cod_vinicola)
VALUES
    (1, 'Quinta do Noval Vintage Port', 'Vinho do Porto', 2015, 'Um Vintage Port excepcional da Quinta do Noval.', 1),
    (2, 'Robert Mondavi Cabernet Sauvignon', 'Tinto', 2018, 'Um Cabernet Sauvignon encorpado de Napa Valley.', 2),
    (3, 'Brunello di Montalcino', 'Tinto', 2016, 'Um elegante vinho tinto da Toscana.', 3),
    (4, 'Catena Malbec', 'Tinto', 2017, 'Um Malbec argentino rico e aromático.', 4),
    (5, 'Château Margaux', 'Tinto', 2014, 'Um Grand Cru Classe de Bordeaux.', 5);



SELECT
    v.nome_vinho AS Nome_Vinho,
    v.ano_vinho AS Ano_Vinho,
    vi.nome_vinicola AS Nome_Vinicola,
    r.nome_regiao AS Nome_Regiao
FROM vinho v
INNER JOIN vinicola vi ON v.cod_vinicola = vi.cod_vinicola
INNER JOIN regiao r ON vi.cod_regiao = r.cod_regiao;


CREATE USER 'Sommelier'@'localhost' IDENTIFIED BY 'sommelier123';

GRANT SELECT ON SOMATIVA_2_BDD.vinho TO 'Sommelier'@'localhost';

GRANT SELECT (cod_vinicola, nome_vinicola) ON SOMATIVA_2_BDD.vinicola TO 'Sommelier'@'localhost';



