-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 23-Jun-2016 às 03:19
-- Versão do servidor: 5.7.11
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bdtestecadastro`
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
(1, 'Liga Galaticos');

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
(1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 4, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 5, 0, 0, 0, 0, 0, 0, 0, 0);

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
(1, 'CR Flamengo', 'http://images.terra.com/2015/05/21/flamengo.png', 1),
(2, 'Alo Fc', 'http://www.clker.com/cliparts/t/m/N/L/J/Q/escudo.svg', 2),
(3, 'Nao Aprovado FC', 'http://www.clker.com/cliparts/t/m/N/L/J/Q/escudo.svg', 3),
(4, 'Real Madrid', NULL, 4),
(5, 'Campo Grande FC', NULL, 5);

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
  `Imagem` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `jogador`
--

INSERT INTO `jogador` (`JogadorID`, `NomeJogador`, `Posicao`, `EquipeOriginal`, `Preco`, `Overall`, `EquipeID`, `Imagem`) VALUES
(1, 'Neuer', 'GOL', 'Bayern Munich', '67500.00', 90, 1, 'http://media-titanium.cursecdn.com/attachments/68/186/neuer-16.JPG'),
(2, 'De Gea', 'GOL', 'ManUtd', '65250.00', 87, 2, 'http://media-titanium.cursecdn.com/attachments/68/64/degea-16.JPG'),
(3, 'Courtois', 'GOL', 'Chelsea', '64500.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(4, 'Cech', 'GOL', 'Arsenal', '64500.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(5, 'Lloris', 'GOL', 'Tottenham', '63750.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(6, 'Handanovic', 'GOL', 'InterMilan', '63000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(7, 'Hart', 'GOL', 'ManCity', '63000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(8, 'Buffon', 'GOL', 'Juventus', '63000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(9, 'Leno', 'GOL', 'BayerLeverkusen', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(10, 'Fahrmann', 'GOL', 'Schalke04', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(11, 'Bravo', 'GOL', 'Barcelona', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(12, 'Ruffier', 'GOL', 'SaintEtienne', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(13, 'Mandanda', 'GOL', 'Marseille', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(14, 'Oblak', 'GOL', 'AtlMadrid', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(15, 'A.Lopes', 'GOL', 'Lyon', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(16, 'K.Navas', 'GOL', 'RealMadrid', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(17, 'Ter Stegen', 'GOL', 'Barcelona', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(18, 'K.Trapp', 'GOL', 'PSG', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(19, 'Muslera', 'GOL', 'Galatasaray', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(20, 'Sommer', 'GOL', 'BorussiaMonchengladbach', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(21, 'Begovic', 'GOL', 'Chelsea', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(22, 'Sirigu', 'GOL', 'PSG', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(23, 'Diego Alves', 'GOL', 'Valencia', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(24, 'Julio Cesar', 'GOL', 'Benfica', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(25, 'Lahm', 'LD', 'BayernMunich', '65250.00', 87, NULL, 'http://media-titanium.cursecdn.com/attachments/68/152/lahm-16.JPG'),
(26, 'Dani Alves', 'LD', 'Barcelona', '63000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(27, 'Carvajal', 'LD', 'RealMadrid', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(28, 'Zabaleta', 'LD', 'ManCity', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(29, 'Lichtsteiner', 'LD', 'Juventus', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(30, 'Aurier', 'LD', 'PSG', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(31, 'Darmian', 'LD', 'ManUtd', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(32, 'Coleman', 'LD', 'Everton', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(33, 'JuanFran', 'LD', 'AtlMadrid', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(34, 'Danilo', 'LD', 'RealMadrid', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(35, 'Mario Gaspar', 'LD', 'Villareal', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(36, 'Clyne', 'LD', 'Liverpool', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(37, 'De Marcos', 'LD', 'AtlBilbao', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(38, 'Smolnikov', 'LD', 'Zenit', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(39, 'Ivanovic', 'LD', 'Chelsea', '60000.00', 80, 2, 'http://i.imgur.com/UGm0Av8.jpg'),
(40, 'Piszczek', 'LD', 'BorDortmund', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(41, 'Coke', 'LD', 'Sevilla', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(42, 'Sagna', 'LD', 'ManCity', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(43, 'Thiago Silva', 'ZAG', 'PSG', '66000.00', 88, 1, 'http://media-titanium.cursecdn.com/attachments/68/192/tsilva-16.JPG'),
(44, 'Boateng', 'ZAG', 'BayernMunich', '65250.00', 87, 1, 'http://media-titanium.cursecdn.com/attachments/68/145/boateng-16.JPG'),
(45, 'Sergio Ramos', 'ZAG', 'RealMadrid', '65250.00', 87, 1, 'http://media-titanium.cursecdn.com/attachments/68/150/ramos-16.JPG'),
(46, 'Godin', 'ZAG', 'AtlMadrid', '64500.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(47, 'Hummels', 'ZAG', 'BorDortmund', '64500.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(48, 'Chiellini', 'ZAG', 'Juventus', '64500.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(49, 'Miranda', 'ZAG', 'InterMilan', '63750.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(50, 'Pique', 'ZAG', 'Barcelona', '63750.00', 85, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(51, 'Kompany', 'ZAG', 'ManCity', '63750.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(52, 'Barzagli', 'ZAG', 'Juventus', '63750.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(53, 'Otamendi', 'ZAG', 'ManCity', '63000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(54, 'Javi Martinez', 'ZAG', 'BayernMunich', '63000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(55, 'Naldo', 'ZAG', 'Wolfsburg', '63000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(56, 'Koscielny', 'ZAG', 'Arsenal', '63000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(57, 'Pepe', 'ZAG', 'RealMadrid', '63000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(58, 'Terry', 'ZAG', 'Chelsea', '63000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(59, 'Laporte', 'ZAG', 'AtlBilbao', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(60, 'Manolas', 'ZAG', 'Roma', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(61, 'Smalling', 'ZAG', 'ManUtd', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(62, 'Bonucci', 'ZAG', 'Juventus', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(63, 'David Luiz', 'ZAG', 'PSG', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(64, 'Howedes', 'ZAG', 'Schallke04', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(65, 'Benatia', 'ZAG', 'BayernMunich', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(66, 'Sokratis', 'ZAG', 'BorDortmund', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(67, 'Garay', 'ZAG', 'Zenit', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(68, 'Mascherano', 'ZAG', 'Barcelona', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(69, 'Mertesacker', 'ZAG', 'Arsenal', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(70, 'Varane', 'ZAG', 'RealMadrid', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(71, 'Mustafi', 'ZAG', 'Valencia', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(72, 'Glik', 'ZAG', 'Torino', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(73, 'Alderweireld', 'ZAG', 'Tottenham', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(74, 'Bender', 'ZAG', 'BorDortmund', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(75, 'Vertonghen', 'ZAG', 'Tottenham', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(76, 'Cahill', 'ZAG', 'Chelsea', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(77, 'Perrin', 'ZAG', 'SaintEtienne', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(78, 'Mathieu', 'ZAG', 'Barcelona', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(79, 'Gimenez', 'ZAG', 'AtlMadrid', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(80, 'Marquinhos', 'ZAG', 'PSG', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(81, 'Savic', 'ZAG', 'AtlMadrid', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(82, 'De Vrij', 'ZAG', 'Lazio', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(83, 'Abdennour', 'ZAG', 'Valencia', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(84, 'Matip', 'ZAG', 'Schallke04', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(85, 'Musacchio', 'ZAG', 'Villareal', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(86, 'Toprak', 'ZAG', 'BayerLeverkusen', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(87, 'Jose Fonte', 'ZAG', 'Southampton', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(88, 'Skrtel', 'ZAG', 'Liverpool', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(89, 'Williams', 'ZAG', 'Swansea', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(90, 'Raul Albiol', 'ZAG', 'Napoli', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(91, 'Alaba', 'LE', 'BayernMunich', '63750.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(92, 'Jordi Alba', 'LE', 'Barcelona', '63000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(93, 'Marcelo', 'LE', 'RealMadrid', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(94, 'R.Rodriguez', 'LE', 'Wolfsburg', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(95, 'Alex Sandro', 'LE', 'Juventus', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(96, 'Azpilicueta', 'LE', 'Chelsea', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(97, 'Filipe Luis', 'LE', 'AtlMadrid', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(98, 'Baines', 'LE', 'Everton', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(99, 'Tremoulinas', 'LE', 'Sevilla', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(100, 'Evra', 'LE', 'Juventus', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(101, 'Gaya', 'LE', 'Valencia', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(102, 'Kurzawa', 'LE', 'PSG', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(103, 'Nacho Monreal', 'LE', 'Arsenal', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(104, 'Fabio Coentrao', 'LE', 'Monaco', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(105, 'Bernat', 'LE', 'BayernMunich', '59250.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(106, 'Balenziaga', 'LE', 'AtlBilbao', '59250.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(107, 'Jefferson', 'LE', 'Sporting', '59250.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(108, 'Gibbs', 'LE', 'Arsenal', '59250.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(109, 'Iniesta', 'VOL', 'Barcelona', '66000.00', 88, NULL, 'http://media-titanium.cursecdn.com/attachments/68/142/iniesta-16.JPG'),
(110, 'Kroos', 'VOL', 'RealMadrid', '65250.00', 87, 1, 'http://media-titanium.cursecdn.com/attachments/68/146/kroos-16.JPG'),
(111, 'Modric', 'VOL', 'RealMadrid', '65250.00', 87, 1, 'http://media-titanium.cursecdn.com/attachments/68/147/modric-16.JPG'),
(112, 'Pogba', 'VOL', 'Juventus', '64500.00', 86, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(113, 'Busquets', 'VOL', 'Barcelona', '64500.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(114, 'Fabregas', 'VOL', 'Chelsea', '64500.00', 86, 2, 'http://i.imgur.com/UGm0Av8.jpg'),
(115, 'Vidal', 'VOL', 'BayernMunich', '63750.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(116, 'Rakitic', 'VOL', 'Barcelona', '63750.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(117, 'Schweinsteiger', 'VOL', 'ManUtd', '63750.00', 85, NULL, 'http://media-titanium.cursecdn.com/attachments/68/14/basti-16.JPG'),
(118, 'Yaya Toure', 'VOL', 'ManCity', '63750.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(119, 'Verratti', 'VOL', 'PSG', '63000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(120, 'Pastore', 'VOL', 'PSG', '63000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(121, 'Gundogan', 'VOL', 'BorDortmund', '63000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(122, 'Pjanic', 'VOL', 'Roma', '63000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(123, 'Marchisio', 'VOL', 'Juventus', '63000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(124, 'Matuidi', 'VOL', 'PSG', '63000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(125, 'Xabi Alonso', 'VOL', 'BayernMunich', '63000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(126, 'Matic', 'VOL', 'Chelsea', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(127, 'Thiago', 'VOL', 'BayernMunich', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(128, 'Luiz Gustavo', 'VOL', 'Wolfsburg', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(129, 'Nainggolan', 'VOL', 'Roma', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(130, 'Xhaka', 'VOL', 'BorMochengladbach', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(131, 'Krychowiak', 'VOL', 'Sevilla', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(132, 'Parejo', 'VOL', 'Valencia', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(133, 'Ramsey', 'VOL', 'Arsenal', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(134, 'Bender', 'VOL', 'BorDortmund', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(135, 'Schneiderlin', 'VOL', 'ManUtd', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(136, 'Hamsik', 'VOL', 'Napoli', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(137, 'Diarra', 'VOL', 'Marseille', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(138, 'Toulalan', 'VOL', 'Monaco', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(139, 'De Rossi', 'VOL', 'Roma', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(140, 'T.Motta', 'VOL', 'PSG', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(141, 'Pirlo', 'VOL', 'NewYorkCityFootball', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(142, 'William Carvalho', 'VOL', 'Sporting', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(143, 'Medel', 'VOL', 'InterMilan', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(144, 'Ander Herrera', 'VOL', 'ManUtd', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(145, 'Iturraspe', 'VOL', 'AtlBilbao', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(146, 'Iborra', 'VOL', 'Sevilla', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(147, 'Wilshere', 'VOL', 'Arsenal', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(148, 'Bruno', 'VOL', 'Villareal', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(149, 'Khedira', 'VOL', 'Juventus', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(150, 'Witsel', 'VOL', 'Zenit', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(151, 'Guardado', 'VOL', 'PSV', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(152, 'Sahin', 'VOL', 'BorDortmund', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(153, 'G.Castro', 'VOL', 'BorDortmund', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(154, 'Biglia', 'VOL', 'Lazio', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(155, 'Robben', 'MEIA', 'BayernMunich', '66750.00', 89, 1, 'http://media-titanium.cursecdn.com/attachments/68/187/robben-16.JPG'),
(156, 'Hazard', 'MEIA', 'Chelsea', '66000.00', 88, NULL, 'http://media-titanium.cursecdn.com/attachments/68/188/hazard-16.JPG'),
(157, 'Ozil', 'MEIA', 'Arsenal', '66000.00', 88, 1, 'http://media-titanium.cursecdn.com/attachments/68/148/ozil-16.JPG'),
(158, 'James Rodriguez', 'MEIA', 'RealMadrid', '65250.00', 87, NULL, 'http://media-titanium.cursecdn.com/attachments/68/143/james-16.JPG'),
(159, 'De Bruyne', 'MEIA', 'ManCity', '64500.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(160, 'Reus', 'MEIA', 'BorDortmund', '64500.00', 86, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(161, 'David Silva', 'MEIA', 'ManCity', '64500.00', 86, 2, 'http://i.imgur.com/UGm0Av8.jpg'),
(162, 'Ribery', 'MEIA', 'BayernMunich', '64500.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(163, 'Mkhitaryan', 'MEIA', 'BorDortmund', '63750.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(164, 'Cazorla', 'MEIA', 'Arsenal', '63750.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(165, 'Isco', 'MEIA', 'RealMadrid', '63000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(166, 'Gotze', 'MEIA', 'BayernMunich', '63000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(167, 'Hulk', 'MEIA', 'Zenit', '63000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(168, 'Coutinho', 'MEIA', 'Liverpool', '63000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(169, 'Koke', 'MEIA', 'AtlMadrid', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(170, 'Douglas Costa', 'MEIA', 'BayernMunich', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(171, 'Eriksen', 'MEIA', 'Tottenham', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(172, 'Pedro', 'MEIA', 'Chelsea', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(173, 'Gaitan', 'MEIA', 'Benfica', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(174, 'Willian', 'MEIA', 'Chelsea', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(175, 'Mata', 'MEIA', 'ManUtd', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(176, 'Payet', 'MEIA', 'WestHam', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(177, 'João Moutinho', 'MEIA', 'Monaco', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(178, 'Turan', 'MEIA', 'Barcelona', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(179, 'Bellarabi', 'MEIA', 'BayerLeverkusen', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(180, 'Draxler', 'MEIA', 'Wolfsburg', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(181, 'Konoplyanka', 'MEIA', 'Sevilla', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(182, 'Kagawa', 'MEIA', 'BorDortmund', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(183, 'Oscar', 'MEIA', 'Chelsea', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(184, 'Nasri', 'MEIA', 'ManCity', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(185, 'Borja Valero', 'MEIA', 'Fiorentina', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(186, 'BenArfa', 'MEIA', 'OGCNice', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(187, 'Sneijder', 'MEIA', 'Galatasaray', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(188, 'Danny', 'MEIA', 'Zenit', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(189, 'Mahrez', 'MEIA', 'Leicester', '60750.00', 81, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(190, 'Sterling', 'MEIA', 'ManCity', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(191, 'Vitolo', 'MEIA', 'Sevilla', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(192, 'Hermann', 'MEIA', 'BorMochengladbach', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(193, 'Cuadrado', 'MEIA', 'Juventus', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(194, 'Perisic', 'MEIA', 'InterMilan', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(195, 'Banega', 'MEIA', 'Sevilla', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(196, 'Mertens', 'MEIA', 'Napoli', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(197, 'Raul Garcia', 'MEIA', 'AtlBilbao', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(198, 'Walcott', 'MEIA', 'Arsenal', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(199, 'Kaka', 'MEIA', 'OrlandoCity', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(200, 'Joao Mario', 'MEIA', 'Sporting', '60000.00', 80, 2, 'http://i.imgur.com/UGm0Av8.jpg'),
(201, 'LucasLima', 'MEIA', 'Santos', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(202, 'Carrasco', 'MEIA', 'AtlMadrid', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(203, 'Messi', 'PNT', 'Barcelona', '70500.00', 94, 1, 'https://pbs.twimg.com/media/CNrxOQrVAAAetgf.png'),
(204, 'Cristiano Ronaldo', 'PNT', 'RealMadrid', '69750.00', 93, 1, 'http://media-titanium.cursecdn.com/attachments/68/184/ronaldo-16.JPG'),
(205, 'Neymar', 'PNT', 'Barcelona', '67500.00', 90, 2, 'http://media-titanium.cursecdn.com/attachments/68/190/neymar-16.JPG'),
(206, 'Bale', 'PNT', 'RealMadrid', '65250.00', 87, NULL, 'http://media-titanium.cursecdn.com/attachments/68/57/bale-16.JPG'),
(207, 'DiMaria', 'PNT', 'PSG', '64500.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(208, 'Sanchez', 'PNT', 'Arsenal', '64500.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(209, 'Nani', 'PNT', 'Fenerbahce', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(210, 'Brahimi', 'PNT', 'Porto', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(211, 'Insigne', 'PNT', 'Napoli', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(212, 'Nolito', 'PNT', 'CeltaVigo', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(213, 'Vela', 'PNT', 'RealSociedad', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(214, 'Candreva', 'PNT', 'Lazio', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(215, 'Feghouli', 'PNT', 'Valencia', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(216, 'Callejon', 'PNT', 'Napoli', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(217, 'Lucas', 'PNT', 'PSG', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(218, 'Berardi', 'PNT', 'Sassuolo', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(219, 'Muniain', 'PNT', 'AtlBilbao', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(220, 'Orellana', 'PNT', 'CeltaVigo', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(221, 'Jese', 'PNT', 'RealMadrid', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(222, 'Salah', 'PNT', 'Roma', '60000.00', 80, 2, 'http://i.imgur.com/UGm0Av8.jpg'),
(223, 'Suarez', 'ATA', 'Barcelona', '67500.00', 90, NULL, 'http://media-titanium.cursecdn.com/attachments/68/185/suarez-16.JPG'),
(224, 'Ibrahimovic', 'ATA', 'PSG', '66750.00', 89, NULL, 'http://media-titanium.cursecdn.com/attachments/68/189/zlatan-16.JPG'),
(225, 'Lewandowski', 'ATA', 'BayernMunich', '66000.00', 88, 2, 'http://media-titanium.cursecdn.com/attachments/68/56/robert-16.JPG'),
(226, 'Aguero', 'ATA', 'ManCity', '66000.00', 88, 1, 'http://media-titanium.cursecdn.com/attachments/68/151/agueri-16.JPG'),
(227, 'Higuain', 'ATA', 'Napoli', '64500.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(228, 'Benzema', 'ATA', 'RealMadrid', '64500.00', 86, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(229, 'DiegoCosta', 'ATA', 'Chelsea', '63750.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(230, 'Cavani', 'ATA', 'PSG', '63750.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(231, 'Tevez', 'ATA', 'BocaJuniors', '63750.00', 85, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(232, 'Rooney', 'ATA', 'ManUtd', '63750.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(233, 'Griezzmann', 'ATA', 'AtlMadrid', '63000.00', 84, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(234, 'Aubameyang', 'ATA', 'BorDortmund', '63000.00', 84, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(235, 'Lacazette', 'ATA', 'Lyon', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(236, 'Jonas', 'ATA', 'Benfica', '62250.00', 83, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(237, 'Sturridge', 'ATA', 'Liverpool', '62250.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(238, 'Bacca', 'ATA', 'Milan', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(239, 'Kane', 'ATA', 'Tottenham', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(240, 'Lukaku', 'ATA', 'Everton', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(241, 'Mandzukic', 'ATA', 'Juventus', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(242, 'Giroud', 'ATA', 'Arsenal', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(243, 'Hernandez', 'ATA', 'BayerLeverkusen', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(244, 'Falcao', 'ATA', 'Chelsea', '61500.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(245, 'Aduriz', 'ATA', 'AtlBilbao', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(246, 'Dybala', 'ATA', 'Juventus', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(247, 'Van Persie', 'ATA', 'Fenerbahce', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(248, 'Mario Gomez', 'ATA', 'Besiktas', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(249, 'Huntelaar', 'ATA', 'Schalke04', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(250, 'Negredo', 'ATA', 'Valencia', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(251, 'David Villa', 'ATA', 'NewYorkCity', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(252, 'Drogba', 'ATA', 'MontrealImpact', '60750.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(253, 'Slimani', 'ATA', 'Sporting Lisboa', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(254, 'Icardi', 'ATA', 'Inter de Milão', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(255, 'Morata', 'ATA', 'Juventus', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(256, 'Immobile', 'ATA', 'Torino', '59250.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(257, 'Balotelli', 'ATA', 'Milan', '59250.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(258, 'Bony', 'ATA', 'Man City', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(259, 'Llorente', 'ATA', 'Sevilla', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(260, 'Benteke', 'ATA', 'Liverpool', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(261, 'Jovetic', 'ATA', 'Inter de Milão', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(262, 'Dzeko', 'ATA', 'Roma', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(263, 'Pato', 'ATA', 'Chelsea', '59250.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(264, 'Remy', 'ATA', 'Chelsea', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(265, 'Dempsey', 'ATA', 'Seattle Sounders', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(266, 'Berbatov', 'ATA', 'PAOK', '60000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(267, 'Vardy', 'ATA', 'Leicester City', '59250.00', 79, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(268, 'Ricardo Oliveira', 'ATA', 'Santos', '59250.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(269, 'Fernando Torres', 'ATA', 'Atl Madrid', '59250.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg');

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

--
-- Extraindo dados da tabela `partida`
--

INSERT INTO `partida` (`PartidaID`, `CampeonatoID`, `EquipeCasa`, `GolsCasa`, `EquipeFora`, `GolsFora`, `DataAbertura`, `DataReport`, `Rodada`) VALUES
(1, 1, 1, NULL, 2, NULL, '2016-06-27 00:00:00', NULL, 1),
(2, 1, 3, NULL, 1, NULL, '2016-07-01 00:00:00', NULL, 2),
(3, 1, 1, NULL, 4, NULL, '2016-07-06 00:00:00', NULL, 3);

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

--
-- Extraindo dados da tabela `transferencia`
--

INSERT INTO `transferencia` (`ID`, `EquipeSaida`, `EquipeEntrada`, `DataInicio`, `DataFim`, `Valor`, `Status`, `JogadorID`, `JogadorTrocaID`) VALUES
(1, 2, 1, '2016-06-05 13:27:53', '2016-06-18 23:17:59', '20000.00', 'Cancelado', 205, NULL),
(6, 1, 2, '2016-06-05 16:22:34', '2016-06-18 18:38:16', '1000.00', 'Concluido', 155, 161),
(5, 1, 2, '2016-06-05 16:22:00', '2016-06-18 18:38:10', '20000.00', 'Rejeitado', 226, NULL),
(4, 2, 1, '2016-06-05 14:29:45', '2016-06-18 23:18:10', '200.00', 'Cancelado', 225, 228),
(11, 1, 2, '2016-06-18 20:31:39', '2016-06-18 20:33:32', '70000.00', 'Concluido', 207, NULL),
(8, NULL, 1, '2016-06-18 19:09:56', '2016-06-18 19:09:56', '15000.00', 'Concluido', 253, NULL),
(9, NULL, 1, '2016-06-18 19:41:06', '2016-06-18 19:41:06', '41000.00', 'Concluido', 75, NULL),
(10, NULL, 1, '2016-06-18 19:43:29', '2016-06-18 19:43:29', '40000.00', 'Concluido', 202, NULL),
(12, 1, 2, '2016-06-18 20:32:44', '2016-06-18 20:33:37', '18000.00', 'Concluido', 193, NULL),
(13, NULL, 2, '2016-06-18 20:55:36', '2016-06-18 20:55:36', '42500.00', 'Concluido', 117, NULL),
(14, NULL, 5, '2016-06-18 21:07:56', '2016-06-18 21:07:56', '42000.00', 'Concluido', 26, NULL),
(15, NULL, 5, '2016-06-18 21:08:19', '2016-06-18 21:08:19', '42000.00', 'Concluido', 8, NULL),
(16, NULL, 5, '2016-06-18 21:08:31', '2016-06-18 21:08:31', '44000.00', 'Concluido', 226, NULL),
(17, NULL, 5, '2016-06-18 21:08:59', '2016-06-18 21:08:59', '42000.00', 'Concluido', 120, NULL),
(18, NULL, 4, '2016-06-18 22:04:21', '2016-06-18 22:04:21', '41000.00', 'Concluido', 17, NULL),
(19, NULL, 4, '2016-06-18 22:05:46', '2016-06-18 22:05:46', '45000.00', 'Concluido', 223, NULL),
(20, NULL, 4, '2016-06-18 22:07:51', '2016-06-18 22:07:51', '40500.00', 'Concluido', 31, NULL),
(21, NULL, 1, '2016-06-19 00:17:52', '2016-06-19 00:17:52', '41500.00', 'Concluido', 93, NULL),
(22, 2, 1, '2016-06-19 00:21:39', '2016-06-19 00:25:03', '40000.00', 'Concluido', 117, 231),
(23, NULL, 1, '2016-06-19 15:33:35', '2016-06-19 15:33:35', '41500.00', 'Concluido', 176, NULL),
(24, 1, NULL, '2016-06-19 16:24:31', '2016-06-19 16:24:31', '6150.00', 'Concluido', 182, NULL),
(25, 1, NULL, '2016-06-19 16:30:59', '2016-06-19 16:30:59', '6450.00', 'Concluido', 161, NULL),
(26, 1, NULL, '2016-06-19 16:36:57', '2016-06-19 16:36:57', '6225.00', 'Concluido', 175, NULL),
(27, 2, NULL, '2016-06-19 17:31:58', '2016-06-19 17:31:58', '6075.00', 'Concluido', 189, NULL),
(28, 2, NULL, '2016-06-19 17:35:14', '2016-06-19 17:35:14', '6300.00', 'Concluido', 166, NULL),
(29, 1, 2, '2016-06-19 17:43:15', NULL, '32000.00', 'Cancelado', 228, NULL),
(30, 1, 4, '2016-06-19 17:44:51', '2016-06-19 17:49:52', '38000.00', 'Concluido', 228, NULL),
(31, 1, 4, '2016-06-19 18:08:04', '2016-06-19 18:10:43', '80000.00', 'Cancelado', 160, NULL),
(32, 1, 2, '2016-06-19 18:08:38', '2016-06-19 18:10:43', '86000.00', 'Concluido', 160, NULL),
(33, 1, 5, '2016-06-19 18:09:21', '2016-06-19 18:10:43', '79000.00', 'Cancelado', 160, NULL),
(34, 2, 1, '2016-06-19 18:14:00', '2016-06-19 18:31:43', '30000.00', 'Concluido', 225, 233),
(35, NULL, 4, '2016-06-19 19:29:27', '2016-06-19 19:29:27', '40000.00', 'Concluido', 201, NULL),
(36, NULL, 1, '2016-06-19 19:33:19', '2016-06-19 19:33:19', '41000.00', 'Concluido', 21, NULL),
(37, NULL, 1, '2016-06-22 20:49:06', '2016-06-22 20:49:06', '59250.00', 'Concluido', 267, NULL),
(38, 1, NULL, '2016-06-22 20:56:59', '2016-06-22 20:56:59', '43050.00', 'Concluido', 185, NULL),
(39, 1, NULL, '2016-06-22 20:59:21', '2016-06-22 20:59:21', '42525.00', 'Concluido', 193, NULL),
(40, 2, 1, '2016-06-22 21:00:24', NULL, '70000.00', 'Aguardando', 2, NULL);

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
  `Admin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`ID`, `Nome`, `PSN`, `Email`, `Senha`, `Orcamento`, `Ativo`, `Admin`) VALUES
(1, 'Thiago Oliva', 'thiag6', 'thiagosfoliva@gmail.com', 'testes', '114350.00', 1, 1),
(2, 'Lucas Domingues', 'luped720', 'luped@galaticos', 'testes', '90125.00', 1, 0),
(3, 'Teste NÃ£o Aprovado', 'naoAtivo', 'teste', 'testes', '250000.00', 0, 0),
(4, 'Marreiros', 'marreiros10', 'marreiros', 'testes', '45500.00', 1, 0),
(5, 'Rangel', 'HBRangel', 'hbrangel@es', 'testes', '80000.00', 1, 0);

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
  MODIFY `EquipeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `grupo`
--
ALTER TABLE `grupo`
  MODIFY `Grupo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jogador`
--
ALTER TABLE `jogador`
  MODIFY `JogadorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;
--
-- AUTO_INCREMENT for table `partida`
--
ALTER TABLE `partida`
  MODIFY `PartidaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `ReportID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transferencia`
--
ALTER TABLE `transferencia`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
