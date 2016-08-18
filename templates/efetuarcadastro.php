<html>
<head>
<title>Efetuar Cadastro</title>
	<link rel="stylesheet" href="../static/css/estilo.css"/>
	<script type="text/javascript">
		function confirmarCadastro(){
			alert("Usuário cadastrado com sucesso!");
		}
	</script>
</head>

<body>
	<?php
		include("conexao.php");

		$nome = $_POST['nome'];
		$psn = $_POST['psn'];
		$email = $_POST['email'];
		$time = $_POST['time'];
		$senha = $_POST['senha'];
		
		//VALIDAR a criação do novo usuário
		$query = "SELECT * FROM usuario WHERE PSN = '$psn'";
		$sql = mysqli_query($con,$query);
		$rowcount = mysqli_num_rows($sql);
		$codError = 0; // 0 -> não há critica ; 1 -> psn já cadastrada ; 2 -> time já cadastrado ;

	  	if($rowcount > 0)
	  	{
	  		//ja existe essa psn cadastrada
			$codError = 1;
	  	}
	  	else
	  	{
	  		//Valida se já possui time com esse nome
			$sql = "SELECT * FROM equipe WHERE NomeEquipe = '$time'";
			$sql = mysqli_query($con,$sql);
			$rowcount = mysqli_num_rows($sql);
			
			if($rowcount > 0)
			{
				//já existe time com esse nome
				$codError = 2;
			}
	  	}
	
		if($codError == 0)
		{
			mysqli_begin_transaction($con, MYSQLI_TRANS_START_READ_WRITE);
			
			//Criação de novo usuário
			mysqli_query($con, "INSERT INTO usuario(Nome, PSN, Email, Senha) VALUES ('$nome', '$psn', '$email', '$senha')") or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
			
			//Buscando o usuarioID gerado para este novo usuário
			$sql = "SELECT max(ID) as ID 
					  FROM usuario";
						 
			$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
			
			$row = mysqli_fetch_array($query,MYSQLI_ASSOC);
			$usuarioID = (int)$row["ID"];
			//echo $usuarioID;
			
			$query = mysqli_query($con, "INSERT INTO equipe(NomeEquipe, usuarioID) VALUES ('$time', '$usuarioID')") or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
			mysqli_commit($con);
			
			echo "<div>
					<center>Cadastro efetuado com sucesso!</center><br/>
					<center><a href='login.php'>Voltar para a tela de login</a></center>
				  </div>";
				
		}
		else if($codError == 1)
		{
			echo "<div>
					<center>PSN já cadastrada.</center><br/>
					<center><a href='telacadastro.php'>Voltar para a tela de cadastro</a></center>
				  </div>";
		}
		else //$coderror == 2
		{
			echo "<div>
					<center>Time com esse nome já cadastrado.</center><br/>
					<center><a href='telacadastro.php'>Voltar para a tela de cadastro</a></center>
				  </div>";
		}
		mysqli_close($con);
		
	?>
</body>
</html>