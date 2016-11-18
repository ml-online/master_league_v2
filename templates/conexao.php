<?php
	//$host = "mysql.hostinger.com.br";
	//$user = "u998726246_thiag";
	//$pass = "vmpyetcc";
	//$banco = "u998726246_crg";
	//$conexao = mysql_connect($host, $user, $pass) or die (mysql_error());
	$host = "localhost";
	$user = "root";
	$pass = "";
	$banco = "bd_masterleague";

	$con = mysqli_connect($host,$user,$pass,$banco);

	// Check connection
	if (mysqli_connect_errno())
	{
	  echo "Failed to connect to MySQL: " . mysqli_connect_error();
	}
	
	//mysql_select_db($banco) or die (mysql_error());
	mysqli_select_db($con, $banco);
?>