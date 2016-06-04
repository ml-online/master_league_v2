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
	//echo $psn;
  }
?>
<html lang="pt-BR">
    <head>
        <title>Master League - CR Galáticos</title>

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
          <h1 class="present__title">CR Galaticos - Master League</h1>
      </section>

      <section class="main-content">

        <form id="formID" name="signup" method="post" action="jogador.php" style="display: none;">
          <input id="jogadorSelec" name="JogadorCarregado" type="hidden"></input>
        </form>
		
		<?php
			include("conexao.php");
			$psn = $_SESSION["psn"];
			
			//Buscando o usuarioID
			$sql = "SELECT id 
					  FROM usuario 
				     WHERE psn = '$psn'";
							
			$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
			$row = mysqli_fetch_array($query, MYSQLI_ASSOC);
			$usuarioID = $row["id"];
			
			//echo "UsuarioID = " . $usuarioID;
			$_SESSION['session_usuario_id'] = $usuarioID;
			
			
			//Buscando o equipeID
			$sql = "SELECT equipe.equipeID, equipe.nomeEquipe, equipe.Escudo, usuario.Nome
					      FROM equipe
                JOIN usuario 
                  ON equipe.usuarioID = usuario.ID
				       WHERE equipe.usuarioID = '$usuarioID'";
							
			$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
			$row = mysqli_fetch_array($query, MYSQLI_ASSOC);

			$equipeID = $row["equipeID"];
			$_SESSION['session_equipe_id'] = $equipeID;
			
			$nomeEquipe = $row["nomeEquipe"];
			$escudoEquipe = $row["Escudo"];
			$nomeDono = $row["Nome"];
			
		  if($escudoEquipe == null)
		  {
			  $escudoEquipe = "";
		  }

		  echo "<center><h1>$nomeEquipe</h1></center></br>
				<center><img src='$escudoEquipe' alt='Flamengo.png'></center>
				<center><h2>Presidente: $nomeDono</h3></center>
				<center><h2>Orçamento: G$ $orcamento</h2></center></br></br>";
				

		  echo "<center><h2>Jogadores</h1></center>";

				/* -----------------------------------------------------------
					Buscando a lista dos goleiros
				------------------------------------------------------------*/
				
				//Buscando os jogadores da equipe
				$sql = "SELECT `JogadorID`, `NomeJogador`, `Overall`, `EquipeOriginal`, `EquipeID`, `Posicao`
						  FROM `jogador` 
						 WHERE EquipeID = '$equipeID'
						   AND Posicao = 'GOL'";
						 
				$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
				
				// Listando os jogadores buscados da tabela
				echo "<center><h2>Goleiros</h2></center><br/>";
				while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
				{
					echo "<center><a href='#' onclick='carregarPaginaJogador(" . $row["JogadorID"] . ");'>" . $row["NomeJogador"] . "(" . $row["Overall"] . ")" . "</a></center>";
					echo "<br/>";
				}
				
				/* -----------------------------------------------------------
					Buscando a lista dos defensores
				------------------------------------------------------------*/
				
				$sql = "SELECT `JogadorID`, `NomeJogador`, `Overall`, `EquipeOriginal`, `EquipeID`, `Posicao`
						  FROM `jogador` 
						 WHERE EquipeID = '$equipeID'
						   AND Posicao IN ('LD', 'LE', 'ZAG')";
						 
				$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
				
				// Listando os jogadores buscados da tabela
				echo "<center><h2>Defensores</h2></center><br/>";
				while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
				{
					echo "<center><a href='#' onclick='carregarPaginaJogador(" . $row["JogadorID"] . ");'>" . $row["NomeJogador"] . "(" . $row["Overall"] . ")" . "</a></center>";
					echo "<br/>";
				}
				
				/* -----------------------------------------------------------
					Buscando a lista dos meias
				------------------------------------------------------------*/
				
				$sql = "SELECT `JogadorID`, `NomeJogador`, `Overall`, `EquipeOriginal`, `EquipeID`, `Posicao`
						  FROM `jogador` 
						 WHERE EquipeID = '$equipeID'
						   AND Posicao IN ('MC', 'ME', 'MEI', 'VOL', 'MD', 'MEIA')";
						 
				$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
				
				// Listando os jogadores buscados da tabela
				echo "<center><h2>Meias</h2></center><br/>";
				while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
				{
					echo "<center><a href='#' onclick='carregarPaginaJogador(" . $row["JogadorID"] . ");'>" . $row["NomeJogador"] . "(" . $row["Overall"] . ")" . "</a></center>";
					echo "<br/>";
				}
				
				/* -----------------------------------------------------------
					Buscando a lista dos atacantes
				------------------------------------------------------------*/
				
				$sql = "SELECT `JogadorID`, `NomeJogador`, `Overall`, `EquipeOriginal`, `EquipeID`, `Posicao`
						  FROM `jogador` 
						 WHERE EquipeID = '$equipeID'
						   AND Posicao IN ('ATA', 'PD', 'PE', 'SA', 'PNT')";
						 
				$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
				
				// Listando os jogadores buscados da tabela
				echo "<center><h2>Atacantes</h2></center><br/>";
				while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
				{
					echo "<center><a href='#' onclick='carregarPaginaJogador(" . $row["JogadorID"] . ");'>" . $row["NomeJogador"] . "(" . $row["Overall"] . ")" . "</a></center>";
					echo "<br/>";
				}

			?>
		<!--
          <div class="main-content__row">
              <div class="main-content_col">
                  <img src="http://www.ultimateteam.co.uk/wp-content/uploads/2016/02/FIFA-16-MOTM-Di-Maria-In-form-Card-FUT.png" />
              </div>
              <div class="main-content_col">
                  <img src="http://www.ultimateteam.co.uk/wp-content/uploads/2016/02/FIFA-16-MOTM-Di-Maria-In-form-Card-FUT.png" />
              </div>
              <div class="main-content_col">
                  <img src="http://www.ultimateteam.co.uk/wp-content/uploads/2016/02/FIFA-16-MOTM-Di-Maria-In-form-Card-FUT.png" />
              </div>
          </div>

          <div class="main-content__row">
              <div class="main-content_col">
                  <img src="http://www.ultimateteam.co.uk/wp-content/uploads/2016/02/FIFA-16-MOTM-Di-Maria-In-form-Card-FUT.png" />
              </div>
              <div class="main-content_col">
                  <img src="http://www.ultimateteam.co.uk/wp-content/uploads/2016/02/FIFA-16-MOTM-Di-Maria-In-form-Card-FUT.png" />
              </div>
              <div class="main-content_col">
                  <img src="http://www.ultimateteam.co.uk/wp-content/uploads/2016/02/FIFA-16-MOTM-Di-Maria-In-form-Card-FUT.png" />
              </div>
          </div>!-->
      </section>

      <section class="footer">
          <center><h4>Aqui o rodapé</h4></center>
      </section>
    </body>
</html>