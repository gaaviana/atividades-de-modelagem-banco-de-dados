## Praticando 

```sql
-- mostrar filme e o genero do filme
SELECT 
	filmes.titulo AS Filme,
    generos.nome_genero AS Genero
FROM filmes JOIN generos
ON filmes.genero_id = generos.id_genero
ORDER BY Filme ASC;
```

```sql
-- mostrar o flme e o detalhe do filme
SELECT
    filmes.titulo AS Filme,
    detalhes.sinopse AS Detalhes
FROM filmes JOIN detalhes
ON detalhes.filme_id = filmes.id_filmes
ORDER BY Filme ASC;
```

```sql
-- mostrar filme, genero e sinopse
SELECT
    filmes.titulo AS Filme,
    generos.nome_genero AS Genero,
    detalhes.sinopse AS Detalhes
FROM filmes 
JOIN generos ON filmes.genero_id = generos.id_genero 
JOIN detalhes ON filmes.id_filmes = detalhes.filme_id
ORDER BY Filme ASC;
```