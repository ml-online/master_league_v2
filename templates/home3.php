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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    </head>

    <body>
      <?php
      	include("cabecalho.php");
      ?>
	  
      <section class="main-content">
		<div style="padding-top: 10%;width:100%;height:60%;background-image: url('../static/img/back-home3.jpg');">
			<div>
				<h2 style="text-align: center;">PRÓXIMO JOGO</h2>
			</div>
			<div>
				<div style='height:100%;width:40%;float:left;'>
					<center>
						<img src='http://images.terra.com/2015/05/21/flamengo.png' style='width:50%;height:50%;'/></br></br>
						<h2>Overall: 85</h2></br>
						<h2>Ranking: 2º</h2>
					</center>
				</div>
				<div style='float:left;height:100%;width:20%;'>
					<center><h2 style='padding-top:40%'>x</h2></center>
				</div>
				<div style='height:100%;width:40%;float:right;'>
					<center>
						<img src='http://images.terra.com/2015/05/21/flamengo.png' style='width:50%;height:50%;'/></br></br>
						<h2>Overall: 85</h2></br>
						<h2>Ranking: 1º</h2>
					</center>
				</div>
			</div>
		</div>
		</br>
		<div>
			<div style='width:75%;height:70%;border-radius:2px;overflow:auto;'>
				<div style='background-color:#333;'>
					<h2 style='color:white;'>Jogo anterior da competição</h2>					
				</div>
				<div style='background-color: rgba(255,255,255,0.5)'>
					</br>
					<h2>Real Tijucaños</h2>
					<img src='http://images.terra.com/2015/05/21/flamengo.png' style='width:15%;height:15%;'/></br></br>
					
				</div>
			</div>
			<div style='width:25%;height:100%;'>
				<div style='background-color:#333;'>
					<h2 style='color:white;'>Tabela resumida</h2>					
				</div>
				<div style='background-color: rgba(255,255,255,0.5)'>
					<img src='http://images.terra.com/2015/05/21/flamengo.png' style='width:20%;height:20%;'/></br></br>
					
				</div>
			</div>
		</div>
      </section>

      <?php
      	include("footer.php");
      ?>
	  <map name="Map" id="Map">
		<area alt="" title="" href="#" shape="rect" coords="0,136,1913,877" />
	  </map>
    </body>
</html>