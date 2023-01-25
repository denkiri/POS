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
                <h1 class="page-header">Graph For Losses</h1>
              </div>
            </div>

            <!-- /.row -->

            <div class="content" id="content">
              <p> Graph For Losses According to Category</p>
              <div class="row">
                <?php 
                include('connect.php');
                $sql = "SELECT *, category as cat, sum(amount_lose) as qcount FROM lose GROUP BY category";
                $query = $db->prepare($sql); 
                $query->execute();
                $fetch = $query->fetchAll();
                foreach ($fetch as $key => $value) {
                  $data[] = array('title'=>$value['cat'], 'value'=>$value['qcount']);
                }
				if(empty($data)){ 
                          echo "No Losses"; 
				}else{
                $d = json_encode($data);
				}
                ?>
                <div class="col-lg-12">
                  <div id="chart" style="height: 500px;"></div>
                  <div>
                   <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">

                    <thead>
                      <tr>

                        <th class = "hidden">  id </th>
                        <th> Brand Name </th>
                        <th> Description Name </th>
                        <th> Category</th>
                        <th> Total Amount Lose</th>
                        <th> Total Quantity Lose</th>
                        <th> Cost</th>
                        <th> Transaction Date </th>

                      </tr>
                    </thead>
                    <tbody>

                      <?php
                      include('connect.php');
                      $result = $db->prepare("SELECT * FROM lose");
                      $result->execute();
                      for($i=0; $row = $result->fetch(); $i++){
                        ?>
                        <tr class="record">
                          <td class = "hidden"><?php echo $row['p_id']; ?></td>
                          <td><?php echo $row['product_name']; ?></td>
                          <td><?php echo $row['description_name']; ?></td>
                          <td><?php echo $row['category']; ?></td>
                          <td align="right"><?php echo $row['amount_lose']; ?></td>
                          <td align="right"><?php echo $row['qty']; ?></td>
                          <td align="right"><?php echo $row['cost']; ?></td>
                          <td align="right"><?php echo $row['date']; ?></td>
                        </tr>
                        <?php
                      }
                      ?>

                    </tbody>
                  </table>

                </div>
              </div>
            </div>
          </div>
          <a href="javascript:Clickheretoprint()" style="font-size:15px"; class="btn btn-primary"><i class="fa fa-print"></i>Print</a>
        </div>
        <!-- /.container-fluid -->
      </div>
      <!-- /#page-wrapper -->

      <!-- jQuery -->
      <script src="../vendor/jquery/jquery.min.js"></script>

      <script src="plugins/amcharts/amcharts.js"></script>
      <script src="plugins/amcharts/animate.min.js"></script>
      <script src="plugins/amcharts/themes/light.js"></script>
      <script src="plugins/amcharts/export/export.min.js"></script>
      <script src="plugins/amcharts/themes/patterns.js"></script>
      <script type="plugins/export/export.css" type="text/css" media="all""></script>
      <script src="plugins/amcharts/plugins/responsive/responsive.min.js"></script>
      <script src="plugins/amcharts/serial.js"></script>
      <script src="plugins/amcharts/pie.js"></script>


      <script type="text/javascript">
        var raw = '<?php echo $d; ?>';
        var data = JSON.parse(raw);
        var chart = AmCharts.makeChart( "chart", {
          "type": "pie",
          "theme": "light",
          "dataProvider": data ,
          "titleField": "title",
          "valueField": "value",
          "labelRadius": 25,

          "radius": "37%",
          "innerRadius": "40%",
          "labelText": " [[title]] ([[percents]]%)",
          "export": {
            "enabled": true
          },
          "depth3D": 10,
          "angle": 17,
          "fontFamily": "Helvetica",
          "fontSize": 13,
          "balloonText": "[[value]]",
          "color": "#222",
        // "colors": ['#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222', '#222']
        "colors": ['#FF6600', '#FCD202', '#B0DE09', '#0D8ECF', '#2A0CD0', '#CD0D74', '#CC0000', '#00CC00', '#0000CC', '#DDDDDD', '#999999', '#222333', '#990000']
      } );
    </script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

  </body>

  </html>
