-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27/02/2025 às 12:38
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `catalogo_filmes`
--
CREATE DATABASE IF NOT EXISTS `catalogo_filmes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `catalogo_filmes`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `detalhes`
--

CREATE TABLE `detalhes` (
  `id_detalhes` int(11) NOT NULL,
  `duracao_minutos` int(11) NOT NULL,
  `sinopse` text NOT NULL,
  `bilheteria` decimal(14,2) DEFAULT NULL,
  `orcamento` decimal(14,2) DEFAULT NULL,
  `filme_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `detalhes`
--

INSERT INTO `detalhes` (`id_detalhes`, `duracao_minutos`, `sinopse`, `bilheteria`, `orcamento`, `filme_id`) VALUES
(1, 120, 'Em um futuro pós-apocalíptico, Max (Tom Hardy), um homem traumatizado, une forças com Furiosa (Charlize Theron), uma mulher rebelde, para escapar de um tirano chamado Immortan Joe, que controla o abastecimento de água e vive em um domínio selvagem. Juntos, eles tentam escapar pela vasta estrada, enfrentando diversos perigos.', 100000000.00, 150000000.00, 1),
(2, 189, 'Paul Edgecomb (Tom Hanks) é um oficial da prisão que, durante a sua jornada como supervisor de um bloco de prisão, conhece John Coffey (Michael Clarke Duncan), um homem acusado de assassinar duas meninas. Coffey, embora pareça enorme e intimidador, tem poderes de cura sobrenaturais, o que faz Paul questionar sua culpa e a verdadeira natureza de sua prisão.', 286801374.00, 60000000.00, 2),
(3, 97, 'Bridget Jones (Renée Zellweger) é uma mulher solteira e independente, mas que constantemente se sente insegura com sua vida amorosa e aparência. Ela começa a escrever um diário sobre suas tentativas de melhorar sua vida, que inclui tentar encontrar o homem ideal, enquanto lida com dois homens diferentes, Daniel (Hugh Grant) e Mark (Colin Firth).', 281000000.00, 0.00, 3),
(4, 169, 'Em um futuro em que a Terra está morrendo devido a uma série de desastres ambientais, Cooper (Matthew McConaughey), um ex-piloto da NASA, se junta a uma equipe de cientistas em uma missão para encontrar um novo lar para a humanidade. Usando um buraco de minhoca, eles viajam por diferentes planetas em busca de um novo planeta habitável, enfrentando desafios no espaço e na física do tempo e gravidade.', 677471239.00, 165000000.00, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `filmes`
--

CREATE TABLE `filmes` (
  `id_filmes` int(11) NOT NULL,
  `titulo` varchar(90) NOT NULL,
  `data_lancamento` date NOT NULL,
  `genero_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `filmes`
--

INSERT INTO `filmes` (`id_filmes`, `titulo`, `data_lancamento`, `genero_id`) VALUES
(1, 'Mad Max: Estrada da Fúria', '2015-05-15', 1),
(2, 'O Diário de Bridget Jones', '2001-04-13', 3),
(3, 'Interestelar', '2014-11-07', 4),
(4, 'A Espera de um Milagre', '1999-12-10', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `generos`
--

CREATE TABLE `generos` (
  `id_genero` int(11) NOT NULL,
  `nome_genero` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `generos`
--

INSERT INTO `generos` (`id_genero`, `nome_genero`) VALUES
(1, 'Ação'),
(2, 'Drama'),
(3, 'Comédia romântica'),
(4, 'Ficção científica'),
(5, 'Terror');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `detalhes`
--
ALTER TABLE `detalhes`
  ADD PRIMARY KEY (`id_detalhes`),
  ADD KEY `fk_detalhes_filme` (`filme_id`);

--
-- Índices de tabela `filmes`
--
ALTER TABLE `filmes`
  ADD PRIMARY KEY (`id_filmes`),
  ADD KEY `fk_filmes_generos` (`genero_id`);

--
-- Índices de tabela `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id_genero`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `detalhes`
--
ALTER TABLE `detalhes`
  MODIFY `id_detalhes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `filmes`
--
ALTER TABLE `filmes`
  MODIFY `id_filmes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `generos`
--
ALTER TABLE `generos`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `detalhes`
--
ALTER TABLE `detalhes`
  ADD CONSTRAINT `fk_detalhes_filme` FOREIGN KEY (`filme_id`) REFERENCES `filmes` (`id_filmes`);

--
-- Restrições para tabelas `filmes`
--
ALTER TABLE `filmes`
  ADD CONSTRAINT `fk_filmes_generos` FOREIGN KEY (`genero_id`) REFERENCES `generos` (`id_genero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
