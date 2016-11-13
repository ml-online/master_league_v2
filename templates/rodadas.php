<?php
	session_start("login_ml");
	include("conexao.php");
?>
<?php
  if(!isset($_SESSION["psn"]) || !isset($_SESSION["senha"]))
  {
    header("Location: login.php");
    exit; //encerra as funções da páginas
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
        
        <script src="auto-complete.js"></script>
		    <script type="text/javascript">
          function changeRodada()
          {
            var rodada = $("#selectRodada").val();
            window.location.href = "rodadas.php?rodada=" + rodada; 
          }

          function trocarEscolha(rodada)
          {
            var selectRodada = document.getElementById('selectRodada');
            var opcoes = selectRodada.options;
            for(var opt, j = 0; opt = opcoes[j]; j++) 
            {
              if(opt.value == rodada) 
              {
                selectRodada.selectedIndex = j;
                break;
              }
            }
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
  		  <center>
          <br/><div class='tituloPosicao'><center><h2>Próximas rodadas</h2></center></div><br/>
          <?php
            $equipeID = $_SESSION['session_equipe_id'];

            if(isset($_GET["rodada"]))
            {
              $rodada = $_GET["rodada"];
            }

            $sql = "SELECT distinct(p.Rodada)
                      FROM partida p
                     ORDER BY p.Rodada";
           
            $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
            $rowcount = mysqli_num_rows($query);

            echo "Rodada: <select id='selectRodada' onchange='changeRodada()'>";
            while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
            {
              echo "<option id='rodada_" . $row["Rodada"] . "' name='" . $row["Rodada"] . "'>" . $row["Rodada"] . "</option>";
            }
            echo "</select>";

            $sql = "SELECT p.PartidaID, p.CampeonatoID, p.Rodada, c.NomeCampeonato, p.EquipeCasa, p.GolsCasa, p.GolsFora, e.NomeEquipe as NomeEquipeCasa, 
                          p.EquipeFora, e2.NomeEquipe AS NomeEquipeFora, DATE_FORMAT(p.DataAbertura, '%d/%m/%Y') AS DataAbertura
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
                     WHERE ((u.Ativo = 1) AND (u2.Ativo = 1))";

            if(isset($_GET["rodada"]))
            {
              $rodada = $_GET["rodada"];
              $sql = $sql . " AND p.Rodada = $rodada";
            }
            else
            {
              $sql = $sql . " AND p.Rodada IN (SELECT max(Rodada) FROM partida where GolsCasa is not null)";
            }

            $sql = $sql . " ORDER BY p.Rodada";
           
             $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
             $rowcount = mysqli_num_rows($query);

             if($rowcount == 0)
             {
                echo "<center>";
                echo "Não há partidas futuras agendadas.";
                echo "</center>";
             }
             else
             {
                echo "<center>";

                echo "<br/><table>";
                echo "<thead>";
                echo "  <tr>";
                echo "    <th>Campeonato</th>";
                echo "    <th>Rodada</th>";
                echo "    <th>Partida</th>";
                echo "    <th>Data Abertura</th>";
                echo "  </tr>";
                echo "</thead>";

                while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
                {
                  echo "<tr>";
                  echo "<td>" . $row["NomeCampeonato"] . "</td>";
                  echo "<td>" . $row["Rodada"] . "</td>";
                  echo "<td>" . $row["NomeEquipeCasa"] . " " . $row["GolsCasa"] . " x " . $row["GolsFora"] . " " . $row["NomeEquipeFora"] . "</td>";
                  echo "<td style='text-align:right;'>" . $row["DataAbertura"] . "</td>";
                  echo "</tr>";
                }

                echo "</table>";
                echo "</center>";
                if(isset($_GET["rodada"]))
                {
                  echo "<script>trocarEscolha(" . $rodada . ");</script>";
                }
             }
          ?>
        </center>
      </section>
      <?php
        include("footer.php");
      ?>
	</body>
</html>
