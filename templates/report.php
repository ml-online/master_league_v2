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
        <link rel="stylesheet" href="../static/css/estilo2.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script type="text/javascript">
          var estatistica = [];

          function inserirEstatistica()
          {
            var nomeJogadorAdd = $("#jogadorReport").val();
            var idJogadorAdd = $("#jogadorReport").find('option:selected').attr("name");
            var quantidadeAdd = $("#iptQtd").val();
            var tipoAdd = $("#tipoEstatistica").val();
            var tipoAddID = tipoAdd;
            var data;

            if(quantidadeAdd != "" && quantidadeAdd != undefined)
            {
              if(tipoAddID == "Cartão Vermelho")
              {
                tipoAddID = 0;
              }
              else if(tipoAddID == "Gol")
              {
                tipoAddID = 1;
              }
              else{
                tipoAddID = 2;
              }
              //$("#divReport").append("<tr><td>" + nomeJogadorAdd + "</td><td>" + tipoAdd + "</td><td>" + quantidadeAdd + "x</td><tr>");
              $('#tableEstatisticas tr:last').after("<tr id='estatistica_" + tipoAddID + "_" + idJogadorAdd + "'><td>" + nomeJogadorAdd + "</td><td>" + tipoAdd + "</td><td style='width:30px;'>" + quantidadeAdd + "x <button style='margin-left:90px;' class='botaoRecusar' onclick='removerEstats(" + tipoAddID + "," + idJogadorAdd + ")' >Remover</button></td><tr>");

              data = {JogadorID : idJogadorAdd, Tipo : tipoAdd, Quantidade : quantidadeAdd};
              estatistica.push(data);
            }
            else
            {
              alert("Favor preencher corretamente: Jogador, Estatística e Quantidade");
            }

          }

          function removerEstats(tipoEstatistica, idJogador)
          {
            var str = "#estatistica_" + tipoEstatistica + "_" + idJogador;
            //alert(str);
            $.grep(estatistica, function(n, i){
              return (n.JogadorID != idJogador && n.Tipo != tipoEstatistica);
            });
            $(str).remove();
          }

          function finalizarReport()
          {
            if(validaPreenchimento())
            {
              var partidaID = $("#partidaID").val();
              var equipeUsuarioLogado = $("#equipeReportID").val();

              if(confirm("Gostaria de finalizar o report?"))
              {
                $("#golsCasa").val($("#iptGolCasa").val());
                $("#golsFora").val($("#iptGolFora").val());

                for(var i = 1; i <= estatistica.length ; i++)
                {
                  if(i <= 20)
                  {
                    $("#report" + i).val(estatistica[i-1].JogadorID.toString() + "," + estatistica[i-1].Tipo.toString() + "," + estatistica[i-1].Quantidade.toString());
                  }
                } 
                alert($("#report1").val());
              }
            }
          }

          function validaPreenchimento()
          {
            if($("#iptGolCasa").val() != "" && $("#iptGolFora").val() != "")
            {
              return true;  
            }
            else
            {
              return false;
            }
          }
        </script>
    </head>

    <body>
      <?php
      	include("cabecalho.php");
      ?>

      <section class="present">
          <h1 class="present__title">CR Galaticos - Master League</h1>
      </section>

      <section class="main-content">
        <br/><div class='tituloPosicao'><center><h2>Reportar Partida</h2></center></div><br/>

        <?php
          $equipeUsuarioLogado = $_SESSION['session_equipe_id'];
          $partidaID = $_POST['partidaID'];

          $sql = "SELECT p.PartidaID, p.CampeonatoID, c.NomeCampeonato, p.EquipeCasa, e.NomeEquipe as NomeEquipeCasa, e.Escudo AS EscudoEquipeCasa, e2.Escudo AS EscudoEquipeFora,
                        p.EquipeFora, e2.NomeEquipe AS NomeEquipeFora, DATE_FORMAT(p.DataAbertura, '%d/%m/%Y') AS DataAbertura, p.Rodada
                    FROM partida p
                    JOIN equipe e 
                      ON e.EquipeID = p.EquipeCasa
                    JOIN equipe e2 
                      ON e2.EquipeID = p.EquipeFora
                    JOIN campeonato c
                      ON c.CampeonatoID = p.CampeonatoID
                   WHERE ((p.EquipeCasa = '$equipeUsuarioLogado') OR (p.EquipeFora = '$equipeUsuarioLogado'))
                     AND p.PartidaID = $partidaID";
         
          $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
          echo "<center>";

          while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
          {
            echo "<h3>" . $row["NomeCampeonato"] . " - " . $row["Rodada"] . "ª Rodada</h3>";
            echo $row["NomeEquipeCasa"] . " <input id='iptGolCasa' type='text' style='width:27px;text-align:center;' />" . " x " . " <input id='iptGolFora' type='text' style='width:27px;text-align:center;' /> " . $row["NomeEquipeFora"];
            echo "<br/><br/><h3>Estatísticas</h3><br/>
                  <table id='tableEstatisticas'>
                  <tbody>
                  <tr>
                    <td>Jogador</td>
                    <td>Estatística</td>
                    <td>Quantidade</td>
                  </tr>
                  <tr>
                  <td>
                  <select id='jogadorReport'>";
            
            $sql = "SELECT `JogadorID`, `NomeJogador`, `Overall`, `EquipeOriginal`, `EquipeID`, `Posicao`
                  FROM `jogador` 
                 WHERE EquipeID = '$equipeUsuarioLogado'";
               
            $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
            
            // Listando os jogadores buscados da tabela 
            while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
            {
              echo "<option id='jogador_" . $row["JogadorID"] . "' name='" . $row["JogadorID"] . "'>" . $row["NomeJogador"] . "</option>";
            }
            
            echo "</select></td>";
            echo "<td><select id='tipoEstatistica'>
                    <option id='opGol'>Gol</option>
                    <option id='opAssist'>Assistência</option>
                  </select></td>";
            echo "<td><input id='iptQtd' type='text' style='width:50%;' /><button class='botaoReport' style='width:30%;' onclick='inserirEstatistica()'>Enviar</button></td>";
          }
          echo "</tr>";
          echo "</tbody>";
          echo "</table>";
          echo "</br><button onclick='finalizarReport()' class='botaoAceitar'>Finalizar</button>";
          echo "</center>";
        ?>
      </section>

      <?php
      	include("footer.php");
      ?>

      <form id="formID" name="signup" method="post" action="reportPartida.php" style="display: none;">
        <input id="golsCasa" name="golsCasa" type="hidden"></input>
        <input id="golsFora" name="golsFora" type="hidden"></input>
        <input id="report1" name="report1" type="hidden"></input>
        <input id="report2" name="report2" type="hidden"></input>
        <input id="report3" name="report3" type="hidden"></input>
        <input id="report4" name="report4" type="hidden"></input>
        <input id="report5" name="report5" type="hidden"></input>
        <input id="report6" name="report6" type="hidden"></input>
        <input id="report7" name="report7" type="hidden"></input>
        <input id="report8" name="report8" type="hidden"></input>
        <input id="report9" name="report9" type="hidden"></input>
        <input id="report10" name="report10" type="hidden"></input>
        <input id="report11" name="report11" type="hidden"></input>
        <input id="report12" name="report12" type="hidden"></input>
        <input id="report13" name="report13" type="hidden"></input>
        <input id="report14" name="report14" type="hidden"></input>
        <input id="report15" name="report15" type="hidden"></input>
        <input id="report16" name="report16" type="hidden"></input>
        <input id="report17" name="report17" type="hidden"></input>
        <input id="report18" name="report18" type="hidden"></input>
        <input id="report19" name="report19" type="hidden"></input>
        <input id="report20" name="report20" type="hidden"></input>
        <?php
          echo "<input id='partidaID' name='partidaID' type='hidden' value='$partidaID'></input>";
          echo "<input id='equipeReportID' name='equipeReportID' type='hidden' value='$equipeUsuarioLogado'></input>";
        ?>
      </form>

    </body>
</html>
