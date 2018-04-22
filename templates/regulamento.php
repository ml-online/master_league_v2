<?php
	session_start("login_ml");
	include("conexao.php");
?>
<?php
  if(!isset($_SESSION["psn"]) || !isset($_SESSION["senha"]))
  {
    header("Location: login.php");
    exit; //encerra as funções da página
  }
  else
  {
    //echo "Você está logado.";
	$psn = $_SESSION["psn"];
	//echo $psn;
	
	if (isset($_SESSION['LAST_ACTIVITY']) && (time() - $_SESSION['LAST_ACTIVITY'] > 1800)) 
	{
		// last request was more than 30 minutes ago
		session_unset();     // unset $_SESSION variable for the run-time 
		session_destroy();   // destroy session data in storage
		header("Location: logout.php");
		exit; //encerra as funções da página
	}
	
	$_SESSION['LAST_ACTIVITY'] = time(); // update last activity time stamp
  }
?>
<html lang="pt-BR">
    <head>
        <title>Master League</title>

        <meta charset="utf-8"/>
        <meta name="author" content="CR Galaticos">
        <meta name="description" content="Organization of CR Galaticos Master League">

        <link rel="stylesheet" type="text/css" href="../static/css/base.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    </head>

    <body>
      <?php
      	include("cabecalho.php");
      ?>

      <section class="present">
          <h1 class="present__title"></h1>
      </section>

      <section class="main-content">
        <br/>
        <div class='tituloPosicao'><center><h2>Regulamento</h2></center></div><br/>
        <div class='textoLeitura'>
          <p class='textoMargem'>
          <b>1- INSCRIÇÃO:</b><br><br>

          1.1- Cada jogador deverá fazer a inscrição no site http://crgalaticosml.esy.es/masterleague/templates/login.php sendo limitada até 16 participantes.

          <br><br><b>2- DATAS E HORÁRIOS:</b><br><br>

          2.1- Os jogos serão organizados através de uma tabela e cada rodada terá o prazo de 5 dias para ser realizada. (Segunda a sexta). Serão realizados em “rodada dupla”, ou seja, serão 2 jogos por semana, de maneira sequencial, crescente, através da tabela. Os horários dependerão de um consenso entre os dois participantes da partida.

          <br><br><b>3- FORMATO DA COMPETIÇÃO:</b><br><br>

          3.1- Os times participarão de 2 formatos de campeonatos: Liga e Copa.<br><br>

          3.2- Liga: As equipes inscritas jogarão entre si, em partidas de ida e volta, no formato de pontos corridos. No final de todas as rodadas, quem tiver o maior número de pontos será o campeão. As equipes melhores colocadas, se classificarão com antecedência para a próxima fase da Copa, caso as inscrições não atinjam 16 participantes. <br><br>

          3.2.1- Os critérios de desempate serão os seguintes: 1- Número de pontos 2- Número de vitórias 3- Saldo de gols 4- Gols pró 5- Confronto direto<br><br>

          3..2.2- A classificação na Liga relacionará com a premiação a ser paga a cada equipe ao final da temporada.<br><br>

          3.3- Copa: As equipes serão sorteadas e disputarão partidas de ida e volta no formato mata-mata. A equipe que mais avançar será o campeão.<br><br>

          3.3.1- Caso não sejam 16 equipes inscritas, a classificação para a Copa se dará da seguinte forma:<br><br>

          15 equipes – o primeiro colocado da edição anterior da Liga herdará uma vaga garantida, cabendo as 14 equipes restantes disputar a classificação à próxima fase.<br><br>

          14 equipes – O primeiro e o segundo colocado da edição anterior da Liga herdarão vagas, cabendo as 12 equipes restantes disputar a classificação à próxima fase.<br><br>

          13 equipes - O primeiro, segundo e terceiro colocados da edição anterior da Liga herdarão vagas, cabendo as 10 equipes restantes disputar a classificação à próxima fase.<br><br>

          3.3.2- Os critérios de desempate para a copa serão: 1- Número de pontos 2- Gols fora de casa 3- Jogo desempate. (Caso empate novamente, haverá um quarto jogo e assim sucessivamente, até haver um vencedor).<br><br>

          3.4 – A COPA DA PRIMEIRA TEMPORADA SERÁ REALIZADA NAS MESMAS CONDIÇÕES DAS POSTERIORES, EXCETO QUANTO A CLASSIFICAÇÃO HERDADA PELA LIGA. NESSE CASO, SERÃO RECOMPENSADOS OS JOGADORES QUE OBTIVEREM MELHOR VOTAÇÃO NA ENQUETE FEITA SOBRE OS FAVORITOS AO TÍTULO.<br>

          <br><br><b>4- DAS TRANSAÇÕES</b><br><br>

          4.1- Cada participante escolherá um time para participar do torneio e editará o mesmo no local apropriado do FIFA 18, atribuindo a ele os jogadores selecionados.<br><br>

          4.2- Cada participante começará a temporada com D$ 100.000,00. (Cem mil Dinheiros)<br><br>

          4.3- Cada jogador terá um preço pré estabelecido relacionado a seu overall. Os preços se darão da seguinte forma:<br><br>

          Overall / Preço<br><br>
          >79 / D$ 7.000<br>
          79 / D$ 8.000<br>
          80 / D$ 10.000<br>
          81 / D$ 15.000<br>
          82 / D$ 25.000<br>
          83 / D$ 40.000<br>
          84 / D$ 50.000<br>
          85 / D$ 60.000<br>
          86 / D$ 70.000<br>
          87 / D$ 75.000<br>
          88 / D$ 80.000<br>
          89 / D$ 85.000<br>
          90 / D$ 100.000<br>
          91 / D$ 130.000<br>
          92 / D$ 160.000<br>
          93 / D$ 180.000<br>
          94 / D$ 200.000<br><br>

          4.4- Cada participante ao logar no sistema pela primeira vez participará de um sorteio onde serão definidos 18 jogadores para cada equipe. A partir desse sorteio, ficarão livres as transações de compra, venda e troca de jogadores entre os participantes.<br><br>

          4.5- Cada equipe terá um limite mínimo e máximo de jogadores, limitado entre 16 e 22<br><br>

          4.6- Cada participante terá a opção de rescindir o contrato com um jogador. Caso opte por essa transação, terá uma perda de 10% no valor base do jogador relacionado.<br><br>

          4.7- Todos os jogadores, sem exceção, terão uma cláusula de rescisão. Ela será fixada em 3x o valor base do jogador relacionado. O jogador comprado através da cláusula de rescisão deverá permanecer no clube por pelo menos uma temporada, sendo proibida sua venda na temporada vigente.<br>

          <br><br><b>5- REPORT</b><br><br>

          5.1- A classificação do campeonato, assim como estatísticas como gols, assistências e cartões serão administradas na plataforma WebCup, tendo como responsável por atualizar as informações os administradores da liga.<br><br>

          5.2- O vencedor de cada partida deverá ter a responsabilidade de informar o placar, gols, assistências e cartões da partida. Caso a partida não tenha um vencedor, será indiferente a obrigatoriedade de um dos participantes em avisar os ocorridos.<br>

          <br><br><b>6- SUSPENSÂO</b><br><br>

          6.1- Será suspenso por uma partida da rodada seguinte, o jogador que acumular:<br>

          3 Cartões amarelos ou 1 Cartão vermelho

          <br><br><b>7- PREMIAÇÃO:</b><br><br>

          7.1- Premiação da Liga:<br><br>

          1º Colocado – D$ 300.000<br>
          2º Colocado – D$ 250.000<br>
          3º Colocado – D$ 220.000<br>
          4º, 5º e 6º Colocados – D$ 200.000<br>
          7º, 8º, 9º e 10º Colocados – D$ 180.000<br>
          11º, 12º, 13º e 14º Colocados – D$ 150.000<br><br>

          7.2- Premiação da Copa:<br><br>

          1º Colocado – D$ 100.000<br>
          2º Colocado – D$ 50.000<br><br>

          7.3- Premiação Igualitária:<br><br>

          Os dois últimos colocados da Liga terão descontos na cláusula de rescisão do jogador da sua escolha. Os descontos serão:<br><br>

          14º Colocado: 20% de desconto<br>
          13º Colocado: 10% de desconto<br><br>

          <br><br><b>8- PUNIÇÕES</b><br><br>

          8.1- Caso o participante seja flagrado com um jogador editado: o mesmo terá como punição o banimento da liga.<br><br>

          8.2- Participação de jogador que não seja da equipe: o mesmo terá como punição a derrota por 3x0 na partida e multa de D$ 5.000. <br><br>

          8.3- Quit: o mesmo terá como punição a derrota por 3x0 na partida e multa de D$ 10.000.<br><br>

          8.4 – Uso de jogador suspenso: o mesmo terá como punição a derrota por 3x0 na partida e multa de D$ 1.000<br><br>

          8.5- Jogador indisponível na semana: Caso o jogador não apareça para os jogos ao longo da semana, ou se recusar a flexibilizar seu horário para os jogos, o mesmo terá como punição derrota por WO.<br><br>

          8.6- Lag: Será permitido o quit, caso seja concordado por ambos os jogadores, as partidas que tiverem lag e ainda estiverem com o placar de 0x0. <br><br>

          8.7- Queda de conexão: Caso o placar esteja 0x0, o jogo recomeça normalmente. Caso esteja diferente de 0x0, terá que ser acordado com o oponente. Caso a partida esteja após os 60min de jogo, será decretado WO.<br><br>
        </p>
      </div><br><br>
      </section>

      <?php
      	include("footer.php");
      ?>
    </body>
</html>