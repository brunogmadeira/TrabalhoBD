CREATE TABLE "massas" (
  "id_massa" SERIAL PRIMARY KEY,
  "descricao" VARCHAR(50) NOT NULL,
  "ingredientes" TEXT NOT NULL,
  "valor_massa" DECIMAL(10,2) NOT NULL
);

CREATE TABLE "recheios" (
  "id_recheio" SERIAL PRIMARY KEY,
  "descricao" VARCHAR(50) NOT NULL,
  "ingredientes" TEXT NOT NULL,
  "valor_recheio" DECIMAL(10,2) NOT NULL
);

CREATE TABLE "decoracoes" (
  "id_decoracao" SERIAL PRIMARY KEY,
  "descricao" VARCHAR(50) NOT NULL,
  "ingredientes" TEXT NOT NULL,
  "valor_decoracao" DECIMAL(10,2) NOT NULL
);

CREATE TABLE "FICHA_TECNICA" (
  "id_ficha" SERIAL PRIMARY KEY,
  "id_massa" INT NOT NULL,
  "id_recheio" INT NOT NULL,
  "id_decoracao" INT NOT NULL,
  "nome" VARCHAR(100) NOT NULL,
  "descricao" TEXT,
  "tempo_preparo" INTERVAL NOT NULL,
  "servicos_utilizados" VARCHAR(50) NOT NULL,
  "custo_total" DECIMAL(10,2) NOT NULL
);

CREATE TABLE "PRODUTOS" (
  "id_produto" SERIAL PRIMARY KEY,
  "id_ficha" INT NOT NULL,
  "nome_produto" VARCHAR(100) NOT NULL,
  "descricao" TEXT NOT NULL,
  "data_de_criacao" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE "OP" (
  "id_op" SERIAL PRIMARY KEY,
  "id_produto" INT NOT NULL,
  "status" VARCHAR(50) NOT NULL,
  "quantidade_a_produzir" INT NOT NULL,
  "data_inicio" TIMESTAMP NOT NULL,
  "data_conclusao" TIMESTAMP,
  "valor_final" DECIMAL(10,2) NOT NULL,
  "data_de_criacao" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "data_de_atualizacao" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE "SERVICO" (
  "id_servico" SERIAL PRIMARY KEY,
  "funcao" VARCHAR(100) NOT NULL,
  "custo_servico_hora" DECIMAL(10,2) NOT NULL,
  "data_de_criacao" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "data_de_atualizacao" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

ALTER TABLE "FICHA_TECNICA" ADD FOREIGN KEY ("id_massa") REFERENCES "massas" ("id_massa");

ALTER TABLE "FICHA_TECNICA" ADD FOREIGN KEY ("id_recheio") REFERENCES "recheios" ("id_recheio");

ALTER TABLE "FICHA_TECNICA" ADD FOREIGN KEY ("id_decoracao") REFERENCES "decoracoes" ("id_decoracao");

ALTER TABLE "PRODUTOS" ADD FOREIGN KEY ("id_ficha") REFERENCES "FICHA_TECNICA" ("id_ficha");

ALTER TABLE "OP" ADD FOREIGN KEY ("id_produto") REFERENCES "PRODUTOS" ("id_produto");
