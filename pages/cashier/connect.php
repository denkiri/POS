<?php
/* Database config */
$db_host		= 'localhost';
$db_user		= 'denkiric_inventory';
$db_pass		= 'denkiric_inventory';
$db_database	= 'denkiric_inventory'; 

/* End config */

$db = new PDO('mysql:host='.$db_host.';dbname='.$db_database, $db_user, $db_pass);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

?>