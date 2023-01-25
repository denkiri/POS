<?php
require_once('auth.php');
$invoice=$_GET['id'];
include('connect.php');
$result = $db->prepare("SELECT * FROM sales WHERE invoice_number= :userid");
$result->bindParam(':userid', $invoice);
$result->execute();
for($i=0; $row = $result->fetch(); $i++){
	$pt=$row['type'];
}
if($pt=='credit'){
		header("location: invoice.php?invoice=$invoice");
	exit();
}
else{
	header("location: receipt.php?id=$invoice");
	exit();	
}
?>