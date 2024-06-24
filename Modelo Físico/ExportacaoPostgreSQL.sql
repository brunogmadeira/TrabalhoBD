CREATE TABLE "PRODUTOS" (
  "id_produto" SERIAL PRIMARY KEY,
  "id_ficha" INT,
  "nome_produto" VARCHAR(100),
  "descricao" TEXT,
  "data_de_criacao" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE "FICHA_TECNICA" (
  "id_ficha" SERIAL PRIMARY KEY,
  "id_massa" INT,
  "id_recheio" INT,
  "id_decoracao" INT,
  "nome" VARCHAR(100),
  "descricao" TEXT,
  "tempo_preparo" INTERVAL,
  "servicos_utilizados" VARCHAR(50),
  "custo_total" DECIMAL(10,2)
);

CREATE TABLE "MASSAS" (
  "id_massa" SERIAL PRIMARY KEY,
  "descricao" VARCHAR(50),
  "ingredientes" TEXT,
  "valor_massa" DECIMAL(10,2)
);

CREATE TABLE "RECHEIOS" (
  "id_recheio" SERIAL PRIMARY KEY,
  "descricao" VARCHAR(50),
  "ingredientes" TEXT,
  "valor_recheio" DECIMAL(10,2)
);

CREATE TABLE "DECORACOES" (
  "id_decoracao" SERIAL PRIMARY KEY,
  "descricao" VARCHAR(50),
  "ingredientes" TEXT,
  "valor_decoracao" DECIMAL(10,2)
);

CREATE TABLE "OP" (
  "id_op" SERIAL PRIMARY KEY,
  "id_produto" INT,
  "status" VARCHAR(50),
  "quantidade_a_produzir" INT,
  "data_inicio" TIMESTAMP,
  "data_conclusao" TIMESTAMP,
  "valor_final" DECIMAL(10,2),
  "data_de_criacao" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "data_de_atualizacao" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE "SERVICO" (
  "id_servico" SERIAL PRIMARY KEY,
  "funcao" VARCHAR(100),
  "custo_servico_hora" DECIMAL(10,2),
  "data_de_criacao" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "data_de_atualizacao" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

ALTER TABLE "PRODUTOS" ADD FOREIGN KEY ("id_ficha") REFERENCES "FICHA_TECNICA" ("id_ficha");

ALTER TABLE "FICHA_TECNICA" ADD FOREIGN KEY ("id_massa") REFERENCES "MASSAS" ("id_massa");

ALTER TABLE "FICHA_TECNICA" ADD FOREIGN KEY ("id_recheio") REFERENCES "RECHEIOS" ("id_recheio");

ALTER TABLE "FICHA_TECNICA" ADD FOREIGN KEY ("id_decoracao") REFERENCES "DECORACOES" ("id_decoracao");

ALTER TABLE "OP" ADD FOREIGN KEY ("id_produto") REFERENCES "PRODUTOS" ("id_produto");

ALTER TABLE "CUSTOS" ADD FOREIGN KEY ("id_op") REFERENCES "OP" ("id_op");
