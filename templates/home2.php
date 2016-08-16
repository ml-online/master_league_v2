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
        <link rel="shortcut icon" href="../static/img/icon.jpg" >
        <link rel="stylesheet" type="text/css" href="../static/css/base.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    </head>

    <body>
      <?php
      	include("cabecalho.php");
      ?>
      <section class="main-content">
        <center>
          <div style="padding-top: 10%;width:75%;height:55%;background-image: url('../static/img/back3.png');-webkit-background-size: cover; -moz-background-size: cover;-o-background-size: cover;background-size: cover;">
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


          <!--<img src="../static/img/back3.png" style="width:80%; height:80%"/>-->
          <div style="margin-left:6%">
            <div class="widgetMenu">
              <center><div class="widgetTitle"><p><a style="color:white;" href="tabela.php">Tabela</a></p></div>
                <div class="widgetContent">
                  <p style="margin-top:10%;color:white">Colocação:</p>
                  <h1 style="font-size:80px;color:white">2º</h1>
                  <p style="color:white">Lugar</p>
                </div>
                <table class="widgetContent" style="width:90%;margin-top:10%;">
                </table>
              </center>
            </div>
            <div class="widgetMenu">
              <center><div class="widgetTitle"><p>Próximo Jogo</p></div>
                <div class="widgetContent">
                  <img src="https://upload.wikimedia.org/wikipedia/commons/d/d6/Escudo_real_madrid_1908.png" style="width:50%;height:50%;margin-top:5%"/>
                  <br/><p>2º Marreirense FC</p><br/>
                  <p>05/08/2016</p>
                </div>
              </center>
            </div>
            <div class="widgetMenu">
              <center><div class="widgetTitle"><p>Último jogo</p></div>
                <div class="widgetContent">
                  <img src="http://vignette2.wikia.nocookie.net/fifa/images/2/26/Manchester_United_logo.png" style="width:50%;height:50%;margin-top:5%"/>
                  <br/><p>Alo FC</p><br/>
                  <p>2x0</p>
                </div>
              </center>
            </div>
            <div class="widgetMenu">
              <center><div class="widgetTitle"><p>Mercado</p></div>
                <table class="widgetContent" style="width:90%;color:white;margin-top:1%;">
                  <tr>
                    <td>Cristiano Ronaldo</td>
                    <td><img src="../static/img/RightArrow.png" style="width:80%;height:30px"/></td>
                    <td><img src="https://upload.wikimedia.org/wikipedia/pt/8/8f/Real_Noroeste_Capixaba_FC.png" style="width:100%;height:20%;float:left;"/></td>
                  </tr>
                  <tr>
                    <td>Messi</td>
                    <td><img src="../static/img/RightArrow.png" style="width:80%;height:30px"/></td>
                    <td><img src="https://upload.wikimedia.org/wikipedia/pt/8/8f/Real_Noroeste_Capixaba_FC.png" style="width:100%;height:20%;float:left;"/></td>
                  </tr>
                  <tr>
                    <td>Lewandowski</td>
                    <td><img src="../static/img/RightArrow.png" style="width:80%;height:30px"/></td>
                    <td><img src="https://upload.wikimedia.org/wikipedia/pt/8/8f/Real_Noroeste_Capixaba_FC.png" style="width:100%;height:20%;float:left;"/></td>
                  </tr>
                </table>
              </center>
            </div>
            <div class="widgetMenu">
              <center><div class="widgetTitle"><p>Últimos resultados</p></div></center>
              <div class="widgetContent">
                <table class="widgetContent" style="margin-top:10%">
                  <tr style="width:90%">
                    <td style="width:38%">Tijucanos</td><td>2 x 0</td><td>Alo FC</td>
                  </tr>
                  <tr style="width:90%">
                    <td>Tijucanos</td><td>3 x 1</td><td>Nandu FC</td>
                  </tr>
                  <tr style="width:90%">
                    <td>Campo Grandense FC</td><td>0 x 5</td><td>Tijucanos</td>
                  </tr>
                </table>
              </div>
            </div>
            <div class="widgetMenu">
              <center>
                <div class="widgetTitle"><p>Artilheiro</p></div>
                <div class="widgetContent">
                  <img class='insideWidget' src='http://gmbox.ru/files/images/307/fut-top-10-robben.png' style="margin-top:5%;width:45%;height:60%"/>
                  <p style="margin-top:5%">7 Gols</p>
                </div>
              </center>
            </div>
            <div class="widgetMenu">
              <center><div class="widgetTitle"><p>Líder em assistências</p></div></center>
              <div class="widgetContent">
                <img class='insideWidget' src='http://gmbox.ru/files/images/307/fut-top-10-robben.png' style="margin-top:5%;width:45%;height:60%"/>
                <p style="margin-top:5%">4 Assistências</p>
              </div>
            </div>
            <div class="widgetMenu">
              <center><div class="widgetTitle"><p>Últimas Notícias</p></div></center>
              <div class="widgetContent">
                <a href="#"><p style="margin-top:5%">Rumo ao G4!</p></a><br/>
                <a href="#"><p style="margin-top:5%">Vitória fácil</p></a><br/>
                <a href="#"><p style="margin-top:5%">Freguês!</p></a><br/>
              </div>
            </div>
            <div style="clear:both;"></div>
          </div>
        </center>
      </section>

      <?php
      	include("footer.php");
      ?>
    </body>
</html>
