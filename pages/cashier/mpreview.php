<?php
require_once('auth.php');
$x='x';
$k='Ksh';
$today = date('m/d/Y');
$time=date("h:i:a");
?>


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
<a class = "btn btn-primary" href="home.php" style="font-size:20px";>Back</a>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <a class = "btn btn-primary" href="javascript:Clickheretoprint()" style="font-size:20px";>Print</a>
<?php
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
?><br>
<br>

<div class="content" id="content"style="width: 44mm;">
	<div style="margin: 0 auto; padding: 20px; width: 400px; font-weight: normal;">
	
		<div >
			<div>
			 <center id="top">
				<p>VALIDUS PHARMACY<br />
					Tel No: 0728145897<br><br/>
					PHARMACEUTICALS
					
					</p>
					
					</center>
				</div>
				<div>Cash sale: <?php echo $invoice?> </div><br/>
				<div>Date: <?php echo $today ?> &nbsp &nbsp  Time: <?php echo $time ?></div>
					<div>-------------------------------------------------------------------------</div>
			</div>
			<div>
				<table border="0" cellpadding="4" cellspacing="2" style="font-family: arial; font-size: 15px;text-align:left;" width="100%">
					<thead>
						<tr>
							<th Style="padding:5px">ITEM</th>
							<th  Style="padding:5px">QTY</th>
							<th  Style="padding:5px">PRICE</th>
							<th  Style="padding:5px">AMOUNT</th>
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
								<td style="word-wrap: break-word;max-width:20mm;" ><?php echo $row['name']; ?></td>
								<td><?php echo $row['qty'].$x; ?></td>
								<td>
									<?php
									$ppp=$row['price'];
									echo formatMoney($ppp, true);
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
							
						<tr>
							<td colspan="3"><strong style="font-size: 12px; color: #222222;">VAT:</strong></td>
							<td colspan="2"><strong style="font-size: 12px; color: #222222;">
								<?php
								$sdsd=$_GET['invoice'];
								$resultas = $db->prepare("SELECT sum(vat)  FROM sales_order WHERE invoice= :a");
								$resultas->bindParam(':a', $sdsd);
								$resultas->execute();
								for($i=0; $rowas = $resultas->fetch(); $i++){
									$fgfg=$rowas['sum(vat)'];
									echo formatMoney($fgfg, true);
								}
								?>
							</strong></td>
						</tr>
						<tr>
							<td colspan="3"><strong style="font-size: 12px; color: #222222;">DISCOUNT:</strong></td>
							<td colspan="2"><strong style="font-size: 12px; color: #222222;">
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
							</strong></td>
						</tr>
						<?php if($pt=='cash'){
							?>
						
							<tr>
								<td colspan="3"><strong style="font-size: 12px; color: #222222;">Total Amount: Ksh</strong></td>
								<td colspan="2"><strong style="font-size: 12px; color: #222222;">
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
								</strong></td>
							</tr>
								<?php
						}
						?>
						<tr>
							<td colspan="3"><strong style="font-size: 12px; color: #222222;">
								<?php
								if($pt=='credit'){
									echo 'Due Date:';
								}
								?>
							</strong></td>

							<td colspan="2"><strong style="font-size: 12px; color: #222222;">
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
								if($pt=='credit'){
									echo $cash;
								}
								?>
							</strong></td>
						</tr>

					</tbody>
				</table>
				
			</div>
			
				<div >PRICES INCLUSIVE OF VAT WHERE APPLICABLE</div>
				<div ><center>Mpesa</center></div>
				<div>
				    <table border="0" cellpadding="4" cellspacing="2" style="font-family: arial; font-size: 15px;text-align:left;" width="100%">
					<thead>
						<tr>
							<th Style="padding:5px">code</th>
							<th  Style="padding:5px">amount</th>
							<th  Style="padding:5px">Phone</th>
						</tr>
					</thead>
					<tboday>
					     <?php
                $id=$_GET['invoice'];
                include('connect.php');
                $result = $db->prepare("SELECT * FROM mpesa_payments WHERE invoice_number= :userid");
                $result->bindParam(':userid', $id);
                $result->execute();
                for($i=0; $row = $result->fetch(); $i++){
                  ?>
				  <tr class="record">
                    <td><?php echo $row['MpesaReceiptNumber']; ?></td>
                    <td><?php echo $row['mpesa_amount']; ?></td>
                    <td><?php echo $row['PhoneNumber']; ?></td>
                    <?php
                    
                }
                ?>
					</tr>
				
					</tboday>
					</table>
				    
				</div>
					<div >-------------------------------------------------------------------------</div>
					<div >YOU WERE SERVED BY : <?php echo $cashier ?></div> <br />
					
					<div >THANK YOU FOR SHOPPING WITH US </div>
				<div>-------------------------------------------------------------------------</div>
					<div >PHARMACY THAT CARES </div>
		</div>
	</div>
	