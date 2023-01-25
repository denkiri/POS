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
                    <h1 class="page-header">Supplier Products</h1>
                </div>

                <div id="maintable"><div style="margin-top: -19px; margin-bottom: 21px;">
                    <a class = "btn btn-primary" href = "supplier.php" ><i class = "fa fa-arrow-left"> Back</i></a>
                </div>
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
//	 "SELECT * FROM questions ,categories WHERE categoryid = 1 && cat_id=1"
    $result = $db->prepare("SELECT * FROM products,supliers WHERE products.supplier=supliers.suplier_id AND products.supplier =$id ORDER BY product_name");
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
