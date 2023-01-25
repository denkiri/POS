<?php
session_start();
include('connect.php');
$a = $_POST['name'];
$sql = "INSERT INTO categories (category_name) VALUES (?)";
$q = $db->prepare($sql);
$q->execute(array($a));
header("location:categories.php");
?>