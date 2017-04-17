<?php require_once 'header.php';?>


<?php
if (isset($_FILES['image'])) {
	$dir = '/app/images/';
	$file = basename($_FILES['image']['name']);
	if (move_uploaded_file($_FILES['image']['tmp_name'], $dir . $file)) {
		echo "Upload done";
		echo "Your file can be found <a href=\"/images/" . htmlentities($file) . "\">here</a>";
	} else {
		echo 'Upload failed';
	}
}
?>


<form method="POST" action="index.php" enctype="multipart/form-data">
Mon image : <input type="file" name="image"><br/>
<input type="submit" name="send" value="Send file">

</form>


<?php require_once 'footer.php';?>
