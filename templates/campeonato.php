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
            <h1 class="present__title">CR Galaticos - Master League</h1>
        </section>

        <form id="formID" name="signup" method="post" action="equipe.php" style="display: none;">
          <input id="equipeSelec" name="equipeIDSelec" type="hidden"></input>
        </form>

        <section class="main-content">			
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
				//$_SESSION['session_usuario_id'] = $usuarioID;
				
				
				//Buscando o equipeID
				$sql = "SELECT equipeID 
						  FROM equipe
					     WHERE usuarioID = '$usuarioID'";
								
				$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
				$row = mysqli_fetch_array($query, MYSQLI_ASSOC);
				$equipeID = $row["equipeID"];
				

				$sql = "SELECT u.ID, u.Nome, u.PSN, u.Orcamento, e.NomeEquipe, e.Escudo, e.equipeID
						  FROM usuario u
						  JOIN equipe e
						    ON e.UsuarioID = u.ID";
								
				$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);

				$indice = 1;

				echo "<center>";
				echo "<table>";
				echo "<caption>Classificação</caption>";
				echo "<thead>";
				echo "	<tr>";
				echo "		<th>Posição</th>";
				echo "		<th>Time</th>";
				echo "		<th>Presidente</th>";
				echo "	</tr>";
				echo "</thead>";

				while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
				{
					echo "<tr>";
					echo "<td>$indice</td>";
					echo "<td><a href='#' onclick='carregarPaginaEquipe(" . $row["equipeID"] . ");'>" . $row["NomeEquipe"] . "</a></td>";
					echo "<td>" . $row["Nome"] . "</td>";
					echo "</tr>";
					$indice++;
				}
				echo "</table>";
				echo "</center>";
			?>

        </section>
    </body>
</html>