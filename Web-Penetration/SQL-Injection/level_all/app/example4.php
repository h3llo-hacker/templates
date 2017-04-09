<?php
require_once 'header.php';
require_once 'db.php';
$sql = "SELECT * FROM users where id=";
$sql .= mysqli_real_escape_string($lnk, $_GET["id"]) . " ";
$result = mysqli_query($lnk, $sql);

if ($result) {
	?>
		<table class='table table-striped'>
      <tr><th>id</th><th>name</th><th>age</th></tr>

		<?php
while ($row = mysqli_fetch_assoc($result)) {
		echo "<tr>";
		echo "<td>" . $row['id'] . "</td>";
		echo "<td>" . $row['name'] . "</td>";
		echo "<td>" . $row['age'] . "</td>";
		echo "</tr>";
	}
	echo "</table>";
}
require 'footer.php';
?>

