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
        <link rel="stylesheet" type="text/css" href="../static/css/Teste_tabela_css.css">
		<link rel="stylesheet" href="../static/css/estilo2.css"/>
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
		<div class='tituloPosicao'><center><h2>Tabela da competição</h2></center></div><br/>
		<div>
		<center>
		<?php
			include("conexao.php");
			$psn = $_SESSION["psn"];
			$pos = 1;
			
			$sql = "SELECT c.`Grupo`, c.`EquipeID`, c.`PontosGanhos`, c.`Jogos`, c.`Vitorias`, c.`Empates`, c.`Derrotas`, c.`GolsMarcados`, c.`GolsSofridos`, c.`SaldoGols`, e.NomeEquipe as NomeEquipe, ifnull(e.Escudo, 'http://www.clker.com/cliparts/t/m/N/L/J/Q/escudo.svg') AS Escudo
			          FROM classificacao c
					  JOIN equipe e
					    ON e.EquipeID = c.EquipeID
					 ORDER BY PontosGanhos desc, SaldoGols desc, Vitorias desc, GolsMarcados desc";
								
			$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
			
			echo "<table>";
			echo "<thead>";
			echo "	<tr>";
			echo "		<th>Posição</th>";
			echo "		<th>Equipe</th>";
			echo "		<th>Pontos Ganhos</th>";
			echo "		<th>Jogos</th>";
			echo "		<th>Vitórias</th>";
			echo "		<th>Empates</th>";
			echo "		<th>Derrotas</th>";
			echo "		<th>GM</th>";
			echo "		<th>GS</th>";
			echo "		<th>Saldo</th>";
			echo "	</tr>";
			echo "</thead>";
			
			while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
			{
				echo "<tr>";
				echo "<td style='text-align:left;'>" . $pos . "</td>";
				echo "<td style='text-align:left;'><img style='max-width:20px;' src='" . $row["Escudo"] . "'/> <a href='equipe.php?id=" . $row["EquipeID"] . "'>" . $row["NomeEquipe"] . "</a></td>";
				echo "<td style='text-align:right;'>" . $row["PontosGanhos"] . "</td>";
				echo "<td style='text-align:right;'>" . $row["Jogos"] . "</td>";
				echo "<td style='text-align:right;'>" . $row["Vitorias"] . "</td>";
				echo "<td style='text-align:right;'>" . $row["Empates"] . "</td>";
				echo "<td style='text-align:right;'>" . $row["Derrotas"] . "</td>";
				echo "<td style='text-align:right;'>" . $row["GolsMarcados"] . "</td>";
				echo "<td style='text-align:right;'>" . $row["GolsSofridos"] . "</td>";
				echo "<td style='text-align:right;'>" . $row["SaldoGols"] . "</td>";
				
				echo "</tr>";
				
				$pos++;
			}
			echo "</table>";
		?>
		</center>
		</div>
      </section>

      <?php
      	include("footer.php");
      ?>
    </body>
</html>