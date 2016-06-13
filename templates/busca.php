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
        <link rel="stylesheet" type="text/css" href="../static/css/teste_tabela_css.css">
		<link rel="stylesheet" href="../static/css/estilo2.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		
		<script src="auto-complete.js"></script>
		<script>
			var demo1 = new autoComplete(
			{
				selector: '#iptBusca',
				minChars: 1,
				source: function(term, suggest){
					term = term.toLowerCase();
					var choices = [
					<?php
						//Buscando os jogadores da equipe
						$sql = "SELECT `JogadorID`, `NomeJogador`, `Overall`, `EquipeOriginal`, `EquipeID`, `Posicao`
								  FROM `jogador`";
								 
						$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
						
						// Listando os jogadores buscados da tabela
						while($row=mysqli_fetch_array($query,MYSQLI_ASSOC))
						{
							echo "'" . $row["NomeJogador"] . "',";
						}
						
						echo "'Teste'";
					?>
					];
					var suggestions = [];
					for (i=0;i<choices.length;i++)
						if (~choices[i].toLowerCase().indexOf(term)) suggestions.push(choices[i]);
					suggest(suggestions);
				}
			});

			if (~window.location.href.indexOf('http')) 
			{
				(function() {var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;po.src = 'https://apis.google.com/js/plusone.js';var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);})();
				(function(d, s, id) {var js, fjs = d.getElementsByTagName(s)[0];if (d.getElementById(id)) return;js = d.createElement(s); js.id = id;js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.4&appId=114593902037957";fjs.parentNode.insertBefore(js, fjs);}(document, 'script', 'facebook-jssdk'));
				!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');
				document.getElementById('github_social').innerHTML = '\
					<iframe style="float:left;margin-right:15px" src="//ghbtns.com/github-btn.html?user=Pixabay&repo=JavaScript-autoComplete&type=watch&count=true" allowtransparency="true" frameborder="0" scrolling="0" width="110" height="20"></iframe>\
					<iframe style="float:left;margin-right:15px" src="//ghbtns.com/github-btn.html?user=Pixabay&repo=JavaScript-autoComplete&type=fork&count=true" allowtransparency="true" frameborder="0" scrolling="0" width="110" height="20"></iframe>\
				';
			}
		</script>
		<script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js" async defer></script>
    </head>
	
	<body>
		<?php
        	include("cabecalho.php");
        ?>
		<section class="present">
            <h1 class="present__title">CR Galaticos - Master League</h1>
        </section>
		<section class="main-content">
			Busca: <input id="iptBusca" autofocus type="text" name="q" placeholder="Buscar conteúdo..." style="width:100%;max-width:600px;outline:0">
			<p style="height:100px;"></p>
		</section>
	</body>
</html>