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
        function goHome(){
          setTimeout("window.location='home.php'", 10);
        }
      </script>

      <?php
      	include("cabecalho.php");
      ?>

      <section class="present">
          <h1 class="present__title"></h1>
      </section>

      <section class="main-content">
        <?php
          $usuarioID = $_SESSION['session_usuario_id'];

          $sql = "SELECT `ID`, `Nome`, `PSN`, `Email`, `Senha`, `Orcamento`, `Ativo`, `Admin`, `PackDisponivel`, EquipeID
                  FROM usuario u 
                  JOIN equipe e
                    ON e.UsuarioID = u.ID
                 WHERE u.ID = $usuarioID";

          $sql = mysqli_query($con,$sql);
          $row = mysqli_fetch_array($sql, MYSQLI_ASSOC);
          $rowcount = mysqli_num_rows($sql);

          $equipeID = $row["EquipeID"];

          if($row["PackDisponivel"] == 0)
          {
            echo "<script>goHome();</script>";
          }
          else
          {
            $sql = "SELECT PackID 
                      FROM pack
                     WHERE Sorteado = 0
                     AND TipoPack = 'T'
                  ORDER BY RAND()
                     LIMIT 1";

            $sql = mysqli_query($con,$sql);
            $row = mysqli_fetch_array($sql, MYSQLI_ASSOC);
            $rowcount11 = mysqli_num_rows($sql);

            $pack11 = $row["PackID"];

            $sql = "SELECT PackID 
                      FROM pack
                     WHERE Sorteado = 0
                     AND TipoPack = 'R'
                  ORDER BY RAND()
                     LIMIT 1";

            $sql = mysqli_query($con,$sql);
            $row = mysqli_fetch_array($sql, MYSQLI_ASSOC);
            $rowcount7 = mysqli_num_rows($sql);

            $pack7 = $row["PackID"];

            if($rowcount11 > 0)
            {
              $sql = "UPDATE jogador j
                        JOIN jogadorpack jp 
                          ON j.JogadorID = jp.JogadorID
                         SET j.EquipeID = $equipeID
                       WHERE jp.PackID = $pack11";

              $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);

              $sql = "UPDATE pack
                         SET Sorteado = 1
                       WHERE PackID = $pack11";

              $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);

            }
            if($rowcount7 > 0)
            {
              $sql = "UPDATE jogador j
                        JOIN jogadorpack jp 
                          ON j.JogadorID = jp.JogadorID
                         SET j.EquipeID = $equipeID
                       WHERE jp.PackID = $pack7";

              $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);

              $sql = "UPDATE pack
                         SET Sorteado = 1
                       WHERE PackID = $pack7";

              $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
            }

            $sql = "UPDATE usuario
                         SET PackDisponivel = 0
                       WHERE ID = $usuarioID";

            $query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);

            echo "<script>goHome();</script>";
          }
        ?>

      </section>

      <?php
      	include("footer.php");
      ?>
    </body>
</html>