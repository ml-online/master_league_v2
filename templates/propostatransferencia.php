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
  }
?>
<html>
<head>
	<title>Processando proposta...</title>
	<link rel="stylesheet" type="text/css" href="../static/css/base.css">
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
		
		if($tipoTransf == "Troca")
		{
			$query = "INSERT INTO transferencia(equipeSaida, equipeEntrada, dataInicio, Valor, dataFim, status, jogadorID, jogadorTrocaID) 
					  VALUES ($equipeSaida, $equipeEntrada, now(), $valorTransf, NULL, 'Aguardando', $jogadorID, $jogadorTroca)";
		}
		else
		{
			$query = "INSERT INTO transferencia(equipeSaida, equipeEntrada, dataInicio, Valor, dataFim, status, jogadorID) 
					  VALUES ($equipeSaida, $equipeEntrada, now(), $valorTransf, NULL, 'Aguardando', $jogadorID)";
		}
		$sql = mysqli_query($con, $query) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
		
		if($sql)//sucesso
		{
			echo '<section class="present">
					<h1 class="present__title">CR Galaticos - Master League</h1>
				 </section>

				 <section class="main-content">
					<h2>Solicitação de Transferência realizada com sucesso.</h2>
				 </section>';
		}
		else
		{
			echo '<section class="present">
					<h1 class="present__title">CR Galaticos - Master League</h1>
			     </section>

				 <section class="main-content">
					<h2>Erro ao processar solicitação.</h2>
				 </section>';
		}
		mysqli_close($con);
		
	?>
</body>
</html>