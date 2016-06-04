<?php
	session_start("login_ml");
	session_destroy("login_ml");
	header("Location: login.php");
?>