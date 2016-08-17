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

      <section class="present">
          <h1 class="present__title"></h1>
      </section>

      <section class="main-content">
        <br/>
        <div class='tituloPosicao'><center><h2>Notícia</h2></center></div><br/>
        <?php
          $noticiaCarregar = $_GET["id"];

          $sql = "SELECT NoticiaID, Titulo, Texto, Imagem 
                    FROM noticia
                   WHERE NoticiaID = $noticiaCarregar";

          $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);

          while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
          {
            echo "<img src='" . $row["Imagem"] . "' style='float:left;height:40%;width:40%;'/>
                  <div style='padding-left:42%;'>
                    <h2>" . $row["Titulo"] . "</h2>
                    <p>" . $row["Texto"] . "</p>
                  </div>";
          }                   
          echo "<br/><br/>";
        ?>
      </section>

      <?php
      	include("footer.php");
      ?>
    </body>
</html>