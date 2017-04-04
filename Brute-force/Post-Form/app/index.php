<?php
include_once "env.php";

$FLAG = getenv("FLAG");
$PASS = getenv("PASSWD");

if (isset($_POST["username"]) && isset($_POST["password"])) {
	$username = $_POST["username"];
	if ($username !== "admin") {
		echo "User Not Found!";
		die();
	}
	$password = $_POST["password"];
	if ($password !== $PASS) {
		echo "Password is Wrong!";
		header("location: index.php");
		die();
	} else {
		echo "The flag is: \n" . $FLAG;
		die();
	}
}

?>
<!DOCTYPE html>
<html>
<head>
	<title>Login System</title>
	<style type="text/css">
		form {
			margin: 10% auto;
			width:250px;
			align-items: center;
			text-align: center;
		}
	</style>
</head>
<body>

<form id='login' action='index.php' method='post' accept-charset='UTF-8'>
    <fieldset>
        <legend>Admin Login</legend>
        <br>
        <label for='username' >UserName*:</label>
        <input type='text' name='username' id='username' maxlength="50"/>
        <p>
	        <label for='password' >Password*:</label>
	        <input type='password' name='password' id='password' maxlength="50"/>
        </p>
        <p><input type='submit' name='Submit' value='Submit'/></p>
    </fieldset>
</form>

</body>
</html>
