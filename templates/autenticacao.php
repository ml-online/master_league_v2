<?php
	ob_start();
?>
<html>
<head>
	<title>Autenticando...</title>
	<link rel="stylesheet" href="../static/css/estilo.css"/>
	<script type="text/javascript">
		function loginsuccessful(){
			setTimeout("window.location='noticias.php'", 10);
		}

		function telapack(){
			setTimeout("window.location='pack.php'", 10);
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

		$sql = "SELECT `ID`, `Nome`, `PSN`, `Email`, `Senha`, `Orcamento`, `Ativo`, `Admin`, `PackDisponivel`
		          FROM usuario 
				 WHERE psn = '$psn' 
				   AND senha = '$senha'";
		$sql = mysqli_query($con,$sql);
		$row = mysqli_fetch_array($sql, MYSQLI_ASSOC);
		$rowcount = mysqli_num_rows($sql);

		//echo 'Ativo: ' . $row["Ativo"];

	  	if($rowcount == 1 && $row["Ativo"] == 1)
	  	{
	  		//abrir sessão
	  		session_start("login_ml");
	  		$_SESSION['psn'] = $psn;
	  		$_SESSION['senha'] = $senha;
          	$usuarioID = $row["ID"];
			$packDisponivel = $row["PackDisponivel"];

			if (!isset($_SESSION['CREATED'])) 
			{
				$_SESSION['CREATED'] = time();
			} 
			else if (time() - $_SESSION['CREATED'] > 1800) 
			{
				// session started more than 30 minutes ago
				session_regenerate_id(true);    // change session ID for the current session and invalidate old session ID
				$_SESSION['CREATED'] = time();  // update creation time
			}
			
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

	  		echo "</br>Login realizado com sucesso.</br></br></br></br></br></br>";

	  		if($packDisponivel == 1)
	  		{
	  			echo "<script>telapack()</script>";		
	  		}
	  		else
	  		{
	  			echo "<script>loginsuccessful()</script>";
	  		}
	  	}
	  	else if ($rowcount == 1 && $row["Ativo"] == 0)
	  	{
	  		echo "<div>
					<center>Usuário ainda não aprovado. Aguarde ou entre em contato com um administrador.</center><br/>
					<center><a href='login.php'>Voltar para a tela de login</a></center>";
			
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

		mysqli_free_result($query);
	?>
</body>
</html>
