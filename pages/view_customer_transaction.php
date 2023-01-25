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
                    <h1 class="page-header">Customer Transaction Record</h1>
                </div>

                <div id="maintable"><div style="margin-top: -19px; margin-bottom: 21px;">
                    <a class = "btn btn-primary" href = "search_customer.php" ><i class = "fa fa-arrow-left"> Back</i></a>
                </div>

                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                        <tr>
                            <th width="20%"> Invoice Number</th>
                            <th width="20%"> Customer Name</th>
                            <th width="15%"> Type Of Payment</th>
                            <th width="20%"> Amount Paid </th>
                            <th width="15%"> Balance </th>
                            <th width="15%"> Transaction Date </th>
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
                        $id=$_GET['id'];
                        $result = $db->prepare("SELECT * FROM sales WHERE name= :userid");
                        $result->bindParam(':userid', $id);
                        $result->execute();
                        for($i=0; $row = $result->fetch(); $i++){
                            ?>

                            <tr class="record">
                                <td><?php echo $row['invoice_number']; ?></td>  
                                <td><?php echo $row['name']; ?></td>
                                <td><?php echo $row['type']; ?></td>
                                <td align="right"><?php echo $row['amount']; ?></td>
                                <td align="right"><?php echo $row['balance']; ?></td>
                                <td><?php echo $row['date']; ?></td>

                            </tr>
                            <?php
                        }
                        ?>
                        <thead>
                            <tr>
                                <th colspan="3" style="border-top:1px solid #999999"> Total Amount </th>
                                <td class = "right" colspan="3" style="border-top:1px solid #999999"> 

                                    <?php
                                    $id = $_GET['id'];
                                    $results = $db->prepare("SELECT sum(amount) FROM sales WHERE name = :name ");
                                    $results->bindParam(':name', $id);
                                    $results->execute();
                                    for($i=0; $rows = $results->fetch(); $i++){
                                        $dsdsd=$rows['sum(amount)'];
                                        echo formatMoney($dsdsd, true);
                                    }
                                    ?>
                                </td>
                            </tr>
                        </thead>
                        <thead>
                            <tr>
                                <th colspan="3" style="border-top:1px solid #999999" >Total balance </th>
                                <th colspan="" style="border-top:1px solid #999999">
                                  <th colspan="3" style="border-top:1px solid #999999"> 
                                     <?php
                                     $id = $_GET['id'];
                                     $results = $db->prepare("SELECT sum(balance) FROM sales WHERE name = :name ");
                                     $results->bindParam(':name', $id);
                                     $results->execute();
                                     for($i=0; $rows = $results->fetch(); $i++){
                                        $dsdsd=$rows['sum(balance)'];
                                        echo formatMoney($dsdsd, true);
                                    }
                                    ?>
                                </th>
                            </tr>
                        </thead>   
                    </tbody>
                </table>
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

<!-- DataTables JavaScript -->
<script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
</script>


</body>

</html>
