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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    </head>

    <body>
      <script type="text/javascript">
        function abrirPack(){
          redirect();
        }

        function redirect(){
          setTimeout("window.location='abrirpack.php'", 10);
        }
      </script>

      <?php
      	include("cabecalho.php");
      ?>

      <section class="present">
          <h1 class="present__title"></h1>
      </section>

      <section class="main-content">
        <h1>Bem-vindo à Master Liga!</h1><br/><br/>
        <center>
          <h3>Identificamos que você ainda não possui jogadores no seu clube. Clique no pack abaixo para garantir seus primeiros jogadores!<br/><br/>
          </h3>
        
          <a id='linkImg' onclick='abrirPack()' href='#'><img src='../static/img/pack1.png'/></a>
        </center>
      </section>

      <?php
      	include("footer.php");
      ?>
    </body>
</html>