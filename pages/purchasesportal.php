<?php
require_once('auth.php');
require_once('header.html');
?>
    <body>
    	<?php include('navfixed.php');?>
    	<!-- Page Content -->
    	<div id="page-wrapper">
    		<div class="container-fluid">
    			<div class="row">
    				<div class="col-lg-12">
    					<h1 class="page-header">Purchase Order Form</h1>
    				</div>
    				<div id="maintable">
    					<form action="savepurchasesitem.php" method="post" class = "form-group" >
    						<input type="hidden" class = "form-control" name="invoice" value="<?php echo $_GET['iv']; ?>" />
    						<label>Select a Product</label><br />
    						<select name="product" style="width: 600px;" class="chzn-select">
    							<?php
    							include('connect.php');
    							$result = $db->prepare("SELECT * FROM products");
    							$result->bindParam(':userid', $res);
    							$result->execute();
    							for($i=0; $row = $result->fetch(); $i++){
    								?>
    								<option value="<?php echo $row['product_code']; ?>"><?php echo $row['product_name']; ?></option>
    								<?php
    							}
    							?>
    						</select><br />
    						<label>Number of items </label>
    						<input type="text" name="qty" class ="form-control" value="" placeholder="Qty" autocomplete="off" style="width: 68px; padding-top: 6px; padding-bottom: 6px; margin-right: 4px;" />
                            <br />
    						<input type="submit" class="btn btn-primary"  value="save" style="width: 123px;" class = "form-control" />
    					</form>
    					<div class="content" id="content">
    						<div>
    							<?php
    							$id=$_GET['iv'];
    							include('connect.php');
    							$resultaz = $db->prepare("SELECT * FROM purchases WHERE invoice_number= :xzxz");
    							$resultaz->bindParam(':xzxz', $id);
    							$resultaz->execute();
    							for($i=0; $rowaz = $resultaz->fetch(); $i++){
    								echo 'Transaction ID : TR-'.$rowaz['transaction_id'].'<br>';
    								echo 'Invoice Number : '.$rowaz['invoice_number'].'<br>';
    								echo 'Date : '.$rowaz['date_order'].'<br>';
    								echo 'Supplier : '.$rowaz['suplier'].'<br>';
    								echo 'Remarks : '.$rowaz['date_deliver'].'<br>';
    							}
    							?>
    						</div>
                            <br />

    						<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
    							<thead>
    								<tr>
    									<th > Name </th>
    									<th > Quantity </th>
    									<th > Cost </th>
    									<th > Action </th>
    								</tr>
    							</thead>
    							<tbody>

    								<?php
    								$id=$_GET['iv'];
    								$result = $db->prepare("SELECT * FROM purchases_item WHERE invoice= :userid");
    								$result->bindParam(':userid', $id);
    								$result->execute();
    								for($i=0; $row = $result->fetch(); $i++){
    									?>
    									<tr class="record">
    										<td><?php
    											$rrrrrrr=$row['name'];
    											$resultss = $db->prepare("SELECT * FROM products WHERE product_code= :asas");
    											$resultss->bindParam(':asas', $rrrrrrr);
    											$resultss->execute();
    											for($i=0; $rowss = $resultss->fetch(); $i++){
    												echo $rowss['product_name'];
    											}
    											?></td>
    											<td><?php echo $row['qty']; ?></td>
    											<td>
    												<?php
    												$dfdf=$row['cost'];
    												echo formatMoney($dfdf, true);
    												?>
    											</td>
    											<td><a href="deletep.php?id=<?php echo $row['id']; ?>&invoice=<?php echo $_GET['iv']; ?>&qty=<?php echo $row['qty'];?>&code=<?php echo $row['name'];?>"> Delete </a></td>
    										</tr>
    										<?php
    									}
    									?>
    									<tr>
    										<td colspan="2"><strong style="font-size: 12px; color: #222222;">Total:</strong></td>
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
    											$sdsd=$_GET['iv'];
    											$resultas = $db->prepare("SELECT sum(cost) FROM purchases_item WHERE invoice= :a");
    											$resultas->bindParam(':a', $sdsd);
    											$resultas->execute();
    											for($i=0; $rowas = $resultas->fetch(); $i++){
    												$fgfg=$rowas['sum(cost)'];
    												echo formatMoney($fgfg, true);
    											}
    											?>
    										</strong></td>
    									</tr>

    								</tbody>
    							</table></div><br>
    							<a id="cccc" class="btn btn-primary" href="purchaseslist.php" style="margin-right: 10px;">Back</a>
    							<a href="" onclick="window.print()" class="btn btn-info"><i class="icon-print icon-large"></i> Print</a>
    							<div class="clearfix"></div>
    						</div>

    					</div>
    					<!-- /.row -->
    				</div>
    				<!-- /.container-fluid -->
    			</div>
    			<!-- /#page-wrapper -->


    			<!-- jQuery -->
    			<script src="../vendor/jquery/jquery.min.js"></script>

    			<!-- Bootstrap Core JavaScript -->
    			<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    			<!-- Metis Menu Plugin JavaScript -->
    			<script src="../vendor/metisMenu/metisMenu.min.js"></script>

    			<!-- Custom Theme JavaScript -->
    			<script src="../dist/js/sb-admin-2.js"></script>

    			<link href="vendors/chosen.min.css" rel="stylesheet" media="screen">
    			<script src="vendors/chosen.jquery.min.js"></script>
    			<script>
    				$(function() {
    					$(".chzn-select").chosen();

    				});
    			</script>

    		</body>

    		</html>
