<?php
session_start();
include '../classes/Aouth.php';
include '../classes/Cart.php';
include('connect.php');
$db = new DbHandler;
$cdb = new CartDbHandler;
$response = array();
        
       // error_log(json_encode($data));
       
       $order=$cdb->insertIntoOrders($_POST['invoice'],$_POST['cashier'],$_POST['date'],$_POST['ptype'],$_POST['amount'], $_POST['cname']);
       $amount=$_POST['amount'];
       $orderId=$_POST['invoice'];
$ftoken=0;
       $paymentPhone=$_POST['phone'];
             $response["error"] = false;
             $response["status"] = 1;
             $response["success"] = true;
             $response["message"] = $cdb->pay($amount,$paymentPhone,$orderId,$ftoken); 
$a = $_POST['invoice'];
$b = $_POST['cashier'];
$c = date('m/d/Y');
$dmonth = date('F');
$dyear = date('Y');
$d = $_POST['ptype'];
$e = $_POST['amount'];   
$am= $_POST['amount'];
$cname = $_POST['cname'];
$vat=0;
$time=date("h:i:a");
	$sql = "INSERT INTO sales (invoice_number,cashier,date,type,amount,cash,name,month,year,p_amount,vat,time) VALUES (:a,:b,:c,:d,:e,:f,:g,:h,:i,:k,:j,:t)";
	$q = $db2->prepare($sql);
	$q->execute(array(':a'=>$a,':b'=>$b,':c'=>$c,':d'=>$d,':e'=>$e,':f'=>$d,':g'=>$cname,':h'=>$dmonth,':i'=>$dyear,':k'=>$am,':j'=>$vat,':t'=>$time));
$amount=$_POST['amount'];	
             
header("location:https://denkiri.000webhostapp.com/sales/pages/cashier/mpreview.php?invoice=$orderId&amount=$amount&phone=$paymentPhone&token=$ftoken");
exit();

echo json_encode($response);

?>