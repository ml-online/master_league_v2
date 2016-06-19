-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 19-Jun-2016 às 03:08
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
(4, 'Real Madrid', 'NÃ£o Cadastrado', 4),
(5, 'Campo Grande FC', 'NÃ£o Cadastrado', 5);

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
(1, 'Neuer', 'GOL', 'Bayern Munich', '45000.00', 90, 1, 'http://media-titanium.cursecdn.com/attachments/68/186/neuer-16.JPG'),
(2, 'De Gea', 'GOL', 'ManUtd', '43500.00', 87, 2, 'http://media-titanium.cursecdn.com/attachments/68/64/degea-16.JPG'),
(3, 'Courtois', 'GOL', 'Chelsea', '43000.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(4, 'Cech', 'GOL', 'Arsenal', '43000.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(5, 'Lloris', 'GOL', 'Tottenham', '42500.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(6, 'Handanovic', 'GOL', 'InterMilan', '42000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(7, 'Hart', 'GOL', 'ManCity', '42000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(8, 'Buffon', 'GOL', 'Juventus', '42000.00', 84, 5, 'http://i.imgur.com/UGm0Av8.jpg'),
(9, 'Leno', 'GOL', 'BayerLeverkusen', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(10, 'Fahrmann', 'GOL', 'Schalke04', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(11, 'Bravo', 'GOL', 'Barcelona', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(12, 'Ruffier', 'GOL', 'SaintEtienne', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(13, 'Mandanda', 'GOL', 'Marseille', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(14, 'Oblak', 'GOL', 'AtlMadrid', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(15, 'A.Lopes', 'GOL', 'Lyon', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(16, 'K.Navas', 'GOL', 'RealMadrid', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(17, 'Ter Stegen', 'GOL', 'Barcelona', '41000.00', 82, 4, 'http://i.imgur.com/UGm0Av8.jpg'),
(18, 'K.Trapp', 'GOL', 'PSG', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(19, 'Muslera', 'GOL', 'Galatasaray', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(20, 'Sommer', 'GOL', 'BorussiaMonchengladbach', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(21, 'Begovic', 'GOL', 'Chelsea', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(22, 'Sirigu', 'GOL', 'PSG', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(23, 'Diego Alves', 'GOL', 'Valencia', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(24, 'Julio Cesar', 'GOL', 'Benfica', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(25, 'Lahm', 'LD', 'BayernMunich', '43500.00', 87, NULL, 'http://media-titanium.cursecdn.com/attachments/68/152/lahm-16.JPG'),
(26, 'Dani Alves', 'LD', 'Barcelona', '42000.00', 84, 5, 'http://i.imgur.com/UGm0Av8.jpg'),
(27, 'Carvajal', 'LD', 'RealMadrid', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(28, 'Zabaleta', 'LD', 'ManCity', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(29, 'Lichtsteiner', 'LD', 'Juventus', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(30, 'Aurier', 'LD', 'PSG', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(31, 'Darmian', 'LD', 'ManUtd', '40500.00', 81, 4, 'http://i.imgur.com/UGm0Av8.jpg'),
(32, 'Coleman', 'LD', 'Everton', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(33, 'JuanFran', 'LD', 'AtlMadrid', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(34, 'Danilo', 'LD', 'RealMadrid', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(35, 'Mario Gaspar', 'LD', 'Villareal', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(36, 'Clyne', 'LD', 'Liverpool', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(37, 'De Marcos', 'LD', 'AtlBilbao', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(38, 'Smolnikov', 'LD', 'Zenit', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(39, 'Ivanovic', 'LD', 'Chelsea', '40000.00', 80, 2, 'http://i.imgur.com/UGm0Av8.jpg'),
(40, 'Piszczek', 'LD', 'BorDortmund', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(41, 'Coke', 'LD', 'Sevilla', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(42, 'Sagna', 'LD', 'ManCity', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(43, 'Thiago Silva', 'ZAG', 'PSG', '44000.00', 88, 1, 'http://media-titanium.cursecdn.com/attachments/68/192/tsilva-16.JPG'),
(44, 'Boateng', 'ZAG', 'BayernMunich', '43500.00', 87, 1, 'http://media-titanium.cursecdn.com/attachments/68/145/boateng-16.JPG'),
(45, 'Sergio Ramos', 'ZAG', 'RealMadrid', '43500.00', 87, 1, 'http://media-titanium.cursecdn.com/attachments/68/150/ramos-16.JPG'),
(46, 'Godin', 'ZAG', 'AtlMadrid', '43000.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(47, 'Hummels', 'ZAG', 'BorDortmund', '43000.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(48, 'Chiellini', 'ZAG', 'Juventus', '43000.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(49, 'Miranda', 'ZAG', 'InterMilan', '42500.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(50, 'Pique', 'ZAG', 'Barcelona', '42500.00', 85, 1, 'http://media-titanium.cursecdn.com/attachments/68/16/pique-16.JPG'),
(51, 'Kompany', 'ZAG', 'ManCity', '42500.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(52, 'Barzagli', 'ZAG', 'Juventus', '42500.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(53, 'Otamendi', 'ZAG', 'ManCity', '42000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(54, 'Javi Martinez', 'ZAG', 'BayernMunich', '42000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(55, 'Naldo', 'ZAG', 'Wolfsburg', '42000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(56, 'Koscielny', 'ZAG', 'Arsenal', '42000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(57, 'Pepe', 'ZAG', 'RealMadrid', '42000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(58, 'Terry', 'ZAG', 'Chelsea', '42000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(59, 'Laporte', 'ZAG', 'AtlBilbao', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(60, 'Manolas', 'ZAG', 'Roma', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(61, 'Smalling', 'ZAG', 'ManUtd', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(62, 'Bonucci', 'ZAG', 'Juventus', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(63, 'David Luiz', 'ZAG', 'PSG', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(64, 'Howedes', 'ZAG', 'Schallke04', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(65, 'Benatia', 'ZAG', 'BayernMunich', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(66, 'Sokratis', 'ZAG', 'BorDortmund', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(67, 'Garay', 'ZAG', 'Zenit', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(68, 'Mascherano', 'ZAG', 'Barcelona', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(69, 'Mertesacker', 'ZAG', 'Arsenal', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(70, 'Varane', 'ZAG', 'RealMadrid', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(71, 'Mustafi', 'ZAG', 'Valencia', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(72, 'Glik', 'ZAG', 'Torino', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(73, 'Alderweireld', 'ZAG', 'Tottenham', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(74, 'Bender', 'ZAG', 'BorDortmund', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(75, 'Vertonghen', 'ZAG', 'Tottenham', '41000.00', 82, 1, 'http://www.squawka.com/news/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-17.02.07.png'),
(76, 'Cahill', 'ZAG', 'Chelsea', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(77, 'Perrin', 'ZAG', 'SaintEtienne', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(78, 'Mathieu', 'ZAG', 'Barcelona', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(79, 'Gimenez', 'ZAG', 'AtlMadrid', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(80, 'Marquinhos', 'ZAG', 'PSG', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(81, 'Savic', 'ZAG', 'AtlMadrid', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(82, 'De Vrij', 'ZAG', 'Lazio', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(83, 'Abdennour', 'ZAG', 'Valencia', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(84, 'Matip', 'ZAG', 'Schallke04', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(85, 'Musacchio', 'ZAG', 'Villareal', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(86, 'Toprak', 'ZAG', 'BayerLeverkusen', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(87, 'Jose Fonte', 'ZAG', 'Southampton', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(88, 'Skrtel', 'ZAG', 'Liverpool', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(89, 'Williams', 'ZAG', 'Swansea', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(90, 'Raul Albiol', 'ZAG', 'Napoli', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(91, 'Alaba', 'LE', 'BayernMunich', '42500.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(92, 'Jordi Alba', 'LE', 'Barcelona', '42000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(93, 'Marcelo', 'LE', 'RealMadrid', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(94, 'R.Rodriguez', 'LE', 'Wolfsburg', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(95, 'Alex Sandro', 'LE', 'Juventus', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(96, 'Azpilicueta', 'LE', 'Chelsea', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(97, 'Filipe Luis', 'LE', 'AtlMadrid', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(98, 'Baines', 'LE', 'Everton', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(99, 'Tremoulinas', 'LE', 'Sevilla', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(100, 'Evra', 'LE', 'Juventus', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(101, 'Gaya', 'LE', 'Valencia', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(102, 'Kurzawa', 'LE', 'PSG', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(103, 'Nacho Monreal', 'LE', 'Arsenal', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(104, 'Fabio Coentrao', 'LE', 'Monaco', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(105, 'Bernat', 'LE', 'BayernMunich', '39500.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(106, 'Balenziaga', 'LE', 'AtlBilbao', '39500.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(107, 'Jefferson', 'LE', 'Sporting', '39500.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(108, 'Gibbs', 'LE', 'Arsenal', '39500.00', 79, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(109, 'Iniesta', 'VOL', 'Barcelona', '44000.00', 88, NULL, 'http://media-titanium.cursecdn.com/attachments/68/142/iniesta-16.JPG'),
(110, 'Kroos', 'VOL', 'RealMadrid', '43500.00', 87, 1, 'http://media-titanium.cursecdn.com/attachments/68/146/kroos-16.JPG'),
(111, 'Modric', 'VOL', 'RealMadrid', '43500.00', 87, 1, 'http://media-titanium.cursecdn.com/attachments/68/147/modric-16.JPG'),
(112, 'Pogba', 'VOL', 'Juventus', '43000.00', 86, 1, 'http://media-titanium.cursecdn.com/attachments/68/6/pogba-16.JPG'),
(113, 'Busquets', 'VOL', 'Barcelona', '43000.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(114, 'Fabregas', 'VOL', 'Chelsea', '43000.00', 86, 2, 'http://i.imgur.com/UGm0Av8.jpg'),
(115, 'Vidal', 'VOL', 'BayernMunich', '42500.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(116, 'Rakitic', 'VOL', 'Barcelona', '42500.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(117, 'Schweinsteiger', 'VOL', 'ManUtd', '42500.00', 85, 2, 'http://media-titanium.cursecdn.com/attachments/68/14/basti-16.JPG'),
(118, 'Yaya Toure', 'VOL', 'ManCity', '42500.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(119, 'Verratti', 'VOL', 'PSG', '42000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(120, 'Pastore', 'VOL', 'PSG', '42000.00', 84, 5, 'http://i.imgur.com/UGm0Av8.jpg'),
(121, 'Gundogan', 'VOL', 'BorDortmund', '42000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(122, 'Pjanic', 'VOL', 'Roma', '42000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(123, 'Marchisio', 'VOL', 'Juventus', '42000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(124, 'Matuidi', 'VOL', 'PSG', '42000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(125, 'Xabi Alonso', 'VOL', 'BayernMunich', '42000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(126, 'Matic', 'VOL', 'Chelsea', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(127, 'Thiago', 'VOL', 'BayernMunich', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(128, 'Luiz Gustavo', 'VOL', 'Wolfsburg', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(129, 'Nainggolan', 'VOL', 'Roma', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(130, 'Xhaka', 'VOL', 'BorMochengladbach', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(131, 'Krychowiak', 'VOL', 'Sevilla', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(132, 'Parejo', 'VOL', 'Valencia', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(133, 'Ramsey', 'VOL', 'Arsenal', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(134, 'Bender', 'VOL', 'BorDortmund', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(135, 'Schneiderlin', 'VOL', 'ManUtd', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(136, 'Hamsik', 'VOL', 'Napoli', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(137, 'Diarra', 'VOL', 'Marseille', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(138, 'Toulalan', 'VOL', 'Monaco', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(139, 'De Rossi', 'VOL', 'Roma', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(140, 'T.Motta', 'VOL', 'PSG', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(141, 'Pirlo', 'VOL', 'NewYorkCityFootball', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(142, 'William Carvalho', 'VOL', 'Sporting', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(143, 'Medel', 'VOL', 'InterMilan', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(144, 'Ander Herrera', 'VOL', 'ManUtd', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(145, 'Iturraspe', 'VOL', 'AtlBilbao', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(146, 'Iborra', 'VOL', 'Sevilla', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(147, 'Wilshere', 'VOL', 'Arsenal', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(148, 'Bruno', 'VOL', 'Villareal', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(149, 'Khedira', 'VOL', 'Juventus', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(150, 'Witsel', 'VOL', 'Zenit', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(151, 'Guardado', 'VOL', 'PSV', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(152, 'Sahin', 'VOL', 'BorDortmund', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(153, 'G.Castro', 'VOL', 'BorDortmund', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(154, 'Biglia', 'VOL', 'Lazio', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(155, 'Robben', 'MEIA', 'BayernMunich', '44500.00', 89, 2, 'http://media-titanium.cursecdn.com/attachments/68/187/robben-16.JPG'),
(156, 'Hazard', 'MEIA', 'Chelsea', '44000.00', 88, NULL, 'http://media-titanium.cursecdn.com/attachments/68/188/hazard-16.JPG'),
(157, 'Ozil', 'MEIA', 'Arsenal', '44000.00', 88, 1, 'http://media-titanium.cursecdn.com/attachments/68/148/ozil-16.JPG'),
(158, 'James Rodriguez', 'MEIA', 'RealMadrid', '43500.00', 87, NULL, 'http://media-titanium.cursecdn.com/attachments/68/143/james-16.JPG'),
(159, 'De Bruyne', 'MEIA', 'ManCity', '43000.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(160, 'Reus', 'MEIA', 'BorDortmund', '43000.00', 86, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(161, 'David Silva', 'MEIA', 'ManCity', '43000.00', 86, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(162, 'Ribery', 'MEIA', 'BayernMunich', '43000.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(163, 'Mkhitaryan', 'MEIA', 'BorDortmund', '42500.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(164, 'Cazorla', 'MEIA', 'Arsenal', '42500.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(165, 'Isco', 'MEIA', 'RealMadrid', '42000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(166, 'Gotze', 'MEIA', 'BayernMunich', '42000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(167, 'Hulk', 'MEIA', 'Zenit', '42000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(168, 'Coutinho', 'MEIA', 'Liverpool', '42000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(169, 'Koke', 'MEIA', 'AtlMadrid', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(170, 'Douglas Costa', 'MEIA', 'BayernMunich', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(171, 'Eriksen', 'MEIA', 'Tottenham', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(172, 'Pedro', 'MEIA', 'Chelsea', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(173, 'Gaitan', 'MEIA', 'Benfica', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(174, 'Willian', 'MEIA', 'Chelsea', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(175, 'Mata', 'MEIA', 'ManUtd', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(176, 'Payet', 'MEIA', 'WestHam', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(177, 'João Moutinho', 'MEIA', 'Monaco', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(178, 'Turan', 'MEIA', 'Barcelona', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(179, 'Bellarabi', 'MEIA', 'BayerLeverkusen', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(180, 'Draxler', 'MEIA', 'Wolfsburg', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(181, 'Konoplyanka', 'MEIA', 'Sevilla', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(182, 'Kagawa', 'MEIA', 'BorDortmund', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(183, 'Oscar', 'MEIA', 'Chelsea', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(184, 'Nasri', 'MEIA', 'ManCity', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(185, 'Borja Valero', 'MEIA', 'Fiorentina', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(186, 'BenArfa', 'MEIA', 'OGCNice', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(187, 'Sneijder', 'MEIA', 'Galatasaray', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(188, 'Danny', 'MEIA', 'Zenit', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(189, 'Mahrez', 'MEIA', 'Leicester', '40500.00', 81, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(190, 'Sterling', 'MEIA', 'ManCity', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(191, 'Vitolo', 'MEIA', 'Sevilla', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(192, 'Hermann', 'MEIA', 'BorMochengladbach', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(193, 'Cuadrado', 'MEIA', 'Juventus', '40500.00', 81, 2, 'http://i.imgur.com/UGm0Av8.jpg'),
(194, 'Perisic', 'MEIA', 'InterMilan', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(195, 'Banega', 'MEIA', 'Sevilla', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(196, 'Mertens', 'MEIA', 'Napoli', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(197, 'Raul Garcia', 'MEIA', 'AtlBilbao', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(198, 'Walcott', 'MEIA', 'Arsenal', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(199, 'Kaka', 'MEIA', 'OrlandoCity', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(200, 'Joao Mario', 'MEIA', 'Sporting', '40000.00', 80, 2, 'http://i.imgur.com/UGm0Av8.jpg'),
(201, 'LucasLima', 'MEIA', 'Santos', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(202, 'Carrasco', 'MEIA', 'AtlMadrid', '40000.00', 80, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(203, 'Messi', 'PNT', 'Barcelona', '47000.00', 94, 1, 'https://pbs.twimg.com/media/CNrxOQrVAAAetgf.png'),
(204, 'Cristiano Ronaldo', 'PNT', 'RealMadrid', '46500.00', 93, 1, 'http://media-titanium.cursecdn.com/attachments/68/184/ronaldo-16.JPG'),
(205, 'Neymar', 'PNT', 'Barcelona', '45000.00', 90, 2, 'http://media-titanium.cursecdn.com/attachments/68/190/neymar-16.JPG'),
(206, 'Bale', 'PNT', 'RealMadrid', '43500.00', 87, 1, 'http://media-titanium.cursecdn.com/attachments/68/57/bale-16.JPG'),
(207, 'DiMaria', 'PNT', 'PSG', '43000.00', 86, 2, 'http://media-titanium.cursecdn.com/attachments/67/985/dimaria-6-final.JPG'),
(208, 'Sanchez', 'PNT', 'Arsenal', '43000.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(209, 'Nani', 'PNT', 'Fenerbahce', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(210, 'Brahimi', 'PNT', 'Porto', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(211, 'Insigne', 'PNT', 'Napoli', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(212, 'Nolito', 'PNT', 'CeltaVigo', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(213, 'Vela', 'PNT', 'RealSociedad', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(214, 'Candreva', 'PNT', 'Lazio', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(215, 'Feghouli', 'PNT', 'Valencia', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(216, 'Callejon', 'PNT', 'Napoli', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(217, 'Lucas', 'PNT', 'PSG', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(218, 'Berardi', 'PNT', 'Sassuolo', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(219, 'Muniain', 'PNT', 'AtlBilbao', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(220, 'Orellana', 'PNT', 'CeltaVigo', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(221, 'Jese', 'PNT', 'RealMadrid', '40000.00', 80, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(222, 'Salah', 'PNT', 'Roma', '40000.00', 80, 2, 'http://i.imgur.com/UGm0Av8.jpg'),
(223, 'Suarez', 'ATA', 'Barcelona', '45000.00', 90, 4, 'http://media-titanium.cursecdn.com/attachments/68/185/suarez-16.JPG'),
(224, 'Ibrahimovic', 'ATA', 'PSG', '44500.00', 89, NULL, 'http://media-titanium.cursecdn.com/attachments/68/189/zlatan-16.JPG'),
(225, 'Lewandowski', 'ATA', 'BayernMunich', '44000.00', 88, 2, 'http://media-titanium.cursecdn.com/attachments/68/56/robert-16.JPG'),
(226, 'Aguero', 'ATA', 'ManCity', '44000.00', 88, 5, 'http://media-titanium.cursecdn.com/attachments/68/151/agueri-16.JPG'),
(227, 'Higuain', 'ATA', 'Napoli', '43000.00', 86, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(228, 'Benzema', 'ATA', 'RealMadrid', '43000.00', 86, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(229, 'DiegoCosta', 'ATA', 'Chelsea', '42500.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(230, 'Cavani', 'ATA', 'PSG', '42500.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(231, 'Tevez', 'ATA', 'BocaJuniors', '42500.00', 85, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(232, 'Rooney', 'ATA', 'ManUtd', '42500.00', 85, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(233, 'Griezzmann', 'ATA', 'AtlMadrid', '42000.00', 84, 1, 'http://i.imgur.com/UGm0Av8.jpg'),
(234, 'Aubameyang', 'ATA', 'BorDortmund', '42000.00', 84, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(235, 'Lacazette', 'ATA', 'Lyon', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(236, 'Jonas', 'ATA', 'Benfica', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(237, 'Sturridge', 'ATA', 'Liverpool', '41500.00', 83, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(238, 'Bacca', 'ATA', 'Milan', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(239, 'Kane', 'ATA', 'Tottenham', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(240, 'Lukaku', 'ATA', 'Everton', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(241, 'Mandzukic', 'ATA', 'Juventus', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(242, 'Giroud', 'ATA', 'Arsenal', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(243, 'Hernandez', 'ATA', 'BayerLeverkusen', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(244, 'Falcao', 'ATA', 'Chelsea', '41000.00', 82, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(245, 'Aduriz', 'ATA', 'AtlBilbao', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(246, 'Dybala', 'ATA', 'Juventus', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(247, 'Van Persie', 'ATA', 'Fenerbahce', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(248, 'Mario Gomez', 'ATA', 'Besiktas', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(249, 'Huntelaar', 'ATA', 'Schalke04', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(250, 'Negredo', 'ATA', 'Valencia', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(251, 'David Villa', 'ATA', 'NewYorkCity', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(252, 'Drogba', 'ATA', 'MontrealImpact', '40500.00', 81, NULL, 'http://i.imgur.com/UGm0Av8.jpg'),
(253, 'Rashford', 'ATA', 'Man Utd', '15000.00', 69, 1, 'http://www.fifacoinsgo.com/upload/20160229/6359236345099926236705630.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `transferencia`
--

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
(20, NULL, 4, '2016-06-18 22:07:51', '2016-06-18 22:07:51', '40500.00', 'Concluido', 31, NULL);

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
(1, 'Thiago Oliva', 'thiag6', 'thiagosfoliva@gmail.com', 'testes', '183000.00', 1, 1),
(2, 'Lucas Domingues', 'luped720', 'luped@galaticos', 'testes', '118500.00', 1, 0),
(3, 'Teste NÃ£o Aprovado', 'naoAtivo', 'teste', 'testes', '250000.00', 0, 0),
(4, 'Marreiros', 'marreiros10', 'marreiros', 'testes', '123500.00', 1, 0),
(5, 'Rangel', 'HBRangel', 'hbrangel@es', 'testes', '80000.00', 1, 0);

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
  MODIFY `JogadorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;
--
-- AUTO_INCREMENT for table `transferencia`
--
ALTER TABLE `transferencia`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
