# Trabalho BDD - Somativa 2

## Instruções

As query correspondentes ao items estão no arquivo `query.sql`

### Para verificar se o usuario `Somellier` tem os acessos como foi descrito no item solicitado, siga os passos a seguir:


> Suba o container do mysql que está no `docker-compose.yml` dentro da pasta raiz, para isso execute o comando:
- `docker-compose up -d`

> Acesse o container MySql através do comando:

- `docker exec -it somativa_bdd bash`

> Dentro do container, digite o código a seguir para se conectar ao MySQL pelo usuario Somellier a senha utilizada na query é `sommelier123`:

- `mysql -u Sommelier -p`

> Após se conectar ao MySQL por esse usuario, execute os seguintes comandos para verificar os níveis de acesso do usuario:

- `SELECT * FROM SOMATIVA_2_BDD.vinho`;

- `SELECT cod_vinicola, nome_vinicola FROM SOMATIVA_2_BDD.vinicola;`
