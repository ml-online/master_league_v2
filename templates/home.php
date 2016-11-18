<?php
	session_start("login_ml");
	include("conexao.php");
?>
<?php
  if(!isset($_SESSION["psn"]) || !isset($_SESSION["senha"]))
  {
	//print_r($_SESSION);
	header("Location: login.php");
	exit; //encerra as funções da página
  }
  else
  {
    //echo "Você está logado.";
	$psn = $_SESSION["psn"];
	//echo "Request_URI" . $_SERVER["REQUEST_URI"];
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
      <script type="text/javascript">
        function carregarPaginaJogador(jogadorID){
          var form = document.getElementById("formID");
          $("#jogadorSelec").val(jogadorID);
          form.submit();
        }
      </script>
      <?php
      	include("cabecalho.php");
      ?>

      <section class="present">
          <h1 class="present__title"></h1>
      </section>

      <section class="main-content">

        <form id="formID" name="signup" method="post" action="jogador.php" style="display: none;">
          <input id="jogadorSelec" name="JogadorCarregado" type="hidden"></input>
        </form>
		
		<?php
			include("conexao.php");
			$psn = $_SESSION["psn"];
			
			//Buscando o usuarioID
			$sql = "SELECT ID 
					  FROM usuario 
				     WHERE PSN = '$psn'";
							
			$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
			$row = mysqli_fetch_array($query, MYSQLI_ASSOC);
			$usuarioID = $row["ID"];
			
			//echo "UsuarioID = " . $usuarioID;
			$_SESSION['session_usuario_id'] = $usuarioID;
			
			
			//Buscando o equipeID
			$sql = "SELECT equipe.EquipeID, equipe.NomeEquipe, equipe.Escudo, usuario.Nome
					 FROM equipe
					 JOIN usuario 
					   ON equipe.UsuarioID = usuario.ID
				    WHERE equipe.UsuarioID = '$usuarioID'";
							
			$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
			$row = mysqli_fetch_array($query, MYSQLI_ASSOC);

			$equipeID = $row["EquipeID"];
			$_SESSION['session_equipe_id'] = $equipeID;
			
			$nomeEquipe = $row["NomeEquipe"];
			$escudoEquipe = $row["Escudo"];
			$nomeDono = $row["Nome"];
			
		    if($escudoEquipe == null)
		  	{
			  	$escudoEquipe = "http://www.clker.com/cliparts/t/m/N/L/J/Q/escudo.svg";
		  	}

		  	echo "<center><h1>$nomeEquipe</h1></center></br>
				  <center><img src='$escudoEquipe' alt='Sem escudo cadastrado' style='max-width:300px;'></center><br/>
				  <center><h2 style='color:#333;'>Presidente: $nomeDono</h2></center></br>";
				

			/* -----------------------------------------------------------
				Buscando a lista dos goleiros
			------------------------------------------------------------*/
				
			//Buscando os jogadores da equipe
			$sql = "SELECT `JogadorID`, `NomeJogador`, `Overall`, `EquipeOriginal`, `EquipeID`, `Posicao`, `Imagem`
					  FROM `jogador` 
					 WHERE EquipeID = '$equipeID'
					   AND Posicao = 'GOL'";
					 
			$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
			
			$j = 0;
			// Listando os jogadores buscados da tabela
			echo "<div class='tituloPosicao'><center><h2>Goleiros</h2></center></div><br/>";
			echo "<div class='row'>";
			echo "<div class='main-content__row'>";
			while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
			{
				if($j % 4 == 0)
				{
					echo "</div>";
					echo "<div class='main-content__row'>";
				}
				echo "<div class='main-content__col'>";
				echo "<a href='jogador.php?id=" . $row["JogadorID"] . "'><img class='imgJogador' src='" . $row["Imagem"] . "'/></a>";
				echo "<h3><span>" . $row["NomeJogador"] . "</span></h3>";
				echo "<h3><span>" . $row["Overall"] . "</span></h3>";
				echo "</div>";
				$j++;
				//echo "<br/>";
			}
			echo "</div><br/>";
			
			/* -----------------------------------------------------------
				Buscando a lista dos defensores
			------------------------------------------------------------*/
			
			$sql = "SELECT `JogadorID`, `NomeJogador`, `Overall`, `EquipeOriginal`, `EquipeID`, `Posicao`, `Imagem`
					  FROM `jogador` 
					 WHERE EquipeID = '$equipeID'
					   AND Posicao IN ('LD', 'LE', 'ZAG')";
					 
			$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
			
			$j = 0;
			// Listando os jogadores buscados da tabela
			echo "<div class='tituloPosicao'><center><h2>Defensores</h2></center></div><br/>";
			echo "<div class='row'>";
			echo "<div class='main-content__row'>";
			while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
			{
				if($j % 4 == 0)
				{
					echo "</div>";
					echo "<div class='main-content__row'>";
				}
				echo "<div class='main-content__col'>";
				echo "<a href='jogador.php?id=" . $row["JogadorID"] . "'><img class='imgJogador' src='" . $row["Imagem"] . "'/></a>";
				echo "<h3><span>" . $row["NomeJogador"] . "</span></h3>";
				echo "<h3><span>" . $row["Overall"] . "</span></h3>";
				echo "</div>";
				$j++;
				//echo "<br/>";
			}
			echo "</div><br/>";
			
			/* -----------------------------------------------------------
				Buscando a lista dos meias
			------------------------------------------------------------*/
			
			$sql = "SELECT `JogadorID`, `NomeJogador`, `Overall`, `EquipeOriginal`, `EquipeID`, `Posicao`, `Imagem`
					  FROM `jogador` 
					 WHERE EquipeID = '$equipeID'
					   AND Posicao IN ('MC', 'ME', 'MEI', 'VOL', 'MD', 'MEIA')";
					 
			$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
			
			$j = 0;
			// Listando os jogadores buscados da tabela
			echo "<div class='tituloPosicao'><center><h2>Meias</h2></center></div><br/>";
			echo "<div class='row'>";
			echo "<div class='main-content__row'>";
			while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
			{
				if($j % 4 == 0)
				{
					echo "</div>";
					echo "<div class='main-content__row'>";
				}
				echo "<div class='main-content__col'>";
				echo "<a href='jogador.php?id=" . $row["JogadorID"] . "'><img class='imgJogador' src='" . $row["Imagem"] . "'/></a>";
				echo "<h3><span>" . $row["NomeJogador"] . "</span></h3>";
				echo "<h3><span>" . $row["Overall"] . "</span></h3>";
				echo "</div>";
				$j++;
				//echo "<br/>";
			}
			echo "</div><br/>";
			
			/* -----------------------------------------------------------
				Buscando a lista dos atacantes
			------------------------------------------------------------*/
			
			$sql = "SELECT `JogadorID`, `NomeJogador`, `Overall`, `EquipeOriginal`, `EquipeID`, `Posicao`, `Imagem`
					  FROM `jogador` 
					 WHERE EquipeID = '$equipeID'
					   AND Posicao IN ('ATA', 'PD', 'PE', 'SA', 'PNT')";
					 
			$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
			
			$j = 0;
			// Listando os jogadores buscados da tabela
			echo "<div class='tituloPosicao'><center><h2>Atacantes</h2></center></div><br/>";
			echo "<div class='row'>";
			echo "<div class='main-content__row'>";
			while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
			{
				if($j % 4 == 0)
				{
					echo "</div>";
					echo "<div class='main-content__row'>";
				}
				echo "<div class='main-content__col'>";
				echo "<a href='jogador.php?id=" . $row["JogadorID"] . "'><img class='imgJogador' src='" . $row["Imagem"] . "'/></a>";
				echo "<h3><span>" . $row["NomeJogador"] . "</span></h3>";
				echo "<h3><span>" . $row["Overall"] . "</span></h3>";
				echo "</div>";
				$j++;
				//echo "<br/>";
			}
			echo "</div><br/>";
		?>
      </section>
      <?php
      	include("footer.php");
      ?>
    </body>
</html>