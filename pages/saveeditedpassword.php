<?php 
	include ('connect.php');

	$a = $_POST['username'];
	$b = $_POST['password'];
	$c = $_POST['secret'];
$sql = "SELECT * FROM user WHERE secret = ?";
	$query = $db->prepare($sql);
	$query->execute(array($c));
	$row = $query->fetch();
	if ($query->rowCount() > 0){
	$sql = "UPDATE user 
        SET username=?, password=?,secret=? WHERE secret=?";
	$query = $db->prepare($sql);
	$query->execute(array($a,$b,$c,$c));
	$row = $query->fetch();	
		echo 1;
	}else{
		echo 0;
	}
?>
