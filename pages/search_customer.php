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
                    <h1 class="page-header">View Customer Transaction</h1>
                </div>

                <div id="maintable"><div style="margin-top: -19px; margin-bottom: 21px;">
                </div>
                <!--<a rel="facebox" id="addd" href="addcustomer.php" class="btn btn-primary">Add Customer</a><br><br>-->
                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                        <tr>
                            <th class = "hidden"></th>
                            <th width="25%"> First Name </th>
                            <th width="25%"> Middle Name </th>
                            <th width="25%"> Last Name </th>
                            <th> View </th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php
                        include('connect.php');
                        $result = $db->prepare("SELECT * FROM customer ORDER BY first_name");
                        $result->execute();
                        for($i=0; $row = $result->fetch(); $i++){
                            ?>
                            <tr class="record">
                                <td class = "hidden"><?php echo $row['customer_name']; ?></td>  
                                <td><?php echo $row['first_name']; ?></td>
                                <td><?php echo $row['middle_name']; ?></td>
                                <td><?php echo $row['last_name']; ?></td>
                                <td>
                                <a class="btn btn-primary" href="view_customer_transaction.php?id=<?php echo $row['customer_name']; ?>"> 
                                    <i class = "fa fa-eye"></i>
                                </a>
                            </td>
                        </tr>
                        <?php
                    }
                    ?>

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
