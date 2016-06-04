<section class="menu">
    <img class="menu__logo" src="" />
    <ul class="menu__items">
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
					//setlocale(LC_MONETARY,"en_US");
					//echo money_format("The price is %i", $orcamento);

				?>
        </li>
        <li><a href="home.php">Home</a></li>
        <li>Meu time</li>
		<li>Busca</li>
        <li>Transferências</li>
        <li><a href="campeonato.php">Campeonato</a></li>
		<li>Sala de troféus</li>
        <li><a href="logout.php">Sair</a></li>
    </ul>
</section>