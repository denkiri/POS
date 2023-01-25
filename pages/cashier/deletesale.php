<?php
	include('connect.php');
	$id=$_GET['id'];
	$c=$_GET['invoice'];
	$qty=$_GET['qty'];
	$wapak=$_GET['code'];
	$tot=$_GET['total'];
	//edit qty
	$sql = "UPDATE products 
			SET qty_left=qty_left+?
			WHERE product_code=?";
	$q = $db->prepare($sql);
	$q->execute(array($qty,$wapak));

	$result = $db->prepare("DELETE FROM sales_order WHERE transaction_id= :memid");
	$result->bindParam(':memid', $id);
	$result->execute();
	$result = $db->prepare("SELECT * FROM sales WHERE invoice_number = :userid");
    $result->bindParam(':userid', $c);
    $result->execute();
    for($i=0; $row = $result->fetch(); $i++){
    $asasa=$row['type'];
    }
	if($asasa=='cash'){
	$sql = "UPDATE sales 
			SET p_amount=p_amount-?,amount=amount-?
			WHERE invoice_number=?";
	$q = $db->prepare($sql);
	$q->execute(array($tot,$tot,$c));
 header("location:Rollback_Transaction.php?invoice=$c");
	}
	if($asasa=='credit'){
	$sql = "UPDATE sales 
			SET balance=balance-?,total_amount=total_amount-?
			WHERE invoice_number=?";
	$q = $db->prepare($sql);
	$q->execute(array($tot,$tot,$c));
 header("location:Rollback_Transaction.php?invoice=$c");	
	}
?>