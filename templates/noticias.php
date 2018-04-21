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
      <?php
      	include("cabecalho.php");
      ?>

      <section class="present">
          <h1 class="present__title"></h1>
      </section>

      <section class="main-content">
        <br/>
        <div class='tituloPosicao'><center><h2>Notícias</h2></center></div><br/>
        <?php

          $sql = "SELECT NoticiaID, Titulo, CONCAT(SUBSTRING(Texto, 1, 200), '...') AS Texto, Imagem 
                FROM noticia 
                ORDER BY NoticiaID DESC
                 LIMIT 15";
                  
          $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);

          while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
          {
            echo "<div class='noticia'>
                    <img src='" . $row["Imagem"] . "' style='width:20%;height:80%;float:left;'/>
                    <div style='padding-left: 22%;'>
                      <h2><a href='vernoticia.php?id=" . $row["NoticiaID"] . "'>"  . $row["Titulo"] . "</h2></a>
                      <p>" . $row["Texto"] . "</p>
                      <a href='vernoticia.php?id=" . $row["NoticiaID"] . "'>Leia mais...</a>
                    </div>
                  </div>";
            echo "<br/>";
          }
        ?>
      </section>

      <?php
      	include("footer.php");
      ?>
    </body>
</html>