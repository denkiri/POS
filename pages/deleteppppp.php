<?php
	include('connect.php');
	$id=$_GET['id'];
	$invoice=$_GET['invoice'];
	$supplier=$_GET['supplier'];
	$name=$_GET['name'];
	$transId=$_GET['transId'];
	$result = $db->prepare("DELETE FROM purchases_item WHERE id= :memid");
	$result->bindParam(':memid', $id);
	$result->execute();
	$result = $db->prepare("DELETE FROM purchases WHERE transaction_id= :memid");
	$result->bindParam(':memid', $transId);
	$result->execute();
	header("location: purchase.php?suplierId=$supplier&invoice=$invoice&name=$name");
?>