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
	<script type="text/javascript">
		function finaliza()
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
		$tipoResp = $_POST["tipoResp"];
		$transfID = $_POST["transfID"];
		
		$query = "SELECT ID, EquipeSaida, EquipeEntrada, DataInicio, Valor, Status, JogadorID, ifnull(JogadorTrocaID, '') AS JogadorTrocaID
					  FROM transferencia
					 WHERE ID = $transfID";
								
		$sql = mysqli_query($con,$query) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
		
		$row = mysqli_fetch_array($sql, MYSQLI_ASSOC);
		
		$equipeSaida = $row["EquipeSaida"];
		$equipeEntrada = $row["EquipeEntrada"];
		$valor = $row["Valor"];
		$jogadorID = $row["JogadorID"];
		$jogadorTrocaID = $row["JogadorTrocaID"];
		
		if($tipoResp == "Aceito")
		{
			mysqli_autocommit($con,false);
			
			$sql1 = mysqli_query($con, "UPDATE usuario 
								   SET Orcamento = Orcamento - '$valor'
								 WHERE ID = (SELECT UsuarioID
											   FROM Equipe
											  WHERE EquipeID = '$equipeEntrada')") or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
											  
			$sql2 = mysqli_query($con, "UPDATE usuario 
								   SET Orcamento = Orcamento + '$valor'
								 WHERE ID = (SELECT UsuarioID
											   FROM Equipe
											  WHERE EquipeID = '$equipeSaida')") or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
			
			$sql3 = mysqli_query($con, "UPDATE jogador 
								   SET EquipeID = '$equipeEntrada'
								 WHERE JogadorID = '$jogadorID'") or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
			
			if($jogadorTrocaID != '')
			{
				$sql4 = mysqli_query($con, "UPDATE jogador 
									   SET EquipeID = '$equipeSaida'
									 WHERE JogadorID = '$jogadorTrocaID'") or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
			}
			else
			{
				$sql4 = true;
			}
			
			$sql5 = mysqli_query($con, "UPDATE transferencia
								   SET Status = 'Concluido', DataFim = now()
								 WHERE ID = '$transfID'") or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
								 
			
			//Cancelando as solicitações de transferência pendentes para o jogador que se transferiu agora
			$sql6 = mysqli_query($con, "UPDATE transferencia 
								   SET Status = 'Cancelado', DataFim = now()
								 WHERE JogadorID = '$jogadorID'
								   AND Status like '%Aguardando%'") or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
					
			if($sql1 && $sql2 && $sql3 && $sql4 && $sql5 && $sql6)
			{
				mysqli_commit($con);
			}				
			
			//mysqli_autocommit($con,TRUE);
		}
		else if ($tipoResp == 'Rejeitado')
		{
			mysqli_query($con, "UPDATE transferencia
								   SET Status = 'Rejeitado', DataFim = now()
								 WHERE ID = '$transfID'") or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
		}
		else
		{
			mysqli_query($con, "UPDATE transferencia
								   SET Status = 'Cancelado', DataFim = now()
								 WHERE ID = '$transfID'") or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
		}
		
		echo "<script>finaliza()</script>";
		
		mysqli_close($con);
		
	?>
	<?php
      	include("footer.php");
    ?>
</body>
</html>