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
                    <h1 class="page-header">Sales Report</h1>
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
                                <th > Type of Payment </th>
                                <th > Total Sales </th>
                                <th > Balance </th>
                                <th > Action </th>
                            </tr>
                        </thead>
                        <tbody>

                            <?php
                            include('connect.php');
                            $tftft=$_GET['selectedDate'];
                            $result = $db->prepare("SELECT * FROM sales WHERE date= ?");
                            $result->execute(array($tftft));
                            for($i=0; $row = $result->fetch(); $i++){
                                ?>
                                <tr class="record">
                                    <td>STI-000<?php echo $row['transaction_id']; ?></td>
                                    <td><?php echo $row['date']; ?></td>
                                    <td><?php echo $row['name']; ?></td>
                                    <td><?php echo $row['invoice_number']; ?></td>
                                    <td><?php echo $row['type']; ?></td>
                                    <td><?php
                                        $dsdsd=$row['amount'];
                                        echo formatMoney($dsdsd, true);
                                        ?>
                                    </td>
                                    <td><?php
                                        $d=$row['balance'];
                                        echo formatMoney($d, true);
                                        ?>
                                    </td>
                                    <td>
                                        <a href="#" id="<?php echo $row['transaction_id']; ?>" class="btn btn-danger delbutton" title="Click To Delete">
                                            <span><i class="fa fa-trash"></i></span>
                                        </a>
                                        &nbsp;
                                        <a class="btn btn-primary" href="salesprint.php?id=<?php echo $row['invoice_number']; ?>">
                                            <span><i class="fa fa-print"></i></span>
                                        </a>
                                    </td>
                                </tr>
                                <?php
                            }
                            ?>

                        </tbody>
                        <thead>
                            <tr>
                                <th colspan="5" style="border-top:1px solid #999999"> Total Amount </th>
                                <th colspan="4" style="border-top:1px solid #999999"> 
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
                                    $results = $db->prepare("SELECT sum(amount) FROM sales WHERE date= ? ");
                                    $results->execute(array($tftft));
                                    for($i=0; $rows = $results->fetch(); $i++){
                                        $dsdsda=$rows['sum(amount)'];
                                        echo formatMoney($dsdsda, true);
                                    }
                                    ?>
                                </th>
                            </tr>
                        </thead>
						<thead>
                            <tr>
                                <th colspan="5" style="border-top:1px solid #999999"> Total Cost </th>
                                <th colspan="4" style="border-top:1px solid #999999"> 
                                    <?php
                                    $results = $db->prepare("SELECT sum(total_cost) FROM sales_order WHERE date= ?");
                                    $results->execute(array($tftft));
                                    for($i=0; $rows = $results->fetch(); $i++){
                                        $dsdsdb=$rows['sum(total_cost)'];
                                        echo formatMoney($dsdsdb, true);
                                    }
                                    ?>
                                </th>
                            </tr>
                        </thead>
							<thead>
                            <tr>
                                <th colspan="5" style="border-top:1px solid #999999"> Total Profit </th>
                                <th colspan="4" style="border-top:1px solid #999999"> 
                                    <?php
                                        $dsdsds= $dsdsda - $dsdsdb;
                                        echo formatMoney($dsdsds, true);
                                    
                                    ?>
                                </th>
                            </tr>
                        </thead>
                        <thead>
                            <tr>
                            <th colspan="5" style="border-top:1px solid #999999" >Total balance </th>
                              <th colspan="1" style="border-top:1px solid #999999">
                                  <th colspan="2" style="border-top:1px solid #999999"> 
                                     <?php
                                     $results = $db->prepare("SELECT sum(balance) FROM sales WHERE date= ?");
                                     $results->execute(array($tftft));
                                     for($i=0; $rows = $results->fetch(); $i++){
                                        $dsdsd=$rows['sum(balance)'];
                                        echo formatMoney($dsdsd, true);
                                    }
                                    ?>
                                </th>
                            </tr>
                        </thead>   
                    </table>

                    <a href="" onclick="window.print()" class="btn btn-primary"><i class="icon-print icon-large"></i> Print</a>
                </div>
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
   url: "deletesales.php",
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

<script>
                function print() {
                    window.print();
                }
            </script>


</body>

</html>
