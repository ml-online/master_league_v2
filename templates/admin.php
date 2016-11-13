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
		<link rel="stylesheet" href="../static/css/estilo2.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    </head>

    <body>
    	<script type="text/javascript">
			function redirect()
			{
				window.location='home.php';
			}
			
	        function aceitarUsuario(id){
	          var form = document.getElementById("formID");
	          if(confirm("Tem certeza que deseja aceitar este novo usuário?"))
	          {
	          	$("#idusuario").val(id);
	            $("#tipooperacao").val("Aceitar");
	            form.submit();
	          }
	        }

	        function rejeitarUsuario(id){
	          var form = document.getElementById("formID");
	          if(confirm("Tem certeza que deseja rejeitar este novo usuário?"))
	          {
	            $("#idusuario").val(id);
	            $("#tipooperacao").val("Rejeitar");
	            form.submit();
	          }
	        }
			
			function IncDerrota(id){
				var form = document.getElementById("formID2");
				if(confirm("Gostaria de reportar uma derrota e adicionar D$200 ao usuário " + id + "?"))
				  {
					$("#usuarioID").val(id);
					$("#ValorIncorporado").val(200);
					form.submit();
				  }
			}
			
			function IncEmpate(id){
				var form = document.getElementById("formID2");
				if(confirm("Gostaria de reportar um empate e adicionar D$300 ao usuário " + id + "?"))
				  {
					$("#usuarioID").val(id);
					$("#ValorIncorporado").val(300);
					form.submit();
				  }
			}
			
			function IncVitoria(id){
				var form = document.getElementById("formID2");
				if(confirm("Gostaria de reportar uma vitória e adicionar D$400 ao usuário " + id + "?"))
				  {
					$("#usuarioID").val(id);
					$("#ValorIncorporado").val(400);
					form.submit();
				  }
			}
      	</script>
      <?php
      	include("cabecalho.php");
      ?>

      <section class="present">
          <h1 class="present__title"></h1>
      </section>

      <section class="main-content">
		<br/>
		<?php
			$psn = $_SESSION["psn"];
			
			$sql = "SELECT Admin
					  FROM usuario 
					 WHERE psn = '$psn'";
							
			$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
			$row = mysqli_fetch_array($query, MYSQLI_ASSOC);
			$admin = $row["Admin"];
			
			if($admin != 1)
			{
				echo "<script>redirect();</script>";
			}
		?>
		
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
			else
			{
				echo "<h3>Nenhuma pendência cadastral.</h3><br/><br/>";
			}
			
			echo "</br>";
		?>
		</center>

		<form id="formID" name="signup" method="post" action="aprovacao.php" style="display: none;">
        	<input id="idusuario" name="UsuarioID" type="hidden"></input>
        	<input id="tipooperacao" name="TipoOperacao" type="hidden"></input>
      	</form>
		
		<div class='tituloPosicao'><center><h2>Incorporação Financeira</h2></center></div><br/>
		<center>
			<?php
				$sql = "SELECT u.`ID`, u.`Nome`, u.`PSN`, u.`Email`, u.`Senha`, u.`Orcamento`, u.`Ativo`, u.`Admin`, e.EquipeID, e.NomeEquipe
				      FROM usuario u 
					  JOIN equipe e
					    on e.UsuarioID = u.ID
					 where ativo = 1";
							
				$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
				$rowcount = mysqli_num_rows($query);
				
				if($rowcount > 0)
				{
					echo "<table>";
					echo "<caption>Incorporação financeira</caption>";
					echo "<thead>";
					echo "	<tr>";
					echo "		<th>Nome Usuario</th>";
					echo "		<th>Nome Time</th>";
					echo "		<th>PSN</th>";
					echo "		<th>Orçamento Atual</th>";
					echo "		<th>Incorporação</th>";
					echo "	</tr>";
					echo "</thead>";
					
					while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
					{
						echo "<tr>";
						echo "<td>" . $row["Nome"] . "</td>";
						echo "<td>" . $row["NomeEquipe"] . "</td>";
						echo "<td>" . $row["PSN"] . "</td>";
						echo "<td> D$" . number_format($row["Orcamento"],2,",",".") . "</td>";
						echo "<td>
						<button title='Derrota' id='btnDerrota_'" . $row["ID"] . " onclick='IncDerrota(" . $row["ID"] . ")' class='botaoAceitar'>+200</button>
						<button title='Empate' id='btnEmpate_'" . $row["ID"] . " onclick='IncEmpate(" . $row["ID"] . ")' class='botaoAceitar'>+300</button>
						<button title='Vitoria' id='btnVitoria_'" . $row["ID"] . " onclick='IncVitoria(" . $row["ID"] . ")' class='botaoAceitar'>+400</button>
						</td>";
						echo "</tr>";
					}
					echo "</table>";
				}
				else
				{
					echo "Nao ha usuarios cadastrados.";
				}
			?>
		</center>
		
		<form id="formID2" name="signup" method="post" action="incorporacao.php" style="display: none;">
        	<input id="usuarioID" name="usuarioID" type="hidden"></input>
        	<input id="ValorIncorporado" name="ValorIncorporado" type="hidden"></input>
      	</form>
		
      </section>

      <?php
      	include("footer.php");
      ?>
    </body>
</html>