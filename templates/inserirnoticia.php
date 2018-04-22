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
<html>
<head>
<title>Adicionando jogador</title>
  <link rel="stylesheet" type="text/css" href="../static/css/base.css">
  <link rel="stylesheet" href="../static/css/estilo2.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script type="text/javascript">

    function finaliza()
    {
      window.location.href = "admin.php";
    }

  </script>
</head>

<body>
  <?php
    include("conexao.php");

    $noticiaTitulo = $_POST["noticiaTitulo"];
    $noticiaTexto = $_POST["noticiaTexto"];
    $noticiaImagem = $_POST["noticiaImagem"];

    if($noticiaImagem == "")
    {
      $noticiaImagem = "http://www.freepngimg.com/thumb/newspaper/2-2-newspaper-transparent-thumb.png";
    }


	$sql = "INSERT INTO `noticia`(`Titulo`, `Texto`, `Imagem`) 
          VALUES ('$noticiaTitulo', '$noticiaTexto', '$noticiaImagem')";        

	$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);


    echo "<script>finaliza();</script>";
    mysqli_close($con);
    
  ?>
</body>
</html>
