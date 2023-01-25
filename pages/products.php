<?php
require_once('auth.php');
require_once('header.html')
?>


<body>
    <?php
    function productcode() {
        $chars = "003232303232023232023456789";
        srand((double)microtime()*1000000);
        $i = 0;
        $pass = '' ;
        while ($i <= 7) {

            $num = rand() % 33;

            $tmp = substr($chars, $num, 1);

            $pass = $pass . $tmp;

            $i++;

        }
        return $pass;
    }
    $pcode='P-'.productcode();
    ?>
    <?php include('navfixed.php');?>


    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">PRODUCT LIST</h1>
            </div>
            <div id="maintable"><div style="margin-top: -19px; margin-bottom: 21px;">

             <a  href = "#add" data-toggle = "modal" class="btn btn-primary">Add Product</a>
                    <?php include 'addproduct.php'; ?>
                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">

                        <thead>
                            <tr>
                                <th> Code </th>
                                <th> Product Name </th>
                                <th> Description </th>
                                <th> Category </th>
                                <th> Cost </th>
                                <th> Price </th>
                                <th> Supplier </th>
                                <th witdh = "10%"> Quantity Left </th>
                                <th witdh = "10%"> Product Unit </th>
                                <th> Action </th>
                            </tr>
                        </thead>
                        <tbody>

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
                            include('connect.php');
						//	 "SELECT * FROM questions ,categories WHERE categoryid = 1 && cat_id=1"
                            $result = $db->prepare("SELECT * FROM products,supliers WHERE products.supplier=supliers.suplier_id ORDER BY product_name");
                            $result->execute();
                            for($i=0; $row = $result->fetch(); $i++){
                                ?>
                                <tr class="record">
                                    <td><?php echo $row['product_code']; ?></td>
                                    <td><?php echo $row['product_name']; ?></td>
                                    <td><?php echo $row['description_name']; ?></td>
                                    <td><?php echo $row['category']; ?></td>
                                    <td align="right"><?php
                                        $pcost=$row['cost'];
                                        echo formatMoney($pcost, true);
                                        ?></td>
                                        <td align="right"><?php
                                            $pprice=$row['price'];
                                            echo formatMoney($pprice, true);
                                            ?></td>
                                            <td><?php echo $row['suplier_name']; ?></td>
                                            <td align="right"><?php echo $row['qty_left']; ?></td>
                                            <td ><?php echo $row['unit']; ?></td>
                                            <td><a rel="facebox" class = "btn btn-primary" href="editproduct.php?id=<?php echo $row['product_id']; ?>">
                                                <i class="fa fa-pencil"></i>  
                                            </a>  
                                          <!--   <a href="#" id="<?php echo $row['product_id']; ?>" class="btn btn-danger delbutton" title="Click To Delete">
                                                <i class="fa fa-trash"></i>
                                            </a> -->
                                        </td>
                                    </tr>
                                    <?php
                                }
                                ?>

                            </tbody>
							 <thead>
                            <tr>
                            <th colspan="3" style="border-top:1px solid #999999" >Total Cost </th>
                              <th colspan="1" style="border-top:1px solid #999999">
                                  <th colspan="2" style="border-top:1px solid #999999"> 
                                     <?php
                                     $results = $db->prepare("SELECT sum(cost*qty_left) FROM products ");
                                     $results->execute();
                                     for($i=0; $rows = $results->fetch(); $i++){
                                        $dsdsda=$rows['sum(cost*qty_left)'];
                                        echo formatMoney($dsdsda, true);
                                    }
                                    ?>
                                </th>
                            </tr>
                        </thead> 
                        <thead>
                            <tr>
                            <th colspan="4" style="border-top:1px solid #999999" >Total Price </th>
                              <th colspan="1" style="border-top:1px solid #999999">
                                  <th colspan="2" style="border-top:1px solid #999999"> 
                                     <?php
                                     $results = $db->prepare("SELECT sum(price*qty_left) FROM products ");
                                     $results->execute();
                                     for($i=0; $rows = $results->fetch(); $i++){
                                        $dsdsdb=$rows['sum(price*qty_left)'];
                                        echo formatMoney($dsdsdb, true);
                                    }
                                    ?>
                                </th>
                            </tr>
                        </thead> 
<thead>
                            <tr>
                            <th colspan="5" style="border-top:1px solid #999999" >Estimated Profit</th>
                              <th colspan="1" style="border-top:1px solid #999999">
                                  <th colspan="2" style="border-top:1px solid #999999">
                                  <?php								  
                                        echo formatMoney($dsdsdb-$dsdsda, true);
                                    ?>
                                </th>
                            </tr>
                        </thead>   			  						
                        </table>
						

                    <a href="" onclick="window.print()" class="btn btn-primary"><i class="icon-print icon-large"></i> Print</a>
                    <a href= "product_exp.php" class = "btn btn-primary">View Product Expiration</a>
                        <div class="clearfix"></div>
                    </div>
                  

                    <script src="js/jquery.js"></script>
                    <script type="text/javascript">
                        $(function() {
                            $(".delbutton").click(function(){

//Save the link in a variable called element
var element = $(this);

//Find the id of the link that was clicked
var del_id = element.attr("id");

//Built a url to send
var info = 'id=' + del_id;
if(confirm("Sure you want to delete this update? There is NO undo!"))
{

   $.ajax({
     type: "GET",
     url: "deleteproduct.php",
     data: info,
     success: function(){

     }
 });
   $(this).parents(".record").animate({ backgroundColor: "#fbc7c7" }, "fast")
   .animate({ opacity: "hide" }, "slow");

}

return false;

});

                        });
                    </script>

                </div>
                <!-- /.row -->
            </div>

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="../vendor/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../vendor/metisMenu/metisMenu.min.js"></script>

        <!-- DataTables JavaScript -->
        <script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
        <script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
        <script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../dist/js/sb-admin-2.js"></script>

        <!-- Page-Level Demo Scripts - Tables - Use for reference -->
        <script>
            $(document).ready(function() {
                $('#dataTables-example').DataTable({
                    responsive: true
                });
            });
        </script>

      
   </body>

   </html>
