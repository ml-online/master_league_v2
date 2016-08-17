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
	$usuarioID = $_SESSION["session_usuario_id"];
	$equipeUsuarioLogado = $_SESSION["session_equipe_id"];
	
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
		<link rel="stylesheet" href="../static/css/estilo2.css"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    </head>

    <body>
        <?php
        	include("cabecalho.php");
        ?>
		
		<script type="text/javascript">
			function moeda(z){
				v = z.value;
				v=v.replace(/\D/g,"") // permite digitar apenas numero
				v=v.replace(/(\d{1})(\d{14})$/,"$1.$2") // coloca ponto antes dos ultimos digitos
				v=v.replace(/(\d{1})(\d{11})$/,"$1.$2") // coloca ponto antes dos ultimos 11 digitos
				v=v.replace(/(\d{1})(\d{8})$/,"$1.$2") // coloca ponto antes dos ultimos 8 digitos
				v=v.replace(/(\d{1})(\d{5})$/,"$1.$2") // coloca ponto antes dos ultimos 5 digitos
				v=v.replace(/(\d{1})(\d{1,2})$/,"$1,$2") // coloca virgula antes dos ultimos 2 digitos
				z.value = v;
			}
		
			function enviarProposta()
			{
				var formConfirmacao = document.getElementById("formConfirmacao");
				var tipoEscolhido = document.getElementById("slTipoProposta").value;
				var orcamento = parseFloat(document.getElementById("iptOrcamento").value);
				
				$("#iptTipoTransf").val(tipoEscolhido);
				
				var valorTransf = document.getElementById("tdValor").value.toString();
				valorTransf = valorTransf.replace(/\./g, "");
				valorTransf = valorTransf.replace(/\,/, ".");
				
				valorTransf = parseFloat(valorTransf);
				
				$("#iptValorTransf").val(valorTransf);
				
				//alert("Valor Transf: " + valorTransf + " Valor Orçamento: " + orcamento);
				
				if(valorTransf <= orcamento)
				{
					if(tipoEscolhido == "Troca")
					{
						var jogadorTroca = $("#jogadorTrocaSelecionado").val();
						jogadorTroca = $("option[name='" + jogadorTroca + "']").attr("id");
						jogadorTroca = jogadorTroca.replace("jogador_", "");
						//alert(jogadorTroca);
						$("#iptJogadorTroca").val(jogadorTroca);
						formConfirmacao.submit();
					}
					else //Transferência
					{
						formConfirmacao.submit();
					}
				}
				else
				{
					alert("Você não tem orçamento suficiente para fazer esta proposta.");
				}
				
				
			}

			function fazerProposta()
			{
				$("#divTrans").toggle("slow", "swing");
			}
			
			function trocaTipoProposta()
			{
				var tipoEscolhido = document.getElementById("slTipoProposta").value;
				
				if(tipoEscolhido == "Troca")
				{
					$("#trJogadorTroca").toggle("slow", "swing");
				}
				else
				{
					$("#trJogadorTroca").hide();
				}
			}
			
			function contratarFreeAgent()
			{
				var orcamento = parseFloat(document.getElementById("iptOrcamento").value);
				var preco = parseFloat(document.getElementById("iptPreco").value);
				var formConfirmacao = document.getElementById("formConfirmacao");
				
				if(orcamento < preco)
				{
					alert("Você não possui orçamento suficiente para contratar este jogador");
				}
				else
				{
					if(confirm("Gostaria de finalizar a contratação deste Free Agent?"))
					{
						$("#iptFreeAgent").val(1);
						formConfirmacao.submit();
					}
				}
			}
			
			function dispensarJogador()
			{
				var preco = parseFloat(document.getElementById("iptPreco").value);
				var formConfirmacao = document.getElementById("formConfirmacao");
				var multa = parseFloat(document.getElementById("iptMulta").value); //preco * 0.15;				
				if(confirm("Você receberá apenas G$ " + multa + ". Tem certeza que gostaria de vendê-lo ao mercado?"))
				{
					$("#iptDispensa").val(1);
					formConfirmacao.submit();
				}
			}
		</script>

        <section class="present">
            <h1 class="present__title"></h1>
        </section>
        <section class="main-content">			
			<?php
				//buscando o jogador escolhido na tela anterior para carregamento
				$jogadorID = $_GET["id"];
				//echo $jogadorID;

				$sql = "SELECT j.JogadorID,j.NomeJogador,j.Posicao,j.EquipeOriginal,j.Preco,j.Overall,j.EquipeID,e.NomeEquipe,e.Escudo,e.UsuarioID,j.Imagem
						  FROM jogador j
				     LEFT JOIN equipe e
						    ON e.EquipeID = j.EquipeID
					     WHERE j.jogadorID = '$jogadorID'";
								
				$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
				$row = mysqli_fetch_array($query, MYSQLI_ASSOC);
				
				$NomeJogador = $row["NomeJogador"];
				$posicaoJogador = $row["Posicao"];
				$equipeOriginal = $row["EquipeOriginal"];
				$preco = $row["Preco"];
				$overall = $row["Overall"];
				$equipeJogador = $row["EquipeID"];
				$NomeEquipe = $row["NomeEquipe"];
				$Escudo = $row["Escudo"];
				$ImagemJogador = $row["Imagem"];

				if($ImagemJogador == null)
				{
					$ImagemJogador = "";
				}


				echo "<center><h1>$NomeJogador</h1></center><br/>
					  <center><div class='imgJogador'><img class='imgJogador' src='$ImagemJogador' alt=''></center></div></br>
					  <center><h3>Posição: $posicaoJogador</h3></center></br>";
				
				if($equipeJogador == null)
				{
					echo "<center><h3>SEM CLUBE - FREE AGENT</h3></br>";
					echo "<center><h3>Preço: G$ " . number_format($preco,2,",",".") . "</h3></br>";
					echo "<button class='botao' onclick='contratarFreeAgent();'>Contratar</button></center></br></br>";
				}
				else
				{
					echo "<center><h3>Equipe: <img src='$Escudo' alt='' style='width:20px;'> $NomeEquipe</h3></center></br>";
					
					if($equipeUsuarioLogado != $equipeJogador)
					{
						echo "<center>
								<button class='botao' onclick='fazerProposta();'>Fazer Proposta</button></br></br>
								<div id='divTrans' style='display:none;'>
								<form id='formTransf' name='transfer' method='post' action='submitTransfer.php'>
									<table>
										<tr>
											<td>Tipo: </td>
											<td>
												<select id='slTipoProposta' onchange='trocaTipoProposta();'>
													<option value='Transferência'>Transferência</option>
													<option value='Troca'>Troca</option>
												</select>
											</td>
										</tr>
										<tr id='trJogadorTroca' style='display:none'>
											<td>Jogador: </td>
											<td>
												<select id='jogadorTrocaSelecionado'>
													";
						
						$sql = "SELECT `JogadorID`, `NomeJogador`, `Overall`, `EquipeOriginal`, `EquipeID`, `Posicao`
								  FROM `jogador` 
								 WHERE EquipeID = '$equipeUsuarioLogado'";
							 
						$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
						
						// Listando os jogadores buscados da tabela
						while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
						{
							echo "<option id='jogador_" . $row["JogadorID"] . "' name='" . $row["NomeJogador"] . "'>" . $row["NomeJogador"] . "</option>";
						}
						
						echo "					</select>
											</td>
										</tr>
										<tr>
											<td>Valor: </td>
											<td>G$ <input id='tdValor' type='text' onkeyup='moeda(this)'></td>
										</tr>
									</table>
								</form>
								<button class='botao' onclick='enviarProposta();'>Enviar</button>
								</div>
							  </center>";
					}
					else
					{
						//o jogador que está sendo visualizado é da própria equipe do usuário logado
						$multa = $preco * 0.7;
						echo "<center><h3>Equipe Original: $equipeOriginal</h3></center></br>";
						echo "<center><h3>Valor do jogador: G$ ". number_format($preco,2,",",".") . "</h3></br>";
						echo "<center><h3>Valor de venda ao mercado: G$ " . number_format($multa,2,",",".") . "</h3></br>";
						echo "<button class='botao' onclick='dispensarJogador();'>Vender ao mercado</button></center></br></br>";
					}
				}
				//variáveis a serem passadas para a próxima tela de confirmação
				echo "<form id='formConfirmacao' name='confirmacao' method='post' action='propostatransferencia.php'>";
				echo "<input id='iptEquipeSaida' name='equipeSaida' type='hidden' value='" . $equipeJogador . "'>";
				echo "<input id='iptJogadorID' name='jogadorID' type='hidden' value='" . $jogadorID . "'>";
				echo "<input id='iptEquipeEntrada' name='equipeEntrada' type='hidden' value='" . $equipeUsuarioLogado . "'>";
				echo "<input id='iptValorTransf' name='valorTransf' type='hidden'>";
				echo "<input id='iptJogadorTroca' name='jogadorTroca' type='hidden'>";
				echo "<input id='iptTipoTransf' name='tipoTransf' type='hidden'>";
				echo "<input id='iptFreeAgent' name='freeAgent' type='hidden'>";
				echo "<input id='iptPreco' name='preco' type='hidden' value='" . $preco . "'>";
				echo "<input id='iptMulta' name='multa' type='hidden' value='" . $preco * 0.7 . "'>";
				echo "<input id='iptDispensa' name='dispensa' type='hidden' value='0'>";
				echo "</form>";
				
				$sql = "SELECT Orcamento
						  FROM usuario
						 WHERE PSN = '$psn'";
							
				$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
				$row = mysqli_fetch_array($query, MYSQLI_ASSOC);
				
				$orcamento = $row["Orcamento"];
				
				echo "<input id='iptOrcamento' type='hidden' value='" . $orcamento . "'>";

			?>
        </section>
      <?php
      	include("footer.php");
      ?>
    </body>
</html>