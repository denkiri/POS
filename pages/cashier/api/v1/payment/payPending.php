<?php
session_start();
include '../classes/Aouth.php';
include '../classes/Cart.php';
include('connect.php');
$db = new DbHandler;
$cdb = new CartDbHandler;
$response = array();
        
       // error_log(json_encode($data));
       $amount=$_GET['amount'];
       
       $orderId=$_GET['invoice'];
$ftoken=0;
       $paymentPhone=$_GET['phone'];
         
             $response["error"] = false;
             $response["status"] = 1;
             $response["success"] = true;
             
             $response["message"] = $cdb->pay($amount,$paymentPhone,$orderId,$ftoken); 
header("location:https://denkiri.000webhostapp.com/sales/pages/cashier/mpreview.php?invoice=$orderId&amount=$amount&phone=$paymentPhone&token=$ftoken");
exit();

echo json_encode($response);

?>