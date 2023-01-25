<?php
require_once('auth.php');
require_once('header.html');
$year = date('Y');
 $month = date('F');
?>
<body>
	<div id="wrapper">

		<?php include('navfixed.php');?>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">Welcome:<strong> <?php echo $session_admin_name;?></strong></h3>
				</div>

				<!-- /.col-lg-12 -->
			</div>

				<!-- <div id="myCarousel" class="carousel slide">
				
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
						<li data-target="#myCarousel" data-slide-to="4"></li>

					</ol>

				
					<center>
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img src="pics/1.jpg" width="45%" height="10px" >
							</div>
							<div class="item">
								<img src="pics/2.jpg" width="45%" height="10px">
							</div>
							<div class="item">
								<img src="pics/3.jpg" width="45%" height="10px">
							</div>
							<div class="item">
								<img src="pics/6.jpg" width="45%" height="10px">
							</div>
							<div class="item">
								<img src="pics/7.jpg" width="45%" height="10px">
							</div>
						</div>
					</center>

				
					<a class="left carousel-control" href="#myCarousel" data-slide="prev" >
						<span class="icon-prev"></span>
					</a>
					<a class="right carousel-control" href="#myCarousel" data-slide="next">
						<span class="icon-next"></span>
					</a>
				</div> -->
	

				<div id="orayt">
				<a class="list-group-item" id="totalCategories"style="background-color:green;font-size:30px;">
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

						<?php 
						include('connect.php');
						$today = date('m/d/Y');
					    $month = date('F');
						$sql = "SELECT sum(amount) FROM sales WHERE date = ?";
						$query = $db->prepare($sql);
						$query->execute(array($today));
						$fetch = $query->fetchAll();

						foreach ($fetch as $key => $value) {
							$data1 = $value['sum(amount)'];
						}
						$json = json_encode($data1);
						?>

						<?php echo "<font style = 'color:white;'>Total Sales For Today:  </font>";
							echo  $today;  
						?></br>
						<?php
						echo "<font style = 'color:white;font-size:30px;'>Ksh "          .         formatMoney($data1, true) .       "</font>" . "            ";
					?> 
					 <span class="badge"style="background-color:black;"> Total Sales For Year:<?php echo $year;?>
					 	<?php 
						include('connect.php');
						$today = date('m/d/Y');
					    $month = date('F');
						$sql = "SELECT sum(amount) FROM sales WHERE year = ?";
						$query = $db->prepare($sql);
						$query->execute(array($year));
						$fetch = $query->fetchAll();
						foreach ($fetch as $key => $value) {
							$data8 = $value['sum(amount)'];
						}
						$json = json_encode($data8);?></br></br>
						<?php
							echo "<font style = 'color:white;font-size:18px;'>Ksh "   .   formatMoney($data8, true) .       "</font>" . "            ";
						?>
						</span>
                     <span class="badge"style="background-color:black;"> Total Sales For:<?php echo $month;?>
					 	<?php 
						include('connect.php');
						$today = date('m/d/Y');
					    $month = date('F');
						$sql = "SELECT sum(amount) FROM sales WHERE month = ? && year= ?";
						$query = $db->prepare($sql);
						$query->execute(array($month,$year));
						$fetch = $query->fetchAll();
						foreach ($fetch as $key => $value) {
							$data6 = $value['sum(amount)'];
						}
						$json = json_encode($data6);?></br></br>
						<?php
							echo "<font style = 'color:white;font-size:18px;'>Ksh "   .   formatMoney($data6, true) .       "</font>" . "            ";
						?>
						</span>
						
					</a>
					<a class="list-group-item" id="totalSales"style="background-color:#EE7600;font-size:30px;" >
						<?php 
						include('connect.php');
						$today = date('m/d/Y');
						 $month = date('F');
						$sql = "SELECT sum(total_cost) FROM sales_order WHERE  date= ?";
						$query = $db->prepare($sql);
						$query->execute(array($today));
						$fetch = $query->fetchAll();

						foreach ($fetch as $key => $value) {
							$data2 = $value['sum(total_cost)'];
						}
						$json = json_encode($data2);
						?>

						<?php echo "<font style = 'color:white;font-size:30px;'>Total cost of items sold Today: </font>";
							echo  $today; ?></br>
							
                        <?php							
						echo "<font style = 'color:white;'>Ksh "   .   formatMoney($data2, true) .       "</font>" . "            ";
						 ?> 
						 			  <span class="badge"style="background-color:black;"> Total Cost of items sold on Year:<?php echo $year;?>	 
                      <?php 
						include('connect.php');
						$today = date('m/d/Y');
						 $month = date('F');
						$sql = "SELECT sum(total_cost) FROM sales_order WHERE oyear= ?";
						$query = $db->prepare($sql);
						$query->execute(array($year));
						$fetch = $query->fetchAll();

						foreach ($fetch as $key => $value) {
							$data9 = $value['sum(total_cost)'];
						}
						$json = json_encode($data9);	?>
</br></br>						
					<?php	echo "<font style = 'color:white;font-size:18px;'>Ksh "   .   formatMoney($data9, true) .       "</font>" . "            ";
						 ?> 
						 </span>
					  <span class="badge"style="background-color:black;"> Total Cost of items sold on:<?php echo $month;?>	 
                      <?php 
						include('connect.php');
						$today = date('m/d/Y');
						 $month = date('F');
						$sql = "SELECT sum(total_cost) FROM sales_order WHERE omonth= ?  && oyear= ?";
						$query = $db->prepare($sql);
						$query->execute(array($month,$year));
						$fetch = $query->fetchAll();

						foreach ($fetch as $key => $value) {
							$data7 = $value['sum(total_cost)'];
						}
						$json = json_encode($data7);	?>
</br></br>						
					<?php	echo "<font style = 'color:white;font-size:18px;'>Ksh "   .   formatMoney($data7, true) .       "</font>" . "            ";
						 ?> 
						 </span>
					</a>
					<a class="list-group-item" id="totalCategories"style="background-color:green;font-size:30px;">
						<?php 
							$data =$data1-$data2;
						
						$json = json_encode($data);
						?>

						<?php echo "<font style = 'color:white;'>Total Profit for Today: </font>";
							echo  $today;?></br>
                        <?php							
						echo "<font style = 'color:white;font-size:30px;' >Ksh "   .   formatMoney($data, true) .       "</font>" . "            ";
					 ?>    <span class="badge"style="background-color:black;"> Total Profit For Year:<?php echo $year;?>
					  <?php 
					    include('connect.php');
					 $month = date('F');
						
						$sql = "SELECT sum(amount) FROM sales WHERE year= ?";
						$query = $db->prepare($sql);
						$query->execute(array($year));
						$fetch = $query->fetchAll();

						foreach ($fetch as $key => $value) {
							$data11 = $value['sum(amount)'];
						}
						$json = json_encode($data11);
						include('connect.php');
					   
						$sql = "SELECT sum(cost*qty) FROM products ,sales_order WHERE product_code = product  && oyear= ?";
						$query = $db->prepare($sql);
						$query->execute(array($year));
						$fetch = $query->fetchAll();

						foreach ($fetch as $key => $value) {
							$data12 = $value['sum(cost*qty)'];
						}
						$json = json_encode($data12);
                       
					  
							$data13 =$data11-$data12;
						
						$json = json_encode($data13);
						?>
					</br></br>
                        <?php							
						echo "<font style = 'color:white;font-size:18px;' >Ksh "   .   formatMoney($data13, true) .       "</font>" . "            ";
					 ?> 
					</span> 
                      <span class="badge"style="background-color:black;"> Total Profit For:<?php echo $month;?>
					  <?php 
					    include('connect.php');
					 $month = date('F');
						
						$sql = "SELECT sum(amount) FROM sales WHERE month= ?  && year= ?";
						$query = $db->prepare($sql);
						$query->execute(array($month,$year));
						$fetch = $query->fetchAll();

						foreach ($fetch as $key => $value) {
							$data5 = $value['sum(amount)'];
						}
						$json = json_encode($data5);
						include('connect.php');
					   
						$sql = "SELECT sum(cost*qty) FROM products ,sales_order WHERE product_code = product  && omonth= ?";
						$query = $db->prepare($sql);
						$query->execute(array($month));
						$fetch = $query->fetchAll();

						foreach ($fetch as $key => $value) {
							$data4 = $value['sum(cost*qty)'];
						}
						$json = json_encode($data4);
                       
					  
							$data3 =$data5-$data4;
						
						$json = json_encode($data3);
						?>
					</br></br>
                        <?php							
						echo "<font style = 'color:white;font-size:18px;'>Ksh "   .   formatMoney($data3, true) .       "</font>" . "            ";
					 ?> 
					</span> 
					</a>
					<a class="list-group-item" id="totalSales" href ="view_productqty.php"style="background-color:red;font-size:30px;">
						Re-Order<span class="badge"style="background-color:black;">
						<?php 
						include('connect.php');
						$result = $db->prepare("SELECT * FROM products where qty_left < 50 ORDER BY product_id DESC");
						$result->execute();
						$rowcount = $result->rowcount();
						?>
						<?php echo "<font style = 'color:white;'>" .$rowcount."</font>" ;?>
					</span>
				</a>
				<a class="list-group-item" id="totalCategories" href ="view_customer.php"style="background-color:green;font-size:30px;">
					Credits Due today: <?php echo "$today" ?> <span class="badge"style="background-color:black;">
					<?php
					include('connect.php'); 
					$today = date('Y-m-d');
					$sql = "SELECT * FROM sales WHERE due_date = ?";
					$query = $db->prepare($sql);
					$query->execute(array($today));
					$fetch = $query->fetchAll();
					$rowcount = $query->rowcount();
					?>
					
					<?php echo "<font style = 'color:white;font-size:18px;'>"  .$rowcount."</font>";  ?>  
				</span>
			</a>
			<a class="list-group-item" id="totalSales" href ="view_exproduct.php"style="background-color:#EE7600;font-size:30px;" >
				Product Expiration:<?php echo "$today" ?>  <span class="badge"style="background-color:black;">
				<?php
				include('connect.php'); 
				$today = date('Y-m-d');
				$sql = "SELECT * FROM products WHERE products.expiration_date >= DATE(now())
				AND
				products.expiration_date <= DATE_ADD(DATE(now()), INTERVAL 1 MONTH)";
				$query = $db->prepare($sql);
				$query->execute(array($today));
				$fetch = $query->fetchAll();
				$rowcount = $query->rowcount();
				?>
				<?php echo "<font style = 'color:white;font-size:18px;' >"  .$rowcount."</font>";?>   
			</span>
		</a>
		<!--<a class="list-group-item"  href ="view_overdue.php">
			Overdue <span class="badge">
			<?php
			include('connect.php'); 
			$today = date('Y-m-d');
			$sql = "SELECT due_date FROM sales WHERE DATE(due_date) = DATE( DATE_SUB( NOW() , INTERVAL 1 DAY ) )";
			$query = $db->prepare($sql);
			$query->execute(array($today));
			$fetch = $query->fetchAll();
			$rowcount = $query->rowcount();
			?>
			[<?php echo $rowcount;?>]  <?php echo "$today" ?> 
		</span>
	</a>-->
</div>


<!-- /.row -->
</div>
<!-- /.row -->
</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->


<!-- jQuery -->
<script src="../vendor/jquery/jquery.min.js"></script>


<!-- Bootstrap Core JavaScript -->
<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="../vendor/metisMenu/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="../vendor/raphael/raphael.min.js"></script>
<script src="../vendor/morrisjs/morris.min.js"></script>
<script src="../data/morris-data.js"></script>

<!-- Custom Theme JavaScript -->
<script src="../dist/js/sb-admin-2.js"></script>
<script>
	$('.carousel').carousel({
        interval: 3000 //changes the speed
    })
</script>

</body>

</html>
