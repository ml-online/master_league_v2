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
					<a onclick="busca()" ><img src="../static/img/lupa.png" style="max-width:40px; padding-left:34%"/></a>
				</div>
				
				<?php
					if(isset($_GET["chave"]) && isset($_GET["tipo"]))
					{
						$chaveBusca = $_GET["chave"];
						$tipoBusca = $_GET["tipo"];
						
						if($tipoBusca == 1) //Jogador
						{
							$sql = "SELECT `JogadorID`, `NomeJogador`, `Posicao`, `EquipeOriginal`, `Preco`, `Overall`, `EquipeID`, `Imagem` 
									  FROM jogador
									 WHERE NomeJogador LIKE '%" . $chaveBusca . "%'
									 LIMIT 15";
									 
							$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
							
							echo "<div class='tituloPosicao'><center><h2>Resultados da Busca</h2></center></div><br/>";
							while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
							{
								echo "<a href='jogador.php?id=" . $row["JogadorID"] . "'>" . $row["NomeJogador"] . "</a>";
							}
						}
						else if ($tipoBusca == 2) //Clube
						{
							$sql = "SELECT `EquipeID`, `NomeEquipe`, `Escudo`, `UsuarioID` 
									  FROM equipe
									 WHERE NomeEquipe LIKE '%" . $chaveBusca . "%'
									 LIMIT 15";
									 
							$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
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