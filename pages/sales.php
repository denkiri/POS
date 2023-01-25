<?php
require_once('auth.php');
require_once('header.html');
?>
      <body>
       <?php include('navfixed.php');?>

       <div id="page-wrapper">
        <div class="row">
         <div class="col-lg-12">
          <h1 class="page-header">Payment</h1>
        </div>

        <div id="maintable"><div style="margin-top: -19px; margin-bottom: 21px;">
        </div>
        <form action="incoming.php" method="post" class = "form-group" >
          <input type="hidden" name="pt" class = "form-control" value="<?php echo $_GET['id']; ?>" />
          <input type="hidden" name="invoice" class = "form-control" value="<?php echo $_GET['invoice']; ?>" />
          <label>Select a Product</label><br />
          <select  name="product"  style="width:500px;" class="chzn-select">
           <option></option>
           <?php
           include('connect.php');
           $result = $db->prepare("SELECT * FROM products");
           $result->bindParam(':userid', $res);
           $result->execute();
           for($i=0; $row = $result->fetch(); $i++){
            ?>
            <option value="<?php echo $row['product_code'];?>" 
              <?php
              if($row['qty_left'] == 0)
              {
                echo'disabled';
              }
              ?>
              >
              <?php echo $row['product_code']; ?>
              - <?php echo $row['product_name']; ?>
              - <?php echo $row['qty_left']; ?>

            </option>
            <?php
          }
          ?>
        </select>
        <br />
        <label>Number of Item</label>
        <input type="number" name="qty" value="1" min = "1" class = "form-control"  autocomplete="off" style="width: 100px; padding-top: 6px; padding-bottom: 6px; margin-right: 4px;" />
        <label>Discount</label>
        <input type="text" name="discount" value="0"  min = "0"  class = "form-control"  autocomplete="off" style="width: 100px; padding-top: 6px; padding-bottom: 6px; margin-right: 4px;" />
        <br>
        <input type="submit" class="btn btn-primary" value="add product" class = "form-control" style="width: 123px;" />
      </form>
      <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
        <thead>
         <tr>
          <th> Product Code </th>
          <th> Product Name </th>
          <th> Category </th>
          <th> Quantity </th>
          <th> Price </th>
          <th> Discount </th>
          <th> Total Amount </th>
          <th> Delete </th>
        </tr>
      </thead>
      <tbody>

       <?php
       $id=$_GET['invoice'];
       include('connect.php');
       $result = $db->prepare("SELECT * FROM sales_order WHERE invoice= :userid");
       $result->bindParam(':userid', $id);
       $result->execute();
       for($i=0; $row = $result->fetch(); $i++){
        ?>
        <tr class="record">
         <td><?php echo $row['product']; ?></td>
         <td><?php echo $row['name']; ?></td>
         <td><?php echo $row['category']; ?></td>
         <td><?php echo $row['qty']; ?></td>
         <td>
          <?php
          $ppp=$row['price'];
          echo formatMoney($ppp, true);
          ?>
        </td>
        <td>
          <?php
          $ddd=$row['discount'];
          echo formatMoney($ddd, true);
          ?>
        </td>
        <td>
          <?php
          $dfdf=$row['amount'];
          echo formatMoney($dfdf, true);
          ?>
        </td>
        <td><a href="delete.php?id=<?php echo $row['transaction_id']; ?>&invoice=<?php echo $_GET['invoice']; ?>&dle=<?php echo $_GET['id']; ?>&qty=<?php echo $row['qty'];?>&code=<?php echo $row['product'];?>"> Delete</a></td>
      </tr>
      <?php
    }
    ?>
    <tr>
      <td colspan="6"><strong style="font-size: 12px; color: #222222;">Total:</strong></td>
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
    $sdsd=$_GET['invoice'];
    $resultas = $db->prepare("SELECT sum(amount) FROM sales_order WHERE invoice= :a");
    $resultas->bindParam(':a', $sdsd);
    $resultas->execute();
    for($i=0; $rowas = $resultas->fetch(); $i++){
      $fgfg=$rowas['sum(amount)'];
      echo formatMoney($fgfg, true);
    }
    ?>
  </strong></td>
</tr>

</tbody>
</table><br>
<a rel="facebox" class="btn btn-primary"  href="checkout.php?pt=<?php echo $_GET['id']?>&invoice=<?php echo $_GET['invoice']?>&total=<?php echo $fgfg ?>&cashier=<?php echo $session_admin_name?>">Check Out</a>


<div class="clearfix"></div>
</div>

</div>
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
