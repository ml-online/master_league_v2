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
<html>
<head>
	<title>Processando proposta...</title>
	<link rel="stylesheet" type="text/css" href="../static/css/base.css">
	<script>
		function finaliza()
		{
			alert("Proposta realizada com sucesso.");
			setTimeout("window.location='transferencia.php'", 0);
		}
		function dispensa()
		{
			alert("Jogador dispensado com sucesso.");
			setTimeout("window.location='transferencia.php'", 0);
		}
		function aborta()
		{
			alert("O jogador ja assinou com outro clube ou esta em um pack nao aberto.");
			setTimeout("window.location='transferencia.php'", 0);
		}
		function redirect()
		{
			setTimeout("window.location='transferencia.php'", 0);
		}
	</script>
</head>

<body>
	<?php
      	include("cabecalho.php");
    ?>
	<?php
		$equipeSaida = $_POST["equipeSaida"];
		$jogadorID = $_POST["jogadorID"];
		$equipeEntrada = $_POST["equipeEntrada"];
		$valorTransf = $_POST["valorTransf"];
		$jogadorTroca = $_POST["jogadorTroca"];
		$tipoTransf = $_POST["tipoTransf"];
		$freeAgent = $_POST["freeAgent"];
		$preco = $_POST["preco"];
		$multa = $_POST["multa"];
		$dispensa = $_POST["dispensa"];
		
		if($dispensa == 1)
		{
			//verifica se o jogador já foi dispensado
			$sql = "SELECT * FROM jogador where JogadorID = $jogadorID AND EquipeID IS NULL";
			$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
			$rowcount = mysqli_num_rows($query);

			mysqli_autocommit($con,FALSE);
			
			if($rowcount == 0)
			{
				//ainda não foi
				$query = "UPDATE usuario 
						 SET Orcamento = Orcamento + $multa
					   WHERE ID = (SELECT UsuarioID
											   FROM equipe
											  WHERE EquipeID = '$equipeEntrada')";
											  
				$sql = mysqli_query($con, $query) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
						
				$query = "UPDATE jogador 
									   SET EquipeID = NULL
									 WHERE JogadorID = '$jogadorID'";
									 
				$sql = mysqli_query($con, $query) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
				
				$query = "INSERT INTO transferencia(EquipeSaida, EquipeEntrada, DataInicio, Valor, DataFim, Status, JogadorID) 
						  VALUES ($equipeEntrada, NULL, now(), $multa, now(), 'Concluido', $jogadorID)";
				
				$sql = mysqli_query($con, $query) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
				
				mysqli_commit($con);	
				mysqli_autocommit($con,TRUE);
				
				echo '<script>dispensa();</script>';
			}
			else
			{
				echo "<script>redirect();</script>";	
			}
			
		}
		else if($freeAgent == 1)
		{
			// Set autocommit to off
			mysqli_autocommit($con,FALSE);

			//verifica se nesse meio tempo algum outro usuario ja contratou este jogador
			$sql = "SELECT * 
					  FROM jogador j 
					  left JOIN jogadorpack jp 
					    ON jp.JogadorID = j.JogadorID 
					  left JOIN pack p 
					    on p.PackID = jp.PackID 
					 where j.JogadorID = '$jogadorID' 
					   AND j.EquipeID IS NULL 
					   AND ifnull(p.Sorteado, 1) = 1";
			$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
			$rowcount = mysqli_num_rows($query);

			if($rowcount > 0)
			{
				//ninguém contratou nesse meio tempo
				$query = "UPDATE usuario 
						 SET Orcamento = Orcamento - $preco
					   WHERE ID = (SELECT UsuarioID
											   FROM equipe
											  WHERE EquipeID = '$equipeEntrada')";
											  
				$sql = mysqli_query($con, $query) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
						
				$query = "UPDATE jogador 
									   SET EquipeID = '$equipeEntrada'
									 WHERE JogadorID = '$jogadorID'";
									 
				$sql = mysqli_query($con, $query) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
				
				$query = "INSERT INTO transferencia(EquipeSaida, EquipeEntrada, DataInicio, Valor, DataFim, Status, JogadorID, JogadorTrocaID) 
						  VALUES (NULL, $equipeEntrada, now(), $preco, now(), 'Concluido', $jogadorID, NULL)";
				
				$sql = mysqli_query($con, $query) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
				
				// Commit transaction
				mysqli_commit($con);	
				mysqli_autocommit($con,TRUE);
						  
				echo '<script>finaliza();</script>';
			}
			else
			{
				//possui time ja
				echo '<script>aborta();</script>';
			}
			
			
					  
		}
		else
		{
			mysqli_autocommit($con,FALSE);
			
			if($tipoTransf == "Troca")
			{
				$query = "INSERT INTO transferencia(EquipeSaida, EquipeEntrada, DataInicio, Valor, DataFim, Status, JogadorID, JogadorTrocaID) 
						  VALUES ($equipeSaida, $equipeEntrada, now(), $valorTransf, NULL, 'Aguardando', $jogadorID, $jogadorTroca)";
			}
			else
			{
				$query = "INSERT INTO transferencia(EquipeSaida, EquipeEntrada, DataInicio, Valor, DataFim, Status, JogadorID) 
						  VALUES ($equipeSaida, $equipeEntrada, now(), $valorTransf, NULL, 'Aguardando', $jogadorID)";
			}
			$sql = mysqli_query($con, $query) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
						
			mysqli_commit($con);	
			mysqli_autocommit($con,TRUE);
			
			if($sql)//sucesso
			{
				echo '<script>finaliza();</script>';
			}
			else
			{
				echo '<section class="present">
						<h1 class="present__title"></h1>
					 </section>

					 <section class="main-content">
						</br></br><h2>Erro ao processar solicitação.</h2></br></br>
					 </section>';
			}
		}
		
		mysqli_close($con);
		
	?>
	<?php
      	include("footer.php");
    ?>
</body>
</html>