<?php
// configuration
include('connect.php');

// new data
$id = $_POST['memi'];
$a = $_POST['name'];
$categname =$_POST['categname'];
// query
$sql = "UPDATE categories 
        SET category_name=?
		WHERE category_id=?";
$q = $db->prepare($sql);
$q->execute(array($a,$id));
$sqlB = "UPDATE products 
        SET products.category=?
		WHERE products.category=?";
$q = $db->prepare($sqlB);
$q->execute(array($a,$categname));
$q->execute(array($a,$id));
$sqlC = "UPDATE sales_order 
        SET sales_order.category=?
		WHERE sales_order.category=?";
$q = $db->prepare($sqlC);
$q->execute(array($a,$categname));
header("location: categories.php");

?>