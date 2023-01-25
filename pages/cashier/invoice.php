<?php
require_once('auth.php');
$x='x';
$k='Ksh';
$today = date('m/d/Y');
$time=date("h:i:a");
$invoice=$_GET['invoice'];
include('connect.php');
$result = $db->prepare("SELECT * FROM sales WHERE invoice_number= :userid");
$result->bindParam(':userid', $invoice);
$result->execute();
for($i=0; $row = $result->fetch(); $i++){
	$cname=$row['name'];
	$invoice=$row['invoice_number'];
	$date=$row['date'];
	$cash=$row['due_date'];
	$cashier=$row['cashier'];

	$pt=$row['type'];
	$amCheck=$row['amount'];
	if($amCheck==''){
		$am=0;
	}
	else{
	$am=$row['amount'];
	}
	if($pt=='cash'){
		$cash=$row['cash'];
		$amount=$am-$am;
	}
}
?>
	<?php
								function formatMoney($number, $fractional=false) {
									if ($fractional) {
										$number = sprintf('%.2f', $number);
									}
									while (true) {
										$replaced = preg_replace('/(-?\d+)(\d\d\d)/', '$1,$2', $number);
										if ($replaced != $number) {
											$number = $replaced;
										} else {
											break;
										}
									}
									return $number;
								}
								?>
<!DOCTYPE html>
<html>
    <head>
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="dist/css/sb-admin-2.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script language="javascript">
	function Clickheretoprint()
	{ 
		var disp_setting="toolbar=yes,location=no,directories=yes,menubar=yes,"; 
		disp_setting+="scrollbars=yes,width=800, height=400, left=100, top=25"; 
		var content_vlue = document.getElementById("content").innerHTML; 

		var docprint=window.open("","",disp_setting); 
		docprint.document.open(); 
		docprint.document.write('</head><body onLoad="self.print()" style="width: 800px; font-size: 13px; font-family: arial;">');          
		docprint.document.write(content_vlue); 
		docprint.document.close(); 
		docprint.focus(); 
	}
</script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>DELE TECH POS </title>
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="icon" href="../images/fav.png" type="image/png">
    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="../css/memo.css" rel="stylesheet" >
    <link href="../css/memo1.css" rel="stylesheet" type="text/css" media="print" >
</head>
    <body>
       <!-------------------Main-------------------->
       <main class="container" >
       <!-------------------header-------------------->
	   <cen
            <div class="row header">
				 <center id="top">
						<?php
include('connect.php');
$result = $db->prepare("SELECT * FROM user ");
$result->execute();
for($i=0; $row = $result->fetch(); $i++){
	$mobile=$row['mobile'];
		$business_name=$row['business_name'];
			$business_type=$row['business_type'];

}
?>     
				<p><?php echo $business_name?> <br />
					Tel No: <?php echo $mobile?><br><br/>
					<?php echo $business_type?> 
					
					</p>
                </div>
						</center>
            </div>
            <!-------------------Section-------------------->
            <div class="row section">
			<?php
						$resulta = $db->prepare("SELECT * FROM customer WHERE customer_name= :a");
						$resulta->bindParam(':a', $cname);
						$resulta->execute();
						for($i=0; $rowa = $resulta->fetch(); $i++){
							$customer=$rowa['customer_name'];
							$address=$rowa['address'];
							$contact=$rowa['contact'];
						}
						?>
                <div class="col-xs-4">
                <h1>INVOICE</h1>
                <h4>BILL TO</h4>
                <ul style="list-style-type:none">
				      <li><?php echo $customer?> </li> 
                      <li>P.O.Box: <?php echo $address?></li>
                      <li>Tel: <?php echo $contact?></li>
                </ul>
                </div>
                <div class="col-xs-8">
                     <ul style="list-style-type:none">
                          <li>INVOICE #<?php echo $invoice; ?></li>
                          <li> DATE: <?php echo $today?></li>
						  <li><?php echo $time?></li>
                    </ul>               
                </div>
            </div>
            <!-------------------Content-------------------->
            <div class="row content">
                <table class="table" border="0" cellpadding="4" cellspacing="2" style="font-family: arial; font-size: 15px;text-align:left;" width="100%">
                        <thead>
                         <tr>
             
                            <th Style="padding:5px">Item</th>
							<th Style="padding:5px">Description</th>
							<th Style="padding:5px">Expiry</th>
                            <th Style="padding:5px">Unit Price</th>
                            <th Style="padding:5px">Quantity</th>
							<th Style="padding:5px">Discount</th>
                            <th Style="padding:5px">Total Price</th>
                          </tr>
                        </thead>
                        <tbody>
                         						<?php
						$id=$_GET['invoice'];
						$result = $db->prepare("SELECT * FROM sales_order WHERE invoice= :userid");
						$result->bindParam(':userid', $id);
						$result->execute();
						for($i=0; $row = $result->fetch(); $i++){
							?>
							<tr class="record">
								<td><?php echo $row['name']; ?></td>
									<td><?php echo $row['dname']; ?></td>
										<td><?php echo $row['expiry']; ?></td>
								<td>
									<?php
									$ppp=$row['price'];
									echo formatMoney($ppp, true);
									?>
								</td>
								<td><?php echo $row['qty'].$x; ?></td>
								<td>
									<?php
									$ddd=$row['discount'];
										echo formatMoney($ddd, true);
									?>
								</td>
								<td>
									<?php
									$dfdf=$row['total_amount'];
										echo formatMoney($dfdf, true);
									?>
								</td>
							</tr>
							<?php
						}
						?>
                          </tbody>
                    </table>
            </div>
            <!-------------------Footer-------------------->
            <div class="row footer">
               <div class="col-xs-5">
               </div>
               <div class="col-xs-4"  >
                <ul style="list-style-type:none">
                      <li >Discount</li>
                      <li>Vat</li>
                      <li>Grand Total</li>
                </ul>               
               </div>
               <div class="col-xs-3">
                <ul style="list-style-type:none">
                   
                      <li><strong style="font-size: 12px; color: #222222;"> Ksh :
								<?php
								$sdsd=$_GET['invoice'];
								$resultas = $db->prepare("SELECT sum(discount)  FROM sales_order WHERE invoice= :a");
								$resultas->bindParam(':a', $sdsd);
								$resultas->execute();
								for($i=0; $rowas = $resultas->fetch(); $i++){
									$fgfg=$rowas['sum(discount)'];
										echo formatMoney($fgfg, true);
								}
								?>
							</strong></li>
                      <li><strong style="font-size: 12px; color: #222222;"> Ksh :<?php
								$sdsd=$_GET['invoice'];
								$resultas = $db->prepare("SELECT sum(vat)  FROM sales_order WHERE invoice= :a");
								$resultas->bindParam(':a', $sdsd);
								$resultas->execute();
								for($i=0; $rowas = $resultas->fetch(); $i++){
									$fgfg=$rowas['sum(vat)'];
										echo formatMoney($fgfg, true);
								}
								?>	</strong></li>
                      <li><strong style="font-size: 12px; color: #222222;"> Ksh :
					  <?php
									$sdsd=$_GET['invoice'];
									$resultas = $db->prepare("SELECT sum(total_amount) FROM sales_order WHERE invoice= :a");
									$resultas->bindParam(':a', $sdsd);
									$resultas->execute();
									for($i=0; $rowas = $resultas->fetch(); $i++){
										$fgfg=$rowas['sum(total_amount)'];
											echo formatMoney($fgfg, true);
									}
									?>
					 	</strong> </li>
                </ul>               
               </div> 
            </div>
            <!-------------------Another Footer-------------------->
            <div class="row footer2">
                <h5>Name :_____________________</h5></br>
				<h>Sign :_____________________</h5>
				
                <form class="no-print">
                  <a class = "btn btn-primary" href="home.php" style="font-size:20px";>Back</a>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     <input type="button" class = "btn btn-primary" style="font-size:20px" value="Print" onClick="window.print()">
                </form>
            </div>
            
        </main>
        
        <script src="../js/bootstrap.min.js"></script>
    </body>
    
</html>