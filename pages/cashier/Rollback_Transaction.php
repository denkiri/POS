<?php

require_once('auth.php');
require_once('header.html');
?>
<!DOCTYPE html>
<html lang="en">

<head>
<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
	
</SCRIPT>
</HEAD>
      <body onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="" >

        <?php include('navfixed.php');?>

        <div id="page-wrapper">
          <div class="row">
            <div id="maintable"><div style="margin-top: -19px; margin-bottom: 21px;">
            </div> 
            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
              <thead>
                <tr>
                  <th> Product Code </th>
                  <th> Product Name </th>
                  <th> Description Name </th>
                  <th> Category </th>
                  <th> Quantity </th>
                  <th> Price </th>
                  <th> Discount </th>
                  <th> VAT </th>
                  <th> Amount </th>
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
                    <td><?php echo $row['dname']; ?></td>
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
                      $fff=$row['vat'];
                      echo formatMoney($fff, true);
                      ?>
                    </td>
                    <td>
                      <?php
                      $ccc=$row['amount'];
                      echo formatMoney($ccc, true);
                      ?>
                    </td>

                    <td>
                      <?php
                      $dfdf=$row['total_amount'];
                      echo formatMoney($dfdf, true);
                      ?>
                    </td>
                    
                    <td><a class = "btn btn-primary"  href="deletesale.php?id=<?php echo $row['transaction_id']; ?>&invoice=<?php echo $_GET['invoice']; ?>&qty=<?php echo $row['qty'];?>&code=<?php echo $row['product'];?>&total=<?php echo $row['amount']; ?>"> Pull Out</a></td>
                  </tr>
                  <?php
                }
                ?>
                <tr>
                  <td colspan="9"><strong style="font-size: 12px; color: #222222;">Total:</strong></td>
                  <td colspan="3"><strong style="font-size: 12px; color: #222222;">
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

              </tbody>
            </table><br>
            <div class="clearfix"></div>
          </div>

        </div>
      </div>
      <!-- /#page-wrapper -->



      <!-- jQuery -->
      <script src="vendor/jquery/jquery.min.js"></script>

      <!-- Bootstrap Core JavaScript -->
      <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

      <!-- Metis Menu Plugin JavaScript -->
      <script src="vendor/metisMenu/metisMenu.min.js"></script>

      <!-- Custom Theme JavaScript -->
      <script src="dist/js/sb-admin-2.js"></script>

      <link href="vendor/chosen.min.css" rel="stylesheet" media="screen">
      <script src="vendor/chosen.jquery.min.js"></script>
      <script>
        $(function() {
          $(".chzn-select").chosen();

        });
      </script>

    </body>

    </html>
