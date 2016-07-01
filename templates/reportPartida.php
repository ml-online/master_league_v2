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
<title>Reportando partida</title>
  <link rel="stylesheet" type="text/css" href="../static/css/base.css">
  <link rel="stylesheet" href="../static/css/estilo2.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script type="text/javascript">
    function confirmarCadastro(){
      alert("Usuário cadastrado com sucesso!");
    }
  </script>
</head>

<body>
  <?php
    include("conexao.php");

    $golsCasaInput = $_POST["golsCasa"];
    $golsForaInput = $_POST["golsFora"];
    $partidaID = $_POST["partidaID"];
    $equipeReport = $_POST["equipeReportID"];

    //eu nao me orgulho desta porra
    $report = array(
      1 => $_POST["report1"],
      2 => $_POST["report2"],
      3 => $_POST["report3"],
      4 => $_POST["report4"],
      5 => $_POST["report5"],
      6 => $_POST["report6"],
      7 => $_POST["report7"],
      8 => $_POST["report8"],
      9 => $_POST["report9"],
      10 => $_POST["report10"],
      11 => $_POST["report11"],
      12 => $_POST["report12"],
      13 => $_POST["report13"],
      14 => $_POST["report14"],
      15 => $_POST["report15"],
      16 => $_POST["report16"],
      17 => $_POST["report17"],
      18 => $_POST["report18"],
      19 => $_POST["report19"],
      20 => $_POST["report20"]
    )

    $sql = "INSERT INTO report (PartidaID, EquipeReportID, GolsCasa, GolsFora, DataReport)
                   VALUES (partidaID, $equipeReport, $golsCasaInput, $golsForaInput, now());";

    $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);

    $i = 1;
    while($report[i] != "")
    {
      if (strpos($report[i], 'Gol') !== false) 
      {
        $report[i] = str_replace(",Gol","",$report[i]);
        $sql = "INSERT INTO gol ()
                 VALUES ();";
      }
      else if(strpos($report[i], 'Assistencia') !== false)
      {
        $report[i] = str_replace(",Assistencia","",$report[i]);
        $sql = "INSERT INTO assistencia ()
                 VALUES ();";
      }
      
      i++;
    }
    
    
    mysqli_close($con);
    
  ?>
</body>
</html>
