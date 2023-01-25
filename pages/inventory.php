<?php
require_once('auth.php');
require_once('header.html');
?>

<body>
    <?php include('navfixed.php');?>


    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Inventory  Report</h1>
            </div>
            <div id="maintable"><div style="margin-top: -19px; margin-bottom: 21px;">
                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">

                    <thead>
                        <tr>

                            <th class="hidden"> Id </th>
                            <th width="10%"> Invoice </th>
                            <th> Product Code </th>
                            <th> Product Name </th>
                            <th> Description Name </th>
                            <th> Quantity Start </th>
                            <th> Quantity Sold </th>
                            <th> Quantity End </th>
                            <th> Product Price </th>  
                            <th> Cost </th>
                            <th> Date Purchased </th>                               
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
                        $result = $db->prepare("SELECT *  FROM  sales_order ORDER BY transaction_id  ");
                        $result->execute();
                        for($i=0; $row = $result->fetch(); $i++){
                            ?>
                            <tr class="record">
                                <td class="hidden"><?php echo $row['transaction_id']; ?></td>
                                <td><?php echo $row['invoice']; ?></td>
                                <td><?php echo $row['product']; ?></td>
                                <td><?php echo $row['name']; ?></td>
                                <td><?php echo $row['dname']; ?></td>
                                <?php $qtyend=$row['qtyleft']+$row['qty'];?>
                                <td><?php echo $qtyend; ?></td>
                                <td><?php echo $row['qty']; ?></td>
                                <td><?php echo $row['qtyleft']; ?></td>
                                <td><?php
                                    $pprice=$row['price'];
                                    echo formatMoney($pprice, true);
                                    ?></td>
                                    <td><?php
                                        $pprice=$row['amount'];
                                        echo formatMoney($pprice, true);
                                        ?></td> 

                                        <td><?php echo $row['date']; ?></td> 

                                    </tr>
                                    <?php
                                }
                                ?>

                            </tbody>
                        </table>
                        <button onclick="myFunction()" id="btnPrint" class="btn btn-primary btn-m " >
                            Print
                        </button>
                        <div class="clearfix"></div>
                    </div>

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

        <script>
           function myFunction() {
               window.print();
           }
       </script>


   </body>

   </html>
