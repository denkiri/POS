 <!DOCTYPE html>
<html>
<head>
<script>
function validateForm() {
  var x = document.forms["myForm"]["qty"].value;
  var y = document.forms["myForm"]["bname"].value;
  var z = parseInt(document.forms["myForm"]["cost"].value;)
  var a = parseInt(document.forms["myForm"]["price"].value);
  
 
  if (y== "" || y == null) {
    alert("Product Name must be filled out");
    return false;
  }
 
   if (z == "" || z == null) {
    alert("Cost must be filled out");
    return false;
  }
   if (a == "" || x == null) {
    alert("Price must be filled out");
    return false;
  }
    if (x == "" || x == null) {
    alert("Quantity must be filled out");
    return false;
  }
  if(a <= z){
	  alert("Price must be higher than cost");
	  return false;
  }
}
</script>
</head>
<body>
 <div class="panel-body">
    <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Add Product</h4>
                </div>
                <div class="modal-body">
                    <form name="myForm" action="saveproduct.php" onsubmit="return validateForm()" method="post" class = "form-group" required>
                        <div id="ac">
                            <span>Category: </span>
                            <select name="categ" required class = "form-control" >
                            <?php
                                include('connect.php');
                                $result = $db->prepare("SELECT * FROM categories");
                                $result->bindParam(':userid', $res);
                                $result->execute();
                                for($i=0; $row = $result->fetch(); $i++){
                                    ?>
                                    <option value= <?php echo $row['category_name']; ?>><?php echo $row['category_name']; ?></option>
                                    <?php
                                }
                                ?>
                            </select>
                            <span>Product Code : </span><input type="text" name="code"required value = "<?php echo $pcode ?>" class = "form-control" />
                            <span>Product Name : </span><input type="text" name="bname"required class = "form-control" />
                            <span>Description Name : </span><input type="text" name="dname" class = "form-control" />
                            <span>Product Unit : </span>
                            <select name="unit"required class = "form-control" >
                            <option>Per Pieces</option>
                            <option>Per Box</option>
							<option>Per Tablet</option>
                            <option>Per Pack</option>
							<option>Per Bottle</option>
							<option>per sachet</option>
							<option>Per Kit</option>
							<option>per Item</option>
                            </select>
                            <span>Cost : </span><input type="number" step="any" name="cost"required class = "form-control" />
                            <span>Price : </span><input type="number" step="any" name="price" required class = "form-control" />
                            <span>Supplier : </span>
                            <select name="supplier" class = "form-control">
                                <?php
                                include('connect.php');
                                $result = $db->prepare("SELECT * FROM supliers");
                                $result->bindParam(':userid', $res);
                                $result->execute();
                                for($i=0; $row = $result->fetch(); $i++){
                                    ?>
                                    <option value= <?php echo $row['suplier_id']; ?>><?php echo $row['suplier_name']; ?></option>
                                    <?php
                                }
                                ?>
                            </select>
                            <span>Quantity : </span><input type="number" name="qty" min = "0" class = "form-control" />
                            <span></span><input hidden type="date" name="date_del" value="<?php echo date('m/d/Y')?>  class = "form-control" />
                            <span>Expiration Date: </span><input type="date"required name="ex_date" class = "form-control" />
                            <span>&nbsp;</span><input class="btn btn-primary btn-block" type="submit" class = "form-control" value="Save" />
                        </div>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
                        <!-- /.modal -->
	</body>
</html>					