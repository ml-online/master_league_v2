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
        <script type="text/javascript">
			function carregarPaginaEquipe(EquipeID){
			  var form = document.getElementById("formID");
			  $("#equipeSelec").val(EquipeID);
			  form.submit();
			}
			
			function aceitarTransf(idTransf)
			{
				var form = document.getElementById("formRespTransf");
				
				if(confirm("Tem certeza que gostaria de aceitar esta solicitação?"))
				{
					$("#iptTipoResp").val("Aceito");
					$("#iptTransfID").val(idTransf);
					form.submit();
				}
			}
			
			function rejeitarTransf(idTransf)
			{
				var form = document.getElementById("formRespTransf");
				
				if(confirm("Tem certeza que gostaria de rejeitar esta solicitação?"))
				{
					$("#iptTipoResp").val("Rejeitado");
					$("#iptTransfID").val(idTransf);
					form.submit();
				}
			}
			
			function cancelarTransf(idTransf)
			{
				var form = document.getElementById("formRespTransf");
				
				if(confirm("Tem certeza que gostaria de cancelar esta solicitação e retirar a proposta?"))
				{
					$("#iptTipoResp").val("Cancelado");
					$("#iptTransfID").val(idTransf);
					form.submit();
				}
			}
      	</script>

        <section class="present">
            <h1 class="present__title">CR Galaticos - Master League</h1>
        </section>

        <form id="formID" name="signup" method="post" action="equipe.php" style="display: none;">
          <input id="equipeSelec" name="equipeIDSelec" type="hidden"></input>
        </form>
		
		<form id="formRespTransf" name="aceite" method="post" action="respostaTransf.php" style="display: none;">
          <input id="iptTipoResp" name="tipoResp" type="hidden"></input>
		  <input id="iptTransfID" name="transfID" type="hidden"></input>
        </form>
	
        <section class="main-content">	
			<br/>
			<div class='tituloPosicao'><center><h2>Transferências</h2></center></div><br/>
			<center>
			<?php
				include("conexao.php");
				$psn = $_SESSION["psn"];
				
				$equipeID = $_SESSION['session_equipe_id'];
				
				/*----------------------------------------------------------
				-------------------Propostas recebidas----------------------
				----------------------------------------------------------*/
				$sql = "SELECT t.ID, t.EquipeSaida, t.EquipeEntrada, t.DataInicio, t.Valor, t.Status, t.JogadorID, j.NomeJogador, 
						ifnull(t.JogadorTrocaID, '') as JogadorTrocaID, ifnull(j2.NomeJogador, '') as JogadorTrocaNome, u.Nome AS NomeUsuarioSolicitante, e2.NomeEquipe as NomeEquipeEntrada
						  FROM transferencia t 
						  JOIN equipe e 
						    ON e.EquipeID = t.EquipeSaida 
                          JOIN equipe e2
                            ON e2.EquipeID = T.EquipeEntrada
						  JOIN jogador j 
						    ON j.JogadorID = t.JogadorID 
				     LEFT JOIN jogador j2 
						    ON j2.JogadorID = t.JogadorTrocaID 
						  JOIN usuario u 
						    ON u.ID = e2.UsuarioID 
						 WHERE t.EquipeSaida = $equipeID
						   AND t.Status = 'Aguardando'";
								
				$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
				$rowcount = mysqli_num_rows($query);
				
				if($rowcount > 0)
				{
					echo "<table>";
					echo "<caption>Propostas recebidas</caption>";
					echo "<thead>";
					echo "	<tr>";
					echo "		<th>Equipe</th>";
					echo "		<th>Presidente</th>";
					echo "		<th>Jogador</th>";
					echo "		<th>Valor Proposta</th>";
					echo "		<th>Jogador Incluso</th>";
					echo "		<th>Aceitar</th>";
					echo "		<th>Recusar</th>";
					echo "	</tr>";
					echo "</thead>";

					while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
					{
						echo "<tr>";
						echo "<td>" . $row["NomeEquipeEntrada"] . "</td>";
						echo "<td>" . $row["NomeUsuarioSolicitante"] . "</td>";
						echo "<td>" . $row["NomeJogador"] . "</td>";
						echo "<td>G$ " . number_format($row["Valor"],2,",",".") . "</td>";
						echo "<td>" . $row["JogadorTrocaNome"] . "</td>";
						echo "<td><button id='btnAceitar_'" . $row["JogadorID"] . " onclick='aceitarTransf(" . $row["ID"] . ")' class='botaoAceitar'>Aceitar</button></td>";
						echo "<td><button id='btnRejeitar_'" . $row["JogadorID"] . " onclick='rejeitarTransf(" . $row["ID"] . ")' class='botaoRecusar'>Rejeitar</button></td>";
						echo "</tr>";
					}
					echo "</table>";
				}
				
				echo "</br>";
				
				/*----------------------------------------------------------
				-------------------Aguardando resposta---------------------
				----------------------------------------------------------*/
				$sql = "SELECT t.ID, t.EquipeSaida, t.EquipeEntrada, t.DataInicio, t.Valor, t.Status, t.JogadorID, j.NomeJogador, 
						ifnull(t.JogadorTrocaID, '') as JogadorTrocaID, ifnull(j2.NomeJogador, '') as JogadorTrocaNome, u.Nome AS NomeUsuarioResposta, e.NomeEquipe as NomeEquipeSaida
						  FROM transferencia t 
						  JOIN equipe e 
						    ON e.EquipeID = t.EquipeSaida 
                          JOIN equipe e2
                            ON e2.EquipeID = T.EquipeEntrada
						  JOIN jogador j 
						    ON j.JogadorID = t.JogadorID 
				     LEFT JOIN jogador j2 
						    ON j2.JogadorID = t.JogadorTrocaID 
						  JOIN usuario u 
						    ON u.ID = e.UsuarioID 
						 WHERE t.EquipeEntrada = $equipeID
						   AND t.Status = 'Aguardando'";
								
				$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
				$rowcount = mysqli_num_rows($query);
				
				if($rowcount > 0)
				{
					echo "<table>";
					echo "<caption>Aguardando Resposta</caption>";
					echo "<thead>";
					echo "	<tr>";
					echo "		<th>Equipe</th>";
					echo "		<th>Presidente</th>";
					echo "		<th>Jogador</th>";
					echo "		<th>Valor Proposta</th>";
					echo "		<th>Jogador Incluso</th>";
					echo "		<th>Status</th>";
					echo "		<th>Retirar Proposta</th>";
					echo "	</tr>";
					echo "</thead>";

					while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
					{
						echo "<tr>";
						echo "<td>" . $row["NomeEquipeSaida"] . "</td>";
						echo "<td>" . $row["NomeUsuarioResposta"] . "</td>";
						echo "<td>" . $row["NomeJogador"] . "</td>";
						echo "<td>G$ " . number_format($row["Valor"],2,",",".") . "</td>";
						echo "<td>" . $row["JogadorTrocaNome"] . "</td>";
						echo "<td>" . $row["Status"] . "</td>";
						echo "<td><button class='botaoRecusar' onclick='cancelarTransf(" . $row["ID"] . ")'>Retirar proposta</button></td>";
						echo "</tr>";
					}
					echo "</table>";
					echo "</br>";
				}
				
				/*----------------------------------------------------------
				-------------------Finalizados------------------------------
				----------------------------------------------------------*/
				$sql = "SELECT t.ID, t.EquipeSaida, t.EquipeEntrada, t.DataInicio, t.Valor, t.Status, t.JogadorID, j.NomeJogador, 
						ifnull(t.JogadorTrocaID, '') as JogadorTrocaID, ifnull(j2.NomeJogador, '') as JogadorTrocaNome, u.Nome AS NomeUsuarioSolicitante, 
						ifnull(e2.NomeEquipe, 'FREE AGENT') as NomeEquipeEntrada, ifnull(e.NomeEquipe, 'FREE AGENT') as NomeEquipeSaida, t.DataFim AS DataFim
						  FROM transferencia t 
					 LEFT JOIN equipe e 
						    ON e.EquipeID = t.EquipeSaida 
                     LEFT JOIN equipe e2
                            ON e2.EquipeID = T.EquipeEntrada
						  JOIN jogador j 
						    ON j.JogadorID = t.JogadorID 
				     LEFT JOIN jogador j2 
						    ON j2.JogadorID = t.JogadorTrocaID 
					 LEFT JOIN usuario u 
						    ON u.ID = e2.UsuarioID 
						 WHERE ((t.EquipeEntrada = $equipeID) OR (t.EquipeSaida = $equipeID))
						   AND t.Status NOT IN ('Aguardando')
						 ORDER BY t.DataFim desc
						 LIMIT 15";
								
				$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
				$rowcount = mysqli_num_rows($query);
				
				if($rowcount > 0)
				{
					echo "<table>";
					echo "<caption>Finalizados</caption>";
					echo "<thead>";
					echo "	<tr>";
					echo "		<th>Equipe Entrada</th>";
					echo "		<th>Equipe Saída</th>";
					echo "		<th>Jogador</th>";
					echo "		<th>Valor Proposta</th>";
					echo "		<th>Jogador Incluso</th>";
					echo "		<th>Status</th>";
					echo "		<th>Data Conclusão</th>";
					echo "	</tr>";
					echo "</thead>";

					while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
					{
						echo "<tr>";
						echo "<td>" . $row["NomeEquipeEntrada"] . "</td>";
						echo "<td>" . $row["NomeEquipeSaida"] . "</td>";
						echo "<td>" . $row["NomeJogador"] . "</td>";
						echo "<td>G$ " . number_format($row["Valor"],2,",",".") . "</td>";
						echo "<td>" . $row["JogadorTrocaNome"] . "</td>";
						echo "<td>" . $row["Status"] . "</td>";
						echo "<td>" . $row["DataFim"] . "</td>";
						echo "</tr>";
					}
					echo "</table>";
				}
				
				echo "</center>";
			?>
		<p style="height:100px;"></p>
        </section>
		<?php
			include("footer.php");
		?>
    </body>
</html>