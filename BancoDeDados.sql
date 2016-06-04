-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 02-Jun-2016 às 23:19
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
(2, 'Alo Fc', NULL, 2);

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
(1, 'Neuer', 'GOL', 'Bayern Munich', NULL, 90, 1, 'http://media-titanium.cursecdn.com/attachments/68/186/neuer-16.JPG'),
(2, 'De Gea', 'GOL', 'ManUtd', NULL, 87, 2, 'http://media-titanium.cursecdn.com/attachments/68/64/degea-16.JPG'),
(3, 'Courtois', 'GOL', 'Chelsea', NULL, 86, NULL, NULL),
(4, 'Cech', 'GOL', 'Arsenal', NULL, 86, NULL, NULL),
(5, 'Lloris', 'GOL', 'Tottenham', NULL, 85, NULL, NULL),
(6, 'Handanovic', 'GOL', 'InterMilan', NULL, 84, NULL, NULL),
(7, 'Hart', 'GOL', 'ManCity', NULL, 84, NULL, NULL),
(8, 'Buffon', 'GOL', 'Juventus', NULL, 84, NULL, NULL),
(9, 'Leno', 'GOL', 'BayerLeverkusen', NULL, 83, NULL, NULL),
(10, 'Fahrmann', 'GOL', 'Schalke04', NULL, 83, NULL, NULL),
(11, 'Bravo', 'GOL', 'Barcelona', NULL, 83, NULL, NULL),
(12, 'Ruffier', 'GOL', 'SaintEtienne', NULL, 83, NULL, NULL),
(13, 'Mandanda', 'GOL', 'Marseille', NULL, 83, NULL, NULL),
(14, 'Oblak', 'GOL', 'AtlMadrid', NULL, 82, NULL, NULL),
(15, 'A.Lopes', 'GOL', 'Lyon', NULL, 82, NULL, NULL),
(16, 'K.Navas', 'GOL', 'RealMadrid', NULL, 82, NULL, NULL),
(17, 'Ter Stegen', 'GOL', 'Barcelona', NULL, 82, NULL, NULL),
(18, 'K.Trapp', 'GOL', 'PSG', NULL, 82, NULL, NULL),
(19, 'Muslera', 'GOL', 'Galatasaray', NULL, 82, NULL, NULL),
(20, 'Sommer', 'GOL', 'BorussiaMonchengladbach', NULL, 82, NULL, NULL),
(21, 'Begovic', 'GOL', 'Chelsea', NULL, 82, NULL, NULL),
(22, 'Sirigu', 'GOL', 'PSG', NULL, 82, NULL, NULL),
(23, 'Diego Alves', 'GOL', 'Valencia', NULL, 82, NULL, NULL),
(24, 'Julio Cesar', 'GOL', 'Benfica', NULL, 82, NULL, NULL),
(25, 'Lahm', 'LD', 'BayernMunich', NULL, 87, NULL, 'http://media-titanium.cursecdn.com/attachments/68/152/lahm-16.JPG'),
(26, 'Dani Alves', 'LD', 'Barcelona', NULL, 84, NULL, NULL),
(27, 'Carvajal', 'LD', 'RealMadrid', NULL, 82, NULL, NULL),
(28, 'Zabaleta', 'LD', 'ManCity', NULL, 82, NULL, NULL),
(29, 'Lichtsteiner', 'LD', 'Juventus', NULL, 82, NULL, NULL),
(30, 'Aurier', 'LD', 'PSG', NULL, 81, NULL, NULL),
(31, 'Darmian', 'LD', 'ManUtd', NULL, 81, NULL, NULL),
(32, 'Coleman', 'LD', 'Everton', NULL, 81, NULL, NULL),
(33, 'JuanFran', 'LD', 'AtlMadrid', NULL, 81, NULL, NULL),
(34, 'Danilo', 'LD', 'RealMadrid', NULL, 80, NULL, NULL),
(35, 'Mario Gaspar', 'LD', 'Villareal', NULL, 80, NULL, NULL),
(36, 'Clyne', 'LD', 'Liverpool', NULL, 80, NULL, NULL),
(37, 'De Marcos', 'LD', 'AtlBilbao', NULL, 80, NULL, NULL),
(38, 'Smolnikov', 'LD', 'Zenit', NULL, 80, NULL, NULL),
(39, 'Ivanovic', 'LD', 'Chelsea', NULL, 80, 2, NULL),
(40, 'Piszczek', 'LD', 'BorDortmund', NULL, 80, NULL, NULL),
(41, 'Coke', 'LD', 'Sevilla', NULL, 80, NULL, NULL),
(42, 'Sagna', 'LD', 'ManCity', NULL, 80, NULL, NULL),
(43, 'Thiago Silva', 'ZAG', 'PSG', NULL, 88, NULL, 'http://media-titanium.cursecdn.com/attachments/68/192/tsilva-16.JPG'),
(44, 'Boateng', 'ZAG', 'BayernMunich', NULL, 87, 1, 'http://media-titanium.cursecdn.com/attachments/68/145/boateng-16.JPG'),
(45, 'Sergio Ramos', 'ZAG', 'RealMadrid', NULL, 87, 1, 'http://media-titanium.cursecdn.com/attachments/68/150/ramos-16.JPG'),
(46, 'Godin', 'ZAG', 'AtlMadrid', NULL, 86, NULL, NULL),
(47, 'Hummels', 'ZAG', 'BorDortmund', NULL, 86, NULL, NULL),
(48, 'Chiellini', 'ZAG', 'Juventus', NULL, 86, NULL, NULL),
(49, 'Miranda', 'ZAG', 'InterMilan', NULL, 85, NULL, NULL),
(50, 'Pique', 'ZAG', 'Barcelona', NULL, 85, NULL, NULL),
(51, 'Kompany', 'ZAG', 'ManCity', NULL, 85, NULL, NULL),
(52, 'Barzagli', 'ZAG', 'Juventus', NULL, 85, NULL, NULL),
(53, 'Otamendi', 'ZAG', 'ManCity', NULL, 84, NULL, NULL),
(54, 'Javi Martinez', 'ZAG', 'BayernMunich', NULL, 84, NULL, NULL),
(55, 'Naldo', 'ZAG', 'Wolfsburg', NULL, 84, NULL, NULL),
(56, 'Koscielny', 'ZAG', 'Arsenal', NULL, 84, NULL, NULL),
(57, 'Pepe', 'ZAG', 'RealMadrid', NULL, 84, NULL, NULL),
(58, 'Terry', 'ZAG', 'Chelsea', NULL, 84, NULL, NULL),
(59, 'Laporte', 'ZAG', 'AtlBilbao', NULL, 83, NULL, NULL),
(60, 'Manolas', 'ZAG', 'Roma', NULL, 83, NULL, NULL),
(61, 'Smalling', 'ZAG', 'ManUtd', NULL, 83, NULL, NULL),
(62, 'Bonucci', 'ZAG', 'Juventus', NULL, 83, NULL, NULL),
(63, 'David Luiz', 'ZAG', 'PSG', NULL, 83, NULL, NULL),
(64, 'Howedes', 'ZAG', 'Schallke04', NULL, 83, NULL, NULL),
(65, 'Benatia', 'ZAG', 'BayernMunich', NULL, 83, NULL, NULL),
(66, 'Sokratis', 'ZAG', 'BorDortmund', NULL, 83, NULL, NULL),
(67, 'Garay', 'ZAG', 'Zenit', NULL, 83, NULL, NULL),
(68, 'Mascherano', 'ZAG', 'Barcelona', NULL, 83, NULL, NULL),
(69, 'Mertesacker', 'ZAG', 'Arsenal', NULL, 83, NULL, NULL),
(70, 'Varane', 'ZAG', 'RealMadrid', NULL, 82, NULL, NULL),
(71, 'Mustafi', 'ZAG', 'Valencia', NULL, 82, NULL, NULL),
(72, 'Glik', 'ZAG', 'Torino', NULL, 82, NULL, NULL),
(73, 'Alderweireld', 'ZAG', 'Tottenham', NULL, 82, NULL, NULL),
(74, 'Bender', 'ZAG', 'BorDortmund', NULL, 82, NULL, NULL),
(75, 'Vertonghen', 'ZAG', 'Tottenham', NULL, 82, NULL, NULL),
(76, 'Cahill', 'ZAG', 'Chelsea', NULL, 82, NULL, NULL),
(77, 'Perrin', 'ZAG', 'SaintEtienne', NULL, 82, NULL, NULL),
(78, 'Mathieu', 'ZAG', 'Barcelona', NULL, 82, NULL, NULL),
(79, 'Gimenez', 'ZAG', 'AtlMadrid', NULL, 81, NULL, NULL),
(80, 'Marquinhos', 'ZAG', 'PSG', NULL, 81, NULL, NULL),
(81, 'Savic', 'ZAG', 'AtlMadrid', NULL, 81, NULL, NULL),
(82, 'De Vrij', 'ZAG', 'Lazio', NULL, 81, NULL, NULL),
(83, 'Abdennour', 'ZAG', 'Valencia', NULL, 81, NULL, NULL),
(84, 'Matip', 'ZAG', 'Schallke04', NULL, 81, NULL, NULL),
(85, 'Musacchio', 'ZAG', 'Villareal', NULL, 81, NULL, NULL),
(86, 'Toprak', 'ZAG', 'BayerLeverkusen', NULL, 81, NULL, NULL),
(87, 'Jose Fonte', 'ZAG', 'Southampton', NULL, 81, NULL, NULL),
(88, 'Skrtel', 'ZAG', 'Liverpool', NULL, 81, NULL, NULL),
(89, 'Williams', 'ZAG', 'Swansea', NULL, 81, NULL, NULL),
(90, 'Raul Albiol', 'ZAG', 'Napoli', NULL, 81, NULL, NULL),
(91, 'Alaba', 'LE', 'BayernMunich', NULL, 85, NULL, NULL),
(92, 'Jordi Alba', 'LE', 'Barcelona', NULL, 84, NULL, NULL),
(93, 'Marcelo', 'LE', 'RealMadrid', NULL, 83, NULL, NULL),
(94, 'R.Rodriguez', 'LE', 'Wolfsburg', NULL, 82, NULL, NULL),
(95, 'Alex Sandro', 'LE', 'Juventus', NULL, 82, NULL, NULL),
(96, 'Azpilicueta', 'LE', 'Chelsea', NULL, 82, NULL, NULL),
(97, 'Filipe Luis', 'LE', 'AtlMadrid', NULL, 82, NULL, NULL),
(98, 'Baines', 'LE', 'Everton', NULL, 82, NULL, NULL),
(99, 'Tremoulinas', 'LE', 'Sevilla', NULL, 81, NULL, NULL),
(100, 'Evra', 'LE', 'Juventus', NULL, 81, NULL, NULL),
(101, 'Gaya', 'LE', 'Valencia', NULL, 80, NULL, NULL),
(102, 'Kurzawa', 'LE', 'PSG', NULL, 80, NULL, NULL),
(103, 'Nacho Monreal', 'LE', 'Arsenal', NULL, 80, NULL, NULL),
(104, 'Fabio Coentrao', 'LE', 'Monaco', NULL, 80, NULL, NULL),
(105, 'Bernat', 'LE', 'BayernMunich', NULL, 79, NULL, NULL),
(106, 'Balenziaga', 'LE', 'AtlBilbao', NULL, 79, NULL, NULL),
(107, 'Jefferson', 'LE', 'Sporting', NULL, 79, NULL, NULL),
(108, 'Gibbs', 'LE', 'Arsenal', NULL, 79, NULL, NULL),
(109, 'Iniesta', 'VOL', 'Barcelona', NULL, 88, NULL, 'http://media-titanium.cursecdn.com/attachments/68/142/iniesta-16.JPG'),
(110, 'Kroos', 'VOL', 'RealMadrid', NULL, 87, 1, 'http://media-titanium.cursecdn.com/attachments/68/146/kroos-16.JPG'),
(111, 'Modric', 'VOL', 'RealMadrid', NULL, 87, 1, 'http://media-titanium.cursecdn.com/attachments/68/147/modric-16.JPG'),
(112, 'Pogba', 'VOL', 'Juventus', NULL, 86, 1, NULL),
(113, 'Busquets', 'VOL', 'Barcelona', NULL, 86, NULL, NULL),
(114, 'Fabregas', 'VOL', 'Chelsea', NULL, 86, 2, NULL),
(115, 'Vidal', 'VOL', 'BayernMunich', NULL, 85, NULL, NULL),
(116, 'Rakitic', 'VOL', 'Barcelona', NULL, 85, NULL, NULL),
(117, 'Schweinsteiger', 'VOL', 'ManUtd', NULL, 85, NULL, 'http://media-titanium.cursecdn.com/attachments/68/14/basti-16.JPG'),
(118, 'Yaya Toure', 'VOL', 'ManCity', NULL, 85, NULL, NULL),
(119, 'Verratti', 'VOL', 'PSG', NULL, 84, NULL, NULL),
(120, 'Pastore', 'VOL', 'PSG', NULL, 84, NULL, NULL),
(121, 'Gundogan', 'VOL', 'BorDortmund', NULL, 84, NULL, NULL),
(122, 'Pjanic', 'VOL', 'Roma', NULL, 84, NULL, NULL),
(123, 'Marchisio', 'VOL', 'Juventus', NULL, 84, NULL, NULL),
(124, 'Matuidi', 'VOL', 'PSG', NULL, 84, NULL, NULL),
(125, 'Xabi Alonso', 'VOL', 'BayernMunich', NULL, 84, NULL, NULL),
(126, 'Matic', 'VOL', 'Chelsea', NULL, 83, NULL, NULL),
(127, 'Thiago', 'VOL', 'BayernMunich', NULL, 83, NULL, NULL),
(128, 'Luiz Gustavo', 'VOL', 'Wolfsburg', NULL, 83, NULL, NULL),
(129, 'Nainggolan', 'VOL', 'Roma', NULL, 83, NULL, NULL),
(130, 'Xhaka', 'VOL', 'BorMochengladbach', NULL, 82, NULL, NULL),
(131, 'Krychowiak', 'VOL', 'Sevilla', NULL, 82, NULL, NULL),
(132, 'Parejo', 'VOL', 'Valencia', NULL, 82, NULL, NULL),
(133, 'Ramsey', 'VOL', 'Arsenal', NULL, 82, NULL, NULL),
(134, 'Bender', 'VOL', 'BorDortmund', NULL, 82, NULL, NULL),
(135, 'Schneiderlin', 'VOL', 'ManUtd', NULL, 82, NULL, NULL),
(136, 'Hamsik', 'VOL', 'Napoli', NULL, 82, NULL, NULL),
(137, 'Diarra', 'VOL', 'Marseille', NULL, 82, NULL, NULL),
(138, 'Toulalan', 'VOL', 'Monaco', NULL, 82, NULL, NULL),
(139, 'De Rossi', 'VOL', 'Roma', NULL, 82, NULL, NULL),
(140, 'T.Motta', 'VOL', 'PSG', NULL, 82, NULL, NULL),
(141, 'Pirlo', 'VOL', 'NewYorkCityFootball', NULL, 82, NULL, NULL),
(142, 'William Carvalho', 'VOL', 'Sporting', NULL, 81, NULL, NULL),
(143, 'Medel', 'VOL', 'InterMilan', NULL, 81, NULL, NULL),
(144, 'Ander Herrera', 'VOL', 'ManUtd', NULL, 81, NULL, NULL),
(145, 'Iturraspe', 'VOL', 'AtlBilbao', NULL, 81, NULL, NULL),
(146, 'Iborra', 'VOL', 'Sevilla', NULL, 81, NULL, NULL),
(147, 'Wilshere', 'VOL', 'Arsenal', NULL, 81, NULL, NULL),
(148, 'Bruno', 'VOL', 'Villareal', NULL, 81, NULL, NULL),
(149, 'Khedira', 'VOL', 'Juventus', NULL, 81, NULL, NULL),
(150, 'Witsel', 'VOL', 'Zenit', NULL, 81, NULL, NULL),
(151, 'Guardado', 'VOL', 'PSV', NULL, 81, NULL, NULL),
(152, 'Sahin', 'VOL', 'BorDortmund', NULL, 81, NULL, NULL),
(153, 'G.Castro', 'VOL', 'BorDortmund', NULL, 81, NULL, NULL),
(154, 'Biglia', 'VOL', 'Lazio', NULL, 81, NULL, NULL),
(155, 'Robben', 'MEIA', 'BayernMunich', NULL, 89, 1, 'http://media-titanium.cursecdn.com/attachments/68/187/robben-16.JPG'),
(156, 'Hazard', 'MEIA', 'Chelsea', NULL, 88, NULL, 'http://media-titanium.cursecdn.com/attachments/68/188/hazard-16.JPG'),
(157, 'Ozil', 'MEIA', 'Arsenal', NULL, 88, 1, 'http://media-titanium.cursecdn.com/attachments/68/148/ozil-16.JPG'),
(158, 'James Rodriguez', 'MEIA', 'RealMadrid', NULL, 87, NULL, 'http://media-titanium.cursecdn.com/attachments/68/143/james-16.JPG'),
(159, 'De Bruyne', 'MEIA', 'ManCity', NULL, 86, NULL, NULL),
(160, 'Reus', 'MEIA', 'BorDortmund', NULL, 86, 1, NULL),
(161, 'David Silva', 'MEIA', 'ManCity', NULL, 86, 2, NULL),
(162, 'Ribery', 'MEIA', 'BayernMunich', NULL, 86, NULL, NULL),
(163, 'Mkhitaryan', 'MEIA', 'BorDortmund', NULL, 85, NULL, NULL),
(164, 'Cazorla', 'MEIA', 'Arsenal', NULL, 85, NULL, NULL),
(165, 'Isco', 'MEIA', 'RealMadrid', NULL, 84, NULL, NULL),
(166, 'Gotze', 'MEIA', 'BayernMunich', NULL, 84, NULL, NULL),
(167, 'Hulk', 'MEIA', 'Zenit', NULL, 84, NULL, NULL),
(168, 'Coutinho', 'MEIA', 'Liverpool', NULL, 84, NULL, NULL),
(169, 'Koke', 'MEIA', 'AtlMadrid', NULL, 83, NULL, NULL),
(170, 'Douglas Costa', 'MEIA', 'BayernMunich', NULL, 83, NULL, NULL),
(171, 'Eriksen', 'MEIA', 'Tottenham', NULL, 83, NULL, NULL),
(172, 'Pedro', 'MEIA', 'Chelsea', NULL, 83, NULL, NULL),
(173, 'Gaitan', 'MEIA', 'Benfica', NULL, 83, NULL, NULL),
(174, 'Willian', 'MEIA', 'Chelsea', NULL, 83, NULL, NULL),
(175, 'Mata', 'MEIA', 'ManUtd', NULL, 83, NULL, NULL),
(176, 'Payet', 'MEIA', 'WestHam', NULL, 83, NULL, NULL),
(177, 'João Moutinho', 'MEIA', 'Monaco', NULL, 83, NULL, NULL),
(178, 'Turan', 'MEIA', 'Barcelona', NULL, 83, NULL, NULL),
(179, 'Bellarabi', 'MEIA', 'BayerLeverkusen', NULL, 82, NULL, NULL),
(180, 'Draxler', 'MEIA', 'Wolfsburg', NULL, 82, NULL, NULL),
(181, 'Konoplyanka', 'MEIA', 'Sevilla', NULL, 82, NULL, NULL),
(182, 'Kagawa', 'MEIA', 'BorDortmund', NULL, 82, NULL, NULL),
(183, 'Oscar', 'MEIA', 'Chelsea', NULL, 82, NULL, NULL),
(184, 'Nasri', 'MEIA', 'ManCity', NULL, 82, NULL, NULL),
(185, 'Borja Valero', 'MEIA', 'Fiorentina', NULL, 82, NULL, NULL),
(186, 'BenArfa', 'MEIA', 'OGCNice', NULL, 82, NULL, NULL),
(187, 'Sneijder', 'MEIA', 'Galatasaray', NULL, 82, NULL, NULL),
(188, 'Danny', 'MEIA', 'Zenit', NULL, 82, NULL, NULL),
(189, 'Mahrez', 'MEIA', 'Leicester', NULL, 81, NULL, NULL),
(190, 'Sterling', 'MEIA', 'ManCity', NULL, 81, NULL, NULL),
(191, 'Vitolo', 'MEIA', 'Sevilla', NULL, 81, NULL, NULL),
(192, 'Hermann', 'MEIA', 'BorMochengladbach', NULL, 81, NULL, NULL),
(193, 'Cuadrado', 'MEIA', 'Juventus', NULL, 81, NULL, NULL),
(194, 'Perisic', 'MEIA', 'InterMilan', NULL, 81, NULL, NULL),
(195, 'Banega', 'MEIA', 'Sevilla', NULL, 81, NULL, NULL),
(196, 'Mertens', 'MEIA', 'Napoli', NULL, 81, NULL, NULL),
(197, 'Raul Garcia', 'MEIA', 'AtlBilbao', NULL, 81, NULL, NULL),
(198, 'Walcott', 'MEIA', 'Arsenal', NULL, 81, NULL, NULL),
(199, 'Kaka', 'MEIA', 'OrlandoCity', NULL, 81, NULL, NULL),
(200, 'Joao Mario', 'MEIA', 'Sporting', NULL, 80, 2, NULL),
(201, 'LucasLima', 'MEIA', 'Santos', NULL, 80, NULL, NULL),
(202, 'Carrasco', 'MEIA', 'AtlMadrid', NULL, 80, NULL, NULL),
(203, 'Messi', 'PNT', 'Barcelona', NULL, 94, 1, 'https://pbs.twimg.com/media/CNrxOQrVAAAetgf.png'),
(204, 'Cristiano Ronaldo', 'PNT', 'RealMadrid', NULL, 93, 1, 'http://media-titanium.cursecdn.com/attachments/68/184/ronaldo-16.JPG'),
(205, 'Neymar', 'PNT', 'Barcelona', NULL, 90, 2, 'http://media-titanium.cursecdn.com/attachments/68/190/neymar-16.JPG'),
(206, 'Bale', 'PNT', 'RealMadrid', NULL, 87, NULL, 'http://media-titanium.cursecdn.com/attachments/68/57/bale-16.JPG'),
(207, 'DiMaria', 'PNT', 'PSG', NULL, 86, NULL, NULL),
(208, 'Sanchez', 'PNT', 'Arsenal', NULL, 86, NULL, NULL),
(209, 'Nani', 'PNT', 'Fenerbahce', NULL, 82, NULL, NULL),
(210, 'Brahimi', 'PNT', 'Porto', NULL, 82, NULL, NULL),
(211, 'Insigne', 'PNT', 'Napoli', NULL, 82, NULL, NULL),
(212, 'Nolito', 'PNT', 'CeltaVigo', NULL, 82, NULL, NULL),
(213, 'Vela', 'PNT', 'RealSociedad', NULL, 81, NULL, NULL),
(214, 'Candreva', 'PNT', 'Lazio', NULL, 81, NULL, NULL),
(215, 'Feghouli', 'PNT', 'Valencia', NULL, 81, NULL, NULL),
(216, 'Callejon', 'PNT', 'Napoli', NULL, 81, NULL, NULL),
(217, 'Lucas', 'PNT', 'PSG', NULL, 81, NULL, NULL),
(218, 'Berardi', 'PNT', 'Sassuolo', NULL, 81, NULL, NULL),
(219, 'Muniain', 'PNT', 'AtlBilbao', NULL, 80, NULL, NULL),
(220, 'Orellana', 'PNT', 'CeltaVigo', NULL, 80, NULL, NULL),
(221, 'Jese', 'PNT', 'RealMadrid', NULL, 80, NULL, NULL),
(222, 'Salah', 'PNT', 'Roma', NULL, 80, 2, NULL),
(223, 'Suarez', 'ATA', 'Barcelona', NULL, 90, NULL, 'http://media-titanium.cursecdn.com/attachments/68/185/suarez-16.JPG'),
(224, 'Ibrahimovic', 'ATA', 'PSG', NULL, 89, NULL, 'http://media-titanium.cursecdn.com/attachments/68/189/zlatan-16.JPG'),
(225, 'Lewandowski', 'ATA', 'BayernMunich', NULL, 88, 2, 'http://media-titanium.cursecdn.com/attachments/68/56/robert-16.JPG'),
(226, 'Aguero', 'ATA', 'ManCity', NULL, 88, NULL, 'http://media-titanium.cursecdn.com/attachments/68/151/agueri-16.JPG'),
(227, 'Higuain', 'ATA', 'Napoli', NULL, 86, NULL, NULL),
(228, 'Benzema', 'ATA', 'RealMadrid', NULL, 86, 1, NULL),
(229, 'DiegoCosta', 'ATA', 'Chelsea', NULL, 85, NULL, NULL),
(230, 'Cavani', 'ATA', 'PSG', NULL, 85, NULL, NULL),
(231, 'Tevez', 'ATA', 'BocaJuniors', NULL, 85, 1, NULL),
(232, 'Rooney', 'ATA', 'ManUtd', NULL, 85, NULL, NULL),
(233, 'Griezzmann', 'ATA', 'AtlMadrid', NULL, 84, NULL, NULL),
(234, 'Aubameyang', 'ATA', 'BorDortmund', NULL, 84, NULL, NULL),
(235, 'Lacazette', 'ATA', 'Lyon', NULL, 83, NULL, NULL),
(236, 'Jonas', 'ATA', 'Benfica', NULL, 83, NULL, NULL),
(237, 'Sturridge', 'ATA', 'Liverpool', NULL, 83, NULL, NULL),
(238, 'Bacca', 'ATA', 'Milan', NULL, 82, NULL, NULL),
(239, 'Kane', 'ATA', 'Tottenham', NULL, 82, NULL, NULL),
(240, 'Lukaku', 'ATA', 'Everton', NULL, 82, NULL, NULL),
(241, 'Mandzukic', 'ATA', 'Juventus', NULL, 82, NULL, NULL),
(242, 'Giroud', 'ATA', 'Arsenal', NULL, 82, NULL, NULL),
(243, 'Hernandez', 'ATA', 'BayerLeverkusen', NULL, 82, NULL, NULL),
(244, 'Falcao', 'ATA', 'Chelsea', NULL, 82, NULL, NULL),
(245, 'Aduriz', 'ATA', 'AtlBilbao', NULL, 81, NULL, NULL),
(246, 'Dybala', 'ATA', 'Juventus', NULL, 81, NULL, NULL),
(247, 'Van Persie', 'ATA', 'Fenerbahce', NULL, 81, NULL, NULL),
(248, 'Mario Gomez', 'ATA', 'Besiktas', NULL, 81, NULL, NULL),
(249, 'Huntelaar', 'ATA', 'Schalke04', NULL, 81, NULL, NULL),
(250, 'Negredo', 'ATA', 'Valencia', NULL, 81, NULL, NULL),
(251, 'David Villa', 'ATA', 'NewYorkCity', NULL, 81, NULL, NULL),
(252, 'Drogba', 'ATA', 'MontrealImpact', NULL, 81, NULL, NULL);

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
  `JogadorID` int(11) NOT NULL
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
  `Orcamento` decimal(12,2) NOT NULL DEFAULT '250000.00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`ID`, `Nome`, `PSN`, `Email`, `Senha`, `Orcamento`) VALUES
(1, 'Thiago Oliva', 'thiag6', 'thiagosfoliva@gmail.com', 'testes', '250000.00'),
(2, 'Lucas Domingues', 'luped720', 'luped@galaticos', 'testes', '250000.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`EquipeID`);

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
  MODIFY `EquipeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jogador`
--
ALTER TABLE `jogador`
  MODIFY `JogadorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;
--
-- AUTO_INCREMENT for table `transferencia`
--
ALTER TABLE `transferencia`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
