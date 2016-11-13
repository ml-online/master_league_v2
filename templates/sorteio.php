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
        
        <script src="auto-complete.js"></script>
		<script>
		
                function sorteio() {
                    alert ("O sorteio será realizado e colocado no site em breve :)");
                }
                
                
		</script>
			
    </head>

    <body>
      <?php
      	include("cabecalho.php");
      ?>

      <section class="present">
          <h1 class="present__title"></h1>
      </section>
        <section class="main-content">
			<center>
				<div style="padding-top:20px;">
					Aperte abaixo para o sorteio! 
<!--                                        <input id="iptBusca" autofocus type="text" name="q" placeholder="Buscar conteudo..." class="campoTexto" style="width:100%;max-width:600px;outline:0;"/>-->
<!--					<select onchange="trocaTipo()" style="border-radius:10px; width:150px;" id='slTipoBusca' >
						<option value='Jogador'>Jogador</option>
						<option value='Clube'>Clube</option>
					</select>-->
<!--					<select id="sltPosicao" style="border-radius:10px; width:150px;" id='slTipoBusca' >
						<option value='Qualquer'>Qualquer posição</option>
                                               
						
					</select>-->
<!--					//<input id="chkSemClube" type="checkbox"  /><span style="padding-left:8px;" id="labelSemClube">Sem clube</span>
				</div>-->
				<div>
                                    <a onclick="sorteio()" ><img class="putLink" src="../static/img/sorteador2.png" style="max-width:170px;"/></a>
				</div>
				<br/>
                                                </center>
        </section>
         <?php
      	include("footer.php");
      ?>
	</body>
</html>
