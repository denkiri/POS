<?php
/* Database config */
$db_host		= 'localhost';
$db_user		= 'id12192696_db';
$db_pass		= 'jd!3GUP+M!^K6N\m';
$db_database	= 'id12192696_db2'; 

/* End config */

$db2 = new PDO('mysql:host='.$db_host.';dbname='.$db_database, $db_user, $db_pass);
$db2->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

?>