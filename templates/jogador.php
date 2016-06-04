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
				var tipoEscolhido = document.getElementById("slTipoProposta").value;
				
				if(tipoEscolhido == "Troca")
				{
					
				}
				else
				{
					var formConfirmacao = document.getElementById("formConfirmacao");
					
					var valorTransf = document.getElementById("tdValor").value.toString();
					valorTransf = valorTransf.replace(/\./g, "");
					valorTransf = valorTransf.replace(/\,/, ".");
					
					$("#iptValorTransf").val(valorTransf);
					
					formConfirmacao.submit();
					//mysqli_query($con, "INSERT INTO transferencia(equipeSaida, equipeEntrada, dataSolicitacao, valorTransf, dataResposta, status, jogadorID) 
					//VALUES ('$nome', '$psn', '$email', '$senha')") or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
				}
			}
			
			function validaValorMoeda(e)
			{
				var tecla=(window.event)?event.keyCode:e.which;
				
				if(tecla>47 && tecla<58) return true;
				
				else{
					if (tecla==8 || tecla==0 || tecla==190 || tecla==190) return true;
					else  return false;
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
		</script>

        <section class="present">
            <h1 class="present__title">CR Galaticos - Master League</h1>
        </section>

        <section class="main-content">			
			<?php
				//buscando o jogador escolhido na tela anterior para carregamento
				$jogadorID = $_POST["JogadorCarregado"];
				//echo $jogadorID;

				$sql = "SELECT j.JogadorID,j.NomeJogador,j.Posicao,j.EquipeOriginal,j.Preco,j.Overall,j.EquipeID,e.NomeEquipe,e.Escudo,e.UsuarioID,j.Imagem
						  FROM jogador j
						  JOIN equipe e
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
					  <center><img src='$ImagemJogador' alt=''></center></br>
					  <center><h3>Overall: $overall</h3></center></br>
					  <center><h3>Posição: $posicaoJogador</h3></center></br>
					  <center><h3>Equipe: <img src='$Escudo' alt='' style='width:20px;'> $NomeEquipe</h3></center></br>";
				
				
				//echo "Logado: $equipeUsuarioLogado </br>";
				//echo "Na pagina do jogador do usuario: " . $equipeJogador . " <br/>";
				
				//print_r($_SESSION);
				
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
											<select>
												";
					
					$sql = "SELECT `JogadorID`, `NomeJogador`, `Overall`, `EquipeOriginal`, `EquipeID`, `Posicao`
						      FROM `jogador` 
						     WHERE EquipeID = '$equipeUsuarioLogado'";
						 
					$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
					
					// Listando os jogadores buscados da tabela
					while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
					{
						echo "<option id='jogador_" . $row["JogadorID"] . "' value='" . $row["NomeJogador"] . "'>" . $row["NomeJogador"] . "</option>";
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
					
					//variáveis a serem passadas para a próxima tela de confirmação
					echo "<form id='formConfirmacao' name='confirmacao' method='post' action='submitTransfer.php'>"
					echo "<input id='iptEquipeSaida' name='equipeSaida' type='hidden' value='" . $equipeJogador . "'>";
					echo "<input id='iptJogadorID' name='jogadorID' type='hidden' value='" . $jogadorID . "'>";
					echo "<input id='iptEquipeEntrada' name='equipeEntrada' type='hidden' value='" . $equipeUsuarioLogado . "'>";
					echo "<input id='iptValorTransf' name='valorTransf' type='hidden' value=''>";
					echo "</form>"
				}

			?>
			<p style="height:100px;"></p>
        </section>
    </body>
</html>