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
<title>Gerenciando usuario</title>
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

    $usuarioID = $_POST["UsuarioID"];
    $tipoOperacao = $_POST["TipoOperacao"];

    if($tipoOperacao == "Aceitar")
    {
      $sql = "UPDATE usuario
                 SET Ativo = 1, PackDisponivel = 1
               WHERE ID = $usuarioID";

      $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
    }
    else if($tipoOperacao == "Rejeitar")
    {
      $sql = "DELETE FROM equipe 
                    WHERE UsuarioID = $usuarioID;";

      $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);

      $sql = "DELETE FROM usuario 
                    WHERE ID = $usuarioID;";

      $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
    }

    echo "<script>finaliza();</script>";
    mysqli_close($con);
    
  ?>
</body>
</html>
