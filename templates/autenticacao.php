<html>
<head>
	<title>Autenticando...</title>
	<link rel="stylesheet" href="_css/estilo.css"/>
	<script type="text/javascript">
		function loginsuccessful(){
			setTimeout("window.location='home.php'", 10);
		}

		function loginFailed(){
			setTimeout("window.location='login.php'", 10); //milisegundos
		}
	</script>
</head>

<body>
	<?php
		include("conexao.php");
	?>

	<?php
		$psn = $_POST["psn"];
		$senha = $_POST["senha"];

		$sql = "SELECT * 
		          FROM usuario 
				 WHERE psn = '$psn' 
				   AND senha = '$senha'";
		$sql = mysqli_query($con,$sql);
		$rowcount = mysqli_num_rows($sql);

	  	if($rowcount == 1)
	  	{
	  		//abrir sessão
	  		session_start("login_ml");
	  		$_SESSION['psn'] = $_POST['psn'];
	  		$_SESSION['senha'] = $_POST['senha'];
	  		echo "Login realizado com sucesso.";
	  		echo "<script>loginsuccessful()</script>";
	  	}
	  	else if ($rowcount > 1)
	  	{
	  		echo "Ops! Ocorreu um erro";
	  		echo "<script>loginFailed()</script>";
	  	}
	  	else
	  	{
	  		echo "<div>
					<center>PSN ou senha incorretos.</center><br/>
					<center><a href='login.php'>Voltar para a tela de login</a></center>
				  </div>";
	  	}

		mysqli_free_result($sql);
	?>
</body>
</html>