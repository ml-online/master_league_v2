
-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 14/11/2016 às 02:09:05
-- Versão do Servidor: 10.0.20-MariaDB
-- Versão do PHP: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `u998726246_crg`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `assistencia`
--

CREATE TABLE IF NOT EXISTS `assistencia` (
  `JogadorID` int(11) NOT NULL,
  `PartidaID` int(11) NOT NULL,
  `ReportID` int(11) NOT NULL,
  `Qtd` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `campeonato`
--

CREATE TABLE IF NOT EXISTS `campeonato` (
  `CampeonatoID` int(11) NOT NULL AUTO_INCREMENT,
  `NomeCampeonato` varchar(250) NOT NULL,
  PRIMARY KEY (`CampeonatoID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `campeonato`
--

INSERT INTO `campeonato` (`CampeonatoID`, `NomeCampeonato`) VALUES
(1, 'Master Liga Jogadores');

-- --------------------------------------------------------

--
-- Estrutura da tabela `classificacao`
--

CREATE TABLE IF NOT EXISTS `classificacao` (
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

CREATE TABLE IF NOT EXISTS `equipe` (
  `EquipeID` int(11) NOT NULL AUTO_INCREMENT,
  `NomeEquipe` varchar(250) NOT NULL,
  `Escudo` varchar(500) DEFAULT NULL,
  `UsuarioID` int(11) NOT NULL,
  PRIMARY KEY (`EquipeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `equipe`
--

INSERT INTO `equipe` (`EquipeID`, `NomeEquipe`, `Escudo`, `UsuarioID`) VALUES
(1, 'Athletic Novaes', NULL, 1),
(2, 'Real Tijucanos', NULL, 2),
(3, 'Real United FC', NULL, 3),
(4, 'Clube do Remo', NULL, 4),
(5, 'Tigre do Sul FC', NULL, 5),
(6, 'Galo Forte', NULL, 6),
(7, 'Peleadores do Sul', NULL, 7),
(8, 'Poderoso do Sul', NULL, 8),
(9, 'Los Hermanos FC', NULL, 9),
(10, 'HANDICAP (BUG)', NULL, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `gol`
--

CREATE TABLE IF NOT EXISTS `gol` (
  `JogadorID` int(11) NOT NULL,
  `PartidaID` int(11) NOT NULL,
  `ReportID` int(11) NOT NULL,
  `Qtd` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo`
--

CREATE TABLE IF NOT EXISTS `grupo` (
  `Grupo` int(11) NOT NULL AUTO_INCREMENT,
  `NomeGrupo` varchar(200) NOT NULL,
  PRIMARY KEY (`Grupo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogador`
--

CREATE TABLE IF NOT EXISTS `jogador` (
  `JogadorID` int(11) NOT NULL AUTO_INCREMENT,
  `NomeJogador` varchar(250) NOT NULL,
  `Posicao` varchar(5) NOT NULL,
  `EquipeOriginal` varchar(250) DEFAULT NULL,
  `Preco` decimal(12,2) DEFAULT NULL,
  `Overall` int(11) NOT NULL,
  `EquipeID` int(11) DEFAULT NULL,
  `Imagem` varchar(500) DEFAULT NULL,
  `Escala` int(11) NOT NULL,
  PRIMARY KEY (`JogadorID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=205 ;

--
-- Extraindo dados da tabela `jogador`
--

INSERT INTO `jogador` (`JogadorID`, `NomeJogador`, `Posicao`, `EquipeOriginal`, `Preco`, `Overall`, `EquipeID`, `Imagem`, `Escala`) VALUES
(1, 'Matheus braga', 'GOL', NULL, '6000.00', 76, 6, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(2, 'Diego', 'GOL', NULL, '1000.00', 67, 6, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(3, 'Mario Fernandes', 'LD', NULL, '10000.00', 80, 6, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(4, 'Deleu', 'LD', NULL, '1000.00', 65, 6, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(5, 'Maxwell', 'LE', NULL, '7000.00', 79, 6, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(6, 'Rhodolfo', 'ZAG', NULL, '10000.00', 80, 6, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(7, 'Rodrigo Moledo', 'ZAG', NULL, '7000.00', 78, 6, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(8, 'Diego Angelo', 'ZAG', NULL, '4000.00', 73, 6, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(9, 'Sandro', 'VOL', NULL, '7000.00', 78, 6, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(10, 'Anderson Talisca', 'MC', NULL, '6000.00', 76, 6, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(11, 'Sanches', 'MC', NULL, '7000.00', 78, 6, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(12, 'Allanzinho', 'MEI', NULL, '4000.00', 72, 6, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(13, 'D''alessandro', 'MEI', NULL, '7000.00', 79, 6, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(14, 'Edmilson Junior', 'MEI', NULL, '4000.00', 72, 6, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(15, 'Ilsinho', 'MD', NULL, '4000.00', 72, 6, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(16, 'Dembele', 'MD', NULL, '6000.00', 77, 6, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(17, 'Ibarbo', 'ATA', NULL, '5000.00', 75, 6, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(18, 'Rashford', 'ATA', NULL, '6000.00', 76, 6, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(19, 'Adriano', 'ATA', NULL, '6000.00', 77, 6, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(20, 'Szczesny', 'GOL', NULL, '7000.00', 79, 1, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(21, 'Marquinhos', 'ZAG', NULL, '15000.00', 82, 1, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(22, 'Rudiger', 'ZAG', NULL, '6000.00', 77, 1, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(23, 'Ely', 'ZAG', NULL, '3000.00', 71, 1, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(24, 'Michel Macedo', 'LD', NULL, '5000.00', 75, 1, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(25, 'Bruno Peres', 'LD', NULL, '10000.00', 81, 1, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(26, 'Wendell', 'LE', NULL, '7000.00', 78, 1, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(27, 'Jefferson', 'LE', NULL, '10000.00', 81, 1, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(28, 'Mauricio', 'VOL', NULL, '7000.00', 78, 1, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(29, 'Casemiro', 'VOL', NULL, '15000.00', 82, 1, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(30, 'Fabinho', 'VOL', NULL, '7000.00', 79, 1, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(31, 'Ganso', 'MEI', NULL, '10000.00', 81, 1, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(32, 'Philippe Coutinho', 'MEI', NULL, '25000.00', 85, 1, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(33, 'Lucas', 'ATA', NULL, '15000.00', 82, 1, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(34, 'Ademilson', 'ATA', NULL, '5000.00', 74, 1, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(35, 'Douglas Coutinho', 'ATA', NULL, '3000.00', 71, 1, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(36, 'Maikon Leite', 'ATA', NULL, '3000.00', 71, 1, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(37, 'Felipe Anderson', 'ATA', NULL, '7000.00', 79, 1, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(38, 'Joaozinho', 'ATA', NULL, '7000.00', 79, 1, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(39, 'Ederson', 'GOL', NULL, '7000.00', 78, 10, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(40, 'Nicolas', 'GOL', NULL, '1000.00', 63, 10, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(41, 'Samir', 'ZAG', NULL, '4000.00', 73, 10, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(42, 'Gerson', 'ZAG', NULL, '2000.00', 69, 10, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(43, 'Sidnei', 'ZAG', NULL, '10000.00', 80, 10, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(44, 'Wellington', 'ZAG', NULL, '7000.00', 79, 10, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(45, 'Leandro', 'LE', NULL, '1000.00', 67, 10, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(46, 'Fábio', 'LE', NULL, '5000.00', 74, 10, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(47, 'Nilton', 'VOL', NULL, '3000.00', 71, 10, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(48, 'M. Silva', 'VOL', NULL, '1000.00', 60, 10, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(49, 'Malcon', 'MC', NULL, '5000.00', 74, 10, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(50, 'Muriqui', 'MC', NULL, '5000.00', 74, 10, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(51, 'Alefe', 'MD', NULL, '1000.00', 54, 10, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(52, 'Natanael', 'MEI', NULL, '4000.00', 72, 10, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(53, 'B. Mota', 'MEI', NULL, '1000.00', 67, 10, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(54, 'Jonas', 'ATA', NULL, '25000.00', 84, 10, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(55, 'Baptistão', 'ATA', NULL, '7000.00', 79, 10, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(56, 'G. Santos', 'ATA', NULL, '1000.00', 54, 10, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(57, 'Heberty', 'ATA', NULL, '1000.00', 66, 10, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(58, 'Tim Krull', 'GOL', NULL, '7000.00', 79, 2, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(59, 'Santiago Arias', 'LD', NULL, '6000.00', 77, 2, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(60, 'Maxime Le Marchand', 'ZAG', NULL, '6000.00', 77, 2, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(61, 'Facundo Roncaglia', 'ZAG', NULL, '6000.00', 77, 2, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(62, 'Bernat', 'LE', NULL, '7000.00', 79, 2, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(63, 'Gianelli Imbula', 'VOL', NULL, '7000.00', 79, 2, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(64, 'Jonjo Shelvey', 'VOL', NULL, '6000.00', 77, 2, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(65, 'Jakub Blaszczykowski', 'MD', NULL, '7000.00', 79, 2, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(66, 'Marko Marin', 'MEI', NULL, '6000.00', 76, 2, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(67, 'Ashley Young', 'ME', NULL, '7000.00', 79, 2, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(68, 'Charlie Austin', 'ATA', NULL, '7000.00', 78, 2, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(69, 'Leroy Fer', 'MC', NULL, '6000.00', 76, 2, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(70, 'Okazaki', 'ATA', NULL, '6000.00', 77, 2, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(71, 'Okore', 'ZAG', NULL, '6000.00', 77, 2, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(72, 'Luciano Abecasis', 'LD', NULL, '4000.00', 73, 2, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(73, 'Junior Stanislas', 'MD', NULL, '4000.00', 73, 2, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(74, 'Wouter Van Der Steen', 'GOL', NULL, '1000.00', 67, 2, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(75, 'Liberto Beltran', 'ME', NULL, '1000.00', 67, 2, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(76, 'Lecomte', 'GOL', NULL, '7000.00', 79, 3, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(77, 'Monetti', 'GOL', NULL, '6000.00', 77, 3, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(78, 'Vidal', 'LD', NULL, '6000.00', 77, 3, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(79, 'Koch', 'LD', NULL, '1000.00', 66, 3, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(80, 'Zapata', 'ZAG', NULL, '7000.00', 78, 3, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(81, 'Mbemba', 'ZAG', NULL, '6000.00', 77, 3, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(82, 'Welbster', 'ZAG', NULL, '2000.00', 69, 3, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(83, 'Armero', 'LE', NULL, '5000.00', 75, 3, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(84, 'Aliji', 'LE', NULL, '2000.00', 69, 3, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(85, 'Rômulo', 'VOL', NULL, '6000.00', 77, 3, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(86, 'Hernández', 'MEI', NULL, '6000.00', 77, 3, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(87, 'Ghodoos', 'MEI', NULL, '1000.00', 67, 3, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(88, 'Podolski', 'MD', NULL, '10000.00', 80, 3, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(89, 'Navas', 'MD', NULL, '10000.00', 80, 3, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(90, 'Mendez-Laing', 'MD', NULL, '1000.00', 65, 3, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(91, 'Lozano', 'PE', NULL, '6000.00', 76, 3, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(92, 'Verde', 'PE', NULL, '3000.00', 70, 3, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(93, 'Menez', 'ATA', NULL, '7000.00', 79, 3, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(94, 'Pábon', 'ATA', NULL, '6000.00', 77, 3, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(95, 'Joosten', 'ATA', NULL, '1000.00', 67, 3, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(96, 'Gomes', 'GOL', NULL, '7000.00', 78, 4, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(97, 'Gottardi', 'GOL', NULL, '6000.00', 76, 4, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(98, 'Baiano', 'LD', NULL, '6000.00', 77, 4, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(99, 'Caiçara', 'LD', NULL, '6000.00', 76, 4, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(100, 'Marçal', 'LE', NULL, '6000.00', 76, 4, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(101, 'Teles', 'LE', NULL, '6000.00', 77, 4, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(102, 'Dante', 'ZG', NULL, '10000.00', 80, 4, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(103, 'Hilton', 'ZG', NULL, '7000.00', 79, 4, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(104, 'Guilherme', 'MC', NULL, '5000.00', 75, 4, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(105, 'Fred', 'MC', NULL, '7000.00', 79, 4, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(106, 'Luiz Gustavo', 'MC', NULL, '15000.00', 83, 4, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(107, 'Renato Neto', 'MC', NULL, '5000.00', 75, 4, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(108, 'Edu', 'ATA', NULL, '6000.00', 76, 4, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(109, 'Douglas Costa', 'ATA', NULL, '25000.00', 84, 4, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(110, 'Wellington Nem', 'ATA', NULL, '5000.00', 75, 4, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(111, 'Marlos', 'ATA', NULL, '10000.00', 80, 4, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(112, 'Neto', 'GOL', NULL, '10000.00', 80, 8, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(113, 'Cassio', 'GOL', NULL, '7000.00', 78, 8, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(114, 'Mariano', 'LD', NULL, '7000.00', 79, 8, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(115, 'Anderson Luis', 'LD', NULL, '4000.00', 72, 8, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(116, 'Alex Sandro', 'LE', NULL, '25000.00', 84, 8, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(117, 'Juan Jesus', 'LE', NULL, '7000.00', 79, 8, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(118, 'Titi', 'ZAG', NULL, '5000.00', 75, 8, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(119, 'Felipe', 'ZAG', NULL, '7000.00', 78, 8, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(120, 'Jardel', 'ZAG', NULL, '15000.00', 82, 8, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(121, 'Lucas Leiva', 'VOL', NULL, '10000.00', 80, 8, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(122, 'Bruno Henrique', 'VOL', NULL, '5000.00', 75, 8, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(123, 'Juninho', 'MC', NULL, '4000.00', 72, 8, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(124, 'Fernandinho', 'MC', NULL, '10000.00', 81, 8, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(125, 'Oscar', 'MEI', NULL, '15000.00', 83, 8, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(126, 'Lucas Piazon', 'MEI', NULL, '5000.00', 74, 8, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(127, 'Taison', 'MEI', NULL, '10000.00', 81, 8, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(128, 'Pato', 'ATA', NULL, '10000.00', 80, 8, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(129, 'Ryder', 'ATA', NULL, '5000.00', 75, 8, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(130, 'Zarate', 'ATA', NULL, '6000.00', 77, 9, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(131, 'Riquelme', 'ATA', NULL, '3000.00', 70, 9, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(132, 'Aguirre', 'ME', NULL, '2000.00', 68, 9, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(133, 'Lezcano', 'PE', NULL, '6000.00', 76, 9, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(134, 'Sálvio', 'MD', NULL, '7000.00', 79, 9, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(135, 'Centurion', 'PD', NULL, '4000.00', 72, 9, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(136, 'Sosa', 'MEI', NULL, '10000.00', 80, 9, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(137, 'Lanzini', 'MEI', NULL, '7000.00', 79, 9, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(138, 'Bataglia', 'MC', NULL, '3000.00', 70, 9, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(139, 'Escalante', 'VOL', NULL, '7000.00', 78, 9, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(140, 'Kranevitter', 'VOL', NULL, '6000.00', 77, 9, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(141, 'Tagliafico', 'LE', NULL, '6000.00', 76, 9, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(142, 'Vangioni', 'LE', NULL, '6000.00', 77, 9, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(143, 'Salazar', 'LD', NULL, '3000.00', 70, 9, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(144, 'Federico Vega', 'LD', NULL, '2000.00', 69, 9, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(145, 'Funes Mori', 'ZAG', NULL, '6000.00', 77, 9, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(146, 'Abraham', 'ZAG', NULL, '6000.00', 77, 9, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(147, 'Gorosito', 'ZAG', NULL, '4000.00', 72, 9, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(148, 'Caballero', 'GOL', NULL, '7000.00', 79, 9, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(149, 'Ochoa', 'GOL', NULL, '10000.00', 80, 7, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(150, 'Cancelo', 'LD', NULL, '7000.00', 79, 7, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(151, 'Siqueira', 'LE', NULL, '7000.00', 79, 7, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(152, 'Douglas', 'LD', NULL, '4000.00', 73, 7, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(153, 'Mangala', 'ZAG', NULL, '10000.00', 80, 7, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(154, 'Kolodziejczak', 'ZAG', NULL, '10000.00', 80, 7, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(155, 'IÉ', 'ZAG', NULL, '2000.00', 68, 7, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(156, 'N''Diaye', 'VOL', NULL, '7000.00', 79, 7, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(157, 'Lucas Silva', 'VOL', NULL, '5000.00', 74, 7, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(158, 'Ryan Donk', 'VOL', NULL, '4000.00', 73, 7, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(159, 'Boateng', 'MC', NULL, '7000.00', 79, 7, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(160, 'Kovacic', 'MC', NULL, '7000.00', 79, 7, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(161, 'Rafinha', 'MC', NULL, '10000.00', 80, 7, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(162, 'Hernandes', 'MC', NULL, '10000.00', 80, 7, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(163, 'Sergi Roberto', 'MC', NULL, '7000.00', 79, 7, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(164, 'Ben Yedder', 'ATA', NULL, '10000.00', 80, 7, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(165, 'Corrêa', 'ATA', NULL, '7000.00', 79, 7, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(166, 'Victor Andrade', 'ATA', NULL, '4000.00', 73, 7, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(167, 'Williams', 'ATA', NULL, '10000.00', 80, 7, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(168, 'Alisson', 'GOL', NULL, '10000.00', 80, 5, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(169, 'Diego Alves', 'GOL', NULL, '15000.00', 83, 5, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(170, 'Castan', 'ZAG', NULL, '10000.00', 80, 5, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(171, 'Jemerson', 'ZAG', NULL, '6000.00', 77, 5, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(172, 'Eduardo', 'ZAG', NULL, '1000.00', 66, 5, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(173, 'Adriano', 'LE', NULL, '7000.00', 78, 5, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(174, 'Danilo', 'LD', NULL, '10000.00', 80, 5, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(175, 'Ramos', 'LD', NULL, '1000.00', 67, 5, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(176, 'Petros', 'VOL', NULL, '7000.00', 78, 5, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(177, 'Souza', 'MC', NULL, '6000.00', 76, 5, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(178, 'Edenilson', 'MD', NULL, '5000.00', 75, 5, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(179, 'Bernard', 'MEI', NULL, '7000.00', 79, 5, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(180, 'Giuliano', 'MEI', NULL, '10000.00', 81, 5, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(181, 'Maicon', 'ME', NULL, '6000.00', 77, 5, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(182, 'Willian', 'MD', NULL, '25000.00', 85, 5, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(183, 'Firmino', 'ATA', NULL, '15000.00', 82, 5, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(184, 'Lucas Venuto', 'MD', NULL, '1000.00', 67, 5, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(185, 'Luiz Adriano', 'ATA', NULL, '7000.00', 79, 5, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(186, 'Ospina', 'GOL', NULL, '7000.00', 79, NULL, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(187, 'Gabriel', 'ZAG', NULL, '7000.00', 79, NULL, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(188, 'Kabasele', 'ZAG', NULL, '6000.00', 76, NULL, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(189, 'Djilobodji', 'ZAG', NULL, '7000.00', 78, NULL, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(190, 'Zouma', 'ZAG', NULL, '10000.00', 80, NULL, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(191, 'Mendy', 'VOL', NULL, '7000.00', 78, NULL, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(192, 'Alberto Moreno', 'LE', NULL, '6000.00', 77, NULL, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(193, 'Pablo Maffeo', 'LD', NULL, '1000.00', 65, NULL, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(194, 'Loftus Cheek', 'MEI', NULL, '2000.00', 68, NULL, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(195, 'Bolasie', 'ME', NULL, '7000.00', 78, NULL, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(196, 'Boufal', 'PE', NULL, '10000.00', 80, NULL, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(197, 'Montero', 'ME', NULL, '7000.00', 79, NULL, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(198, 'Welbeck', 'ATA', NULL, '10000.00', 80, NULL, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(199, 'Musa', 'ATA', NULL, '7000.00', 78, NULL, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(200, 'Origi', 'ATA', NULL, '7000.00', 78, NULL, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(201, 'Manquilo', 'LD', NULL, '6000.00', 77, NULL, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(202, 'Nkoudou', 'ME', NULL, '7000.00', 78, NULL, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(203, 'Sane', 'MD', NULL, '7000.00', 79, NULL, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0),
(204, 'Feghouli', 'PD', NULL, '10000.00', 80, NULL, 'https://s-media-cache-ak0.pinimg.com/originals/5f/48/9f/5f489fb761d0fbf44a01e2bf1b87be64.png', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogadorpack`
--

CREATE TABLE IF NOT EXISTS `jogadorpack` (
  `JogadorID` int(11) NOT NULL,
  `PackID` int(11) NOT NULL,
  `NomeJogador` varchar(250) NOT NULL,
  `TipoPack` char(1) NOT NULL,
  UNIQUE KEY `JogadorID` (`JogadorID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticia`
--

CREATE TABLE IF NOT EXISTS `noticia` (
  `NoticiaID` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(100) NOT NULL,
  `Texto` varchar(6000) NOT NULL,
  `Imagem` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`NoticiaID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pack`
--

CREATE TABLE IF NOT EXISTS `pack` (
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

CREATE TABLE IF NOT EXISTS `partida` (
  `PartidaID` int(11) NOT NULL AUTO_INCREMENT,
  `CampeonatoID` int(11) NOT NULL,
  `EquipeCasa` int(11) NOT NULL,
  `GolsCasa` int(11) DEFAULT NULL,
  `EquipeFora` int(11) NOT NULL,
  `GolsFora` int(11) DEFAULT NULL,
  `DataAbertura` datetime NOT NULL,
  `DataReport` datetime DEFAULT NULL,
  `Rodada` int(11) DEFAULT NULL,
  PRIMARY KEY (`PartidaID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `report`
--

CREATE TABLE IF NOT EXISTS `report` (
  `ReportID` int(11) NOT NULL AUTO_INCREMENT,
  `PartidaID` int(11) NOT NULL,
  `EquipeReportID` int(11) NOT NULL,
  `GolsCasa` int(11) DEFAULT NULL,
  `GolsFora` int(11) DEFAULT NULL,
  `DataReport` datetime NOT NULL,
  PRIMARY KEY (`ReportID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `transferencia`
--

CREATE TABLE IF NOT EXISTS `transferencia` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EquipeSaida` int(11) DEFAULT NULL,
  `EquipeEntrada` int(11) DEFAULT NULL,
  `DataInicio` datetime NOT NULL,
  `DataFim` datetime DEFAULT NULL,
  `Valor` decimal(12,2) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `JogadorID` int(11) NOT NULL,
  `JogadorTrocaID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(250) NOT NULL,
  `PSN` varchar(250) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `Senha` varchar(250) NOT NULL,
  `Orcamento` decimal(12,2) NOT NULL DEFAULT '250000.00',
  `Ativo` tinyint(1) NOT NULL DEFAULT '0',
  `Admin` tinyint(1) NOT NULL DEFAULT '0',
  `PackDisponivel` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`ID`, `Nome`, `PSN`, `Email`, `Senha`, `Orcamento`, `Ativo`, `Admin`, `PackDisponivel`) VALUES
(1, 'Gustavo Novaes', 'gunovaes420', 'n/a', 'novaes123', '10500.00', 1, 1, 0),
(2, 'Thiago Oliva', 'thiag6', 'n/a', 'tijucanos7', '0.00', 1, 1, 0),
(3, 'Christian Nunes', 'christiannunnes', 'n/a', 'nunesunited', '3000.00', 1, 0, 0),
(4, 'Alvaro Brasil', 'alvaro_brasil', 'n/a', 'alvaroremo', '3700.00', 1, 0, 0),
(5, 'Douglas Custodio', 'dogacustodio', 'n/a', 'custodio01', '4700.00', 1, 0, 0),
(6, 'Celso', 'celso269', 'n/a', 'galocelso', '13300.00', 1, 0, 0),
(7, 'Lucas Wittmann', 'lucaswittmann92', 'n/a', 'wittmann92', '1000.00', 1, 0, 0),
(8, 'Cristiano Nunes', 'crisnunes87', 'n/a', 'crisnunes01', '7400.00', 1, 0, 0),
(9, 'Guto', 'newbliss', 'n/a', 'cbfol666', '600.00', 1, 0, 0),
(10, 'Zaca', 'fifa951488', 'n/a', 'zaca951488', '5500.00', 1, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
