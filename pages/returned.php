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
                    <h1 class="page-header">Report of Returned Products</h1>
                </div>
            </div>
            <div id="maintable">
                <div style="margin-top: -19px; margin-bottom: 21px;">
                </div>
                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                        <tr>
                            <th > Invoice Number </th>
                            <th > Product Code </th>
                            <th > Product Name </th>
                            <th > Description Name </th>
                            <th > Status </th>
                            <th > Remarks </th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php
                        include('connect.php');
                        $result = $db->prepare("SELECT * FROM purchases WHERE status= 'returned'");
                        $result->execute();
                        for($i=0; $row = $result->fetch(); $i++){
                            ?>
                            <tr class="record">

                                <td><?php echo $row['invoice_number']; ?></td>
                                <td><?php echo $row['p_name']; ?></td>
                                <td><?php
                                 $rrrrrrr=$row['p_name'];
                                 $resultss = $db->prepare("SELECT * FROM products WHERE product_code= :asas");
                                 $resultss->bindParam(':asas', $rrrrrrr);
                                 $resultss->execute();
                                 for($i=0; $rowss = $resultss->fetch(); $i++){
                                    echo $rowss['product_name'];
                                }
                                ?></td>
                                 <td><?php
                                 $rrrrrrr=$row['p_name'];
                                 $resultss = $db->prepare("SELECT * FROM products WHERE product_code= :asas");
                                 $resultss->bindParam(':asas', $rrrrrrr);
                                 $resultss->execute();
                                 for($i=0; $rowss = $resultss->fetch(); $i++){
                                    echo $rowss['description_name'];
                                }
                                ?></td>
                                <td><?php echo $row['status']; ?></td>
                                <td><?php echo $row['remark']; ?></td>

                            </tr>
                            <?php
                        }
                        ?>

                    </tbody>
                </table>
            </div>

            <a href="" onclick="window.print()" class="btn btn-primary"><i class="icon-print icon-large"></i> Print</a>
            <div class="clearfix"></div>
        </div>

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
