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
				echo "G$" . str_replace('.', ',', $orcamento);

			?>
        </li>
        <li><a href="home.php">Home</a></li>
		<li>Busca</li>
        <li><a href="transferencia.php">Transferências</a></li>
        <li>
			<div class="dropdown">
				<a href="campeonato.php">Campeonato</a>
				<div class="dropdown-content">
					<a href="#">Tabela</a>
					<a href="#">Próximos jogos</a>
					<a href="#">Rodadas</a>
					<a href="#">Reportar partida</a>
				</div>
			</div>
		</li>
		<li>Sala de troféus</li>
        <li><a href="logout.php">Sair</a></li>
    </ul>
	
</section>