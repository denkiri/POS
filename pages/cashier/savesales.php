<?php
session_start();
include('connect.php');
$a = $_POST['invoice'];
$b = $_POST['cashier'];
$c = $_POST['date'];
$d = $_POST['ptype'];
$e = $_POST['amount'];
$f = $_POST['TIME'];
$pamount = $_POST['hamount'];
if( $pamount=='' ){
$am=0;	
}
else{
	$am=$_POST['hamount'];
}

$cname = $_POST['cname'];
$vat=0;

$date = date('m-d-Y');
$time=date("h:i:a");

$dmonth = date('F');
$dyear = date('Y');

if($d=='credit') {
	$sql = "INSERT INTO sales (invoice_number,cashier,date,type,total_amount,due_date,name,month,year,balance,p_amount,vat,time) VALUES (:a,:b,:c,:d,:e,:f,:g,:h,:i,:k,:j,:l,:t)";
	$q = $db->prepare($sql);
	$q->execute(array(':a'=>$a,':b'=>$b,':c'=>$c,':d'=>$d,':e'=>$e,':f'=>$f,':g'=>$cname,':h'=>$dmonth,':i'=>$dyear,':k'=>$e,':j'=>$am,':l'=>$vat,':t'=>$time));
	header("location: invoice.php?invoice=$a");
	exit();
}
if($d=='cash') {
	$f = $_POST['cash'];
	$sql = "INSERT INTO sales (invoice_number,cashier,date,type,amount,cash,name,month,year,p_amount,vat,time) VALUES (:a,:b,:c,:d,:e,:f,:g,:h,:i,:k,:j,:t)";
	$q = $db->prepare($sql);
	$q->execute(array(':a'=>$a,':b'=>$b,':c'=>$c,':d'=>$d,':e'=>$e,':f'=>$f,':g'=>$cname,':h'=>$dmonth,':i'=>$dyear,':k'=>$am,':j'=>$vat,':t'=>$time));
	header("location: preview.php?invoice=$a");
	exit();
}
// query

?>