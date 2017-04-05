<?php
session_start();
?>
<!DOCTYPE html>
<html>
<head>
	<title>Login System | with-captcha</title>
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

<form id='login' action='check.php' method='post' accept-charset='UTF-8'>
    <fieldset>
        <legend>Admin Login</legend>
        <br>
        <label for='username' >UserName*:</label>
        <input type='text' name='username' id='username' maxlength="50"/>
        <p>
	        <label for='password' >Password*:</label>
	        <input type='password' name='password' id='password' maxlength="50"/>
        </p>

		<img src="captcha.php?rand=<?php echo rand(); ?>">
		<input type="text" style="display:inline;width:40%" name="captcha_code" placeholder="验证码"/>

        <p><input type='submit' name='Submit' value='Submit'/></p>
    </fieldset>
</form>

</body>

</html>