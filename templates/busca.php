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
		
		<script src="auto-complete.js"></script>
		<script>
			function busca()
			{
				var chaveBusca = $("#iptBusca").val();
				if(chaveBusca == "" || chaveBusca == undefined)
				{
					alert("Preencha uma chave a ser buscada");
				}
				else
				{
					var tipoBusca = document.getElementById("slTipoBusca").value;
					if(tipoBusca == "Jogador")
					{
						window.location.href = "busca.php?chave=" + chaveBusca + "&tipo=1";
					}
					else if(tipoBusca == "Clube")
					{	
						window.location.href = "busca.php?chave=" + chaveBusca + "&tipo=2";
					}
					else
					{
						alert ("Corrigir os parâmetros de busca");
					}
				}
				
			}
		</script>
    </head>
	
	<body>
		<?php
        	include("cabecalho.php");
        ?>
		<section class="present">
            <h1 class="present__title">CR Galaticos - Master League</h1>
        </section>
		<section class="main-content">
			<center>
				<div style="padding-top:20px;">
					Busca: <input id="iptBusca" autofocus type="text" name="q" placeholder="Buscar conteudo..." class="campoTexto" style="width:100%;max-width:600px;outline:0;"/>
					<select style="border-radius:10px; width:200px;" id='slTipoBusca' >
						<option value='Jogador'>Jogador</option>
						<option value='Clube'>Clube</option>
					</select>
				</div>
				<div>
					<a onclick="busca()" ><img class="putLink" src="../static/img/lupa.png" style="max-width:40px;"/></a>
				</div>
				<br/>
				<?php
					if(isset($_GET["chave"]) && isset($_GET["tipo"]))
					{
						$chaveBusca = $_GET["chave"];
						$tipoBusca = $_GET["tipo"];
						
						if($tipoBusca == 1) //Jogador
						{
							$sql = "SELECT j.`JogadorID`, j.`NomeJogador`, j.`Posicao`, j.`EquipeOriginal`, j.`Preco`, j.`Overall`, j.`EquipeID`, j.`Imagem`, e.NomeEquipe
									  FROM jogador j
								 LEFT JOIN equipe e 
										ON e.EquipeID = j.EquipeID
									 WHERE NomeJogador LIKE '%" . $chaveBusca . "%'
									 LIMIT 15";
									 
							$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
							$rowcount = mysqli_num_rows($query);
							
							echo "<div class='tituloPosicao'><center><h2>Resultados da Busca</h2></center></div><br/>";
							
							if($rowcount > 0)
							{
								echo "<table>";
								echo "<thead>";
								echo "	<tr>";
								echo "		<th>ID</th>";
								echo "		<th>Jogador</th>";
								echo "		<th>Clube</th>";
								echo "		<th>Overall</th>";
								echo "		<th>Clube Original</th>";
								echo "	</tr>";
								echo "</thead>";
								
								while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
								{
									echo "<tr>";
									echo "<td style='text-align:right;'>" . $row["JogadorID"] . "</td>";
									echo "<td style='text-align:right;'><a href='jogador.php?id=" . $row["JogadorID"] . "'>" . $row["NomeJogador"] . "</a></td>";
									echo "<td style='text-align:right;'><a href='equipe.php?id=" . $row["EquipeID"] . "'>" . $row["NomeEquipe"] . "</a></td>";
									echo "<td style='text-align:right;'>" . $row["Overall"] . "</td>";
									echo "<td style='text-align:right;'>" . $row["EquipeOriginal"] . "</td>";
									echo "</tr>";
									//echo "<a href='jogador.php?id=" . $row["JogadorID"] . "'>" . $row["NomeJogador"] . "</a><br/>";
								}
								
								echo "</table>";
								
								if($rowcount == 15)
								{
									echo "<br/>Sua busca retornou muitos resultados, utilize uma chave mais específica para melhorar o resultado.";
								}
								
							}
							else
							{
								echo "Nenhum resultado encontrado.";
							}
							
						}
						else if ($tipoBusca == 2) //Clube
						{
							$sql = "SELECT e.`EquipeID`, e.`NomeEquipe`, e.`Escudo`, e.`UsuarioID`, u.Nome 
									  FROM equipe e
									  JOIN usuario u
									    ON u.ID = e.UsuarioID
									 WHERE NomeEquipe LIKE '%" . $chaveBusca . "%'
									   AND u.Ativo = 1
									 LIMIT 15";
									 
							$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
							
							$rowcount = mysqli_num_rows($query);
							
							echo "<div class='tituloPosicao'><center><h2>Resultados da Busca</h2></center></div><br/>";
							
							if($rowcount > 0)
							{
								echo "<table>";
								echo "<thead>";
								echo "	<tr>";
								echo "		<th>ID</th>";
								echo "		<th>Equipe</th>";
								echo "		<th>Presidente</th>";
								echo "	</tr>";
								echo "</thead>";
								
								while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
								{
									echo "<tr>";
									echo "<td style='text-align:right;'>" . $row["EquipeID"] . "</td>";
									echo "<td style='text-align:right;'><a href='equipe.php?id=" . $row["EquipeID"] . "'>" . $row["NomeEquipe"] . "</a></td>";
									echo "<td style='text-align:right;'>" . $row["Nome"] . "</td>";
									echo "</tr>";
								}
								if($rowcount == 15)
								{
									echo "<br/>Sua busca retornou muitos resultados, utilize uma chave mais específica para melhorar o resultado.";
								}
								echo "</table>";
							}
							else
							{
								echo "Nenhum resultado encontrado.";
							}
							
						}
					}
					
				?>
				
			</center>
			
		</section>
	  <?php
      	include("footer.php");
      ?>
	</body>
</html>