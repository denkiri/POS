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
                        <h2 class="page-header">Product(s) Expiration</h2>
                    </div>



                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr>
                                <th > Product Code </th>
                                <th > Brand Name </th>
                                <th > Description Name </th>
                                <th > Quantity </th>
                                <th > Expiration Date </th>
                            </tr>
                        </thead>
                        <tbody>
                          <?php
                          include('connect.php');
                          $today = date('Y-m-d');
                          $sql = "SELECT * FROM products WHERE products.expiration_date >= DATE(now())
                          AND
                          products.expiration_date <= DATE_ADD(DATE(now()), INTERVAL 1 MONTH)";
                          $query = $db->prepare($sql);
                          $query->execute(array($today));
                          for($i=0; $row = $query->fetch(); $i++)
                          {
                            ?>
                            <tr class="record">
                                <td><font style="color:red;"><?php echo $row['product_code']; ?></td>
                                <td><font style="color:red;"><?php echo $row['product_name']; ?></td>
                                <td><font style="color:red;"><?php echo $row['description_name']; ?></td>
                                <td><font style="color:red;"><?php echo $row['qty_left']; ?></td>
                                
                                <td><font style="color:red;"><?php echo $row['expiration_date']; ?></td>
                            </tr>
                            <?php
                        }
                        ?>
                    </tbody>
                </table>
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
