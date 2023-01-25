<?php
require_once('auth.php');
  $id =$_GET['suplierId'];
  $date = date('m/d/Y');
require_once('header.html');  
?>
<body>

 <?php include('navfixed.php');?>

 <!-- Page Content -->
 <div id="page-wrapper">
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-12">
        <h1 class="page-header"><?php echo $_GET['name'];  ?>'s Purchase Order Form  </h1>
      </div>

      <form action="savepurchase.php" method="post" class = "form-group">
	  <div style="color: #ff7a59" ><?php echo "";?></div>
        <input type="hidden" name="invoice" class = "form-control" value="<?php echo $_GET['invoice']; ?>"/>
		 <input type="hidden" name="suplierId" class = "form-control" value="<?php echo $id; ?>"/>
		
        <?php
        $today = date('Y-m-d');
        ?>
        <label>Date : </label><input type="text"  required style="width: 600px;" class = "form-control"readonly name="date" value = "<?php echo $today; ?>" />

        <label>Supplier : </label><input type = "text" required style="width: 600px;" class = "form-control"readonly name = "supplier" value = "<?php echo $_GET['name']; ?>">

        <label>Date Deliver : </label><input type="date"  style="width: 600px;" class = "form-control" name="date_delivered" />

        <input type="hidden" class = "form-control"  value="<?php echo $_GET['name']; ?>" />

        <label>Select a Product</label><br />
        <select name="product" required style="width: 600px;" class="chzn-select">
         <?php
         include('connect.php');
       
         $result = $db->prepare("SELECT * FROM products WHERE supplier = :supp");
         $result->bindParam(':supp', $id);
         $result->execute();
         for($i=0; $row = $result->fetch(); $i++){
          ?>
          <option value="<?php echo $row['product_code']; ?>"><?php echo $row['product_name']; ?> - <?php echo $row['description_name']; ?></option>
          <?php
        }
        ?>
      </select><br />
      <label>Number of items </label>
      <input type="number" required name="qty" class ="form-control" value="" placeholder="Qty" autocomplete="off" style="width: 68px; padding-top: 6px; padding-bottom: 6px; margin-right: 4px;" value="1" min = "1" />
      <label> Status </label>
      <input type ="text" required name = "status" value = "pending" class = "form-control" style="width: 600px;" >
      <br />
      <!-- <button onclick="myFunction()" class="btn btn-primary" type="submit">Print PO</button> -->
      <button class="btn btn-primary" type="submit">Add Product</button>
    </form>
<div>
 <?php
    $id=$_GET['invoice'];
    include('connect.php');
    $resultaz = $db->prepare("SELECT * FROM purchases WHERE invoice_number= :xzxz");
    $resultaz->bindParam(':xzxz', $id);
    $resultaz->execute();
    for($i=0; $rowaz = $resultaz->fetch(); $i++){
		$transId =$rowaz['transaction_id']; 
	 $date=$rowaz['date_order'];
      $suplier=$rowaz['suplier'];
      $deliver=$rowaz['date_deliver'];	
    }
	
    ?>
	 <div class="col-xs-4">
                <ul style="list-style-type:none">
				      <li>Date: <?php echo $date?> </li> 
                      <li>Suplier: <?php echo $_GET['name']; ?></li>
                   
                </ul>
                </div>
    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
      <thead>
       <tr>
        <th> Product Name </th>
        <th> Quantity </th>
        <th> Cost </th>
		<th> Action</th>
      </tr>
    </thead>
    <tbody>

     <?php
     $id=$_GET['invoice'];
     include('connect.php');
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
          <td align="right"><?php echo $row['qty']; ?></td>
          <td align="right">
            <?php
            $dfdf=$row['cost'];
            echo formatMoney($dfdf, true);
            ?>
          </td>
<td><a href="deleteppppp.php?id=<?php echo $row['id']; ?>&transId=<?php echo $transId;?>&invoice=<?php echo $_GET['invoice']; ?>&supplier=<?php echo $_GET['suplierId']; ?>&name=<?php echo $_GET['name']; ?>"> Delete</a></td>
        </tr>
        <?php
      }
      ?>
      <tr>
        <td colspan="2"><strong style="font-size: 12px; color: #222222;">Total:</strong></td>
        <td align="right" colspan="2"><strong style="font-size: 12px; color: #222222;">
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
      $sdsd=$_GET['invoice'];
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
</table>
</div>

<div class = "pull-right">

  <a class = "btn btn-primary"  href="printpo.php?id=<?php echo $_GET['invoice']; ?>&supplier=<?php echo $_GET['name']; ?>"><span><i class="fa fa-print"></i></span></a>
        
   
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


<script>
     function myFunction() {
         window.print();
     }
  </script>


</body>

</html>