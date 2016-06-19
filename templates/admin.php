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
        <title>Master League - CR Galáticos</title>

        <meta charset="utf-8"/>
        <meta name="author" content="CR Galaticos">
        <meta name="description" content="Organization of CR Galaticos Master League">

        <link rel="stylesheet" type="text/css" href="../static/css/base.css">
		<link rel="stylesheet" type="text/css" href="../static/css/teste_tabela_css.css">
		<link rel="stylesheet" href="../static/css/estilo2.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    </head>

    <body>
      <?php
      	include("cabecalho.php");
      ?>

      <section class="present">
          <h1 class="present__title">CR Galaticos - Master League</h1>
      </section>

      <section class="main-content">
		<br/>
		<div class='tituloPosicao'><center><h2>Pendências de cadastro</h2></center></div><br/>
		<center>
		<?php

			$sql = "SELECT u.`ID`, u.`Nome`, u.`PSN`, u.`Email`, u.`Senha`, u.`Orcamento`, u.`Ativo`, u.`Admin`, e.EquipeID, e.NomeEquipe
				      FROM usuario u 
					  JOIN equipe e
					    on e.UsuarioID = u.ID
					 where ativo = 0";
							
			$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
			$rowcount = mysqli_num_rows($query);
			
			if($rowcount > 0)
			{
				echo "<table>";
				echo "<caption>Propostas recebidas</caption>";
				echo "<thead>";
				echo "	<tr>";
				echo "		<th>Nome Usuario</th>";
				echo "		<th>Nome Time</th>";
				echo "		<th>PSN</th>";
				echo "		<th>E-mail</th>";
				echo "		<th>Aceitar</th>";
				echo "		<th>Recusar</th>";
				echo "	</tr>";
				echo "</thead>";

				while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
				{
					echo "<tr>";
					echo "<td>" . $row["Nome"] . "</td>";
					echo "<td>" . $row["NomeEquipe"] . "</td>";
					echo "<td>" . $row["PSN"] . "</td>";
					echo "<td>" . $row["Email"] . "</td>";
					echo "<td><button id='btnAceitar_'" . $row["ID"] . " onclick='aceitarUsuario(" . $row["ID"] . ")' class='botaoAceitar'>Aceitar</button></td>";
					echo "<td><button id='btnRejeitar_'" . $row["ID"] . " onclick='rejeitarUsuario(" . $row["ID"] . ")' class='botaoRecusar'>Rejeitar</button></td>";
					echo "</tr>";
				}
				echo "</table>";
			}
			
			echo "</br>";
		?>
		</center>
      </section>

      <?php
      	include("footer.php");
      ?>
    </body>
</html>