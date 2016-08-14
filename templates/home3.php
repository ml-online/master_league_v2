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
	  <br/>
      <section class="main-content">
		<div style="padding-top: 10%;width:100%;height:60%;background-image: url('../static/img/back-home3.jpg');">
			<div>
				<h2 style="text-align: center;color: white;text-shadow: 2px 2px 8px #ffffff;font-size:200%">PRÓXIMO JOGO</h2>
			</div>
			<div>
				<div style='height:100%;width:40%;float:left;'>
					<center>
						<img src='http://images.terra.com/2015/05/21/flamengo.png' style='width:50%;height:50%;'/></br></br>
						<h2  style="text-align: center;color: white;text-shadow: 2px 2px 8px #000000;font-size:150%">Overall: 85</h2></br>
						<h2  style="text-align: center;color: white;text-shadow: 2px 2px 8px #000000;font-size:150%">Ranking: 2º</h2></br>
					</center>
				</div>
				<div style='float:left;height:100%;width:20%;'>
					<center><h2 style='padding-top:40%;color: white;text-shadow: 2px 2px 8px #ffffff;font-size:300%'>x</h2></center>
				</div>
				<div style='height:100%;width:40%;float:right;'>
					<center>
						<img src='http://images.terra.com/2015/05/21/flamengo.png' style='width:50%;height:50%;'/></br></br>
						<h2  style="text-align: center;color: white;text-shadow: 2px 2px 8px #000000;font-size:150%">Overall: 85</h2></br>
						<h2  style="text-align: center;color: white;text-shadow: 2px 2px 8px #000000;font-size:150%">Ranking: 1º</h2></br>
					</center>
				</div>
			</div>
		</div>
		</br>
		<div>
			<div style='width:70%;height:70%;border-radius:15px 50px;float:left;overflow:auto;'>
				<div style='background-color:#333;'>
					<h2 style='color:white;padding-left:1%;'>Jogo anterior da competição</h2>					
				</div>
				<div style='background-color: rgba(255,255,255,0.5)'>
					</br>
					<img src='http://images.terra.com/2015/05/21/flamengo.png' style='width:8%;height:8%;float:left;'/>
					<h2 style='float:left;'>Real Tijucaños 3 x 0 Marreirense FC</h2>
					<img src="http://vignette3.wikia.nocookie.net/logopedia/images/4/46/Real-Madrid-logo-30's.png/revision/latest?cb=20120211170721" style='width:8%;height:8%;'/>
					<br/><br/>		
				</div>
			</div>
			<div style='width:28%;height:100%;float:right;overflow:auto;paddin-left:2%;border-radius:15px 15px;'>
				<div style='background-color:#333;'>
					<h2 style='color:white;padding-left:1%;'>Tabela resumida</h2>					
				</div>
				<div style='background-color: rgba(255,255,255,0.5)'>
					<br/>
					<img src='http://images.terra.com/2015/05/21/flamengo.png' style='width:12%;height:4%;'/></br></br>
					<img src='http://images.terra.com/2015/05/21/flamengo.png' style='width:12%;height:4%;'/></br></br>
					<img src='http://images.terra.com/2015/05/21/flamengo.png' style='width:12%;height:4%;'/></br></br>
					<img src='http://images.terra.com/2015/05/21/flamengo.png' style='width:12%;height:4%;'/></br></br>
					<img src='http://images.terra.com/2015/05/21/flamengo.png' style='width:12%;height:4%;'/></br></br>
					<img src='http://images.terra.com/2015/05/21/flamengo.png' style='width:12%;height:4%;'/></br></br>
					<img src='http://images.terra.com/2015/05/21/flamengo.png' style='width:12%;height:4%;'/></br></br>
					<img src='http://images.terra.com/2015/05/21/flamengo.png' style='width:12%;height:4%;'/></br></br>
					<img src='http://images.terra.com/2015/05/21/flamengo.png' style='width:12%;height:4%;'/></br></br>
					</br>
					
				</div>
			</div>
			<div style='clear:both;'></div>
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