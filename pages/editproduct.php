<?php
	include('connect.php');
	$id=$_GET['id'];
	$result = $db->prepare("SELECT * FROM products,supliers WHERE product_id= :userid && products.supplier=supliers.suplier_id ");
	$result->bindParam(':userid', $id);
	$result->execute();
	for($i=0; $row = $result->fetch(); $i++){
?>

	<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- MetisMenu CSS -->
	<link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

	<!-- Custom CSS -->
	<link href="../dist/css/sb-admin-2.css" rel="stylesheet">

	<!-- Custom Fonts -->
	<link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


<form action="saveeditproduct.php" method="post" class = "form-group">
<div id="ac">
<input type="hidden" name="memi" value="<?php echo $id; ?>" />
<span>Product Code : </span><input type="text"required name="code" class = "form-control" value="<?php echo $row['product_code']; ?>" />
<span>Product Name : </span><input type="text"required name="bname" class = "form-control" value="<?php echo $row['product_name']; ?>" />
<span>Description Name : </span><input type="text" name="dname" class = "form-control" value="<?php echo $row['description_name']; ?>" />
<span>Quantity left: </span><input type="number"required name="qleft" class = "form-control" value="<?php echo $row['qty_left']; ?>" />
<span>Cost : </span><input type="number" step="any" required name="cost" class = "form-control" value="<?php echo $row['cost']; ?>" <span>Price : </span>
<input type="number" step="any" required name="price" class = "form-control" value="<?php echo $row['price']; ?>" />
<span>Supplier : </span>
<select name="supplier"required class = "form-control" >
	<option value= <?php echo $row['suplier_id']; ?>><?php echo $row['suplier_name']; ?></option>
	<?php
	$results = $db->prepare("SELECT * FROM supliers");
		$results->bindParam(':userid', $res);
		$results->execute();
		for($i=0; $rows = $results->fetch(); $i++){
	?>
		<option value= <?php echo $rows['suplier_id']; ?>><?php echo $rows['suplier_name']; ?></option>
	<?php
	}
	?>
</select>
<span>Category: </span>
<select name="categ"required class = "form-control" >
                            <option><?php echo $row['category']; ?>	</option>
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
	   <span>Product Unit : </span>
                            <select name="unit"required class = "form-control" >
							<?php
	include('connect.php');
	$id=$_GET['id'];
	$result = $db->prepare("SELECT * FROM products,supliers WHERE product_id= :userid && Products.supplier=supliers.suplier_id ");
	$result->bindParam(':userid', $id);
	$result->execute();
	for($i=0; $row = $result->fetch(); $i++){	
?>
 <option><?php echo $row['unit']; ?></option>
 <?php
	}
	?>
							
                            <option>Per Pieces</option>
                            <option>Per Box</option>
							<option>Per Tablet</option>
                            <option>Per Pack</option>
							<option>Per Bottle</option>
							<option>per sachet</option>
							<option>Per Kit</option>
							<option>per Item</option>
                            </select>						
<span>&nbsp;</span><input class="btn btn-primary btn-block" type="submit" class = "form-control" value="Update" />
</div>
</form>
<?php
}
?>