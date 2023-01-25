<?php
// configuration
include('connect.php');

// new data
$id = $_POST['memi'];
$g = $_POST['fname'];
$e = $_POST['mname'];
$f = $_POST['lname'];
$b = $_POST['address'];
$c = $_POST['contact'];
$d = $_POST['memno'];
$sp='';
$h =$g." ". $e." ". $f ;
// query
$sql = "UPDATE customer 
        SET customer_name=?, address=?, contact=?, membership_number=?,first_name=?,last_name=?,middle_name=?
		WHERE customer_id=?";
$q = $db->prepare($sql);
$q->execute(array($h,$b,$c,$d,$g,$f,$e,$id));
header("location: customer.php");

?>