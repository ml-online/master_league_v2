-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 13-Nov-2016 às 16:58
-- Versão do servidor: 5.7.11
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_masterleague`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `assistencia`
--

CREATE TABLE `assistencia` (
  `JogadorID` int(11) NOT NULL,
  `PartidaID` int(11) NOT NULL,
  `ReportID` int(11) NOT NULL,
  `Qtd` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `campeonato`
--

CREATE TABLE `campeonato` (
  `CampeonatoID` int(11) NOT NULL,
  `NomeCampeonato` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `campeonato`
--

INSERT INTO `campeonato` (`CampeonatoID`, `NomeCampeonato`) VALUES
(1, 'Master Liga Jogadores');

-- --------------------------------------------------------

--
-- Estrutura da tabela `classificacao`
--

CREATE TABLE `classificacao` (
  `Grupo` int(11) NOT NULL,
  `EquipeID` int(11) NOT NULL,
  `PontosGanhos` int(11) NOT NULL DEFAULT '0',
  `Jogos` int(11) NOT NULL DEFAULT '0',
  `Vitorias` int(11) NOT NULL DEFAULT '0',
  `Empates` int(11) NOT NULL DEFAULT '0',
  `Derrotas` int(11) NOT NULL DEFAULT '0',
  `GolsMarcados` int(11) NOT NULL DEFAULT '0',
  `GolsSofridos` int(11) NOT NULL DEFAULT '0',
  `SaldoGols` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `classificacao`
--

INSERT INTO `classificacao` (`Grupo`, `EquipeID`, `PontosGanhos`, `Jogos`, `Vitorias`, `Empates`, `Derrotas`, `GolsMarcados`, `GolsSofridos`, `SaldoGols`) VALUES
(1, 6, 4, 2, 1, 1, 0, 6, 2, 4),
(1, 7, 3, 3, 1, 0, 2, 4, 9, -5),
(1, 8, 4, 2, 2, 0, 0, 4, 2, 2),
(1, 9, 0, 1, 0, 0, 1, 1, 2, -1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipe`
--

CREATE TABLE `equipe` (
  `EquipeID` int(11) NOT NULL,
  `NomeEquipe` varchar(250) NOT NULL,
  `Escudo` varchar(500) DEFAULT NULL,
  `UsuarioID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `equipe`
--

INSERT INTO `equipe` (`EquipeID`, `NomeEquipe`, `Escudo`, `UsuarioID`) VALUES
(1, 'Athletic Novaes', NULL, 1),
(2, 'Real Tijucanos', NULL, 2),
(3, 'Real United FC', NULL, 3),
(4, 'Clube do Remo', NULL, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `gol`
--

CREATE TABLE `gol` (
  `JogadorID` int(11) NOT NULL,
  `PartidaID` int(11) NOT NULL,
  `ReportID` int(11) NOT NULL,
  `Qtd` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo`
--

CREATE TABLE `grupo` (
  `Grupo` int(11) NOT NULL,
  `NomeGrupo` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogador`
--

CREATE TABLE `jogador` (
  `JogadorID` int(11) NOT NULL,
  `NomeJogador` varchar(250) NOT NULL,
  `Posicao` varchar(5) NOT NULL,
  `EquipeOriginal` varchar(250) DEFAULT NULL,
  `Preco` decimal(12,2) DEFAULT NULL,
  `Overall` int(11) NOT NULL,
  `EquipeID` int(11) DEFAULT NULL,
  `Imagem` varchar(500) DEFAULT NULL,
  `Escala` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `jogador`
--

INSERT INTO `jogador` (`JogadorID`, `NomeJogador`, `Posicao`, `EquipeOriginal`, `Preco`, `Overall`, `EquipeID`, `Imagem`, `Escala`) VALUES
(1, 'Matheus braga', 'GK', NULL, '1000.00', 76, 100, NULL, 0),
(2, 'Diego', 'GK', NULL, '1000.00', 67, 100, NULL, 0),
(3, 'Mario Fernandes', 'LD', NULL, '1000.00', 80, 100, NULL, 0),
(4, 'Deleu', 'LD', NULL, '1000.00', 65, 100, NULL, 0),
(5, 'Maxwell', 'LE', NULL, '1000.00', 79, 100, NULL, 0),
(6, 'Rhodolfo', 'ZAG', NULL, '1000.00', 80, 100, NULL, 0),
(7, 'Rodrigo Moledo', 'ZAG', NULL, '1000.00', 78, 100, NULL, 0),
(8, 'Diego Angelo', 'ZAG', NULL, '1000.00', 73, 100, NULL, 0),
(9, 'Sandro', 'VOL', NULL, '1000.00', 78, 100, NULL, 0),
(10, 'Anderson Talisca', 'MC', NULL, '1000.00', 76, 100, NULL, 0),
(11, 'Sanches', 'MC', NULL, '1000.00', 78, 100, NULL, 0),
(12, 'Allanzinho', 'MEI', NULL, '1000.00', 72, 100, NULL, 0),
(13, 'D\'alessandro', 'MEI', NULL, '1000.00', 79, 100, NULL, 0),
(14, 'Edmilson Junior', 'MEI', NULL, '1000.00', 72, 100, NULL, 0),
(15, 'Ilsinho', 'MD', NULL, '1000.00', 72, 100, NULL, 0),
(16, 'Dembele', 'MD', NULL, '1000.00', 77, 100, NULL, 0),
(17, 'Ibarbo', 'ATA', NULL, '1000.00', 75, 100, NULL, 0),
(18, 'Rashford', 'ATA', NULL, '1000.00', 76, 100, NULL, 0),
(19, 'Adriano', 'ATA', NULL, '1000.00', 77, 100, NULL, 0),
(20, 'Szczesny', 'GK', NULL, '1000.00', 79, 200, NULL, 0),
(21, 'Marquinhos', 'ZAG', NULL, '1000.00', 82, 200, NULL, 0),
(22, 'Rudiger', 'ZAG', NULL, '1000.00', 77, 200, NULL, 0),
(23, 'Ely', 'ZAG', NULL, '1000.00', 71, 200, NULL, 0),
(24, 'Michel Macedo', 'LD', NULL, '1000.00', 75, 200, NULL, 0),
(25, 'Bruno Peres', 'LD', NULL, '1000.00', 81, 200, NULL, 0),
(26, 'Wendell', 'LE', NULL, '1000.00', 78, 200, NULL, 0),
(27, 'Jefferson', 'LE', NULL, '1000.00', 81, 200, NULL, 0),
(28, 'Mauricio', 'VOL', NULL, '1000.00', 78, 200, NULL, 0),
(29, 'Casemiro', 'VOL', NULL, '1000.00', 82, 200, NULL, 0),
(30, 'Fabinho', 'VOL', NULL, '1000.00', 79, 200, NULL, 0),
(31, 'Ganso', 'MEI', NULL, '1000.00', 81, 200, NULL, 0),
(32, 'Philippe Coutinho', 'MEI', NULL, '1000.00', 85, 200, NULL, 0),
(33, 'Lucas', 'ATA', NULL, '1000.00', 82, 200, NULL, 0),
(34, 'Ademilson', 'ATA', NULL, '1000.00', 74, 200, NULL, 0),
(35, 'Douglas Coutinho', 'ATA', NULL, '1000.00', 71, 200, NULL, 0),
(36, 'Maikon Leite', 'ATA', NULL, '1000.00', 71, 200, NULL, 0),
(37, 'Felipe Anderson', 'ATA', NULL, '1000.00', 79, 200, NULL, 0),
(38, 'Joaozinho', 'ATA', NULL, '1000.00', 79, 200, NULL, 0),
(39, 'Ederson', 'GK', NULL, '1000.00', 78, 300, NULL, 0),
(40, 'Nicolas', 'GK', NULL, '1000.00', 63, 300, NULL, 0),
(41, 'Samir', 'ZAG', NULL, '1000.00', 73, 300, NULL, 0),
(42, 'Gerson', 'ZAG', NULL, '1000.00', 69, 300, NULL, 0),
(43, 'Sidnei', 'ZAG', NULL, '1000.00', 80, 300, NULL, 0),
(44, 'Wellington', 'ZAG', NULL, '1000.00', 79, 300, NULL, 0),
(45, 'Leandro', 'LE', NULL, '1000.00', 67, 300, NULL, 0),
(46, 'Fábio', 'LE', NULL, '1000.00', 74, 300, NULL, 0),
(47, 'Nilton', 'VOL', NULL, '1000.00', 71, 300, NULL, 0),
(48, 'M. Silva', 'VOL', NULL, '1000.00', 60, 300, NULL, 0),
(49, 'Malcon', 'MC', NULL, '1000.00', 74, 300, NULL, 0),
(50, 'Muriqui', 'MC', NULL, '1000.00', 74, 300, NULL, 0),
(51, 'Alefe', 'MD', NULL, '1000.00', 54, 300, NULL, 0),
(52, 'Natanael', 'MEI', NULL, '1000.00', 72, 300, NULL, 0),
(53, 'B. Mota', 'MEI', NULL, '1000.00', 67, 300, NULL, 0),
(54, 'Jonas', 'ATA', NULL, '1000.00', 84, 300, NULL, 0),
(55, 'Baptistão', 'ATA', NULL, '1000.00', 79, 300, NULL, 0),
(56, 'G. Santos', 'ATA', NULL, '1000.00', 54, 300, NULL, 0),
(57, 'Heberty', 'ATA', NULL, '1000.00', 66, 300, NULL, 0),
(58, 'Tim Krull', 'GK', NULL, '1000.00', 79, 400, NULL, 0),
(59, 'Santiago Arias', 'LD', NULL, '1000.00', 77, 400, NULL, 0),
(60, 'Maxime Le Marchand', 'ZAG', NULL, '1000.00', 77, 400, NULL, 0),
(61, 'Facundo Roncaglia', 'ZAG', NULL, '1000.00', 77, 400, NULL, 0),
(62, 'Bernat', 'LE', NULL, '1000.00', 79, 400, NULL, 0),
(63, 'Gianelli Imbula', 'VOL', NULL, '1000.00', 79, 400, NULL, 0),
(64, 'Jonjo Shelvey', 'VOL', NULL, '1000.00', 77, 400, NULL, 0),
(65, 'Jakub Blaszczykowski', 'MD', NULL, '1000.00', 79, 400, NULL, 0),
(66, 'Marko Marin', 'MEI', NULL, '1000.00', 76, 400, NULL, 0),
(67, 'Ashley Young', 'ME', NULL, '1000.00', 79, 400, NULL, 0),
(68, 'Charlie Austin', 'ATA', NULL, '1000.00', 78, 400, NULL, 0),
(69, 'Leroy Fer', 'MC', NULL, '1000.00', 76, 400, NULL, 0),
(70, 'Okazaki', 'ATA', NULL, '1000.00', 77, 400, NULL, 0),
(71, 'Okore', 'ZAG', NULL, '1000.00', 77, 400, NULL, 0),
(72, 'Luciano Abecasis', 'LD', NULL, '1000.00', 73, 400, NULL, 0),
(73, 'Junior Stanislas', 'MD', NULL, '1000.00', 73, 400, NULL, 0),
(74, 'Wouter Van Der Steen', 'GK', NULL, '1000.00', 67, 400, NULL, 0),
(75, 'Liberto Beltran', 'ME', NULL, '1000.00', 67, 400, NULL, 0),
(76, 'Lecomte', 'GK', NULL, '1000.00', 79, 500, NULL, 0),
(77, 'Monetti', 'GK', NULL, '1000.00', 77, 500, NULL, 0),
(78, 'Vidal', 'LD', NULL, '1000.00', 77, 500, NULL, 0),
(79, 'Koch', 'LD', NULL, '1000.00', 66, 500, NULL, 0),
(80, 'Zapata', 'ZAG', NULL, '1000.00', 78, 500, NULL, 0),
(81, 'Mbemba', 'ZAG', NULL, '1000.00', 77, 500, NULL, 0),
(82, 'Welbster', 'ZAG', NULL, '1000.00', 69, 500, NULL, 0),
(83, 'Armero', 'LE', NULL, '1000.00', 75, 500, NULL, 0),
(84, 'Aliji', 'LE', NULL, '1000.00', 69, 500, NULL, 0),
(85, 'Rômulo', 'VOL', NULL, '1000.00', 77, 500, NULL, 0),
(86, 'Hernández', 'MEI', NULL, '1000.00', 77, 500, NULL, 0),
(87, 'Ghodoos', 'MEI', NULL, '1000.00', 67, 500, NULL, 0),
(88, 'Podolski', 'MD', NULL, '1000.00', 80, 500, NULL, 0),
(89, 'Navas', 'MD', NULL, '1000.00', 80, 500, NULL, 0),
(90, 'Mendez-Laing', 'MD', NULL, '1000.00', 65, 500, NULL, 0),
(91, 'Lozano', 'PE', NULL, '1000.00', 76, 500, NULL, 0),
(92, 'Verde', 'PE', NULL, '1000.00', 70, 500, NULL, 0),
(93, 'Menez', 'ATA', NULL, '1000.00', 79, 500, NULL, 0),
(94, 'Pábon', 'ATA', NULL, '1000.00', 77, 500, NULL, 0),
(95, 'Joosten', 'ATA', NULL, '1000.00', 67, 500, NULL, 0),
(96, 'Gomes', 'GK', NULL, '1000.00', 78, 600, NULL, 0),
(97, 'Gottardi', 'GK', NULL, '1000.00', 76, 600, NULL, 0),
(98, 'Baiano', 'LD', NULL, '1000.00', 77, 600, NULL, 0),
(99, 'Caiçara', 'LD', NULL, '1000.00', 76, 600, NULL, 0),
(100, 'Marçal', 'LE', NULL, '1000.00', 76, 600, NULL, 0),
(101, 'Teles', 'LE', NULL, '1000.00', 77, 600, NULL, 0),
(102, 'Dante', 'ZG', NULL, '1000.00', 80, 600, NULL, 0),
(103, 'Hilton', 'ZG', NULL, '1000.00', 79, 600, NULL, 0),
(104, 'Guilherme', 'MC', NULL, '1000.00', 75, 600, NULL, 0),
(105, 'Fred', 'MC', NULL, '1000.00', 79, 600, NULL, 0),
(106, 'Luiz Gustavo', 'MC', NULL, '1000.00', 83, 600, NULL, 0),
(107, 'Renato Neto', 'MC', NULL, '1000.00', 75, 600, NULL, 0),
(108, 'Edu', 'ATA', NULL, '1000.00', 76, 600, NULL, 0),
(109, 'Douglas Costa', 'ATA', NULL, '1000.00', 84, 600, NULL, 0),
(110, 'Wellington Nem', 'ATA', NULL, '1000.00', 75, 600, NULL, 0),
(111, 'Marlos', 'ATA', NULL, '1000.00', 80, 600, NULL, 0),
(112, 'Neto', 'GK', NULL, '1000.00', 80, 700, NULL, 0),
(113, 'Cassio', 'GK', NULL, '1000.00', 78, 700, NULL, 0),
(114, 'Mariano', 'LD', NULL, '1000.00', 79, 700, NULL, 0),
(115, 'Anderson Luis', 'LD', NULL, '1000.00', 72, 700, NULL, 0),
(116, 'Alex Sandro', 'LE', NULL, '1000.00', 84, 700, NULL, 0),
(117, 'Juan Jesus', 'LE', NULL, '1000.00', 79, 700, NULL, 0),
(118, 'Titi', 'ZAG', NULL, '1000.00', 75, 700, NULL, 0),
(119, 'Felipe', 'ZAG', NULL, '1000.00', 78, 700, NULL, 0),
(120, 'Jardel', 'ZAG', NULL, '1000.00', 82, 700, NULL, 0),
(121, 'Lucas Leiva', 'VOL', NULL, '1000.00', 80, 700, NULL, 0),
(122, 'Bruno Henrique', 'VOL', NULL, '1000.00', 75, 700, NULL, 0),
(123, 'Juninho', 'MC', NULL, '1000.00', 72, 700, NULL, 0),
(124, 'Fernandinho', 'MC', NULL, '1000.00', 81, 700, NULL, 0),
(125, 'Oscar', 'MEI', NULL, '1000.00', 83, 700, NULL, 0),
(126, 'Lucas Piazon', 'MEI', NULL, '1000.00', 74, 700, NULL, 0),
(127, 'Taison', 'MEI', NULL, '1000.00', 81, 700, NULL, 0),
(128, 'Pato', 'ATA', NULL, '1000.00', 80, 700, NULL, 0),
(129, 'Ryder', 'ATA', NULL, '1000.00', 75, 700, NULL, 0),
(130, 'Zarate', 'ATA', NULL, '1000.00', 77, 800, NULL, 0),
(131, 'Riquelme', 'ATA', NULL, '1000.00', 70, 800, NULL, 0),
(132, 'Aguirre', 'ME', NULL, '1000.00', 68, 800, NULL, 0),
(133, 'Lezcano', 'PE', NULL, '1000.00', 76, 800, NULL, 0),
(134, 'Sálvio', 'MD', NULL, '1000.00', 79, 800, NULL, 0),
(135, 'Centurion', 'PD', NULL, '1000.00', 72, 800, NULL, 0),
(136, 'Sosa', 'MEI', NULL, '1000.00', 80, 800, NULL, 0),
(137, 'Lanzini', 'MEI', NULL, '1000.00', 79, 800, NULL, 0),
(138, 'Bataglia', 'MC', NULL, '1000.00', 70, 800, NULL, 0),
(139, 'Escalante', 'VOL', NULL, '1000.00', 78, 800, NULL, 0),
(140, 'Kranevitter', 'VOL', NULL, '1000.00', 77, 800, NULL, 0),
(141, 'Tagliafico', 'LE', NULL, '1000.00', 76, 800, NULL, 0),
(142, 'Vangioni', 'LE', NULL, '1000.00', 77, 800, NULL, 0),
(143, 'Salazar', 'LD', NULL, '1000.00', 70, 800, NULL, 0),
(144, 'Federico Vega', 'LD', NULL, '1000.00', 69, 800, NULL, 0),
(145, 'Funes Mori', 'ZAG', NULL, '1000.00', 77, 800, NULL, 0),
(146, 'Abraham', 'ZAG', NULL, '1000.00', 77, 800, NULL, 0),
(147, 'Gorosito', 'ZAG', NULL, '1000.00', 72, 800, NULL, 0),
(148, 'Caballero', 'GK', NULL, '1000.00', 79, 800, NULL, 0),
(149, 'Ochoa', 'GK', NULL, '1000.00', 80, 900, NULL, 0),
(150, 'Cancelo', 'LD', NULL, '1000.00', 79, 900, NULL, 0),
(151, 'Siqueira', 'LE', NULL, '1000.00', 79, 900, NULL, 0),
(152, 'Douglas', 'LD', NULL, '1000.00', 73, 900, NULL, 0),
(153, 'Mangala', 'ZAG', NULL, '1000.00', 80, 900, NULL, 0),
(154, 'Kolodziejczak', 'ZAG', NULL, '1000.00', 80, 900, NULL, 0),
(155, 'IÉ', 'ZAG', NULL, '1000.00', 68, 900, NULL, 0),
(156, 'N\'Diaye', 'VOL', NULL, '1000.00', 79, 900, NULL, 0),
(157, 'Lucas Silva', 'VOL', NULL, '1000.00', 74, 900, NULL, 0),
(158, 'Ryan Donk', 'VOL', NULL, '1000.00', 73, 900, NULL, 0),
(159, 'Boateng', 'MC', NULL, '1000.00', 79, 900, NULL, 0),
(160, 'Kovacic', 'MC', NULL, '1000.00', 79, 900, NULL, 0),
(161, 'Rafinha', 'MC', NULL, '1000.00', 80, 900, NULL, 0),
(162, 'Hernandes', 'MC', NULL, '1000.00', 80, 900, NULL, 0),
(163, 'Sergi Roberto', 'MC', NULL, '1000.00', 79, 900, NULL, 0),
(164, 'Ben Yedder', 'ATA', NULL, '1000.00', 80, 900, NULL, 0),
(165, 'Corrêa', 'ATA', NULL, '1000.00', 79, 900, NULL, 0),
(166, 'Victor Andrade', 'ATA', NULL, '1000.00', 73, 900, NULL, 0),
(167, 'Williams', 'ATA', NULL, '1000.00', 80, 900, NULL, 0),
(168, 'Alisson', 'GK', NULL, '1000.00', 80, 1000, NULL, 0),
(169, 'Diego Alves', 'GK', NULL, '1000.00', 83, 1000, NULL, 0),
(170, 'Castan', 'ZAG', NULL, '1000.00', 80, 1000, NULL, 0),
(171, 'Jemerson', 'ZAG', NULL, '1000.00', 77, 1000, NULL, 0),
(172, 'Eduardo', 'ZAG', NULL, '1000.00', 66, 1000, NULL, 0),
(173, 'Adriano', 'LE', NULL, '1000.00', 78, 1000, NULL, 0),
(174, 'Danilo', 'LD', NULL, '1000.00', 80, 1000, NULL, 0),
(175, 'Ramos', 'LD', NULL, '1000.00', 67, 1000, NULL, 0),
(176, 'Petros', 'VOL', NULL, '1000.00', 78, 1000, NULL, 0),
(177, 'Souza', 'MC', NULL, '1000.00', 76, 1000, NULL, 0),
(178, 'Edenilson', 'MD', NULL, '1000.00', 75, 1000, NULL, 0),
(179, 'Bernard', 'MEI', NULL, '1000.00', 79, 1000, NULL, 0),
(180, 'Giuliano', 'MEI', NULL, '1000.00', 81, 1000, NULL, 0),
(181, 'Maicon', 'ME', NULL, '1000.00', 77, 1000, NULL, 0),
(182, 'Willian', 'MD', NULL, '1000.00', 85, 1000, NULL, 0),
(183, 'Firmino', 'ATA', NULL, '1000.00', 82, 1000, NULL, 0),
(184, 'Lucas Venuto', 'MD', NULL, '1000.00', 67, 1000, NULL, 0),
(185, 'Luiz Adriano', 'ATA', NULL, '1000.00', 79, 1000, NULL, 0),
(186, 'Ospina', 'GK', NULL, '1000.00', 79, 2000, NULL, 0),
(187, 'Gabriel', 'ZAG', NULL, '1000.00', 79, 2000, NULL, 0),
(188, 'Kabasele', 'ZAG', NULL, '1000.00', 76, 2000, NULL, 0),
(189, 'Djilobodji', 'ZAG', NULL, '1000.00', 78, 2000, NULL, 0),
(190, 'Zouma', 'ZAG', NULL, '1000.00', 80, 2000, NULL, 0),
(191, 'Mendy', 'VOL', NULL, '1000.00', 78, 2000, NULL, 0),
(192, 'Alberto Moreno', 'LE', NULL, '1000.00', 77, 2000, NULL, 0),
(193, 'Pablo Maffeo', 'LD', NULL, '1000.00', 65, 2000, NULL, 0),
(194, 'Loftus Cheek', 'MEI', NULL, '1000.00', 68, 2000, NULL, 0),
(195, 'Bolasie', 'ME', NULL, '1000.00', 78, 2000, NULL, 0),
(196, 'Boufal', 'PE', NULL, '1000.00', 80, 2000, NULL, 0),
(197, 'Montero', 'ME', NULL, '1000.00', 79, 2000, NULL, 0),
(198, 'Welbeck', 'ATA', NULL, '1000.00', 80, 2000, NULL, 0),
(199, 'Musa', 'ATA', NULL, '1000.00', 78, 2000, NULL, 0),
(200, 'Origi', 'ATA', NULL, '1000.00', 78, 2000, NULL, 0),
(201, 'Manquilo', 'LD', NULL, '1000.00', 77, 2000, NULL, 0),
(202, 'Nkoudou', 'ME', NULL, '1000.00', 78, 2000, NULL, 0),
(203, 'Sane', 'MD', NULL, '1000.00', 79, 2000, NULL, 0),
(204, 'Feghouli', 'PD', NULL, '1000.00', 80, 2000, NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogadorpack`
--

CREATE TABLE `jogadorpack` (
  `JogadorID` int(11) NOT NULL,
  `PackID` int(11) NOT NULL,
  `NomeJogador` varchar(250) NOT NULL,
  `TipoPack` char(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticia`
--

CREATE TABLE `noticia` (
  `NoticiaID` int(11) NOT NULL,
  `Titulo` varchar(100) NOT NULL,
  `Texto` varchar(6000) NOT NULL,
  `Imagem` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pack`
--

CREATE TABLE `pack` (
  `PackID` int(11) NOT NULL,
  `TipoPack` varchar(50) DEFAULT NULL,
  `Sorteado` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pack`
--

INSERT INTO `pack` (`PackID`, `TipoPack`, `Sorteado`) VALUES
(1, 'T', 1),
(2, 'T', 0),
(3, 'T', 0),
(4, 'T', 0),
(5, 'T', 1),
(6, 'T', 1),
(7, 'T', 1),
(8, 'T', 0),
(9, 'T', 0),
(10, 'T', 1),
(11, 'T', 0),
(12, 'T', 0),
(13, 'T', 0),
(14, 'T', 1),
(15, 'R', 1),
(16, 'R', 1),
(17, 'R', 1),
(18, 'R', 1),
(19, 'R', 1),
(20, 'R', 0),
(21, 'R', 0),
(22, 'R', 0),
(23, 'R', 0),
(24, 'R', 0),
(25, 'R', 0),
(26, 'R', 1),
(27, 'R', 0),
(28, 'R', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `partida`
--

CREATE TABLE `partida` (
  `PartidaID` int(11) NOT NULL,
  `CampeonatoID` int(11) NOT NULL,
  `EquipeCasa` int(11) NOT NULL,
  `GolsCasa` int(11) DEFAULT NULL,
  `EquipeFora` int(11) NOT NULL,
  `GolsFora` int(11) DEFAULT NULL,
  `DataAbertura` datetime NOT NULL,
  `DataReport` datetime DEFAULT NULL,
  `Rodada` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `report`
--

CREATE TABLE `report` (
  `ReportID` int(11) NOT NULL,
  `PartidaID` int(11) NOT NULL,
  `EquipeReportID` int(11) NOT NULL,
  `GolsCasa` int(11) DEFAULT NULL,
  `GolsFora` int(11) DEFAULT NULL,
  `DataReport` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `transferencia`
--

CREATE TABLE `transferencia` (
  `ID` int(11) NOT NULL,
  `EquipeSaida` int(11) DEFAULT NULL,
  `EquipeEntrada` int(11) DEFAULT NULL,
  `DataInicio` datetime NOT NULL,
  `DataFim` datetime DEFAULT NULL,
  `Valor` decimal(12,2) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `JogadorID` int(11) NOT NULL,
  `JogadorTrocaID` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(250) NOT NULL,
  `PSN` varchar(250) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `Senha` varchar(250) NOT NULL,
  `Orcamento` decimal(12,2) NOT NULL DEFAULT '250000.00',
  `Ativo` tinyint(1) NOT NULL DEFAULT '0',
  `Admin` tinyint(1) NOT NULL DEFAULT '0',
  `PackDisponivel` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`ID`, `Nome`, `PSN`, `Email`, `Senha`, `Orcamento`, `Ativo`, `Admin`, `PackDisponivel`) VALUES
(1, 'Gustavo Novaes', 'gunovaes420', 'n/a', 'novaes123', '100000.00', 1, 1, 0),
(2, 'Thiago Oliva', 'thiag6', 'n/a', 'tijucanos7', '100000.00', 1, 0, 0),
(3, 'Christian Nunes', 'christiannunes', 'n/a', 'nunesunited', '100000.00', 1, 0, 0),
(4, 'Alvaro Brasil', 'alvaro_brasil', 'n/a', 'alvaroremo', '100000.00', 1, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campeonato`
--
ALTER TABLE `campeonato`
  ADD PRIMARY KEY (`CampeonatoID`);

--
-- Indexes for table `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`EquipeID`);

--
-- Indexes for table `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`Grupo`);

--
-- Indexes for table `jogador`
--
ALTER TABLE `jogador`
  ADD PRIMARY KEY (`JogadorID`);

--
-- Indexes for table `jogadorpack`
--
ALTER TABLE `jogadorpack`
  ADD UNIQUE KEY `JogadorID` (`JogadorID`);

--
-- Indexes for table `noticia`
--
ALTER TABLE `noticia`
  ADD PRIMARY KEY (`NoticiaID`);

--
-- Indexes for table `partida`
--
ALTER TABLE `partida`
  ADD PRIMARY KEY (`PartidaID`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`ReportID`);

--
-- Indexes for table `transferencia`
--
ALTER TABLE `transferencia`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `campeonato`
--
ALTER TABLE `campeonato`
  MODIFY `CampeonatoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `equipe`
--
ALTER TABLE `equipe`
  MODIFY `EquipeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `grupo`
--
ALTER TABLE `grupo`
  MODIFY `Grupo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jogador`
--
ALTER TABLE `jogador`
  MODIFY `JogadorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;
--
-- AUTO_INCREMENT for table `noticia`
--
ALTER TABLE `noticia`
  MODIFY `NoticiaID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `partida`
--
ALTER TABLE `partida`
  MODIFY `PartidaID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `ReportID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transferencia`
--
ALTER TABLE `transferencia`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
