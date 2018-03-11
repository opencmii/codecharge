	<?php
	if (!empty($_SERVER['HTTPS']) && ('on' == $_SERVER['HTTPS'])) {
		$uri = 'https://';
	} else {
		$uri = 'http://';
	}
	$uri .= $_SERVER['HTTP_HOST'];
	header('Location: '.$uri.'/codecharge/dist-ccs/Projects/basic-linux-mysql-php');
	exit;
?>
Something is wrong with this application DEV installation. 
Please contact your sysop.
