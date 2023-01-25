<?php
	include('connect.php');
	$id=$_GET['id'];
	$result = $db->prepare("DELETE FROM categories WHERE category_id= :memid");
	$result->bindParam(':memid', $id);
	$result->execute();
?>