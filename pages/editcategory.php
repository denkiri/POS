<?php
	include('connect.php');
	$id=$_GET['id'];
	$result = $db->prepare("SELECT * FROM categories WHERE category_id= :userid");
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
<form action="saveeditcategory.php" method="post" class = "form-group">
<div id="ac">
<input type="hidden" class = "form-control" name="memi" value="<?php echo $id; ?>" />
<input type="hidden" class = "form-control" name="categname" value="<?php echo $row['category_name']; ?>"/>
<span>Name : </span><input type="text" class = "form-control"  name="name" value="<?php echo $row['category_name']; ?>" />
<span>&nbsp;</span><input class="btn btn-primary btn-block" type="submit" value="save" class = "form-control" />
</div>
</form>
<?php
}
?>