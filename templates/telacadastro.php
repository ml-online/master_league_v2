<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8"/>
  <link rel="stylesheet" href="_css/estilo.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <title>Cadastro Master League</title>
</head>
<body>
  <script>

  function submitForm(){
    if(validaForm())
    {
      var form = document.getElementById("formID");
      form.submit();
    }
  }

  function validaForm() {
    //pegando os campos do form
    
    var nome = document.getElementById("nomeID");
    var psn = document.getElementById("psnID");
    var email = document.getElementById("emailID");
    var nomeTime = document.getElementById("timeID");
    var senha = document.getElementById("senhaID");
    var confSenha = document.getElementById("confirmsenhaID");

    //não pode estar vazio
    if(nome.value == "" || psn.value == "" || email.value == "" || nomeTime.value == "" || senha.value == "" || confSenha.value == "")
    {
      alert("Todos os campos devem estar preenchidos.");
      return false;
    }

    if(senha.value != confSenha.value)
    {
      alert("Favor confirmar a senha corretamente.");
      return false;
    }
    else if(senha.value.length < 5)
    {
      alert("Senha deve ter pelo menos 5 caracteres.");
      document.getElementById("senhaID").value = "";
      document.getElementById("confirmsenhaID").value = "";
      return false;
    }

    return true;
  }
  </script>
  <div>
    <form id="formID" name="signup" method="post" action="efetuarcadastro.php" style="padding-left: 16%;">
      <table>
        <tr>
          <td class="campoCadastro">Nome*: </td><td><input type="text" name="nome" id="nomeID" class="campoTexto"/> </td>
        </tr>
        <tr>
          <td class="campoCadastro">PSN*: </td><td><input type="text" name="psn" id="psnID" class="campoTexto"/></td>
        </tr>
        <tr>
          <td class="campoCadastro">E-mail*: </td><td><input type="text" name="email" id="emailID" class="campoTexto"/></td>
        </tr>
        <tr>
          <td class="campoCadastro">Nome do time*: </td><td><input type="text" name="time" id="timeID" class="campoTexto"/> </td>
        </tr>
        <tr>
          <td class="campoCadastro">Senha*: </td><td><input type="password" name="senha" id="senhaID" class="campoTexto"/></td>
        </tr>
        <tr>
          <td class="campoCadastro">Confirme sua senha*: </td><td><input type="password" name="confirmsenha" id="confirmsenhaID" class="campoTexto"/>
        </tr>
        <tr>
          <td></td><td style="padding-top:5%;"><input type="button" value="Cadastrar" onclick="submitForm()" class="botao"></></td>
        </tr>
      </table>
    </form>
	
	<center><a href='login.php'>Ir para a tela de Login</a></center>
  </div>
</body>
</html>