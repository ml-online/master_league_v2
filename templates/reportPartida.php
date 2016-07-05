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

    function debug(i)
    {
      alert("Passou pelo ponto: " + i);
    }

    function cancelReport()
    {
      alert("Você já reportou esta partida. Não é possível reportar novamente.");
      window.location.href = "proximosJogos.php";
    }

    function successReport()
    {
      alert("Report realizado com sucesso.");
      window.location.href = "proximosJogos.php";
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

    //Verificando se esta partida já foi reportada por este usuário
    $sql = "SELECT 1 FROM report where EquipeReportID = $equipeReport AND PartidaID = $partidaID";
    $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
    $rowcount = mysqli_num_rows($query);

    if($rowcount <= 0)
    {
      //eu nao me orgulho desta porra

      $report[1] = $_POST["report1"];
      $report[2] = $_POST["report2"];
      $report[3] = $_POST["report3"];
      $report[4] = $_POST["report4"];
      $report[5] = $_POST["report5"];
      $report[6] = $_POST["report6"];
      $report[7] = $_POST["report7"];
      $report[8] = $_POST["report8"];
      $report[9] = $_POST["report9"];
      $report[10] = $_POST["report10"];
      $report[11] = $_POST["report11"];
      $report[12] = $_POST["report12"];
      $report[13] = $_POST["report13"];
      $report[14] = $_POST["report14"];
      $report[15] = $_POST["report15"];
      $report[16] = $_POST["report16"];
      $report[17] = $_POST["report17"];
      $report[18] = $_POST["report18"];
      $report[19] = $_POST["report19"];
      $report[20] = $_POST["report20"];

      $sql = "INSERT INTO report (PartidaID, EquipeReportID, GolsCasa, GolsFora, DataReport)
                     VALUES ($partidaID, $equipeReport, $golsCasaInput, $golsForaInput, now());";

      $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);

      $sql = "SELECT max(reportID) as ReportID from report";

      $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);

      while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
      {
        $reportID = $row["ReportID"];
      }

      $i = 1;
      while($report[$i] != "")
      {
        if (strpos($report[$i], 'Gol') !== false) 
        {
          $report[$i] = str_replace(",Gol","",$report[$i]);
          $sql = "INSERT INTO gol (JogadorID, Qtd, PartidaID, reportID)
                   VALUES ($report[$i], $partidaID, $reportID);";

          $sql = str_replace("$report[$i]",$report[$i],$sql);   
          $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
        }
        else if(strpos($report[$i], 'Assistência') !== false)
        {
          $report[$i] = str_replace(",Assistência","",$report[$i]);
          $sql = "INSERT INTO assistencia (JogadorID, Qtd, PartidaID, reportID)
                   VALUES ($report[$i], $partidaID, $reportID);";

          $sql = str_replace("$report[$i]",$report[$i],$sql);      
          $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);           
        }
        
        $i++;
      }

      //atualizando o resultado oficial da partida se nao houver sido reportada ainda
      $sql = "SELECT * FROM report WHERE PartidaID = $partidaID";
      $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);  
      $rowcount = mysqli_num_rows($query);
      if($rowcount == 1)
      { 
        $sql = "UPDATE partida SET GolsCasa = $golsCasaInput, GolsFora = $golsForaInput, DataReport = now() WHERE PartidaID = $partidaID";
        $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);   

        if($golsCasaInput > $golsForaInput)
        {
          //VITÓRIA DA EQUIPE DA CASA
          $sql = "UPDATE classificacao 
                     SET PontosGanhos = (PontosGanhos + 3), 
                         Jogos = Jogos + 1,
                         Vitorias = Vitorias + 1,
                         GolsMarcados = GolsMarcados + $golsCasaInput,
                         GolsSofridos = GolsSofridos + $golsForaInput,
                         SaldoGols = SaldoGols + ($golsCasaInput - $golsForaInput)
                     WHERE EquipeID IN (SELECT EquipeCasa FROM partida WHERE PartidaID = $partidaID)";
          $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);

          $sql = "UPDATE classificacao 
                     SET Jogos = Jogos + 1,
                         Derrotas = Derrotas + 1,
                         GolsMarcados = GolsMarcados + $golsForaInput,
                         GolsSofridos = GolsSofridos + $golsCasaInput,
                         SaldoGols = SaldoGols + ($golsForaInput - $golsCasaInput)
                     WHERE EquipeID IN (SELECT EquipeFora FROM partida WHERE PartidaID = $partidaID)";
          $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
        }
        else if($golsCasaInput < $golsForaInput)
        {
          //VITÓRIA DA EQUIPE VISITANTE
          $sql = "UPDATE classificacao 
                     SET PontosGanhos = (PontosGanhos + 3), 
                         Jogos = Jogos + 1,
                         Vitorias = Vitorias + 1,
                         GolsMarcados = GolsMarcados + $golsForaInput,
                         GolsSofridos = GolsSofridos + $golsCasaInput,
                         SaldoGols = SaldoGols + ($golsForaInput - $golsCasaInput)
                     WHERE EquipeID IN (SELECT EquipeFora FROM partida WHERE PartidaID = $partidaID)";
          $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);

          $sql = "UPDATE classificacao 
                     SET Jogos = Jogos + 1,
                         Derrotas = Derrotas + 1,
                         GolsMarcados = GolsMarcados + $golsCasaInput,
                         GolsSofridos = GolsSofridos + $golsForaInput,
                         SaldoGols = SaldoGols + ($golsCasaInput - $golsForaInput)
                     WHERE EquipeID IN (SELECT EquipeCasa FROM partida WHERE PartidaID = $partidaID)";
          $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
        }
        else
        {
          //EMPATE
          $sql = "UPDATE classificacao 
                     SET PontosGanhos = (PontosGanhos + 1), 
                         Jogos = Jogos + 1,
                         Vitorias = Vitorias + 1,
                         GolsMarcados = GolsMarcados + $golsCasaInput,
                         GolsSofridos = GolsSofridos + $golsForaInput
                     WHERE EquipeID IN (SELECT EquipeCasa FROM partida WHERE PartidaID = $partidaID)";
          $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);

          $sql = "UPDATE classificacao 
                     SET PontosGanhos = (PontosGanhos + 1),
                         Jogos = Jogos + 1,
                         Empates = Empates + 1,
                         GolsMarcados = GolsMarcados + $golsForaInput,
                         GolsSofridos = GolsSofridos + $golsCasaInput
                     WHERE EquipeID IN (SELECT EquipeFora FROM partida WHERE PartidaID = $partidaID)";
          $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
        }

      }
    }
    else
    {
      echo "<script>cancelReport();</script>";
    }


    echo "<script>successReport();</script>";
    mysqli_close($con);
    
  ?>
</body>
</html>
