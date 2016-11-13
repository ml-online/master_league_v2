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
        <link rel="stylesheet" type="text/css" href="../static/css/Teste_tabela_css.css">
        <link rel="stylesheet" href="../static/css/estilo2.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script>
          function reportar(partidaID, equipeReport1)
          {
            var form = document.getElementById("formID");
            $("#partidaReport").val(partidaID);
            $("#equipeReport1").val(equipeReport1);
            form.submit();
          }
        </script>
    </head>

    <body>
      <?php
      	include("cabecalho.php");
      ?>

      <section class="present">
          <h1 class="present__title"></h1>
      </section>

      <section class="main-content">
          <br/><div class='tituloPosicao'><center><h2>Próximos jogos</h2></center></div><br/>
          <?php
            $equipeID = $_SESSION['session_equipe_id'];

            $sql = "SELECT p.PartidaID, p.CampeonatoID, c.NomeCampeonato, p.EquipeCasa, e.NomeEquipe as NomeEquipeCasa, 
                          p.EquipeFora, e2.NomeEquipe AS NomeEquipeFora, DATE_FORMAT(p.DataAbertura, '%d/%m/%Y') AS DataAbertura, r.EquipeReportID
                      FROM partida p
                      JOIN equipe e 
                        ON e.EquipeID = p.EquipeCasa
                      JOIN equipe e2 
                        ON e2.EquipeID = p.EquipeFora
                      JOIN campeonato c
                        ON c.CampeonatoID = p.CampeonatoID
                      JOIN usuario u 
                        ON u.ID = e.UsuarioID
                      JOIN usuario u2
                        ON u2.ID = e2.UsuarioID
                 LEFT JOIN report r
                        ON r.PartidaID = p.PartidaID
                     WHERE ((p.EquipeCasa = '$equipeID') OR (p.EquipeFora = '$equipeID'))
                       AND ((u.Ativo = 1) AND (u2.Ativo = 1))
                       AND ((r.EquipeReportID <> $equipeID) OR (r.EquipeReportID IS NULL))
                       AND ((r.EquipeReportID IS NULL) 
                            OR
                            (NOT EXISTS (SELECT count(r2.EquipeReportID)
                                          FROM report r2
                                         WHERE r2.PartidaID = p.PartidaID
                                         GROUP BY r2.PartidaID
                                        HAVING count(*) > 1))) ";
           
             $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
             $rowcount = mysqli_num_rows($query);

             if($rowcount == 0)
             {
                echo "<center>";
                echo "Não há partidas a serem reportadas.";
                echo "</center>";
             }
             else
             {
                echo "<center>";

                echo "<table>";
                echo "<thead>";
                echo "  <tr>";
                echo "    <th>Campeonato</th>";
                echo "    <th>Partida</th>";
                echo "    <th>Data Abertura</th>";
                echo "    <th>Reportar</th>";
                echo "  </tr>";
                echo "</thead>";

                while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
                {
                  echo "<tr>";
                  echo "<td>" . $row["NomeCampeonato"] . "</td>";
                  echo "<td>" . $row["NomeEquipeCasa"] . " x " . $row["NomeEquipeFora"] . "</td>";
                  echo "<td style='text-align:right;'>" . $row["DataAbertura"] . "</td>";
                  echo "<td style='text-align:center;'><button id='btnReport_" . $row["PartidaID"] . "' onclick='reportar(" . $row["PartidaID"] . ")' class='botaoReport'>Reportar</button></td>";
                  echo "</tr>";
                }

                echo "</table>";
                echo "</center>";
             }
          ?>
      </section>
      <form id="formID" name="signup" method="post" action="report.php" style="display: none;">
        <input id="partidaReport" name="partidaID" type="hidden"></input>
      </form>
      <?php
      	include("footer.php");
      ?>
    </body>
</html>
