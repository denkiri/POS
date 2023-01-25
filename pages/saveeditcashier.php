<?php
// configuration
include('connect.php');

// new data
$id = $_POST['memi'];
$a = $_POST['name'];
$b = $_POST['username'];
$c = $_POST['Password'];
// query
$sql = "UPDATE cashier 
        SET cashier_name=?, username=?, password=? WHERE cashier_id=?";
$q = $db->prepare($sql);
$q->execute(array($a,$b,$c,$id));
header("location: users.php");

?>