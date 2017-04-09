<?php
// This is a vulnerable view_source script.

$page = array(
	'title' => 'View Source',
	'title_separator' => ' :: ',
	'body' => '',
);

$vuln = parse_url($_SERVER["HTTP_REFERER"])["path"];
if ($vuln == "/") {
	$vuln = "/index.php";
}

$file_name = $_SERVER["DOCUMENT_ROOT"] . $vuln;
if (!file_exists($file_name)) {
	header("location: index.php");
}

$page['title'] .= $page['title_separator'] . $vuln;

$source = @file_get_contents($file_name);
$source = str_replace(array('$html .='), array('echo'), $source);

$page['body'] .= "
<div class=\"body_padded\">
	<h1>{$vuln} Source</h1>

	<div id=\"code\">
		<table width='100%' bgcolor='white' style=\"border:2px #C0C0C0 solid\">
			<tr>
				<td><div id=\"code\">" . highlight_string($source, true) . "</div></td>
			</tr>
		</table>
	</div>
	<br /> <br />

</div>\n";

function dvwaSourceHtmlEcho($pPage) {
	// Send Headers
	Header('Cache-Control: no-cache, must-revalidate'); // HTTP/1.1
	Header('Content-Type: text/html;charset=utf-8');
	echo "
<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">

<html xmlns=\"http://www.w3.org/1999/xhtml\">

	<head>

		<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />

		<title>{$pPage['title']}</title>

			<style type=\"text/css\">
				body {
					background-color: #e7e7e7;
					font-family: Arial, Helvetica, sans-serif;
					font-size: 13px;
				}

				h1 {
					font-size: 25px;
				}

				div#container {
				}

				div#code {
					background-color: #ffffff;
				}

				div#area {
					margin-left: 30px;
				}
			</style>

		<link rel=\"icon\" type=\"\image/ico\" href=\"favicon.ico\" />

	</head>

	<body>

		<div id=\"container\">

			{$pPage['body']}

		</div>

	</body>

</html>";
}

dvwaSourceHtmlEcho($page);

?>
