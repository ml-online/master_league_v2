<html>
<head>
	<title>Processando proposta...</title>
</head>

<body>
	<?php
		include("conexao.php");
		
		$equipeSaida = $_POST["equipeSaida"];
		$jogadorID = $_POST["jogadorID"];
		$equipeEntrada = $_POST["equipeEntrada"];
		$valorTransf = $_POST["valorTransf"];
		
		/*$query = "SELECT * FROM usuario WHERE psn = '$psn'";
		
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
			$sql = "SELECT * FROM equipe WHERE nomeequipe = '$time'";
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
			mysqli_query($con, "INSERT INTO usuario(nome, psn, email, senha) VALUES ('$nome', '$psn', '$email', '$senha')") or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
			
			//Buscando o usuarioID gerado para este novo usuário
			$sql = "SELECT max(id) as id 
					  FROM usuario";
						 
			$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
			
			$row = mysqli_fetch_array($query,MYSQLI_ASSOC);
			$usuarioID = (int)$row["id"];
			//echo $usuarioID;
			
			$query = mysqli_query($con, "INSERT INTO equipe(NomeEquipe, Escudo, usuarioID) VALUES ('$time', 'Não Cadastrado', '$usuarioID')") or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
			echo 'DEBUG ' . $query;
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
		}*/
		mysqli_close($con);
		
	?>
</body>
</html>