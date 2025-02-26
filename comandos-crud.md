# Comandos para operações CRUD no Banco de Dados

## Resumo

- C -> **C**reate -> **INSERT**: inserir dados/registros na tabela
- R -> **R**ead -> **SELECT**: consultar/ler dados/registros na tabela
- U -> **U**pdate -> **UPDATE** atualizar dados/registros na tabela
- D -> **D**elete -> **DELETE** excluir dados/registros na tabela

## INSERT (Fabricantes)

```sql
INSERT INTO fabricantes (nome) VALUES('Asus');
INSERT INTO fabricantes (nome) VALUES('Dell');
INSERT INTO fabricantes (nome) VALUES('Apple');

INSERT INTO fabricantes (nome) VALUES('LG'), ('Samsung'), ('Brastemp');
```

## SELECT (Fabricantes)

```sql
SELECT * FROM fabricantes;
```

---

## INSERT (Produtos)

```sql
INSERT INTO produtos(nome, descricao, preco, quantidade, fabricante_id)
VALUES(
    'Ultrabook', 
    'Equipamento de última geração cheio de recusos, e etc e tal...',
    3999.45,
    7,
    2 --id fabricante Dell
);

INSERT INTO produtos(nome, descricao, preco, quantidade, fabricante_id)
VALUES(
    'Tablet',
    'Tablet com a versão 16 do sistema operacional Android, tela 10 polegadas e armazenamento de 128GB',
    900,
    12,
    5 -- samsung
);

INSERT INTO produtos(nome, descricao, preco, quantidade, fabricante_id)
VALUES(
    'Geladeira',
    'Refrigerador frodt-free com aceeso á internet',
    5000,
    12,
    6 -- brastemp
),
(
    'iPhone 18',
    'Smartphone aplle chei das frescuras e caro para caramba',
    9666.66,
    3,
    3 --apple
),
(
    'iPad Mini',
    'Tablet Apple com tela retina display e bla bla bla',
    4999.12,
    5,
    3 --apple
);
```

## Exercicio 03

```sql
INSERT INTO fabricantes (nome) VALUES('Positivo'), ('Microsoft');

INSERT INTO produtos(nome, descricao, preco, quantidade, fabricante_id)
VALUES(
    'Xbox Series S',
    'Velocidade e desempenho de última geração.',
    1997,
    5,
    8   -- Microsoft
),
(
    'Notebook Motion',
    'Intel Dual Core 4GB de RAM, 128GB SSD e Tela 14,1 polegadas.',
    1213.65,
    8,
    7   -- Positivo
);
```

---

## SELECT (Produtos)


```sql
-- lendo todas as colunas de todos os registros
SELECT * FROM produtos;

-- lendo somente nome e preco de todos os registros
SELECT nome, preco FROM produtos;

SELECT preco, nome FROM produtos;

-- mostrar nome, preco e quanridade somente dos produtos que custam abaixo de 5000
SELECT nome, preco, quantidade FROM produtos
WHERE preco < 5000;
```