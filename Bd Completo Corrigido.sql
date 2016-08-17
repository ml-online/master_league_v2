-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 17-Ago-2016 às 02:55
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
(1, 'Real Tijucanos', 'https://upload.wikimedia.org/wikipedia/pt/8/8f/Real_Noroeste_Capixaba_FC.png', 1),
(2, 'Alo Fc', 'http://static.wixstatic.com/media/a16a79_7387d73e90181ba6055c352c7c3a9f9f.png_256', 2),
(3, 'Nao Aprovado FC', 'http://www.clker.com/cliparts/t/m/N/L/J/Q/escudo.svg', 3),
(4, 'Marreirense FC', 'https://upload.wikimedia.org/wikipedia/commons/d/d6/Escudo_real_madrid_1908.png', 4),
(5, 'Campo Grande FC', 'http://4.bp.blogspot.com/-J0BWNcbgohE/VgHSw9vVjKI/AAAAAAAABYQ/4JFeMYczBi0/s1600/AECGFC-500x363.jpg', 5);

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

--
-- Extraindo dados da tabela `gol`
--

INSERT INTO `gol` (`JogadorID`, `PartidaID`, `ReportID`, `Qtd`) VALUES
(110, 1, 1, 3);

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
(1, 'Neuer', 'GOL', 'Bayern Munich', '90000.00', 90, NULL, 'http://media-titanium.cursecdn.com/attachments/68/186/neuer-16.JPG', 10),
(2, 'De Gea', 'GOL', 'ManUtd', '78300.00', 87, 1, 'http://media-titanium.cursecdn.com/attachments/68/64/degea-16.JPG', 9),
(3, 'Courtois', 'GOL', 'Chelsea', '77400.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 9),
(4, 'Cech', 'GOL', 'Arsenal', '68800.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 8),
(5, 'Lloris', 'GOL', 'Tottenham', '51000.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(6, 'Handanovic', 'GOL', 'InterMilan', '50400.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(7, 'Hart', 'GOL', 'ManCity', '58800.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(8, 'Buffon', 'GOL', 'Juventus', '67200.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 8),
(9, 'Leno', 'GOL', 'BayerLeverkusen', '49800.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(10, 'Fahrmann', 'GOL', 'Schalke04', '24900.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 3),
(11, 'Bravo', 'GOL', 'Barcelona', '58100.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(12, 'Ruffier', 'GOL', 'SaintEtienne', '24900.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 3),
(13, 'Mandanda', 'GOL', 'Marseille', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(14, 'Oblak', 'GOL', 'AtlMadrid', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(15, 'A.Lopes', 'GOL', 'Lyon', '32800.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(16, 'K.Navas', 'GOL', 'RealMadrid', '57400.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(17, 'Ter Stegen', 'GOL', 'Barcelona', '49200.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(18, 'K.Trapp', 'GOL', 'PSG', '32800.00', 82, 1, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(19, 'Muslera', 'GOL', 'Galatasaray', '32800.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(20, 'Sommer', 'GOL', 'BorussiaMonchengladbach', '8200.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 1),
(21, 'Begovic', 'GOL', 'Chelsea', '24600.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 3),
(22, 'Sirigu', 'GOL', 'PSG', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(23, 'Diego Alves', 'GOL', 'Valencia', '24600.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 3),
(24, 'Julio Cesar', 'GOL', 'Benfica', '16400.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 2),
(25, 'Lahm', 'LD', 'BayernMunich', '78300.00', 87, NULL, 'http://media-titanium.cursecdn.com/attachments/68/152/lahm-16.JPG', 9),
(26, 'Daniel Alves', 'LD', 'Barcelona', '67200.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 8),
(27, 'Carvajal', 'LD', 'RealMadrid', '49200.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(28, 'Zabaleta', 'LD', 'ManCity', '49200.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(29, 'Lichtsteiner', 'LD', 'Juventus', '49200.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(30, 'Aurier', 'LD', 'PSG', '32400.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(31, 'Darmian', 'LD', 'ManUtd', '32400.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(32, 'Coleman', 'LD', 'Everton', '24300.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 3),
(33, 'JuanFran', 'LD', 'AtlMadrid', '48600.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(34, 'Danilo', 'LD', 'RealMadrid', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(35, 'Mario Gaspar', 'LD', 'Villareal', '16000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 2),
(36, 'Clyne', 'LD', 'Liverpool', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(37, 'De Marcos', 'LD', 'AtlBilbao', '32000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(38, 'Smolnikov', 'LD', 'Zenit', '8000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 1),
(39, 'Ivanovic', 'LD', 'Chelsea', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(40, 'Piszczek', 'LD', 'BorDortmund', '56000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(41, 'Coke', 'LD', 'Sevilla', '16000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 2),
(42, 'Sagna', 'LD', 'ManCity', '40000.00', 80, 1, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(43, 'Thiago Silva', 'ZAG', 'PSG', '79200.00', 88, NULL, 'http://media-titanium.cursecdn.com/attachments/68/192/tsilva-16.JPG', 9),
(44, 'Boateng', 'ZAG', 'BayernMunich', '78300.00', 87, NULL, 'http://media-titanium.cursecdn.com/attachments/68/145/boateng-16.JPG', 9),
(45, 'Sergio Ramos', 'ZAG', 'RealMadrid', '78300.00', 87, NULL, 'http://media-titanium.cursecdn.com/attachments/68/150/ramos-16.JPG', 9),
(46, 'Godin', 'ZAG', 'AtlMadrid', '68800.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 8),
(47, 'Hummels', 'ZAG', 'BorDortmund', '68800.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 8),
(48, 'Chiellini', 'ZAG', 'Juventus', '68800.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 8),
(49, 'Miranda', 'ZAG', 'InterMilan', '59500.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(50, 'Pique', 'ZAG', 'Barcelona', '68000.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 8),
(51, 'Kompany', 'ZAG', 'ManCity', '68000.00', 85, 1, 'http://i.imgur.com/UGm0Av8.jpg', 8),
(52, 'Barzagli', 'ZAG', 'Juventus', '59500.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(53, 'Otamendi', 'ZAG', 'ManCity', '67200.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 8),
(54, 'Javi Martinez', 'ZAG', 'BayernMunich', '50400.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(55, 'Naldo', 'ZAG', 'Wolfsburg', '42000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(56, 'Koscielny', 'ZAG', 'Arsenal', '58800.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(57, 'Pepe', 'ZAG', 'RealMadrid', '58800.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(58, 'Terry', 'ZAG', 'Chelsea', '50400.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(59, 'Laporte', 'ZAG', 'AtlBilbao', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(60, 'Manolas', 'ZAG', 'Roma', '33200.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(61, 'Smalling', 'ZAG', 'ManUtd', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(62, 'Bonucci', 'ZAG', 'Juventus', '49800.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(63, 'David Luiz', 'ZAG', 'PSG', '58100.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(64, 'Howedes', 'ZAG', 'Schallke04', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(65, 'Benatia', 'ZAG', 'BayernMunich', '49800.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(66, 'Sokratis', 'ZAG', 'BorDortmund', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(67, 'Garay', 'ZAG', 'Zenit', '49800.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(68, 'Mascherano', 'ZAG', 'Barcelona', '58100.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(69, 'Mertesacker', 'ZAG', 'Arsenal', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(70, 'Varane', 'ZAG', 'RealMadrid', '57400.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(71, 'Mustafi', 'ZAG', 'Valencia', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(72, 'Glik', 'ZAG', 'Torino', '24600.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 3),
(73, 'Alderweireld', 'ZAG', 'Tottenham', '49200.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(74, 'Bender', 'ZAG', 'BorDortmund', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(75, 'Vertonghen', 'ZAG', 'Tottenham', '49200.00', 82, 1, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(76, 'Cahill', 'ZAG', 'Chelsea', '32800.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(77, 'Perrin', 'ZAG', 'SaintEtienne', '16400.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 2),
(78, 'Mathieu', 'ZAG', 'Barcelona', '32800.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(79, 'Gimenez', 'ZAG', 'AtlMadrid', '32400.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(80, 'Marquinhos', 'ZAG', 'PSG', '48600.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(81, 'Savic', 'ZAG', 'AtlMadrid', '24300.00', 81, 1, 'http://i.imgur.com/UGm0Av8.jpg', 3),
(82, 'De Vrij', 'ZAG', 'Lazio', '16200.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 2),
(83, 'Abdennour', 'ZAG', 'Valencia', '8100.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 1),
(84, 'Matip', 'ZAG', 'Schallke04', '24300.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 3),
(85, 'Musacchio', 'ZAG', 'Villareal', '16200.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 2),
(86, 'Toprak', 'ZAG', 'BayerLeverkusen', '16200.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 2),
(87, 'Jose Fonte', 'ZAG', 'Southampton', '16200.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 2),
(88, 'Skrtel', 'ZAG', 'Liverpool', '32400.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(89, 'Williams', 'ZAG', 'Swansea', '8100.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 1),
(90, 'Raul Albiol', 'ZAG', 'Napoli', '32400.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(91, 'Alaba', 'LE', 'BayernMunich', '68000.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 8),
(92, 'Jordi Alba', 'LE', 'Barcelona', '58800.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(93, 'Marcelo', 'LE', 'RealMadrid', '66400.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 8),
(94, 'R.Rodriguez', 'LE', 'Wolfsburg', '49200.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(95, 'Alex Sandro', 'LE', 'Juventus', '49200.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(96, 'Azpilicueta', 'LE', 'Chelsea', '57400.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(97, 'Filipe Luis', 'LE', 'AtlMadrid', '49200.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(98, 'Baines', 'LE', 'Everton', '49200.00', 82, 1, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(99, 'Tremoulinas', 'LE', 'Sevilla', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(100, 'Evra', 'LE', 'Juventus', '48600.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(101, 'Gaya', 'LE', 'Valencia', '24000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 3),
(102, 'Kurzawa', 'LE', 'PSG', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(103, 'Nacho Monreal', 'LE', 'Arsenal', '32000.00', 80, 1, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(104, 'Fabio Coentrao', 'LE', 'Monaco', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(105, 'Bernat', 'LE', 'BayernMunich', '23700.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 3),
(106, 'Balenziaga', 'LE', 'AtlBilbao', '23700.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 3),
(107, 'Jefferson', 'LE', 'Sporting', '7900.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 1),
(108, 'Gibbs', 'LE', 'Arsenal', '23700.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 3),
(109, 'Iniesta', 'VOL', 'Barcelona', '88000.00', 88, 1, 'http://media-titanium.cursecdn.com/attachments/68/142/iniesta-16.JPG', 10),
(110, 'Kroos', 'VOL', 'RealMadrid', '78300.00', 87, NULL, 'http://media-titanium.cursecdn.com/attachments/68/146/kroos-16.JPG', 9),
(111, 'Modric', 'VOL', 'RealMadrid', '69600.00', 87, NULL, 'http://media-titanium.cursecdn.com/attachments/68/147/modric-16.JPG', 8),
(112, 'Pogba', 'VOL', 'Juventus', '77400.00', 86, NULL, 'https://www.thesun.co.uk/wp-content/uploads/2016/03/2587251.main_image.jpg', 9),
(113, 'Busquets', 'VOL', 'Barcelona', '68800.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 8),
(114, 'Fabregas', 'VOL', 'Chelsea', '68800.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 8),
(115, 'Vidal', 'VOL', 'BayernMunich', '68000.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 8),
(116, 'Rakitic', 'VOL', 'Barcelona', '68000.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 8),
(117, 'Schweinsteiger', 'VOL', 'ManUtd', '59500.00', 85, NULL, 'http://media-titanium.cursecdn.com/attachments/68/14/basti-16.JPG', 7),
(118, 'Yaya Toure', 'VOL', 'ManCity', '68000.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 8),
(119, 'Verratti', 'VOL', 'PSG', '42000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(120, 'Pastore', 'VOL', 'PSG', '50400.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(121, 'Gundogan', 'VOL', 'BorDortmund', '50400.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(122, 'Pjanic', 'VOL', 'Roma', '50400.00', 84, 1, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(123, 'Marchisio', 'VOL', 'Juventus', '58800.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(124, 'Matuidi', 'VOL', 'PSG', '58800.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(125, 'Xabi Alonso', 'VOL', 'BayernMunich', '50400.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(126, 'Matic', 'VOL', 'Chelsea', '49800.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(127, 'Thiago', 'VOL', 'BayernMunich', '49800.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(128, 'Luiz Gustavo', 'VOL', 'Wolfsburg', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(129, 'Nainggolan', 'VOL', 'Roma', '58100.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(130, 'Xhaka', 'VOL', 'BorMochengladbach', '49200.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(131, 'Krychowiak', 'VOL', 'Sevilla', '32800.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(132, 'Parejo', 'VOL', 'Valencia', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(133, 'Ramsey', 'VOL', 'Arsenal', '49200.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(134, 'Bender', 'VOL', 'BorDortmund', '32800.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(135, 'Schneiderlin', 'VOL', 'ManUtd', '24600.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 3),
(136, 'Hamsik', 'VOL', 'Napoli', '57400.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(137, 'Diarra', 'VOL', 'Marseille', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(138, 'Toulalan', 'VOL', 'Monaco', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(139, 'De Rossi', 'VOL', 'Roma', '49200.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(140, 'Thiago Motta', 'VOL', 'PSG', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(141, 'Pirlo', 'VOL', 'NewYorkCityFootball', '49200.00', 82, 1, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(142, 'William Carvalho', 'VOL', 'Sporting', '16200.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 2),
(143, 'Medel', 'VOL', 'InterMilan', '32400.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(144, 'Ander Herrera', 'VOL', 'ManUtd', '32400.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(145, 'Iturraspe', 'VOL', 'AtlBilbao', '32400.00', 81, 1, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(146, 'Iborra', 'VOL', 'Sevilla', '8100.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 1),
(147, 'Wilshere', 'VOL', 'Arsenal', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(148, 'Bruno', 'VOL', 'Villareal', '8100.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 1),
(149, 'Khedira', 'VOL', 'Juventus', '48600.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(150, 'Witsel', 'VOL', 'Zenit', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(151, 'Guardado', 'VOL', 'PSV', '16200.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 2),
(152, 'Sahin', 'VOL', 'BorDortmund', '16200.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 2),
(153, 'G.Castro', 'VOL', 'BorDortmund', '16200.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 2),
(154, 'Biglia', 'VOL', 'Lazio', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(155, 'Robben', 'MEIA', 'BayernMunich', '80100.00', 89, NULL, 'http://media-titanium.cursecdn.com/attachments/68/187/robben-16.JPG', 9),
(156, 'Hazard', 'MEIA', 'Chelsea', '79200.00', 88, 1, 'http://media-titanium.cursecdn.com/attachments/68/188/hazard-16.JPG', 9),
(157, 'Ozil', 'MEIA', 'Arsenal', '70400.00', 88, NULL, 'http://media-titanium.cursecdn.com/attachments/68/148/ozil-16.JPG', 8),
(158, 'James Rodriguez', 'MEIA', 'RealMadrid', '69600.00', 87, NULL, 'http://media-titanium.cursecdn.com/attachments/68/143/james-16.JPG', 8),
(159, 'De Bruyne', 'MEIA', 'ManCity', '77400.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 9),
(160, 'Reus', 'MEIA', 'BorDortmund', '77400.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 9),
(161, 'David Silva', 'MEIA', 'ManCity', '60200.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(162, 'Ribery', 'MEIA', 'BayernMunich', '68800.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 8),
(163, 'Mkhitaryan', 'MEIA', 'BorDortmund', '59500.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(164, 'Cazorla', 'MEIA', 'Arsenal', '59500.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(165, 'Isco', 'MEIA', 'RealMadrid', '58800.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(166, 'Gotze', 'MEIA', 'BayernMunich', '58800.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(167, 'Hulk', 'MEIA', 'Zenit', '50400.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(168, 'Coutinho', 'MEIA', 'Liverpool', '58800.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(169, 'Koke', 'MEIA', 'AtlMadrid', '58100.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(170, 'Douglas Costa', 'MEIA', 'BayernMunich', '66400.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 8),
(171, 'Eriksen', 'MEIA', 'Tottenham', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(172, 'Pedro', 'MEIA', 'Chelsea', '58100.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(173, 'Gaitan', 'MEIA', 'Benfica', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(174, 'Willian', 'MEIA', 'Chelsea', '58100.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(175, 'Mata', 'MEIA', 'ManUtd', '49800.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(176, 'Payet', 'MEIA', 'WestHam', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(177, 'João Moutinho', 'MEIA', 'Monaco', '49800.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(178, 'Turan', 'MEIA', 'Barcelona', '58100.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(179, 'Bellarabi', 'MEIA', 'BayerLeverkusen', '32800.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(180, 'Draxler', 'MEIA', 'Wolfsburg', '49200.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(181, 'Konoplyanka', 'MEIA', 'Sevilla', '24600.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 3),
(182, 'Kagawa', 'MEIA', 'BorDortmund', '49200.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(183, 'Oscar', 'MEIA', 'Chelsea', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(184, 'Nasri', 'MEIA', 'ManCity', '49200.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(185, 'Borja Valero', 'MEIA', 'Fiorentina', '32800.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(186, 'Ben Arfa', 'MEIA', 'OGCNice', '32800.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(187, 'Sneijder', 'MEIA', 'Galatasaray', '49200.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(188, 'Danny', 'MEIA', 'Zenit', '24600.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 3),
(189, 'Mahrez', 'MEIA', 'Leicester', '48600.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(190, 'Sterling', 'MEIA', 'ManCity', '48600.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(191, 'Vitolo', 'MEIA', 'Sevilla', '16200.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 2),
(192, 'Hermann', 'MEIA', 'BorMochengladbach', '16200.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 2),
(193, 'Cuadrado', 'MEIA', 'Juventus', '56700.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(194, 'Perisic', 'MEIA', 'InterMilan', '32400.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(195, 'Banega', 'MEIA', 'Sevilla', '48600.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(196, 'Mertens', 'MEIA', 'Napoli', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(197, 'Raul Garcia', 'MEIA', 'AtlBilbao', '16200.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 2),
(198, 'Walcott', 'MEIA', 'Arsenal', '48600.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(199, 'Kaka', 'MEIA', 'OrlandoCity', '48600.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(200, 'Joao Mario', 'MEIA', 'Sporting', '8000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 1),
(201, 'LucasLima', 'MEIA', 'Santos', '24000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 3),
(202, 'Carrasco', 'MEIA', 'AtlMadrid', '24000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 3),
(203, 'Messi', 'PNT', 'Barcelona', '120000.00', 94, NULL, 'https://pbs.twimg.com/media/CNrxOQrVAAAetgf.png', 11),
(204, 'Cristiano Ronaldo', 'PNT', 'RealMadrid', '110000.00', 93, NULL, 'http://media-titanium.cursecdn.com/attachments/68/184/ronaldo-16.JPG', 11),
(205, 'Neymar', 'PNT', 'Barcelona', '90000.00', 90, NULL, 'http://media-titanium.cursecdn.com/attachments/68/190/neymar-16.JPG', 10),
(206, 'Bale', 'PNT', 'RealMadrid', '87000.00', 87, NULL, 'http://media-titanium.cursecdn.com/attachments/68/57/bale-16.JPG', 10),
(207, 'Di Maria', 'PNT', 'PSG', '68800.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 8),
(208, 'Sanchez', 'PNT', 'Arsenal', '68800.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 8),
(209, 'Nani', 'PNT', 'Fenerbahce', '57400.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(210, 'Brahimi', 'PNT', 'Porto', '24600.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 3),
(211, 'Insigne', 'PNT', 'Napoli', '32800.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(212, 'Nolito', 'PNT', 'CeltaVigo', '8200.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 1),
(213, 'Vela', 'PNT', 'RealSociedad', '40500.00', 81, 1, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(214, 'Candreva', 'PNT', 'Lazio', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(215, 'Feghouli', 'PNT', 'Valencia', '24300.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 3),
(216, 'Callejon', 'PNT', 'Napoli', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(217, 'Lucas', 'PNT', 'PSG', '48600.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(218, 'Berardi', 'PNT', 'Sassuolo', '16200.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 2),
(219, 'Muniain', 'PNT', 'AtlBilbao', '8000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 1),
(220, 'Orellana', 'PNT', 'CeltaVigo', '8000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 1),
(221, 'Jese', 'PNT', 'RealMadrid', '16000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 2),
(222, 'Salah', 'PNT', 'Roma', '24000.00', 80, 1, 'http://i.imgur.com/UGm0Av8.jpg', 3),
(223, 'Suarez', 'ATA', 'Barcelona', '90000.00', 90, NULL, 'http://media-titanium.cursecdn.com/attachments/68/185/suarez-16.JPG', 10),
(224, 'Ibrahimovic', 'ATA', 'PSG', '89000.00', 89, NULL, 'http://media-titanium.cursecdn.com/attachments/68/189/zlatan-16.JPG', 10),
(225, 'Lewandowski', 'ATA', 'BayernMunich', '88000.00', 88, NULL, 'http://media-titanium.cursecdn.com/attachments/68/56/robert-16.JPG', 10),
(226, 'Aguero', 'ATA', 'ManCity', '79200.00', 88, NULL, 'http://media-titanium.cursecdn.com/attachments/68/151/agueri-16.JPG', 9),
(227, 'Higuain', 'ATA', 'Napoli', '60200.00', 86, 1, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(228, 'Benzema', 'ATA', 'RealMadrid', '77400.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 9),
(229, 'Diego Costa', 'ATA', 'Chelsea', '68000.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 8),
(230, 'Cavani', 'ATA', 'PSG', '76500.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 9),
(231, 'Tevez', 'ATA', 'BocaJuniors', '59500.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(232, 'Rooney', 'ATA', 'ManUtd', '76500.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 9),
(233, 'Griezzmann', 'ATA', 'AtlMadrid', '67200.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 8),
(234, 'Aubameyang', 'ATA', 'BorDortmund', '58800.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(235, 'Lacazette', 'ATA', 'Lyon', '49800.00', 83, 1, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(236, 'Jonas', 'ATA', 'Benfica', '49800.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(237, 'Sturridge', 'ATA', 'Liverpool', '49800.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(238, 'Bacca', 'ATA', 'Milan', '32800.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(239, 'Kane', 'ATA', 'Tottenham', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(240, 'Lukaku', 'ATA', 'Everton', '49200.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(241, 'Mandzukic', 'ATA', 'Juventus', '57400.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(242, 'Giroud', 'ATA', 'Arsenal', '49200.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(243, 'Chicharito', 'ATA', 'BayerLeverkusen', '32800.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(244, 'Falcao', 'ATA', 'Chelsea', '49200.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(245, 'Aduriz', 'ATA', 'AtlBilbao', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(246, 'Dybala', 'ATA', 'Juventus', '48600.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(247, 'Van Persie', 'ATA', 'Fenerbahce', '56700.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(248, 'Mario Gomez', 'ATA', 'Besiktas', '32400.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(249, 'Huntelaar', 'ATA', 'Schalke04', '32400.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(250, 'Negredo', 'ATA', 'Valencia', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(251, 'David Villa', 'ATA', 'NewYorkCity', '56700.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(252, 'Drogba', 'ATA', 'MontrealImpact', '48600.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(253, 'Slimani', 'ATA', 'Sporting Lisboa', '16000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 2),
(254, 'Icardi', 'ATA', 'Inter de Milão', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(255, 'Morata', 'ATA', 'Juventus', '48000.00', 80, 1, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(256, 'Immobile', 'ATA', 'Torino', '23700.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 3),
(257, 'Balotelli', 'ATA', 'Milan', '55300.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(258, 'Bony', 'ATA', 'Man City', '24000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 3),
(259, 'Llorente', 'ATA', 'Sevilla', '32000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(260, 'Benteke', 'ATA', 'Liverpool', '48000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(261, 'Jovetic', 'ATA', 'Inter de Milão', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(262, 'Dzeko', 'ATA', 'Roma', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(263, 'Pato', 'ATA', 'Chelsea', '39500.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(264, 'Remy', 'ATA', 'Chelsea', '32000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 4),
(265, 'Dempsey', 'ATA', 'Seattle Sounders', '16000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 2),
(266, 'Berbatov', 'ATA', 'PAOK', '16000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 2),
(267, 'Vardy', 'ATA', 'Leicester City', '47400.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(268, 'Ricardo Oliveira', 'ATA', 'Santos', '15800.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 2),
(269, 'Fernando Torres', 'ATA', 'Atl Madrid', '55300.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 7),
(270, 'Ivanovic', 'LD', 'Chelsea', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 5),
(271, 'Clichy', 'LE', 'ManCity', '48000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg', 6),
(272, 'Romero', 'GOL', 'ManUnited', '38000.00', 76, NULL, NULL, 5),
(273, 'Helton', 'GOL', 'Porto', '24300.00', 81, NULL, NULL, 3),
(274, 'Casillas', 'GOL', 'Porto', '50400.00', 84, NULL, NULL, 6),
(275, 'Cillessen', 'GOL', 'Ajax', '32800.00', 82, NULL, NULL, 4),
(276, 'Çalhanoglu', 'MEI', 'Bayer Leverkusen', '39000.00', 78, NULL, NULL, 5),
(277, 'Vargas', 'ATA', 'Hoffenheim', '31200.00', 78, NULL, NULL, 4),
(278, 'Memphis Depay', 'PE', 'Manchester United', '40500.00', 81, NULL, NULL, 5),
(279, 'El Shaarawy', 'PE', 'Roma', '40000.00', 80, NULL, NULL, 5);

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

--
-- Extraindo dados da tabela `jogadorpack`
--

INSERT INTO `jogadorpack` (`JogadorID`, `PackID`, `NomeJogador`, `TipoPack`) VALUES
(2, 1, 'De Gea', 'T'),
(42, 1, 'Sagna', 'T'),
(51, 1, 'Kompany', 'T'),
(98, 1, 'Baines', 'T'),
(103, 1, 'Nacho Monreal', 'T'),
(109, 1, 'Iniesta', 'T'),
(122, 1, 'Pjanic', 'T'),
(141, 1, 'Pirlo', 'T'),
(156, 1, 'Hazard', 'T'),
(204, 14, 'Cristiano Ronaldo', 'T'),
(227, 1, 'Higuain', 'T'),
(5, 2, 'Lloris', 'T'),
(39, 2, 'Ivanovic', 'T'),
(58, 2, 'Terry', 'T'),
(68, 2, 'Mascherano', 'T'),
(88, 2, 'Skrtel', 'T'),
(129, 2, 'Nainggolan', 'T'),
(149, 2, 'Khedira', 'T'),
(157, 2, 'Ozil', 'T'),
(224, 2, 'Ibrahimovic', 'T'),
(228, 2, 'Benzema', 'T'),
(270, 2, 'Ivanovic', 'T'),
(26, 3, 'Daniel Alves', 'T'),
(27, 3, 'Carvajal', 'T'),
(102, 3, 'Kurzawa', 'T'),
(114, 3, 'Fabregas', 'T'),
(139, 3, 'De Rossi', 'T'),
(155, 3, 'Robben', 'T'),
(170, 3, 'Douglas Costa', 'T'),
(203, 3, 'Messi', 'T'),
(241, 3, 'Mandzukic', 'T'),
(272, 3, 'Romero', 'T'),
(11, 4, 'Bravo', 'T'),
(52, 4, 'Barzagli', 'T'),
(62, 4, 'Bonucci', 'T'),
(66, 4, 'Sokratis', 'T'),
(79, 4, 'Gimenez', 'T'),
(125, 4, 'Xabi Alonso', 'T'),
(160, 4, 'Reus', 'T'),
(168, 4, 'Coutinho', 'T'),
(174, 4, 'Willian', 'T'),
(223, 4, 'Suarez', 'T'),
(232, 4, 'Rooney', 'T'),
(73, 3, 'Alderweireld', 'T'),
(8, 5, 'Buffon', 'T'),
(33, 5, 'JuanFran', 'T'),
(50, 5, 'Pique', 'T'),
(55, 5, 'Naldo', 'T'),
(80, 5, 'Marquinhos', 'T'),
(118, 5, 'Yaya Toure', 'T'),
(159, 5, 'De Bruyne', 'T'),
(167, 5, 'Hulk', 'T'),
(189, 5, 'Mahrez', 'T'),
(225, 5, 'Lewandowski', 'T'),
(231, 5, 'Tevez', 'T'),
(7, 6, 'Hart', 'T'),
(48, 6, 'Chiellini', 'T'),
(69, 6, 'Mertesacker', 'T'),
(76, 6, 'Cahill', 'T'),
(97, 6, 'Filipe Luis', 'T'),
(112, 6, 'Pogba', 'T'),
(147, 6, 'Wilshere', 'T'),
(165, 6, 'Isco', 'T'),
(180, 6, 'Draxler', 'T'),
(205, 6, 'Neymar', 'T'),
(206, 6, 'Bale', 'T'),
(9, 7, 'Leno', 'T'),
(28, 7, 'Zabaleta', 'T'),
(34, 7, 'Danilo', 'T'),
(47, 7, 'Hummels', 'T'),
(64, 7, 'Howedes', 'T'),
(138, 7, 'Toulalan', 'T'),
(164, 7, 'Cazorla', 'T'),
(193, 7, 'Cuadrado', 'T'),
(208, 7, 'Sanchez', 'T'),
(230, 7, 'Cavani', 'T'),
(110, 7, 'Kroos', 'T'),
(6, 8, 'Handanovic', 'T'),
(31, 8, 'Darmian', 'T'),
(53, 8, 'Otamendi', 'T'),
(63, 8, 'David Luiz', 'T'),
(95, 8, 'Alex Sandro', 'T'),
(121, 8, 'Gundogan', 'T'),
(162, 8, 'Ribery', 'T'),
(166, 8, 'Gotze', 'T'),
(173, 8, 'Gaitan', 'T'),
(207, 8, 'Di Maria', 'T'),
(229, 8, 'Diego Costa', 'T'),
(17, 9, 'Ter Stegen', 'T'),
(40, 9, 'Piszczek', 'T'),
(67, 9, 'Garay', 'T'),
(91, 9, 'Alaba', 'T'),
(93, 9, 'Marcelo', 'T'),
(124, 9, 'Matuidi', 'T'),
(127, 9, 'Thiago', 'T'),
(190, 9, 'Sterling', 'T'),
(233, 9, 'Griezzmann', 'T'),
(252, 9, 'Drogba', 'T'),
(158, 9, 'James Rodriguez', 'T'),
(46, 10, 'Godin', 'T'),
(49, 10, 'Miranda', 'T'),
(61, 10, 'Smalling', 'T'),
(111, 10, 'Modric', 'T'),
(115, 10, 'Vidal', 'T'),
(171, 10, 'Eriksen', 'T'),
(184, 10, 'Nasri', 'T'),
(217, 10, 'Lucas', 'T'),
(226, 10, 'Aguero', 'T'),
(94, 10, 'R.Rodriguez', 'T'),
(274, 10, 'Casillas', 'T'),
(3, 11, 'Courtois', 'T'),
(36, 11, 'Clyne', 'T'),
(44, 11, 'Boateng', 'T'),
(54, 11, 'Javi Martinez', 'T'),
(70, 11, 'Varane', 'T'),
(116, 11, 'Rakitic', 'T'),
(126, 11, 'Matic', 'T'),
(172, 11, 'Pedro', 'T'),
(260, 11, 'Benteke', 'T'),
(276, 11, 'Çalhanoglu', 'T'),
(257, 11, 'Balotelli', 'T'),
(234, 12, 'Aubameyang', 'T'),
(1, 12, 'Neuer', 'T'),
(45, 12, 'Sergio Ramos', 'T'),
(96, 12, 'Azpilicueta', 'T'),
(100, 12, 'Evra', 'T'),
(104, 12, 'Fabio Coentrao', 'T'),
(113, 12, 'Busquets', 'T'),
(119, 12, 'Verratti', 'T'),
(136, 12, 'Hamsik', 'T'),
(199, 12, 'Kaka', 'T'),
(240, 12, 'Lukaku', 'T'),
(4, 13, 'Cech', 'T'),
(25, 13, 'Lahm', 'T'),
(56, 13, 'Koscielny', 'T'),
(57, 13, 'Pepe', 'T'),
(161, 13, 'David Silva', 'T'),
(169, 13, 'Koke', 'T'),
(246, 13, 'Dybala', 'T'),
(29, 13, 'Lichtsteiner', 'T'),
(140, 13, 'Thiago Motta', 'T'),
(247, 13, 'Van Persie', 'T'),
(30, 14, 'Aurier', 'T'),
(43, 14, 'Thiago Silva', 'T'),
(65, 14, 'Benatia', 'T'),
(92, 14, 'Jordi Alba', 'T'),
(163, 14, 'Mkhitaryan', 'T'),
(176, 14, 'Payet', 'T'),
(178, 14, 'Turan', 'T'),
(196, 14, 'Mertens', 'T'),
(267, 14, 'Vardy', 'T'),
(16, 14, 'K.Navas', 'T'),
(235, 1, 'Lacazette', 'T'),
(13, 15, 'Mandanda', 'R'),
(72, 15, 'Glik', 'R'),
(85, 15, 'Musacchio', 'R'),
(197, 15, 'Raul Garcia', 'R'),
(236, 15, 'Jonas', 'R'),
(244, 15, 'Falcao', 'R'),
(245, 15, 'Aduriz', 'R'),
(12, 16, 'Ruffier', 'R'),
(35, 16, 'Mario Gaspar', 'R'),
(38, 16, 'Smolnikov', 'R'),
(200, 16, 'Joao Mario', 'R'),
(212, 16, 'Nolito', 'R'),
(237, 16, 'Sturridge', 'R'),
(243, 16, 'Chicharito', 'R'),
(101, 17, 'Gaya', 'R'),
(106, 17, 'Balenziaga', 'R'),
(209, 17, 'Nani', 'R'),
(219, 17, 'Muniain', 'R'),
(242, 17, 'Giroud', 'R'),
(15, 17, 'A.Lopes', 'R'),
(153, 17, 'G.Castro', 'R'),
(60, 18, 'Manolas', 'R'),
(83, 18, 'Abdennour', 'R'),
(146, 18, 'Iborra', 'R'),
(214, 18, 'Candreva', 'R'),
(253, 18, 'Slimani', 'R'),
(259, 18, 'Llorente', 'R'),
(273, 18, 'Helton', 'R'),
(10, 19, 'Fahrmann', 'R'),
(32, 19, 'Coleman', 'R'),
(107, 19, 'Jefferson', 'R'),
(135, 19, 'Schneiderlin', 'R'),
(254, 19, 'Icardi', 'R'),
(264, 19, 'Remy', 'R'),
(265, 19, 'Dempsey', 'R'),
(22, 20, 'Sirigu', 'R'),
(87, 20, 'Jose Fonte', 'R'),
(108, 20, 'Gibbs', 'R'),
(194, 20, 'Perisic', 'R'),
(211, 20, 'Insigne', 'R'),
(258, 20, 'Bony', 'R'),
(263, 20, 'Pato', 'R'),
(24, 21, 'Julio Cesar', 'R'),
(82, 21, 'De Vrij', 'R'),
(86, 21, 'Toprak', 'R'),
(202, 21, 'Carrasco', 'R'),
(250, 21, 'Negredo', 'R'),
(266, 21, 'Berbatov', 'R'),
(277, 21, 'Vargas', 'R'),
(183, 22, 'Oscar', 'R'),
(220, 22, 'Orellana', 'R'),
(262, 22, 'Dzeko', 'R'),
(275, 22, 'Cillessen', 'R'),
(89, 22, 'Williams', 'R'),
(90, 22, 'Raul Albiol', 'R'),
(278, 22, 'Memphis Depay', 'R'),
(20, 23, 'Sommer', 'R'),
(99, 23, 'Tremoulinas', 'R'),
(105, 23, 'Bernat', 'R'),
(185, 23, 'Borja Valero', 'R'),
(239, 23, 'Kane', 'R'),
(249, 23, 'Huntelaar', 'R'),
(279, 23, 'El Shaarawy', 'R'),
(23, 24, 'Diego Alves', 'R'),
(37, 24, 'De Marcos', 'R'),
(41, 24, 'Coke', 'R'),
(186, 24, 'Ben Arfa', 'R'),
(221, 24, 'Jese', 'R'),
(238, 24, 'Bacca', 'R'),
(248, 24, 'Mario Gomez', 'R'),
(14, 25, 'Oblak', 'R'),
(78, 25, 'Mathieu', 'R'),
(84, 25, 'Matip', 'R'),
(143, 25, 'Medel', 'R'),
(256, 25, 'Immobile', 'R'),
(268, 25, 'Ricardo Oliveira', 'R'),
(251, 25, 'David Villa', 'R'),
(75, 26, 'Vertonghen', 'R'),
(81, 26, 'Savic', 'R'),
(145, 26, 'Iturraspe', 'R'),
(213, 26, 'Vela', 'R'),
(222, 26, 'Salah', 'R'),
(255, 26, 'Morata', 'R'),
(18, 26, 'K.Trapp', 'R'),
(19, 27, 'Muslera', 'R'),
(71, 27, 'Mustafi', 'R'),
(74, 27, 'Bender', 'R'),
(132, 27, 'Parejo', 'R'),
(134, 27, 'Bender', 'R'),
(210, 27, 'Brahimi', 'R'),
(218, 27, 'Berardi', 'R'),
(21, 28, 'Begovic', 'R'),
(59, 28, 'Laporte', 'R'),
(77, 28, 'Perrin', 'R'),
(179, 28, 'Bellarabi', 'R'),
(215, 28, 'Feghouli', 'R'),
(216, 28, 'Callejon', 'R'),
(261, 28, 'Jovetic', 'R'),
(150, 13, 'Witsel', 'T');

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

--
-- Extraindo dados da tabela `noticia`
--

INSERT INTO `noticia` (`NoticiaID`, `Titulo`, `Texto`, `Imagem`) VALUES
(1, 'Noticia teste', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', 'http://s2.glbimg.com/cvgaUl6eMafZubIbijclg5jqy9w=/0x0:2000x1332/690x460/s.glbimg.com/es/ge/f/original/2016/07/10/2016-07-10t221026z_111190226_mt1aci14477971_rtrmadp_3_soccer-euro-por-fra_Hak3ss1.jpg'),
(2, 'This is a News Test', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?', 'http://img.emol.com/2012/11/27/tonnacionalfilas600_9730.jpg'),
(3, 'Teste Noticia sem Imagem', 'Esta notícia não tem imagem.', NULL);

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
(5, 'T', 0),
(6, 'T', 0),
(7, 'T', 0),
(8, 'T', 0),
(9, 'T', 0),
(10, 'T', 0),
(11, 'T', 0),
(12, 'T', 0),
(13, 'T', 0),
(14, 'T', 0),
(15, 'R', 0),
(16, 'R', 0),
(17, 'R', 0),
(18, 'R', 0),
(19, 'R', 0),
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

--
-- Extraindo dados da tabela `partida`
--

INSERT INTO `partida` (`PartidaID`, `CampeonatoID`, `EquipeCasa`, `GolsCasa`, `EquipeFora`, `GolsFora`, `DataAbertura`, `DataReport`, `Rodada`) VALUES
(1, 1, 1, NULL, 2, NULL, '2016-06-27 00:00:00', NULL, 1),
(2, 1, 2, NULL, 1, NULL, '2016-07-01 00:00:00', NULL, 2),
(3, 1, 1, NULL, 4, NULL, '2016-07-06 00:00:00', NULL, 3),
(4, 1, 2, NULL, 4, NULL, '2016-06-30 00:00:00', NULL, 2),
(5, 1, 4, NULL, 2, NULL, '2016-07-06 00:00:00', NULL, 3);

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
(1, 'Thiago Oliva', 'thiag6', 'thiagosfoliva@gmail.com', 'testes', '114350.00', 1, 1, 0),
(2, 'Lucas Domingues', 'luped720', 'luped@galaticos', 'testes', '90125.00', 1, 0, 1),
(3, 'Teste NÃ£o Aprovado', 'naoAtivo', 'teste', 'testes', '250000.00', 0, 0, 1),
(4, 'Marreiros', 'marreiros10', 'marreiros', 'testes', '45500.00', 1, 0, 1),
(5, 'Rangel', 'HBRangel', 'hbrangel@es', 'testes', '80000.00', 1, 0, 1);

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
  MODIFY `JogadorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=280;
--
-- AUTO_INCREMENT for table `partida`
--
ALTER TABLE `partida`
  MODIFY `PartidaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `ReportID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transferencia`
--
ALTER TABLE `transferencia`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
