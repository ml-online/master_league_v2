-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 16-Jun-2016 às 03:55
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
-- Estrutura da tabela `classificacao`
--
DROP TABLE IF EXISTS classificacao;
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

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipe`
--
DROP TABLE IF EXISTS equipe;
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
(2, 'Alo Fc', NULL, 2),
(3, 'Nao Aprovado FC', 'NÃ£o Cadastrado', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo`
--
DROP TABLE IF EXISTS grupo;
CREATE TABLE `grupo` (
  `Grupo` int(11) NOT NULL,
  `NomeGrupo` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogador`
--
DROP TABLE IF EXISTS jogador;
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
(1, 'Neuer', 'GOL', 'Bayern Munich', NULL, 90, 1, 'http://media-titanium.cursecdn.com/attachments/68/186/neuer-16.JPG'),
(2, 'De Gea', 'GOL', 'ManUtd', NULL, 87, 2, 'http://media-titanium.cursecdn.com/attachments/68/64/degea-16.JPG'),
(3, 'Courtois', 'GOL', 'Chelsea', NULL, 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(4, 'Cech', 'GOL', 'Arsenal', NULL, 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(5, 'Lloris', 'GOL', 'Tottenham', NULL, 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(6, 'Handanovic', 'GOL', 'InterMilan', NULL, 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(7, 'Hart', 'GOL', 'ManCity', NULL, 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(8, 'Buffon', 'GOL', 'Juventus', NULL, 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(9, 'Leno', 'GOL', 'BayerLeverkusen', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(10, 'Fahrmann', 'GOL', 'Schalke04', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(11, 'Bravo', 'GOL', 'Barcelona', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(12, 'Ruffier', 'GOL', 'SaintEtienne', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(13, 'Mandanda', 'GOL', 'Marseille', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(14, 'Oblak', 'GOL', 'AtlMadrid', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(15, 'A.Lopes', 'GOL', 'Lyon', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(16, 'K.Navas', 'GOL', 'RealMadrid', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(17, 'Ter Stegen', 'GOL', 'Barcelona', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(18, 'K.Trapp', 'GOL', 'PSG', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(19, 'Muslera', 'GOL', 'Galatasaray', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(20, 'Sommer', 'GOL', 'BorussiaMonchengladbach', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(21, 'Begovic', 'GOL', 'Chelsea', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(22, 'Sirigu', 'GOL', 'PSG', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(23, 'Diego Alves', 'GOL', 'Valencia', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(24, 'Julio Cesar', 'GOL', 'Benfica', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(25, 'Lahm', 'LD', 'BayernMunich', NULL, 87, NULL, 'http://media-titanium.cursecdn.com/attachments/68/152/lahm-16.JPG'),
(26, 'Dani Alves', 'LD', 'Barcelona', NULL, 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(27, 'Carvajal', 'LD', 'RealMadrid', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(28, 'Zabaleta', 'LD', 'ManCity', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(29, 'Lichtsteiner', 'LD', 'Juventus', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(30, 'Aurier', 'LD', 'PSG', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(31, 'Darmian', 'LD', 'ManUtd', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(32, 'Coleman', 'LD', 'Everton', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(33, 'JuanFran', 'LD', 'AtlMadrid', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(34, 'Danilo', 'LD', 'RealMadrid', NULL, 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(35, 'Mario Gaspar', 'LD', 'Villareal', NULL, 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(36, 'Clyne', 'LD', 'Liverpool', NULL, 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(37, 'De Marcos', 'LD', 'AtlBilbao', NULL, 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(38, 'Smolnikov', 'LD', 'Zenit', NULL, 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(39, 'Ivanovic', 'LD', 'Chelsea', NULL, 80, 2, 'http://i.imgur.com/UGm0Av8.jpg'),
(40, 'Piszczek', 'LD', 'BorDortmund', NULL, 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(41, 'Coke', 'LD', 'Sevilla', NULL, 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(42, 'Sagna', 'LD', 'ManCity', NULL, 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(43, 'Thiago Silva', 'ZAG', 'PSG', NULL, 88, 1, 'http://media-titanium.cursecdn.com/attachments/68/192/tsilva-16.JPG'),
(44, 'Boateng', 'ZAG', 'BayernMunich', NULL, 87, 1, 'http://media-titanium.cursecdn.com/attachments/68/145/boateng-16.JPG'),
(45, 'Sergio Ramos', 'ZAG', 'RealMadrid', NULL, 87, 1, 'http://media-titanium.cursecdn.com/attachments/68/150/ramos-16.JPG'),
(46, 'Godin', 'ZAG', 'AtlMadrid', NULL, 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(47, 'Hummels', 'ZAG', 'BorDortmund', NULL, 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(48, 'Chiellini', 'ZAG', 'Juventus', NULL, 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(49, 'Miranda', 'ZAG', 'InterMilan', NULL, 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(50, 'Pique', 'ZAG', 'Barcelona', NULL, 85, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(51, 'Kompany', 'ZAG', 'ManCity', NULL, 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(52, 'Barzagli', 'ZAG', 'Juventus', NULL, 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(53, 'Otamendi', 'ZAG', 'ManCity', NULL, 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(54, 'Javi Martinez', 'ZAG', 'BayernMunich', NULL, 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(55, 'Naldo', 'ZAG', 'Wolfsburg', NULL, 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(56, 'Koscielny', 'ZAG', 'Arsenal', NULL, 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(57, 'Pepe', 'ZAG', 'RealMadrid', NULL, 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(58, 'Terry', 'ZAG', 'Chelsea', NULL, 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(59, 'Laporte', 'ZAG', 'AtlBilbao', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(60, 'Manolas', 'ZAG', 'Roma', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(61, 'Smalling', 'ZAG', 'ManUtd', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(62, 'Bonucci', 'ZAG', 'Juventus', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(63, 'David Luiz', 'ZAG', 'PSG', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(64, 'Howedes', 'ZAG', 'Schallke04', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(65, 'Benatia', 'ZAG', 'BayernMunich', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(66, 'Sokratis', 'ZAG', 'BorDortmund', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(67, 'Garay', 'ZAG', 'Zenit', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(68, 'Mascherano', 'ZAG', 'Barcelona', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(69, 'Mertesacker', 'ZAG', 'Arsenal', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(70, 'Varane', 'ZAG', 'RealMadrid', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(71, 'Mustafi', 'ZAG', 'Valencia', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(72, 'Glik', 'ZAG', 'Torino', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(73, 'Alderweireld', 'ZAG', 'Tottenham', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(74, 'Bender', 'ZAG', 'BorDortmund', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(75, 'Vertonghen', 'ZAG', 'Tottenham', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(76, 'Cahill', 'ZAG', 'Chelsea', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(77, 'Perrin', 'ZAG', 'SaintEtienne', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(78, 'Mathieu', 'ZAG', 'Barcelona', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(79, 'Gimenez', 'ZAG', 'AtlMadrid', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(80, 'Marquinhos', 'ZAG', 'PSG', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(81, 'Savic', 'ZAG', 'AtlMadrid', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(82, 'De Vrij', 'ZAG', 'Lazio', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(83, 'Abdennour', 'ZAG', 'Valencia', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(84, 'Matip', 'ZAG', 'Schallke04', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(85, 'Musacchio', 'ZAG', 'Villareal', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(86, 'Toprak', 'ZAG', 'BayerLeverkusen', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(87, 'Jose Fonte', 'ZAG', 'Southampton', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(88, 'Skrtel', 'ZAG', 'Liverpool', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(89, 'Williams', 'ZAG', 'Swansea', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(90, 'Raul Albiol', 'ZAG', 'Napoli', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(91, 'Alaba', 'LE', 'BayernMunich', NULL, 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(92, 'Jordi Alba', 'LE', 'Barcelona', NULL, 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(93, 'Marcelo', 'LE', 'RealMadrid', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(94, 'R.Rodriguez', 'LE', 'Wolfsburg', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(95, 'Alex Sandro', 'LE', 'Juventus', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(96, 'Azpilicueta', 'LE', 'Chelsea', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(97, 'Filipe Luis', 'LE', 'AtlMadrid', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(98, 'Baines', 'LE', 'Everton', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(99, 'Tremoulinas', 'LE', 'Sevilla', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(100, 'Evra', 'LE', 'Juventus', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(101, 'Gaya', 'LE', 'Valencia', NULL, 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(102, 'Kurzawa', 'LE', 'PSG', NULL, 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(103, 'Nacho Monreal', 'LE', 'Arsenal', NULL, 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(104, 'Fabio Coentrao', 'LE', 'Monaco', NULL, 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(105, 'Bernat', 'LE', 'BayernMunich', NULL, 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(106, 'Balenziaga', 'LE', 'AtlBilbao', NULL, 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(107, 'Jefferson', 'LE', 'Sporting', NULL, 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(108, 'Gibbs', 'LE', 'Arsenal', NULL, 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(109, 'Iniesta', 'VOL', 'Barcelona', NULL, 88, NULL, 'http://media-titanium.cursecdn.com/attachments/68/142/iniesta-16.JPG'),
(110, 'Kroos', 'VOL', 'RealMadrid', NULL, 87, 1, 'http://media-titanium.cursecdn.com/attachments/68/146/kroos-16.JPG'),
(111, 'Modric', 'VOL', 'RealMadrid', NULL, 87, 1, 'http://media-titanium.cursecdn.com/attachments/68/147/modric-16.JPG'),
(112, 'Pogba', 'VOL', 'Juventus', NULL, 86, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(113, 'Busquets', 'VOL', 'Barcelona', NULL, 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(114, 'Fabregas', 'VOL', 'Chelsea', NULL, 86, 2, 'http://i.imgur.com/UGm0Av8.jpg'),
(115, 'Vidal', 'VOL', 'BayernMunich', NULL, 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(116, 'Rakitic', 'VOL', 'Barcelona', NULL, 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(117, 'Schweinsteiger', 'VOL', 'ManUtd', NULL, 85, NULL, 'http://media-titanium.cursecdn.com/attachments/68/14/basti-16.JPG'),
(118, 'Yaya Toure', 'VOL', 'ManCity', NULL, 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(119, 'Verratti', 'VOL', 'PSG', NULL, 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(120, 'Pastore', 'VOL', 'PSG', NULL, 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(121, 'Gundogan', 'VOL', 'BorDortmund', NULL, 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(122, 'Pjanic', 'VOL', 'Roma', NULL, 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(123, 'Marchisio', 'VOL', 'Juventus', NULL, 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(124, 'Matuidi', 'VOL', 'PSG', NULL, 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(125, 'Xabi Alonso', 'VOL', 'BayernMunich', NULL, 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(126, 'Matic', 'VOL', 'Chelsea', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(127, 'Thiago', 'VOL', 'BayernMunich', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(128, 'Luiz Gustavo', 'VOL', 'Wolfsburg', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(129, 'Nainggolan', 'VOL', 'Roma', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(130, 'Xhaka', 'VOL', 'BorMochengladbach', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(131, 'Krychowiak', 'VOL', 'Sevilla', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(132, 'Parejo', 'VOL', 'Valencia', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(133, 'Ramsey', 'VOL', 'Arsenal', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(134, 'Bender', 'VOL', 'BorDortmund', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(135, 'Schneiderlin', 'VOL', 'ManUtd', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(136, 'Hamsik', 'VOL', 'Napoli', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(137, 'Diarra', 'VOL', 'Marseille', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(138, 'Toulalan', 'VOL', 'Monaco', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(139, 'De Rossi', 'VOL', 'Roma', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(140, 'T.Motta', 'VOL', 'PSG', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(141, 'Pirlo', 'VOL', 'NewYorkCityFootball', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(142, 'William Carvalho', 'VOL', 'Sporting', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(143, 'Medel', 'VOL', 'InterMilan', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(144, 'Ander Herrera', 'VOL', 'ManUtd', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(145, 'Iturraspe', 'VOL', 'AtlBilbao', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(146, 'Iborra', 'VOL', 'Sevilla', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(147, 'Wilshere', 'VOL', 'Arsenal', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(148, 'Bruno', 'VOL', 'Villareal', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(149, 'Khedira', 'VOL', 'Juventus', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(150, 'Witsel', 'VOL', 'Zenit', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(151, 'Guardado', 'VOL', 'PSV', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(152, 'Sahin', 'VOL', 'BorDortmund', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(153, 'G.Castro', 'VOL', 'BorDortmund', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(154, 'Biglia', 'VOL', 'Lazio', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(155, 'Robben', 'MEIA', 'BayernMunich', NULL, 89, 1, 'http://media-titanium.cursecdn.com/attachments/68/187/robben-16.JPG'),
(156, 'Hazard', 'MEIA', 'Chelsea', NULL, 88, NULL, 'http://media-titanium.cursecdn.com/attachments/68/188/hazard-16.JPG'),
(157, 'Ozil', 'MEIA', 'Arsenal', NULL, 88, 1, 'http://media-titanium.cursecdn.com/attachments/68/148/ozil-16.JPG'),
(158, 'James Rodriguez', 'MEIA', 'RealMadrid', NULL, 87, NULL, 'http://media-titanium.cursecdn.com/attachments/68/143/james-16.JPG'),
(159, 'De Bruyne', 'MEIA', 'ManCity', NULL, 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(160, 'Reus', 'MEIA', 'BorDortmund', NULL, 86, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(161, 'David Silva', 'MEIA', 'ManCity', NULL, 86, 2, 'http://i.imgur.com/UGm0Av8.jpg'),
(162, 'Ribery', 'MEIA', 'BayernMunich', NULL, 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(163, 'Mkhitaryan', 'MEIA', 'BorDortmund', NULL, 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(164, 'Cazorla', 'MEIA', 'Arsenal', NULL, 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(165, 'Isco', 'MEIA', 'RealMadrid', NULL, 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(166, 'Gotze', 'MEIA', 'BayernMunich', NULL, 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(167, 'Hulk', 'MEIA', 'Zenit', NULL, 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(168, 'Coutinho', 'MEIA', 'Liverpool', NULL, 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(169, 'Koke', 'MEIA', 'AtlMadrid', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(170, 'Douglas Costa', 'MEIA', 'BayernMunich', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(171, 'Eriksen', 'MEIA', 'Tottenham', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(172, 'Pedro', 'MEIA', 'Chelsea', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(173, 'Gaitan', 'MEIA', 'Benfica', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(174, 'Willian', 'MEIA', 'Chelsea', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(175, 'Mata', 'MEIA', 'ManUtd', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(176, 'Payet', 'MEIA', 'WestHam', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(177, 'João Moutinho', 'MEIA', 'Monaco', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(178, 'Turan', 'MEIA', 'Barcelona', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(179, 'Bellarabi', 'MEIA', 'BayerLeverkusen', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(180, 'Draxler', 'MEIA', 'Wolfsburg', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(181, 'Konoplyanka', 'MEIA', 'Sevilla', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(182, 'Kagawa', 'MEIA', 'BorDortmund', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(183, 'Oscar', 'MEIA', 'Chelsea', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(184, 'Nasri', 'MEIA', 'ManCity', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(185, 'Borja Valero', 'MEIA', 'Fiorentina', NULL, 82, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(186, 'BenArfa', 'MEIA', 'OGCNice', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(187, 'Sneijder', 'MEIA', 'Galatasaray', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(188, 'Danny', 'MEIA', 'Zenit', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(189, 'Mahrez', 'MEIA', 'Leicester', NULL, 81, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(190, 'Sterling', 'MEIA', 'ManCity', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(191, 'Vitolo', 'MEIA', 'Sevilla', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(192, 'Hermann', 'MEIA', 'BorMochengladbach', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(193, 'Cuadrado', 'MEIA', 'Juventus', NULL, 81, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(194, 'Perisic', 'MEIA', 'InterMilan', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(195, 'Banega', 'MEIA', 'Sevilla', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(196, 'Mertens', 'MEIA', 'Napoli', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(197, 'Raul Garcia', 'MEIA', 'AtlBilbao', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(198, 'Walcott', 'MEIA', 'Arsenal', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(199, 'Kaka', 'MEIA', 'OrlandoCity', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(200, 'Joao Mario', 'MEIA', 'Sporting', NULL, 80, 2, 'http://i.imgur.com/UGm0Av8.jpg'),
(201, 'LucasLima', 'MEIA', 'Santos', NULL, 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(202, 'Carrasco', 'MEIA', 'AtlMadrid', NULL, 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(203, 'Messi', 'PNT', 'Barcelona', NULL, 94, 1, 'https://pbs.twimg.com/media/CNrxOQrVAAAetgf.png'),
(204, 'Cristiano Ronaldo', 'PNT', 'RealMadrid', NULL, 93, 1, 'http://media-titanium.cursecdn.com/attachments/68/184/ronaldo-16.JPG'),
(205, 'Neymar', 'PNT', 'Barcelona', NULL, 90, 2, 'http://media-titanium.cursecdn.com/attachments/68/190/neymar-16.JPG'),
(206, 'Bale', 'PNT', 'RealMadrid', NULL, 87, NULL, 'http://media-titanium.cursecdn.com/attachments/68/57/bale-16.JPG'),
(207, 'DiMaria', 'PNT', 'PSG', NULL, 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(208, 'Sanchez', 'PNT', 'Arsenal', NULL, 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(209, 'Nani', 'PNT', 'Fenerbahce', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(210, 'Brahimi', 'PNT', 'Porto', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(211, 'Insigne', 'PNT', 'Napoli', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(212, 'Nolito', 'PNT', 'CeltaVigo', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(213, 'Vela', 'PNT', 'RealSociedad', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(214, 'Candreva', 'PNT', 'Lazio', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(215, 'Feghouli', 'PNT', 'Valencia', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(216, 'Callejon', 'PNT', 'Napoli', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(217, 'Lucas', 'PNT', 'PSG', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(218, 'Berardi', 'PNT', 'Sassuolo', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(219, 'Muniain', 'PNT', 'AtlBilbao', NULL, 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(220, 'Orellana', 'PNT', 'CeltaVigo', NULL, 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(221, 'Jese', 'PNT', 'RealMadrid', NULL, 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(222, 'Salah', 'PNT', 'Roma', NULL, 80, 2, 'http://i.imgur.com/UGm0Av8.jpg'),
(223, 'Suarez', 'ATA', 'Barcelona', NULL, 90, NULL, 'http://media-titanium.cursecdn.com/attachments/68/185/suarez-16.JPG'),
(224, 'Ibrahimovic', 'ATA', 'PSG', NULL, 89, NULL, 'http://media-titanium.cursecdn.com/attachments/68/189/zlatan-16.JPG'),
(225, 'Lewandowski', 'ATA', 'BayernMunich', NULL, 88, 2, 'http://media-titanium.cursecdn.com/attachments/68/56/robert-16.JPG'),
(226, 'Aguero', 'ATA', 'ManCity', NULL, 88, 1, 'http://media-titanium.cursecdn.com/attachments/68/151/agueri-16.JPG'),
(227, 'Higuain', 'ATA', 'Napoli', NULL, 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(228, 'Benzema', 'ATA', 'RealMadrid', NULL, 86, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(229, 'DiegoCosta', 'ATA', 'Chelsea', NULL, 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(230, 'Cavani', 'ATA', 'PSG', NULL, 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(231, 'Tevez', 'ATA', 'BocaJuniors', NULL, 85, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(232, 'Rooney', 'ATA', 'ManUtd', NULL, 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(233, 'Griezzmann', 'ATA', 'AtlMadrid', NULL, 84, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(234, 'Aubameyang', 'ATA', 'BorDortmund', NULL, 84, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(235, 'Lacazette', 'ATA', 'Lyon', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(236, 'Jonas', 'ATA', 'Benfica', NULL, 83, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(237, 'Sturridge', 'ATA', 'Liverpool', NULL, 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(238, 'Bacca', 'ATA', 'Milan', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(239, 'Kane', 'ATA', 'Tottenham', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(240, 'Lukaku', 'ATA', 'Everton', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(241, 'Mandzukic', 'ATA', 'Juventus', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(242, 'Giroud', 'ATA', 'Arsenal', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(243, 'Hernandez', 'ATA', 'BayerLeverkusen', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(244, 'Falcao', 'ATA', 'Chelsea', NULL, 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(245, 'Aduriz', 'ATA', 'AtlBilbao', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(246, 'Dybala', 'ATA', 'Juventus', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(247, 'Van Persie', 'ATA', 'Fenerbahce', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(248, 'Mario Gomez', 'ATA', 'Besiktas', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(249, 'Huntelaar', 'ATA', 'Schalke04', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(250, 'Negredo', 'ATA', 'Valencia', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(251, 'David Villa', 'ATA', 'NewYorkCity', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(252, 'Drogba', 'ATA', 'MontrealImpact', NULL, 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `transferencia`
--
DROP TABLE IF EXISTS transferencia;
CREATE TABLE `transferencia` (
  `ID` int(11) NOT NULL,
  `EquipeSaida` int(11) DEFAULT NULL,
  `EquipeEntrada` int(11) NOT NULL,
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
(1, 2, 1, '2016-06-05 13:27:53', NULL, '20000.00', 'Aguardando', 205, NULL),
(6, 1, 2, '2016-06-05 16:22:34', NULL, '1000.00', 'Aguardando', 155, 161),
(5, 1, 2, '2016-06-05 16:22:00', NULL, '20000.00', 'Aguardando', 226, NULL),
(4, 2, 1, '2016-06-05 14:29:45', NULL, '200.00', 'Aguardando', 225, 228);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--
DROP TABLE IF EXISTS usuario;
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
(1, 'Thiago Oliva', 'thiag6', 'thiagosfoliva@gmail.com', 'testes', '250000.00', 1, 1),
(2, 'Lucas Domingues', 'luped720', 'luped@galaticos', 'testes', '250000.00', 1, 0),
(3, 'Teste NÃ£o Aprovado', 'naoAtivo', 'teste', 'testes', '250000.00', 0, 0);

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `equipe`
--
ALTER TABLE `equipe`
  MODIFY `EquipeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `grupo`
--
ALTER TABLE `grupo`
  MODIFY `Grupo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jogador`
--
ALTER TABLE `jogador`
  MODIFY `JogadorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;
--
-- AUTO_INCREMENT for table `transferencia`
--
ALTER TABLE `transferencia`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
