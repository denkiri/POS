<?php
require_once('auth.php');
require_once('header.html');
$year = date('Y');
?>

<body>


    <?php include('navfixed.php');?>    

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Monthly Sales</h1>
                </div>


                <div class="content" id="content">
                    <p> Monthly Sales Chart</p>
                    <div class="row">
                        <?php 
                        include('connect.php');
                        $sql = "SELECT *, month as mon, SUM(amount) as qcount FROM sales WHERE year = ? GROUP BY month ";
                        $query = $db->prepare($sql); 
                        $query->execute(array($year));
                        $fetch = $query->fetchAll();
                        foreach ($fetch as $key => $value) {
                            $data[] = array('title'=>$value['mon'], 'value'=>$value['qcount']);
                        }
                          if(empty($data)){ 
                          echo "No Sales "; 
				}else{
                $d = json_encode($data);
				}
                        ?>

                        <div id="chartdiv"></div>       
                    </div>
                </div>
            </div>
            <a href="javascript:Clickheretoprint()" style="font-size:15px"; class="btn btn-primary"><i class="fa fa-print"></i>Print</a>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>




    <!-- /#page-wrapper -->
    <script src="plugins/amcharts/amcharts.js"></script>
    <script src="plugins/amcharts/serial.js"></script>
    <script src="plugins/export/export.min.js"></script>
    <link rel="stylesheet" href="plugins/export/export.css" type="text/css" media="all" />
    <script src="plugins/amcharts/themes/light.js"></script>

    <script>

        var raw = '<?php echo $d; ?>';
        var data = JSON.parse(raw);
        var chart = AmCharts.makeChart( "chartdiv", {
          "type": "serial",
          "theme": "light",
          "dataProvider": data,
          "valueAxes": [ {
            "gridColor": "#FFFFFF",
            "gridAlpha": 0.2,
            "dashLength": 0
        } ],
        "gridAboveGraphs": true,
        "startDuration": 1,
        "graphs": [ {
            "balloonText": "[[category]]: <b>Total Sales [[value]]</b>",
            "fillAlphas": 0.8,
            "lineAlpha": 0.2,
            "type": "column",
            "valueField": "value"
        } ],
        "chartCursor": {
            "categoryBalloonEnabled": false,
            "cursorAlpha": 0,
            "zoomable": false
        },
        "categoryField": "title",
        "categoryAxis": {
            "gridPosition": "start",
            "gridAlpha": 0,
            "tickPosition": "start",
            "tickLength": 20
        },
        "export": {
            "enabled": true
        }

    } );
</script>




<!-- jQuery -->
<script src="../vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="../vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
