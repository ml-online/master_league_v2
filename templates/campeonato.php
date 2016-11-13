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
        <title>Master League</title>

        <meta charset="utf-8"/>
        <meta name="author" content="CR Galaticos">
        <meta name="description" content="Organization of CR Galaticos Master League">

        <link rel="stylesheet" type="text/css" href="../static/css/base.css">
        <link rel="stylesheet" type="text/css" href="../static/css/Teste_tabela_css.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    </head>

    <body>
        <?php
        	include("cabecalho.php");
        ?>
        <script type="text/javascript">
        function carregarPaginaEquipe(EquipeID){
          var form = document.getElementById("formID");
          $("#equipeSelec").val(EquipeID);
          form.submit();
        }
      	</script>

        <section class="present">
            <h1 class="present__title"></h1>
        </section>

        <form id="formID" name="signup" method="post" action="equipe.php" style="display: none;">
          <input id="equipeSelec" name="equipeIDSelec" type="hidden"></input>
        </form>

        <section class="main-content">		
			<br/>
			<div class='tituloPosicao'><center><h2>Times inscritos</h2></center></div><br/>
			<?php
				include("conexao.php");
				$psn = $_SESSION["psn"];
				
				//Buscando o usuarioID
				$sql = "SELECT ID 
						  FROM usuario 
					     WHERE psn = '$psn'";
								
				$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
				$row = mysqli_fetch_array($query, MYSQLI_ASSOC);
				$usuarioID = $row["ID"];
				
				//echo "UsuarioID = " . $usuarioID;
				//$_SESSION['session_usuario_id'] = $usuarioID;
				
				
				//Buscando o equipeID
				$sql = "SELECT equipeID 
						  FROM equipe
					     WHERE usuarioID = '$usuarioID'";
								
				$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
				$row = mysqli_fetch_array($query, MYSQLI_ASSOC);
				$equipeID = $row["equipeID"];
				

				$sql = "SELECT u.ID, u.Nome, u.PSN, u.Orcamento, e.NomeEquipe, e.Escudo, e.EquipeID
						  FROM usuario u
						  JOIN equipe e
						    ON e.UsuarioID = u.ID
						 WHERE u.Ativo = 1";
								
				$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);

				echo "<center>";
				echo "<table style='width:50%;'>";
				echo "<thead>";
				echo "	<tr>";
				echo "		<th>ID</th>";
				echo "		<th>Time</th>";
				echo "		<th>Presidente</th>";
				echo "	</tr>";
				echo "</thead>";

				while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
				{
					echo "<tr>";
					echo "<td>" . $row["EquipeID"] . "</td>";
					echo "<td><a href='equipe.php?id=" . $row["EquipeID"] . "'>" . $row["NomeEquipe"] . "</a></td>";
					echo "<td>" . $row["Nome"] . "</td>";
					echo "</tr>";
				}
				echo "</table>";
				echo "</center>";
			?>
        </section>
      <?php
      	include("footer.php");
      ?>
    </body>
</html>