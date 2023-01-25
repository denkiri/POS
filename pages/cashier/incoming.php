<?php
session_start();
include('connect.php');
$a = $_POST['invoice'];
$b = $_POST['product'];
$c = $_POST['qty'];
$w = $_POST['pt'];
$comm=$_POST['commision'];
$x='.';
$r =$_POST['vat'];
$date = date('m/d/Y');
$month = date('F');
$year = date('Y');
$discount =$_POST['discount'];
$result = $db->prepare("SELECT * FROM products WHERE product_code= :userid");
$result->bindParam(':userid', $b);
$result->execute();
for($i=0; $row = $result->fetch(); $i++){
$asasa=$row['price']+$comm;
$cos=$row['cost'];
$exp=$row['expiration_date'];
$name=$row['product_name'];
$dname=$row['description_name'];
$categ=$row['category'];
$qtyleft=$row['qty_left'];
}
if($qtyleft < $c){
header("location: sales.php?id=$w&invoice=$a");	
	
}
else{
//edit qty
$sql = "UPDATE products 
        SET qty_left=qty_left-?
		WHERE product_code=?";
$q = $db->prepare($sql);
$q->execute(array($c,$b));
$fffffff=$asasa-$discount;
$d=$fffffff*$c;
$totcos=$cos*$c;
$z=$qtyleft-$c;
$vat=($d*$r)/100;
$total=$vat+$d;
// query
$sql = "INSERT INTO sales_order (invoice,product,qty,amount,name,price,discount,category,date,omonth,oyear,qtyleft,dname,vat,expiry,total_amount,total_cost) VALUES (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q)";
$q = $db->prepare($sql);
$q->execute(array(':a'=>$a,':b'=>$b,':c'=>$c,':d'=>$d,':e'=>$name,':f'=>$asasa,':g'=>$discount,':h'=>$categ,':i'=>$date,':j'=>$month,':k'=>$year,':l'=>$z,':m'=>$dname,':n'=>$vat,':o'=>$exp,':p'=>$total,':q'=>$totcos));
header("location: sales.php?id=$w&invoice=$a");
}

?>