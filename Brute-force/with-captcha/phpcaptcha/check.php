<?php
//phpcaptcha
session_start();

include_once 'env.php';

if (empty($_SESSION['captcha_code']) || strcasecmp($_SESSION['captcha_code'], $_POST['captcha_code']) != 0) {
	echo "Wrong";
} else {
	if (isset($_POST["username"]) && isset($_POST["password"])) {
		$username = $_POST["username"];
		if ($username !== "admin") {
			echo "User Not Found!";
			die();
		}
		$password = $_POST["password"];
		if ($password !== getenv("PASSWD")) {
			echo "Wrong";
			header("location: index.php");
			die();
		} else {
			echo getenv("FLAG");
			die();
		}
	}
}
?>
