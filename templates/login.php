<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8"/>
  <link rel="stylesheet" href="../static/css/estilo.css"/>
  <title>Login Master League</title>
</head>
<body>
<div>
  <form name="loginForm" method="post" action="autenticacao.php">
    <table>
      <tr>
        <td class="campoCadastro">PSN: </td><td><input type="text" name="psn" id="psnID" class="campoTexto"/></td>
      </tr>
      <tr>
        <td class="campoCadastro">Senha:</td> <td><input type="password" name="senha" id="senhaID" class="campoTexto"/></td>
      </tr>
      <tr>
        <td><input type="submit" value="Login" class="botao" class="campoTexto"></td>
      </tr>
    </table>
  </form>

  <br/><br/>
  <center><a href="telacadastro.php">Não tem login? Cadastre-se</a></center>
</div>
</body>
</html>