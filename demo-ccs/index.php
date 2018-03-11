	<?php
	if (!empty($_SERVER['HTTPS']) && ('on' == $_SERVER['HTTPS'])) {
		$uri = 'https://';
	} else {
		$uri = 'http://';
	}
	$uri .= $_SERVER['HTTP_HOST'];
	// Initial CodeCharge Studio demo featuring Common Look and Feel (clf) framework
	// https://github.com/opencmii/wet-boew-codecharge
	header('Location: '.$uri.'/demo-ccs/basic-linux-mysql-php');
	exit;
?>
Something is wrong with wet-boew-codecharge demo-ccs installation. 
Please contact your sysop.
