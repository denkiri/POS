<?php
	include('connect.php');
	$id=$_GET['id'];
	$result = $db->prepare("DELETE FROM purchases_item WHERE id= :memid");
	$result->bindParam(':memid', $id);
	$result->execute();
?>