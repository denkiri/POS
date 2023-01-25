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
                    <h1 class="page-header">Accounts Receivables Report</h1>
                </div>
            </div>
            <div id="maintable">
                <div style="margin-top: -19px; margin-bottom: 21px;">
                </div>
                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr>
                                <th > Transaction ID </th>
                                <th > Date </th>
                                <th > Customer Name </th>
                                <th > Invoice Number </th>
                                <th > Overall Balance </th>
                                <th > Due Date </th>
                            </tr>
                        </thead>
                        <tbody>

                            <?php
                            include('connect.php');
                            $c='credit';
                            $d='paid';
                            $result = $db->prepare("SELECT * FROM sales WHERE type=:c AND due_date!= :d");
                            $result->bindParam(':c', $c);
                            $result->bindParam(':d', $d);
                            $result->execute();
                            for($i=0; $row = $result->fetch(); $i++){
                                ?>
                                <tr class="record">
                                    <td>STI-000<?php echo $row['transaction_id']; ?></td>
                                    <td><?php echo $row['date']; ?></td>
                                    <td><?php echo $row['name']; ?></td>
                                    <td><?php echo $row['invoice_number']; ?></td>
                                    <td><?php
                                        $dsdsd=$row['balance'];
                                        echo formatMoney($dsdsd, true);
                                        ?></td>
                                        <td><?php echo $row['due_date']; ?></td>
                                    </tr>
                                    <?php
                                }
                                ?>

                            </tbody>
                            <thead>
                                <tr>
                                    <th colspan="4" style="border-top:1px solid #999999"> Total </th>
                                    <th colspan="3" style="border-top:1px solid #999999"> 
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
                                        $c='credit';
                                        $results = $db->prepare("SELECT sum(balance) FROM sales WHERE type=:c");
                                        $results->bindParam(':c', $c);
                                        $results->execute();
                                        for($i=0; $rows = $results->fetch(); $i++){
                                            $dsdsd=$rows['sum(balance)'];
                                            echo formatMoney($dsdsd, true);
                                        }
                                        ?>
                                    </th>
                                </tr>
                            </thead>
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
