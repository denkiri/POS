<?php
require_once('auth.php');
require_once('header.html')
?>
<body>
   <?php include('navfixed.php');?>


    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">CASHIER LIST</h1>
            </div>
            <div id="maintable"><div style="margin-top: -19px; margin-bottom: 21px;">
			       <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">

                        <thead>
                            <tr>
                                <th> Code </th>
                                <th> Username</th>
                                <th> Password </th>
                                <th> Name</th>
                                <th> Position </th>
                                <th> Action </th>
                            </tr>
                        </thead>
                        <tbody>
	  <?php	
	    include('connect.php');
						//	 "SELECT * FROM questions ,categories WHERE categoryid = 1 && cat_id=1"
                            $result = $db->prepare("SELECT * FROM cashier");
                            $result->execute();
                            for($i=0; $row = $result->fetch(); $i++){
                                ?>
                                <tr class="record">
                                    <td><?php echo $row['cashier_id']; ?></td>
                                    <td><?php echo $row['username']; ?></td>
                                    <td><?php echo $row['password']; ?></td>
                                    <td><?php echo $row['cashier_name']; ?></td>
									 <td><?php echo $row['position']; ?></td>
                                            <td><a rel="facebox" class = "btn btn-primary" href="editcashier.php?id=<?php echo $row['cashier_id']; ?>">
                                                <i class="fa fa-pencil"></i>  
                                            </a>  
                                          <a href="#" id="<?php echo $row['cashier_id']; ?>" class="btn btn-danger delbutton" title="Click To Delete">
                                    <i class="fa fa-trash"></i>
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
     url: "deletecashier.php",
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
</body>