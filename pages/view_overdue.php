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
                        <h2 class="page-header">List of Overdue Customers</h2>
                    </div>
                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr>
                                <th > Invoice Number </th>
                                <th > Customer Name </th>
                                <th > Balance </th>
                                <th > Due Date </th>
                            </tr>
                        </thead>
                        <tbody>
                          <?php
                          include('connect.php');
                          $today = date('Y-m-d');
                          $sql = "SELECT * FROM sales WHERE DATE(due_date) = DATE( DATE_SUB( NOW() , INTERVAL 1 DAY ) )";
                          $query = $db->prepare($sql);
                          $query->execute(array($today));
                          for($i=0; $row = $query->fetch(); $i++)
                          {
                            ?>
                            <tr class="record">
                                <td><font style="color:brown;"><?php echo $row['invoice_number']; ?></td>
                                <td><font style="color:brown;"><?php echo $row['name']; ?></td>
                                <td><font style="color:brown;">
                                <?php
                                    $dsdsd=$row['total_amount'];
                                    echo formatMoney($dsdsd, true);
                                    ?>
                                    </td>
                                    <td><font style="color:brown;"><?php echo $row['due_date']; ?></td>
                                </tr>
                                <?php
                            }
                            ?>

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
