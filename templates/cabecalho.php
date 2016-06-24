<section class="menu">
    <img class="menu__logo" src="" />
    <ul class="menu__items">
		<li>
			<?php
				include("conexao.php");
				//Buscando o orçamento
				$sql = "SELECT Nome
					  FROM usuario 
					 WHERE psn = '$psn'";
							
				$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
				$row = mysqli_fetch_array($query, MYSQLI_ASSOC);
				$nomeUsuario = (string)$row["Nome"];
				echo 'Olá, ' . $nomeUsuario;

			?>
		</li>
		<li>Orçamento: 
			<?php
				include("conexao.php");
				//Buscando o orçamento
				$sql = "SELECT Orcamento
					  FROM usuario 
					 WHERE psn = '$psn'";
							
				$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
				$row = mysqli_fetch_array($query, MYSQLI_ASSOC);
				$orcamento = (string)$row["Orcamento"];
				//echo "G$" . str_replace('.', ',', $orcamento);
				echo "G$ " . number_format($orcamento,2,",",".");

			?>
        </li>
        <li>
			<?php
				include("conexao.php");
				//Buscando o orçamento
				$sql = "SELECT Admin
					  FROM usuario 
					 WHERE psn = '$psn'";
							
				$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
				$row = mysqli_fetch_array($query, MYSQLI_ASSOC);
				$admin = $row["Admin"];
				
				if($admin == 1)
				{
					echo "<a href='admin.php'>Área do Admnistrador</a>";
				}
			?>
		</li>
        <li><a href="home.php">Home</a></li>
		<li><a href="busca.php">Busca</a></li>
        <li>
        	<a href="transferencia.php">Transferências</a>
        	<?php
        		$psn = $_SESSION["psn"];

        		$sql = "SELECT *
		          FROM transferencia t
		          JOIN equipe e 
		            ON t.EquipeSaida = e.EquipeID
		          JOIN usuario u
		            ON e.UsuarioID = u.ID
				 WHERE u.psn = '$psn'
				   AND t.Status = 'Aguardando'";
				$sql = mysqli_query($con,$sql);
				$rowcount = mysqli_num_rows($sql);

	  			if($rowcount > 0)
	  			{
	  				echo "<img title='Você possui transferências pendentes de resposta' style='max-width:15px;' src='http://www.clker.com/cliparts/9/e/0/5/134980368932081390Exclamation%20Button.svg.hi.png'>";	
	  			}
        	?>
        </li>
        <li>
			<div class="dropdown">
				<a href="campeonato.php">Campeonato</a>
				<div class="dropdown-content">
					<!--<a href="sorteio.php">Sorteio</a>-->
					<a href="tabela.php">Tabela</a>
					<a href="proximosJogos.php">Próximos jogos</a>
					<a href="rodadas.php#">Rodadas</a>
					<a href="report.php">Reportar partida</a>
				</div>
			</div>
		</li>
        <li><a href="logout.php">Sair</a></li>
    </ul>
	
</section>