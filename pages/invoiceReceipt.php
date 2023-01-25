<?php
require_once('auth.php');
$x='x';
$k='Ksh';
$today = date('m/d/Y');
$time=date("h:i:a");
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

<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../dist/css/sb-admin-2.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">





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
$invoice=$_GET['id'];
include('connect.php');
$result = $db->prepare("SELECT * FROM sales WHERE invoice_number= :userid");
$result->bindParam(':userid', $invoice);
$result->execute();
$numberofrows = $result->rowCount();
if($numberofrows==0){
	$cash='';
	
}
else{
for($i=0; $row = $result->fetch(); $i++){
	$cname=$row['name'];
	$invoice=$row['invoice_number'];
	$date=$row['date'];
	$cash=$row['due_date'];
	$cashier=$row['cashier'];
	$pt=$row['type'];
	$am=$row['amount'];
}
}
?><br>
<br>

<div class="content" id="content"style="width: 44mm;">
	<div style="margin: 0 auto; padding: 20px; width: 400px; font-weight: normal;">
		<div>
			<div>
			 <center id="top">
				<p>VALIDUS PHARMACY<br />
					Tel No: 0728145897<br><br/>
					PHARMACEUTICALS
					
					</p>
					
					</center>
					<div>
					<div>Date: <?php echo $today ?> &nbsp &nbsp  Time: <?php echo $time ?></div>
					<div>-------------------------------------------------------------------------</div>
						<?php
						$resulta = $db->prepare("SELECT * FROM customer WHERE customer_name= :a");
						$resulta->bindParam(':a', $cname);
						$resulta->execute();
						for($i=0; $rowa = $resulta->fetch(); $i++){
							$address=$rowa['address'];
							$contact=$rowa['contact'];
						}
						?>
					</div>
				</div>
			</div>
			<div style="width: 100%">
				<table border="0" cellpadding="6" cellspacing="2" style="font-family: arial; font-size: 15px;text-align:left;" width="44mm">
					<thead>
						<tr>
							<th Style="padding:5px">Transaction ID</th>
							<th  Style="padding:5px">Date </th>
							<th  Style="padding:5px">Payment</th>
							<th  Style="padding:5px">Balance </th>
						</tr>
					</thead>
					<tbody>
						<?php
						$id=$_GET['id'];
						$result = $db->prepare("SELECT * FROM collection WHERE name= :userid");
						$result->bindParam(':userid', $id);
						$result->execute();
						for($i=0; $row = $result->fetch(); $i++){
							?>
							<tr class="record">
								<td>TR-000<?php echo $row['transaction_id']; ?></td>
								<td><?php echo $row['date']; ?></td>&nbsp &nbsp
								<td>Ksh:<?php
								$ppp=$row['amount'];
									echo formatMoney($ppp, true);
							?></td>
								<td>Ksh:<?php
                              $ppp=$row['balance'];
									echo formatMoney($ppp, true);
								?></td>
							</tr> 
							<?php
						}
						?>
							
							<?php
						
						?>
					
					</tbody>
				</table>
			</div></br>
<div >Due Date: <?php echo $cash;?> </div>
					<div >-------------------------------------------------------------------------</div>
					
					<div >THANK YOU FOR SHOPPING WITH US </div>
				<div  >-------------------------------------------------------------------------</div>
					<div >PHARMACY THAT CARES </div>
		</div>
	</div>
	
	
	



