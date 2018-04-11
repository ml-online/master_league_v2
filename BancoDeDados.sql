
-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 11/04/2018 às 01:37:14
-- Versão do Servidor: 10.1.24-MariaDB
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Extraindo dados da tabela `equipe`
--

INSERT INTO `equipe` (`EquipeID`, `NomeEquipe`, `Escudo`, `UsuarioID`) VALUES
(1, 'Athletic Novaes', 'https://upload.wikimedia.org/wikipedia/en/thumb/9/98/Club_Athletic_Bilbao_logo.svg/903px-Club_Athletic_Bilbao_logo.svg.png', 1),
(2, 'Real Tijucanos', NULL, 2),
(4, 'Clube do Remo', NULL, 4),
(5, 'Tigre do Sul FC', 'https://3.bp.blogspot.com/-E_0BHChxk3c/VroheSNeDiI/AAAAAAAAArA/lWEBNG7cfjM/s320/CRICIMA.png', 5),
(6, 'Galo Forte', 'http://1.bp.blogspot.com/-AAtOHIVdnhg/T5BckwjfyqI/AAAAAAAAA6E/BSnf_RkIR3o/s1600/fu8k1k.png', 6),
(7, 'Peleadores do Sul', NULL, 7),
(8, 'Poderoso do Sul', NULL, 8),
(9, 'Los Hermanos FC', 'http://www.ogol.com.br/img/logos/equipas/2218_imgbank.png', 9),
(10, 'HANDICAP (BUG)', NULL, 10),
(11, 'Barbosateam', NULL, 11),
(12, 'Nova Iguaçu FA', NULL, 12);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=531 ;

--
-- Extraindo dados da tabela `jogador`
--

INSERT INTO `jogador` (`JogadorID`, `NomeJogador`, `Posicao`, `EquipeOriginal`, `Preco`, `Overall`, `EquipeID`, `Imagem`, `Escala`) VALUES
(228, 'Neuer', 'GOL', NULL, NULL, 92, NULL, 'http://intouch.wunderweib.de/assets/styles/600x600/public/field/image/manuel-neuer-2.jpg?itok=05jhHQt2', 0),
(229, 'De Gea', 'GOL', NULL, NULL, 90, NULL, 'http://static.dnaindia.com/sites/default/files/2015/12/17/405743-david.jpg', 0),
(230, 'Courtois', 'GOL', NULL, NULL, 89, NULL, NULL, 0),
(231, 'Buffon', 'GOL', NULL, NULL, 89, NULL, NULL, 0),
(232, 'Handanovic	', 'GOL', NULL, NULL, 87, NULL, NULL, 0),
(233, 'Lloris', 'GOL', NULL, NULL, 88, NULL, NULL, 0),
(234, 'Oblak', 'GOL', NULL, NULL, 88, NULL, NULL, 0),
(235, 'Ter Stegen', 'GOL', NULL, NULL, 85, NULL, NULL, 0),
(236, 'Cech', 'GOL', NULL, NULL, 86, NULL, NULL, 0),
(237, 'Subasic', 'GOL', NULL, NULL, 85, NULL, NULL, 0),
(238, 'Leno', 'GOL', NULL, NULL, 85, NULL, NULL, 0),
(239, 'Ruffier', 'GOL', NULL, NULL, 85, NULL, NULL, 0),
(240, 'Navas', 'GOL', NULL, NULL, 85, NULL, NULL, 0),
(241, 'Perin', 'GOL', NULL, NULL, 83, NULL, NULL, 0),
(242, 'Ederson', 'GOL', NULL, NULL, 83, NULL, NULL, 0),
(243, 'Fahrmann', 'GOL', NULL, NULL, 84, NULL, NULL, 0),
(244, 'Consigli', 'GOL', NULL, NULL, 82, NULL, NULL, 0),
(245, 'Cassilas', 'GOL', NULL, NULL, 83, NULL, NULL, 0),
(246, 'Rui Patricio', 'GOL', NULL, NULL, 83, NULL, NULL, 0),
(247, 'Sommer', 'GOL', NULL, NULL, 83, NULL, NULL, 0),
(248, 'Reina', 'GOL', NULL, NULL, 83, NULL, NULL, 0),
(249, 'Rulli', 'GOL', NULL, NULL, 83, NULL, NULL, 0),
(250, 'Muslera', 'GOL', NULL, NULL, 82, NULL, NULL, 0),
(251, 'Szczesny', 'GOL', NULL, NULL, 82, NULL, NULL, 0),
(252, 'Begovic', 'GOL', NULL, NULL, 82, NULL, NULL, 0),
(253, 'Mandanda', 'GOL', NULL, NULL, 82, NULL, NULL, 0),
(254, 'Bravo', 'GOL', NULL, NULL, 82, NULL, NULL, 0),
(255, 'Trapp', 'GOL', NULL, NULL, 82, NULL, NULL, 0),
(256, 'Hart', 'GOL', NULL, NULL, 82, NULL, NULL, 0),
(257, 'Donnarumma', 'GOL', NULL, NULL, 82, NULL, NULL, 0),
(258, 'Butland', 'GOL', NULL, NULL, 81, NULL, NULL, 0),
(259, 'Mignolet', 'GOL', NULL, NULL, 81, NULL, NULL, 0),
(260, 'Cillessen', 'GOL', NULL, NULL, 81, NULL, NULL, 0),
(261, 'Sirigu', 'GOL', NULL, NULL, 80, NULL, NULL, 0),
(262, 'Alisson', 'GOL', NULL, NULL, 80, NULL, NULL, 0),
(263, 'Sergio Ramos', 'ZAG', NULL, NULL, 90, NULL, NULL, 0),
(264, 'Hummels', 'ZAG', NULL, NULL, 88, NULL, NULL, 0),
(265, 'Chiellini', 'ZAG', NULL, NULL, 89, NULL, NULL, 0),
(266, 'Boateng', 'ZAG', NULL, NULL, 88, NULL, NULL, 0),
(267, 'Bonucci', 'ZAG', NULL, NULL, 88, NULL, NULL, 0),
(268, 'Thiago Silva', 'ZAG', NULL, NULL, 88, NULL, NULL, 0),
(269, 'Godin', 'ZAG', NULL, NULL, 88, NULL, NULL, 0),
(270, 'Pique', 'ZAG', NULL, NULL, 87, NULL, NULL, 0),
(271, 'Miranda', 'ZAG', NULL, NULL, 86, NULL, NULL, 0),
(272, 'Javi Martinez', 'ZAG', NULL, NULL, 86, NULL, NULL, 0),
(273, 'Alderweireld', 'ZAG', NULL, NULL, 86, NULL, NULL, 0),
(274, 'David Luiz', 'ZAG', NULL, NULL, 86, NULL, NULL, 0),
(275, 'Sokratis', 'ZAG', NULL, NULL, 86, NULL, NULL, 0),
(276, 'Pepe', 'ZAG', NULL, NULL, 86, NULL, NULL, 0),
(277, 'Benatia', 'ZAG', NULL, NULL, 85, NULL, NULL, 0),
(278, 'Otamendi', 'ZAG', NULL, NULL, 83, NULL, NULL, 0),
(279, 'Vertonghen', 'ZAG', NULL, NULL, 85, NULL, NULL, 0),
(280, 'Kompany', 'ZAG', NULL, NULL, 85, NULL, NULL, 0),
(281, 'Glik', 'ZAG', NULL, NULL, 85, NULL, NULL, 0),
(282, 'Varane', 'ZAG', NULL, NULL, 85, NULL, NULL, 0),
(283, 'Barzagli', 'ZAG', NULL, NULL, 85, NULL, NULL, 0),
(284, 'Naldo', 'ZAG', NULL, NULL, 82, NULL, NULL, 0),
(285, 'Sule', 'ZAG', NULL, NULL, 83, NULL, NULL, 0),
(286, 'Kimmich', 'ZAG', NULL, NULL, 84, NULL, NULL, 0),
(287, 'Marquinhos', 'ZAG', NULL, NULL, 83, NULL, NULL, 0),
(288, 'de Vrij', 'ZAG', NULL, NULL, 84, NULL, NULL, 0),
(289, 'Laporte', 'ZAG', NULL, NULL, 84, NULL, NULL, 0),
(290, 'Mustafi', 'ZAG', NULL, NULL, 84, NULL, NULL, 0),
(291, 'Bailly', 'ZAG', NULL, NULL, 84, NULL, NULL, 0),
(292, 'Koscielny', 'ZAG', NULL, NULL, 84, NULL, NULL, 0),
(293, 'Benatia', 'ZAG', NULL, NULL, 84, NULL, NULL, 0),
(294, 'Manolas', 'ZAG', NULL, NULL, 84, NULL, NULL, 0),
(295, 'Cahill', 'ZAG', NULL, NULL, 84, NULL, NULL, 0),
(296, 'Koulibaly', 'ZAG', NULL, NULL, 84, NULL, NULL, 0),
(297, 'Albiol', 'ZAG', NULL, NULL, 82, NULL, NULL, 0),
(298, 'van Dijk', 'ZAG', NULL, NULL, 83, NULL, NULL, 0),
(299, 'Umtiti', 'ZAG', NULL, NULL, 83, NULL, NULL, 0),
(300, 'Garay', 'ZAG', NULL, NULL, 83, NULL, NULL, 0),
(301, 'Gimenez', 'ZAG', NULL, NULL, 83, NULL, NULL, 0),
(302, 'Musacchio', 'ZAG', NULL, NULL, 83, NULL, NULL, 0),
(303, 'Toprak', 'ZAG', NULL, NULL, 83, NULL, NULL, 0),
(304, 'Howedes', 'ZAG', NULL, NULL, 83, NULL, NULL, 0),
(305, 'Christensen', 'ZAG', NULL, NULL, 81, NULL, NULL, 0),
(306, 'Felipe', 'ZAG', NULL, NULL, 82, NULL, NULL, 0),
(307, 'Corluka', 'ZAG', NULL, NULL, 82, NULL, NULL, 0),
(308, 'Rudiger', 'ZAG', NULL, NULL, 82, NULL, NULL, 0),
(309, 'Fazio', 'ZAG', NULL, NULL, 82, NULL, NULL, 0),
(310, 'Rojo', 'ZAG', NULL, NULL, 82, NULL, NULL, 0),
(311, 'Savic', 'ZAG', NULL, NULL, 82, NULL, NULL, 0),
(312, 'Dier', 'ZAG', NULL, NULL, 82, NULL, NULL, 0),
(313, 'Phil Jones', 'ZAG', NULL, NULL, 81, NULL, NULL, 0),
(314, 'Bartra', 'ZAG', NULL, NULL, 81, NULL, NULL, 0),
(315, 'Coates', 'ZAG', NULL, NULL, 81, NULL, NULL, 0),
(316, 'Skrtel', 'ZAG', NULL, NULL, 81, NULL, NULL, 0),
(317, 'Semedo', 'ZAG', NULL, NULL, 81, NULL, NULL, 0),
(318, 'Dante', 'ZAG', NULL, NULL, 81, NULL, NULL, 0),
(319, 'Mertesacker', 'ZAG', NULL, NULL, 81, NULL, NULL, 0),
(320, 'Sakho', 'ZAG', NULL, NULL, 81, NULL, NULL, 0),
(321, 'Smalling', 'ZAG', NULL, NULL, 81, NULL, NULL, 0),
(322, 'Nacho Fernandez', 'ZAG', NULL, NULL, 81, NULL, NULL, 0),
(323, 'Mina', 'ZAG', NULL, NULL, 80, NULL, NULL, 0),
(324, 'Alba', 'LD', NULL, NULL, 85, NULL, NULL, 0),
(325, 'Marcelo', 'LD', NULL, NULL, 87, NULL, NULL, 0),
(326, 'Filipe Luis', 'LD', NULL, NULL, 85, NULL, NULL, 0),
(327, 'Azpilicueta', 'LD', NULL, NULL, 85, NULL, NULL, 0),
(328, 'Alaba', 'LD', NULL, NULL, 86, NULL, NULL, 0),
(329, 'Alex Sandro', 'LD', NULL, NULL, 86, NULL, NULL, 0),
(330, 'Walker', 'LD', NULL, NULL, 83, NULL, NULL, 0),
(331, 'Dani Alves', 'LD', NULL, NULL, 84, NULL, NULL, 0),
(332, 'Carvajal', 'LD', NULL, NULL, 84, NULL, NULL, 0),
(333, 'Piszczek', 'LD', NULL, NULL, 83, NULL, NULL, 0),
(334, 'Juanfran', 'LD', NULL, NULL, 83, NULL, NULL, 0),
(335, 'Valência', 'LD', NULL, NULL, 83, NULL, NULL, 0),
(336, 'Alex Teles', 'LD', NULL, NULL, 80, NULL, NULL, 0),
(337, 'Sergi Roberto', 'LD', NULL, NULL, 81, NULL, NULL, 0),
(338, 'Marcos Alonso', 'LD', NULL, NULL, 82, NULL, NULL, 0),
(339, 'Lichtsteiner', 'LD', NULL, NULL, 82, NULL, NULL, 0),
(340, 'Clyne', 'LD', NULL, NULL, 82, NULL, NULL, 0),
(341, 'Florenzi', 'LD', NULL, NULL, 82, NULL, NULL, 0),
(342, 'Rose', 'LD', NULL, NULL, 82, NULL, NULL, 0),
(343, 'Baines', 'LD', NULL, NULL, 82, NULL, NULL, 0),
(344, 'Evra', 'LD', NULL, NULL, 81, NULL, NULL, 0),
(345, 'Kolarov', 'LD', NULL, NULL, 81, NULL, NULL, 0),
(346, 'Srna', 'LD', NULL, NULL, 81, NULL, NULL, 0),
(347, 'Mario Fernandes', 'LD', NULL, NULL, 81, NULL, NULL, 0),
(348, 'Coleman', 'LD', NULL, NULL, 81, NULL, NULL, 0),
(349, 'Meunier', 'LD', NULL, NULL, 81, NULL, NULL, 0),
(350, 'Ricardo Rodrigues', 'LD', NULL, NULL, 81, NULL, NULL, 0),
(351, 'Bellerin', 'LD', NULL, NULL, 81, NULL, NULL, 0),
(352, 'Aurier', 'LD', NULL, NULL, 81, NULL, NULL, 0),
(353, 'Ghoulam', 'LD', NULL, NULL, 80, NULL, NULL, 0),
(354, 'Kurzawa', 'LD', NULL, NULL, 80, NULL, NULL, 0),
(355, 'Kante', 'VOL', NULL, NULL, 87, NULL, NULL, 0),
(356, 'Busquets', 'VOL', NULL, NULL, 87, NULL, NULL, 0),
(357, 'Casemiro', 'VOL', NULL, NULL, 85, NULL, NULL, 0),
(358, 'Fabinho', 'VOL', NULL, NULL, 84, NULL, NULL, 0),
(359, 'Matic', 'VOL', NULL, NULL, 84, NULL, NULL, 0),
(360, 'Luiz Gustavo', 'VOL', NULL, NULL, 80, NULL, NULL, 0),
(361, 'Wanyama', 'VOL', NULL, NULL, 82, NULL, 'https://www.capitalfm.co.ke/sports/files/2016/03/WANYAMA.jpg', 0),
(362, 'Lars Bender', 'VOL', NULL, NULL, 82, NULL, NULL, 0),
(363, 'Seri', 'VOL', NULL, NULL, 82, NULL, NULL, 0),
(364, 'Medel', 'VOL', NULL, NULL, 82, NULL, NULL, 0),
(365, 'Bakayoko', 'VOL', NULL, NULL, 82, NULL, NULL, 0),
(366, 'Moussa Dembele', 'VOL', NULL, NULL, 82, NULL, NULL, 0),
(367, 'Allan', 'VOL', NULL, NULL, 80, NULL, NULL, 0),
(368, 'Thiago Motta', 'VOL', NULL, NULL, 81, NULL, NULL, 0),
(369, 'Parolo', 'VOL', NULL, NULL, 81, NULL, NULL, 0),
(370, 'Kroos', 'MC', NULL, NULL, 90, NULL, NULL, 0),
(371, 'Modric', 'MC', NULL, NULL, 89, NULL, NULL, 0),
(372, 'Pogba', 'MC', NULL, NULL, 87, NULL, 'https://1.bp.blogspot.com/-f_PmwKXK8vg/V6nCjwtLU3I/AAAAAAAAFhw/YYEYPBjHNLEIRLuuuDdJksFg2txNBECmQCLcB/s1600/pogba9.jpg', 0),
(373, 'Thiago', 'MC', NULL, NULL, 88, NULL, NULL, 0),
(374, 'Rakitic', 'MC', NULL, NULL, 87, NULL, NULL, 0),
(375, 'Hamsik', 'MC', NULL, NULL, 87, NULL, NULL, 0),
(376, 'Verratti', 'MC', NULL, NULL, 87, NULL, NULL, 0),
(377, 'Iniesta', 'MC', NULL, NULL, 87, NULL, NULL, 0),
(378, 'Vidal', 'MC', NULL, NULL, 87, NULL, NULL, 0),
(379, 'Fabregas', 'MC', NULL, NULL, 86, NULL, NULL, 0),
(380, 'Nainggolan', 'MC', NULL, NULL, 86, NULL, NULL, 0),
(381, 'Koke', 'MC', NULL, NULL, 84, NULL, NULL, 0),
(382, 'Fernandinho', 'MC', NULL, NULL, 85, NULL, NULL, 0),
(383, 'Pjanic', 'MC', NULL, NULL, 85, NULL, NULL, 0),
(384, 'Marchisio', 'MC', NULL, NULL, 85, NULL, NULL, 0),
(385, 'Gundogan', 'MC', NULL, NULL, 85, NULL, NULL, 0),
(386, 'Matuidi', 'MC', NULL, NULL, 85, NULL, NULL, 0),
(387, 'Ander Herrera', 'MC', NULL, NULL, 84, NULL, 'https://pbs.twimg.com/media/BxbstMBCIAAW0N3.jpg', 0),
(388, 'Khedira', 'MC', NULL, NULL, 84, NULL, NULL, 0),
(389, 'Strootman', 'MC', NULL, NULL, 84, NULL, NULL, 0),
(390, 'Adrien Silva', 'MC', NULL, NULL, 83, NULL, NULL, 0),
(391, 'Paulinho', 'MC', NULL, NULL, 83, NULL, NULL, 0),
(392, 'Saul', 'MC', NULL, NULL, 83, NULL, NULL, 0),
(393, 'Joao Mario', 'MC', NULL, NULL, 83, NULL, NULL, 0),
(394, 'Willian Carvalho', 'MC', NULL, NULL, 83, NULL, NULL, 0),
(395, 'Yaya Toure', 'MC', NULL, NULL, 83, NULL, NULL, 0),
(396, 'Biglia', 'MC', NULL, NULL, 83, NULL, NULL, 0),
(397, 'De Rossi', 'MC', NULL, NULL, 83, NULL, NULL, 0),
(398, 'Rabiot', 'MC', NULL, NULL, 80, NULL, NULL, 0),
(399, 'Arda Turan', 'MC', NULL, NULL, 82, NULL, NULL, 0),
(400, 'Joao Moutinho', 'MC', NULL, NULL, 82, NULL, NULL, 0),
(401, 'Xhaka', 'MC', NULL, NULL, 82, NULL, NULL, 0),
(402, 'Henderson', 'MC', NULL, NULL, 82, NULL, NULL, 0),
(403, 'Shaquiri', 'MC', NULL, NULL, 82, NULL, NULL, 0),
(404, 'Ramsey', 'MC', NULL, NULL, 82, NULL, NULL, 0),
(405, 'Jorginho', 'MC', NULL, NULL, 81, NULL, NULL, 0),
(406, 'Rafinha', 'MC', NULL, NULL, 81, NULL, NULL, 0),
(407, 'De Bruyne', 'MEI', NULL, NULL, 89, NULL, NULL, 0),
(408, 'David Silva', 'MEI', NULL, NULL, 87, NULL, NULL, 0),
(409, 'Eriksen', 'MEI', NULL, NULL, 87, NULL, NULL, 0),
(410, 'Ozil', 'MEI', NULL, NULL, 88, NULL, NULL, 0),
(411, 'Coutinho', 'MEI', NULL, NULL, 86, NULL, NULL, 0),
(412, 'James Rodrigues', 'MEI', NULL, NULL, 86, NULL, NULL, 0),
(413, 'Mata', 'MEI', NULL, NULL, 84, NULL, NULL, 0),
(414, 'Asensio', 'MEI', NULL, NULL, 84, NULL, NULL, 0),
(415, 'Draxler', 'MEI', NULL, NULL, 84, NULL, NULL, 0),
(416, 'Payet', 'MEI', NULL, NULL, 84, NULL, NULL, 0),
(417, 'Willian', 'MEI', NULL, NULL, 84, NULL, NULL, 0),
(418, 'Dele Alli', 'MEI', NULL, NULL, 84, NULL, NULL, 0),
(419, 'Giuliano', 'MEI', NULL, NULL, 81, NULL, NULL, 0),
(420, 'Sneidjer', 'MEI', NULL, NULL, 83, NULL, NULL, 0),
(421, 'Borja Valero', 'MEI', NULL, NULL, 83, NULL, NULL, 0),
(422, 'Kagawa', 'MEI', NULL, NULL, 83, NULL, NULL, 0),
(423, 'Banega', 'MEI', NULL, NULL, 83, NULL, NULL, 0),
(424, 'Suso', 'MEI', NULL, NULL, 82, NULL, NULL, 0),
(425, 'Lanzini', 'MEI', NULL, NULL, 81, NULL, NULL, 0),
(426, 'Ben Yedder', 'MEI', NULL, NULL, 81, NULL, NULL, 0),
(427, 'Rooney', 'MEI', NULL, NULL, 81, NULL, NULL, 0),
(428, 'Berardi', 'MEI', NULL, NULL, 81, NULL, NULL, 0),
(429, 'Felipe Anderson', 'MEI', NULL, NULL, 81, NULL, NULL, 0),
(430, 'Ben Arfa', 'MEI', NULL, NULL, 81, NULL, NULL, 0),
(431, 'Ganso', 'MEI', NULL, NULL, 80, NULL, NULL, 0),
(432, 'Menphis Depay', 'MEI', NULL, NULL, 80, NULL, NULL, 0),
(433, 'Perisic', 'MEI', NULL, NULL, 84, NULL, NULL, 0),
(434, 'Isco', 'MEI', NULL, NULL, 86, NULL, NULL, 0),
(435, 'Parejo', 'MEI', NULL, NULL, 84, NULL, NULL, 0),
(436, 'Martial', 'MEI', NULL, NULL, 83, NULL, NULL, 0),
(437, 'Quaresma', 'MEI', NULL, NULL, 83, NULL, NULL, 0),
(438, 'Bonaventura', 'MEI', NULL, NULL, 83, NULL, NULL, 0),
(439, 'Lallana', 'MEI', NULL, NULL, 83, NULL, NULL, 0),
(440, 'Gaitan', 'MEI', NULL, NULL, 83, NULL, NULL, 0),
(441, 'Cazorla', 'MEI', NULL, NULL, 83, NULL, NULL, 0),
(442, 'Pastore', 'MEI', NULL, NULL, 83, NULL, NULL, 0),
(443, 'Gotze', 'MEI', NULL, NULL, 81, NULL, NULL, 0),
(444, 'Messi', 'PNT', NULL, NULL, 93, NULL, 'https://www.soccerbible.com/media/60310/messi-extension-contract-tab-min.jpg', 0),
(445, 'Neymar', 'PNT', NULL, NULL, 92, NULL, 'https://i0.wp.com/paginabrazil.com/wp-content/uploads/2017/08/Neymar-PSG.jpg', 0),
(446, 'Hazard', 'PNT', NULL, NULL, 90, NULL, NULL, 0),
(447, 'Dybala', 'PNT', NULL, NULL, 88, NULL, NULL, 0),
(448, 'Bale', 'PNT', NULL, NULL, 89, NULL, NULL, 0),
(449, 'Aubameyang', 'PNT', NULL, NULL, 88, NULL, NULL, 0),
(450, 'Griezmann', 'PNT', NULL, NULL, 88, NULL, NULL, 0),
(451, 'Insigne', 'PNT', NULL, NULL, 85, NULL, NULL, 0),
(452, 'Mertens', 'PNT', NULL, NULL, 86, NULL, NULL, 0),
(453, 'Morata', 'PNT', NULL, NULL, 84, NULL, NULL, 0),
(454, 'Salah', 'PNT', NULL, NULL, 83, NULL, NULL, 0),
(455, 'Di Maria', 'PNT', NULL, NULL, 85, NULL, NULL, 0),
(456, 'Iago Aspas', 'PNT', NULL, NULL, 83, NULL, NULL, 0),
(457, 'Mbappe', 'PNT', NULL, NULL, 83, NULL, NULL, 0),
(458, 'Sterling', 'PNT', NULL, NULL, 82, NULL, NULL, 0),
(459, 'Sane', 'PNT', NULL, NULL, 82, NULL, NULL, 0),
(460, 'Mane', 'PNT', NULL, NULL, 84, NULL, NULL, 0),
(461, 'Pedro', 'PNT', NULL, NULL, 84, NULL, NULL, 0),
(462, 'Aduriz', 'PNT', NULL, NULL, 84, NULL, NULL, 0),
(463, 'Giovinco', 'PNT', NULL, NULL, 82, NULL, NULL, 0),
(464, 'Nani', 'PNT', NULL, NULL, 83, NULL, NULL, 0),
(465, 'Belotti', 'PNT', NULL, NULL, 83, NULL, NULL, 0),
(466, 'Gameiro', 'PNT', NULL, NULL, 83, NULL, NULL, 0),
(467, 'Callejon', 'PNT', NULL, NULL, 83, NULL, NULL, 0),
(468, 'Malcon', 'PNT', NULL, NULL, 82, NULL, NULL, 0),
(469, 'Deulofeu', 'PNT', NULL, NULL, 82, NULL, NULL, 0),
(470, 'Lucas', 'PNT', NULL, NULL, 82, NULL, NULL, 0),
(471, 'Vela', 'PNT', NULL, NULL, 82, NULL, NULL, 0),
(472, 'Sturridge', 'PNT', NULL, NULL, 82, NULL, NULL, 0),
(473, 'Lucas Vasquez', 'PNT', NULL, NULL, 82, NULL, NULL, 0),
(474, 'El Shaarawy', 'PNT', NULL, NULL, 80, NULL, NULL, 0),
(475, 'Yarmolenko', 'PNT', NULL, NULL, 81, NULL, NULL, 0),
(476, 'Vardy', 'PNT', NULL, NULL, 81, NULL, NULL, 0),
(477, 'Alexis Sanchez', 'PNT', NULL, NULL, 89, NULL, NULL, 0),
(478, 'Robben', 'PNT', NULL, NULL, 88, NULL, NULL, 0),
(479, 'Ribery', 'PNT', NULL, NULL, 86, NULL, NULL, 0),
(480, 'Reus', 'PNT', NULL, NULL, 86, NULL, NULL, 0),
(481, 'Lemar', 'PNT', NULL, NULL, 84, NULL, NULL, 0),
(482, 'Mkhitaryan', 'PNT', NULL, NULL, 85, NULL, NULL, 0),
(483, 'Carrasco', 'PNT', NULL, NULL, 85, NULL, NULL, 0),
(484, 'Brahimi', 'PNT', NULL, NULL, 82, NULL, NULL, 0),
(485, 'Mahrez', 'PNT', NULL, NULL, 83, NULL, NULL, 0),
(486, 'Bernardo Silva', 'PNT', NULL, NULL, 84, NULL, NULL, 0),
(487, 'Cuadrado', 'PNT', NULL, NULL, 83, NULL, NULL, 0),
(488, 'Douglas Costa', 'PNT', NULL, NULL, 83, NULL, NULL, 0),
(489, 'Son', 'PNT', NULL, NULL, 83, NULL, NULL, 0),
(490, 'Dembele', 'PNT', NULL, NULL, 83, NULL, NULL, 0),
(491, 'Coman', 'PNT', NULL, NULL, 82, NULL, NULL, 0),
(492, 'Taison', 'PNT', NULL, NULL, 82, NULL, NULL, 0),
(493, 'Gonzalo Castro', 'PNT', NULL, NULL, 82, NULL, NULL, 0),
(494, 'Kovacic', 'PNT', NULL, NULL, 82, NULL, NULL, 0),
(495, 'Andre Gomes', 'PNT', NULL, NULL, 82, NULL, NULL, 0),
(496, 'Arnautovic', 'PNT', NULL, NULL, 82, NULL, NULL, 0),
(497, 'Wijnaldum', 'PNT', NULL, NULL, 82, NULL, NULL, 0),
(498, 'Mirallas', 'PNT', NULL, NULL, 81, NULL, NULL, 0),
(499, 'Cristiano Ronaldo', 'ATA', NULL, NULL, 94, NULL, 'https://i.pinimg.com/736x/64/33/13/6433134d0be623a8131e904f97418d5a--cr-ronaldo-cristiano-ronaldo.jpg', 0),
(500, 'Suarez  ', 'ATA', NULL, NULL, 92, NULL, NULL, 0),
(501, 'Lewandowski', 'ATA', NULL, NULL, 91, NULL, NULL, 0),
(502, 'Higuain', 'ATA', NULL, NULL, 90, NULL, NULL, 0),
(503, 'Aguero', 'ATA', NULL, NULL, 89, NULL, NULL, 0),
(504, 'Cavani', 'ATA', NULL, NULL, 87, NULL, NULL, 0),
(505, 'Kane', 'ATA', NULL, NULL, 86, NULL, NULL, 0),
(506, 'Ibrahimovic', 'ATA', NULL, NULL, 88, NULL, NULL, 0),
(507, 'Icardi', 'ATA', NULL, NULL, 84, NULL, NULL, 0),
(508, 'Diego Costa', 'ATA', NULL, NULL, 86, NULL, NULL, 0),
(509, 'Benzema', 'ATA', NULL, NULL, 86, NULL, NULL, 0),
(510, 'Lukaku', 'ATA', NULL, NULL, 86, NULL, NULL, 0),
(511, 'Muller', 'ATA', NULL, NULL, 86, NULL, NULL, 0),
(512, 'Immobile', 'ATA', NULL, NULL, 82, NULL, NULL, 0),
(513, 'Lacazette', 'ATA', NULL, NULL, 85, NULL, NULL, 0),
(514, 'Jonas', 'ATA', NULL, NULL, 83, NULL, NULL, 0),
(515, 'Firmino', 'ATA', NULL, NULL, 83, NULL, 'https://www.soccerbible.com/media/59388/firmino-interview-adidas-tab-min.jpg', 0),
(516, 'Falcao', 'ATA', NULL, NULL, 84, NULL, NULL, 0),
(517, 'Dzeko', 'ATA', NULL, NULL, 84, NULL, NULL, 0),
(518, 'Werner', 'ATA', NULL, NULL, 82, NULL, 'https://www.ksta.de/image/29924064/1x1/620/620/ab91f877491b4855291667dfb813ef8d/GN/urn-newsml-dpa-com-20090101-180325-99-635100-large-4-3.jpg?view=fragmentPreview', 0),
(519, 'Balotelli', 'ATA', NULL, NULL, 83, NULL, NULL, 0),
(520, 'Gabriel Jesus', 'ATA', NULL, NULL, 81, NULL, NULL, 0),
(521, 'Mandzukic', 'ATA', NULL, NULL, 83, NULL, NULL, 0),
(522, 'Giroud', 'ATA', NULL, NULL, 82, NULL, NULL, 0),
(523, 'Slimani', 'ATA', NULL, NULL, 82, NULL, NULL, 0),
(524, 'Willian José', 'ATA', NULL, NULL, 82, NULL, NULL, 0),
(525, 'Chicharito', 'ATA', NULL, NULL, 82, NULL, NULL, 0),
(526, 'Fernando Torres', 'ATA', NULL, NULL, 81, NULL, NULL, 0),
(527, 'Benteke', 'ATA', NULL, NULL, 81, NULL, NULL, 0),
(528, 'Lucas Pratto', 'ATA', NULL, NULL, 80, NULL, NULL, 0),
(529, 'Batshuayi', 'ATA', NULL, NULL, 80, NULL, NULL, 0),
(530, 'Eder', 'ATA', NULL, NULL, 80, NULL, NULL, 0);

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

--
-- Extraindo dados da tabela `jogadorpack`
--

INSERT INTO `jogadorpack` (`JogadorID`, `PackID`, `NomeJogador`, `TipoPack`) VALUES
(499, 1, '', ''),
(453, 1, '', ''),
(482, 1, '', ''),
(416, 1, '', ''),
(377, 1, '', ''),
(368, 1, '', ''),
(324, 1, '', ''),
(278, 1, '', ''),
(281, 1, '', ''),
(233, 1, '', ''),
(444, 2, '', ''),
(481, 2, '', ''),
(456, 2, '', ''),
(418, 2, '', ''),
(376, 2, '', ''),
(385, 2, '', ''),
(369, 2, '', ''),
(325, 2, '', ''),
(277, 2, '', ''),
(293, 2, '', ''),
(292, 2, '', ''),
(501, 3, '', ''),
(509, 3, '', ''),
(483, 3, '', ''),
(413, 3, '', ''),
(383, 3, '', ''),
(364, 3, '', ''),
(422, 3, '', ''),
(327, 3, '', ''),
(276, 3, '', ''),
(288, 3, '', ''),
(231, 3, '', ''),
(504, 4, '', ''),
(480, 4, '', ''),
(466, 4, '', ''),
(373, 4, '', ''),
(388, 4, '', ''),
(363, 4, '', ''),
(423, 4, '', ''),
(328, 4, '', ''),
(275, 4, '', ''),
(230, 4, '', ''),
(505, 5, '', ''),
(452, 5, '', ''),
(464, 5, '', ''),
(411, 5, '', ''),
(384, 5, '', ''),
(355, 5, '', ''),
(395, 5, '', ''),
(326, 5, '', ''),
(272, 5, '', ''),
(342, 5, '', ''),
(229, 5, '', ''),
(506, 6, '', ''),
(451, 6, '', ''),
(488, 6, '', ''),
(410, 6, '', ''),
(382, 6, '', ''),
(359, 6, '', ''),
(397, 6, '', ''),
(329, 6, '', ''),
(273, 6, '', ''),
(295, 6, '', ''),
(228, 6, '', ''),
(510, 7, '', ''),
(477, 7, '', ''),
(490, 7, '', ''),
(435, 7, '', ''),
(380, 7, '', ''),
(356, 7, '', ''),
(390, 7, '', ''),
(330, 7, '', ''),
(340, 7, '', ''),
(234, 7, '', ''),
(511, 8, '', ''),
(508, 8, '', ''),
(502, 8, '', ''),
(412, 8, '', ''),
(370, 8, '', ''),
(420, 8, '', ''),
(331, 8, '', ''),
(263, 8, '', ''),
(294, 8, '', ''),
(236, 8, '', ''),
(445, 9, '', ''),
(461, 9, '', ''),
(467, 9, '', ''),
(434, 9, '', ''),
(378, 9, '', ''),
(437, 9, '', ''),
(332, 9, '', ''),
(270, 9, '', ''),
(296, 9, '', ''),
(235, 9, '', ''),
(446, 10, '', ''),
(486, 10, '', ''),
(414, 10, '', ''),
(386, 10, '', ''),
(365, 10, '', ''),
(436, 10, '', ''),
(333, 10, '', ''),
(268, 10, '', ''),
(289, 10, '', ''),
(238, 10, '', ''),
(448, 11, '', ''),
(460, 11, '', ''),
(457, 11, '', ''),
(433, 11, '', ''),
(379, 11, '', ''),
(389, 11, '', ''),
(362, 11, '', ''),
(334, 11, '', ''),
(267, 11, '', ''),
(290, 11, '', ''),
(239, 11, '', ''),
(449, 12, '', ''),
(479, 12, '', ''),
(465, 12, '', ''),
(415, 12, '', ''),
(374, 12, '', ''),
(357, 12, '', ''),
(441, 12, '', ''),
(335, 12, '', ''),
(269, 12, '', ''),
(286, 12, '', ''),
(240, 12, '', ''),
(450, 13, '', ''),
(455, 13, '', ''),
(489, 13, '', ''),
(417, 13, '', ''),
(381, 13, '', ''),
(361, 13, '', ''),
(439, 13, '', ''),
(283, 13, '', ''),
(266, 13, '', ''),
(339, 13, '', ''),
(237, 13, '', ''),
(513, 14, '', ''),
(478, 14, '', ''),
(459, 14, '', ''),
(407, 14, '', ''),
(387, 14, '', ''),
(421, 14, '', ''),
(438, 14, '', ''),
(282, 14, '', ''),
(265, 14, '', ''),
(338, 14, '', ''),
(447, 15, '', ''),
(454, 15, '', ''),
(485, 15, '', ''),
(372, 15, '', ''),
(358, 15, '', ''),
(392, 15, '', ''),
(280, 15, '', ''),
(264, 15, '', ''),
(343, 15, '', ''),
(503, 16, '', ''),
(487, 16, '', ''),
(408, 16, '', ''),
(371, 16, '', ''),
(366, 16, '', ''),
(391, 16, '', ''),
(279, 16, '', ''),
(271, 16, '', ''),
(341, 16, '', ''),
(242, 16, '', ''),
(500, 16, '', ''),
(409, 15, '', ''),
(257, 15, '', ''),
(243, 14, '', ''),
(462, 10, '', ''),
(360, 9, '', ''),
(367, 8, '', ''),
(274, 7, '', ''),
(291, 4, '', ''),
(375, 1, '', '');

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
(1, 'T', 0),
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
(15, 'T', 0),
(16, 'T', 0),
(17, 'R', 0),
(18, 'R', 0),
(19, 'R', 0),
(20, 'R', 0),
(21, 'R', 0),
(22, 'R', 0),
(23, 'R', 0),
(24, 'R', 0),
(25, 'R', 0),
(26, 'R', 0),
(27, 'R', 0),
(28, 'R', 0),
(29, 'R', 0),
(30, 'R', 0),
(31, 'R', 0),
(32, 'R', 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Extraindo dados da tabela `transferencia`
--

INSERT INTO `transferencia` (`ID`, `EquipeSaida`, `EquipeEntrada`, `DataInicio`, `DataFim`, `Valor`, `Status`, `JogadorID`, `JogadorTrocaID`) VALUES
(1, NULL, 1, '2016-11-16 21:25:26', '2016-11-16 21:25:26', '7000.00', 'Concluido', 187, NULL),
(2, 4, NULL, '2016-11-16 21:32:01', '2016-11-16 21:32:01', '5400.00', 'Concluido', 97, NULL),
(3, NULL, 4, '2016-11-16 21:33:33', '2016-11-16 21:33:33', '7000.00', 'Concluido', 199, NULL),
(4, 9, NULL, '2016-11-16 21:34:02', '2016-11-16 21:34:02', '2700.00', 'Concluido', 138, NULL),
(5, 9, NULL, '2016-11-16 22:44:35', '2016-11-16 22:44:35', '1800.00', 'Concluido', 144, NULL),
(6, 7, 8, '2016-11-17 14:09:28', NULL, '5000.00', 'Aguardando', 157, NULL),
(7, NULL, 11, '2016-11-17 16:09:40', '2016-11-17 16:09:40', '7000.00', 'Concluido', 208, NULL),
(8, NULL, 11, '2016-11-17 16:12:20', '2016-11-17 16:12:20', '6000.00', 'Concluido', 207, NULL),
(9, 5, 11, '2016-11-17 16:13:12', '2016-11-17 21:20:50', '15000.00', 'Concluido', 169, NULL),
(10, NULL, 11, '2016-11-17 16:14:19', '2016-11-17 16:14:19', '5000.00', 'Concluido', 206, NULL),
(11, NULL, 11, '2016-11-17 16:14:56', '2016-11-17 16:14:56', '5000.00', 'Concluido', 205, NULL),
(12, NULL, 11, '2016-11-17 16:15:30', '2016-11-17 16:15:30', '5000.00', 'Concluido', 215, NULL),
(13, 8, 11, '2016-11-17 16:16:05', '2016-11-17 16:23:22', '5000.00', 'Concluido', 122, NULL),
(14, NULL, 11, '2016-11-17 16:16:49', '2016-11-17 16:16:49', '6000.00', 'Concluido', 214, NULL),
(15, NULL, 11, '2016-11-17 16:17:14', '2016-11-17 16:17:14', '6000.00', 'Concluido', 213, NULL),
(16, NULL, 11, '2016-11-17 16:19:29', '2016-11-17 16:19:29', '5000.00', 'Concluido', 211, NULL),
(17, NULL, 11, '2016-11-17 16:19:57', '2016-11-17 16:19:57', '5000.00', 'Concluido', 210, NULL),
(18, NULL, 11, '2016-11-17 16:20:28', '2016-11-17 16:20:28', '6000.00', 'Concluido', 209, NULL),
(19, NULL, 11, '2016-11-17 16:22:07', '2016-11-17 16:22:07', '5000.00', 'Concluido', 212, NULL),
(20, NULL, 11, '2016-11-17 16:22:45', '2016-11-17 16:22:45', '1000.00', 'Concluido', 216, NULL),
(21, NULL, 11, '2016-11-17 16:23:06', '2016-11-17 16:23:06', '1000.00', 'Concluido', 217, NULL),
(22, NULL, 11, '2016-11-17 16:23:37', '2016-11-17 16:23:37', '1000.00', 'Concluido', 218, NULL),
(23, NULL, 11, '2016-11-17 16:23:57', '2016-11-17 16:23:57', '1000.00', 'Concluido', 219, NULL),
(24, NULL, 11, '2016-11-17 16:24:19', '2016-11-17 16:24:19', '1000.00', 'Concluido', 220, NULL),
(25, 4, NULL, '2016-11-17 21:04:36', '2016-11-17 21:04:36', '6300.00', 'Concluido', 199, NULL),
(26, NULL, 4, '2016-11-17 21:05:15', '2016-11-17 21:05:15', '5000.00', 'Concluido', 222, NULL),
(27, NULL, 4, '2016-11-17 21:07:16', '2016-11-17 21:07:16', '10000.00', 'Concluido', 223, NULL),
(28, NULL, 4, '2016-11-17 21:07:43', '2016-11-17 21:07:43', '7000.00', 'Concluido', 224, NULL),
(29, NULL, 4, '2016-11-17 21:08:30', '2016-11-17 21:08:30', '7000.00', 'Concluido', 225, NULL),
(30, 6, 2, '2018-04-10 01:35:46', NULL, '2.00', 'Aguardando', 1, NULL);

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
  `Orcamento` decimal(12,2) NOT NULL DEFAULT '100000.00',
  `Ativo` tinyint(1) NOT NULL DEFAULT '0',
  `Admin` tinyint(1) NOT NULL DEFAULT '0',
  `PackDisponivel` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`ID`, `Nome`, `PSN`, `Email`, `Senha`, `Orcamento`, `Ativo`, `Admin`, `PackDisponivel`) VALUES
(1, 'Gustavo Novaes', 'gunovaes420', 'n/a', 'novaes123', '3500.00', 1, 1, 0),
(2, 'Thiago Oliva', 'thiag6', 'n/a', 'tijucanos7', '100000.00', 1, 1, 0),
(3, 'Christian Nunes', 'christiannunnes', 'n/a', 'nunesunited', '3400.00', 1, 0, 0),
(4, 'Alvaro Brasil', 'alvaro_brasil', 'n/a', 'alvaroremo', '9300.00', 1, 0, 0),
(5, 'Douglas Custodio', 'dogacustodio', 'n/a', 'custodio01', '20500.00', 1, 0, 0),
(6, 'Celso', 'celso269', 'n/a', 'galocelso', '13700.00', 1, 0, 0),
(7, 'Lucas Wittmann', 'lucaswittmann92', 'n/a', 'wittmann92', '3800.00', 1, 0, 0),
(8, 'Cristiano Nunes', 'crisnunes87', 'n/a', 'crisnunes01', '14300.00', 1, 0, 0),
(9, 'Guto', 'newbliss', 'n/a', 'cbfol666', '6800.00', 1, 0, 0),
(10, 'Zaca', 'fifa951488', 'n/a', 'zaca951488', '6100.00', 1, 0, 0),
(11, 'João Victor barbosa', 'Barbosateam', 'jvgordo1205@hotmail.com', 'idvizckn120595', '14000.00', 1, 0, 1),
(12, 'Felipe Bernardo', 'FelipeBernardo21', 'felipe_baros@hotmail.com', 'eufb3005199021', '100000.00', 1, 0, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
