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

-- mini-exercicio: mostre o nome e descrição somente dos produtos da apple
SELECT nome, descricao FROM produtos
WHERE fabricante_id = 3
```

### Operadores Lógicos: E, OU e NÃO

#### E (AND)

```sql
-- exibir nome e preco dos produtos que custam entre 2000 e 6000
SELECT nome, preco FROM produtos
WHERE preco >= 2000 AND  preco <= 6000;
```

#### OU (OR)

```sql
-- Min-exercicio exibir nome, descrição dos produtos da apple e samsung
SELECT nome, descricao FROM produtos
WHERE fabricante_id = 5 OR fabricante_id = 3;

-- versão usando a função sql IN()
SELECT nome, descricao FROM produtos
WHERE fabricante_id in(3, 5);
```

#### NÃO (NOT)

```sql
-- todos os produtos exceto da positivo
SELECT nome, descricao, preco FROM produtos
WHERE NOT fabricante_id = 7;

-- versão usandi iperador relacional de "diferença/diferente"
SELECT nome, descricao, preco FROM produtos
WHERE fabricante_id != 7;
```

---

## UPDATE (Fabricantes)

**SEMPRE USE** a clausura `WHERE` em seu comando `UPDATE` especificando uma ou mais condições para a atualização.

```sql
-- trocar o nome fabricante
UPDATE fabricantes SET nome = 'Asus do Brasil'
WHERE id = 1;

-- Alterar a quantidade para 10 dos produtos que custam abaixo de 2000 exceto da microsoft.
UPDATE produtos SET quantidade = 10
WHERE preco < 2000 AND fabricante_id != 8;

```

--- 

## DELETE (Fabricantes e produtos)

**SEMPRE USE** a clausura `WHERE` em seu comando `UPDATE` especificando uma ou mais condições para a atualização.

```sql
DELETE FROM fabricantes WHERE id = 4;

DELETE FROM produtos WHERE id = 4;

DELETE FROM fabricantes WHERE id = 3;
```

---

## SELECT

### Classificação/Ordenação

```sql
-- DESC: ordena em ordem decrescente
SELECT nome, preco FROM produtos ORDER BY nome;
SELECT nome, preco FROM produtos ORDER BY preco;
SELECT nome, preco FROM produtos ORDER BY preco DESC;

SELECT nome, preco, quantidade FROM produtos
WHERE fabricantes_id = 5 ORDER BY quantidade;
```

### Operações e funções de agregação

```sql
SELECT SUM(preco) FROM produtos;
SELECT SUM(preco) AS Total FROM produtos; -- alias/apelido para coluna
SELECT SUM(preco) AS "Total dos preços dos produtos" FROM produtos;  
SELECT nome AS Produto, preco AS Preço FROM produtos;

-- Funções de formatação
SELECT FORMAT(SUM(preco), 2) AS Total FROM produtos;  
SELECT REPLACE(FORMAT(SUM(preco), 2), ",", ".") AS Total FROM produtos;  

-- Função de média: AVG(Average)
-- Função de arredondamento: ROUND
SELECT AVG(preco) AS "Média dos preços" FROM produtos
SELECT ROUND(AVG(preco), 2) AS "Média dos preços" FROM produtos

-- Função de contagem: COUNT
SELECT COUNT(id) AS "Qtd de Produtos" FROM produtos;
SELECT COUNT(DISTINCT fabricante_id) AS "Qtd de Fabricantes com Produtos" FROM produtos;

SELECT nome, preco, quantidade, (preco * quantidade) AS total FROM produtos;

-- segmentação/agrupamento de resultados
SELECT fabricante_id, SUM(preco) AS Total FROM produtos
GROUP BY fabricante_id;
```

## Consultas (Queries) em duas ou mais tabelas relacionadas (JUNÇÃO/JOIN)
### Exibir o nome do produto e o nome do fabricante

```sql
-- SELECT nomeDaTabela1.nomeDaColuna, nomeDaTabela2.nomeDaColuna
SELECT produtos.nome AS Produto, fabricantes.nome AS Fabricante

-- JOIN permite juntar as tabelas no momento do SELECT
FROM produtos JOIN fabricantes

-- ON indicando os criterios do relacionamento
--ON tabela1.chave_estrangeira = tabela2.chave_primaria 
ON produtos.fabricante_id = fabricantes.id
```

### Nome do produto, preço do produto, nome do fabricante ordenados pelo nnome do produto e pelo preço

```sql
SELECT 
    produtos.nome AS Produto, 
    produtos.preco AS Preço, 
    fabricantes.nome AS Fabricante
FROM produtos JOIN fabricantes
ON produtos.fabricante_id = fabricantes.id
ORDER BY Produto ASC, Preço DESC;
```

### Fabricantes, soma dos produtos, quantidade de produytos POR fabricante

```sql
SELECT
    fabricantes.nome AS Fabricante,
    SUM(produtos.preco) AS Total,
    COUNT(produtos.fabricante_id) AS "Qtd de Produtos"
FROM produtos RIGHT JOIN fabricantes
ON produtos.fabricante_id = fabricantes.id
GROUP BY Fabricante
ORDER BY Total;
```