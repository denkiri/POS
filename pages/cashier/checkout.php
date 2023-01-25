<html>
<head>
<title>Checkout</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.js"></script>
<script>
function suggest(inputString){
		if(inputString.length == 0) {
			$('#suggestions').fadeOut();
		} else {
		$('#country').addClass('load');
			$.post("autosuggestname.php", {queryString: ""+inputString+""}, function(data){
				if(data.length >0) {
					$('#suggestions').fadeIn();
					$('#suggestionsList').html(data);
					$('#country').removeClass('load');
				}
			});
		}
	}

	function fill(thisValue) {
		$('#country').val(thisValue);
		setTimeout("$('#suggestions').fadeOut();", 600);
	}

</script>

<style>
#result {
	height:20px;
	font-size:16px;
	font-family:Arial, Helvetica, sans-serif;
	color:#333;
	padding:5px;
	margin-bottom:10px;
	background-color:#FFFF99;
}
#country{
	border: 1px solid #999;
	background: #EEEEEE;
	padding: 5px 10px;
	box-shadow:0 1px 2px #ddd;
    -moz-box-shadow:0 1px 2px #ddd;
    -webkit-box-shadow:0 1px 2px #ddd;
}
.suggestionsBox {
	position: absolute;
	left: 10px;
	margin: 0;
	width: 268px;
	top: 40px;
	padding:0px;
	background-color: #000;
	color: #fff;
}
.suggestionList {
	margin: 0px;
	padding: 0px;
}
.suggestionList ul li {
	list-style:none;
	margin: 0px;
	padding: 6px;
	border-bottom:1px dotted #666;
	cursor: pointer;
}
.suggestionList ul li:hover {
	background-color: #FC3;
	color:#000;
}
.load{
background-image:url(loader.gif);
background-position:right;
background-repeat:no-repeat;
}

#suggest {
	position:relative;
}
.combopopup{
	padding:3px;
	width:268px;
	border:1px #CCC solid;
}

</style>	
</head>
<body onLoad="document.getElementById('country').focus();">

<?php
include('connect.php');
$asas=$_GET['pt'];

if($asas=='mpesa') {
   
?>
<form action="https://denkiri.000webhostapp.com/sales/pages/cashier/api/v1/payment/pay.php" method="post" class = "form-group" >
<div id="ac">
<input type="hidden" name="date" value="<?php echo date("m/d/Y"); ?>" />
<input type="hidden" name="invoice" value="<?php echo $_GET['invoice']; ?>" />
<input type="hidden" name="amount" value="<?php echo $_GET['total']; ?>" />
<input type="hidden" name="ptype" value="<?php echo $_GET['pt']; ?>" />
<input type="hidden" name="cashier" value="<?php echo $_GET['cashier']; ?>" />
<span>Mobile Number : </span><input type="number" placeholder="254700107838" name="phone" class = "form-control" /></br>
<input type="text"  size="25" value="" name="cname" id="country" onkeyup="suggest(this.value);" onblur="fill();" class="" autocomplete="off" placeholder="Enter Customer Name" style="width: 268px;" /><br><br>
     
      <div class="suggestionsBox" id="suggestions" style="display: none;">
        <div class="suggestionList" id="suggestionsList"> &nbsp; </div>
      </div>
<input type="text" name="mpesa" placeholder="Mpesa" style="width: 268px; margin-bottom: 15px;"readonly="readonly" class = "form-control" /><br>
<input class="btn btn-primary btn-block" type="submit" value="save" style="width: 268px;" />
</div>
</form>
<?php
}
else{
	?>
<form action="savesales.php" method="post" class = "form-group" >
<div id="ac">
<input type="hidden" name="date" value="<?php echo date("m/d/Y"); ?>" />
<input type="hidden" name="invoice" value="<?php echo $_GET['invoice']; ?>" />
<input type="hidden" name="amount" value="<?php echo $_GET['total']; ?>" />
<input type="hidden" name="ptype" value="<?php echo $_GET['pt']; ?>" />
<input type="hidden" name="cashier" value="<?php echo $_GET['cashier']; ?>" />
<input type="hidden" name="hamount" value="<?php echo $_GET['p_amount']; ?>" />
<?php
$asas=$_GET['pt'];
if($asas=='credit') {
?>
<label>Select Customer</label><br />
              <select  name="cname" required style="width:500px;" class="chzn-select">
                <option></option>
                <?php
                include('connect.php');
                $result = $db->prepare("SELECT * FROM customer");
                $result->bindParam(':userid', $res);
                $result->execute();
                for($i=0; $row = $result->fetch(); $i++){
                  ?>
                  <option value="<?php echo $row['first_name'];?> <?php echo $row['middle_name']; ?> <?php echo $row['last_name']; ?>"required 
                    <?php
                    if($row['first_name'] == '')
                    {
                      echo'disabled';
                    }
                    ?>
                    >
                    <?php echo $row['first_name']; ?>
                    - <?php echo $row['middle_name']; ?>
                    - <?php echo $row['last_name']; ?>
                   

                  </option><br />
                  <?php
                }
                ?>
              </select><br />
<?php
} if($asas=='cash') {
?>
<input type="text"  size="25" value="" name="cname" id="country" onkeyup="suggest(this.value);" onblur="fill();" class="" autocomplete="off" placeholder="Enter Customer Name" style="width: 268px;" /><br><br>
     
      <div class="suggestionsBox" id="suggestions" style="display: none;">
        <div class="suggestionList" id="suggestionsList"> &nbsp; </div>
      </div>
<?php
} 
?>

<?php
$asas=$_GET['pt'];
if($asas=='credit') {
	
?>
<br />
<label>Due Date</label>
<br /><input type="date" required name="TIME" placeholder="Due Date" style="width: 268px; margin-bottom: 15px;" /><br>
<?php
}
if($asas=='cash') {
?><input type="text" name="cash" placeholder="Cash" style="width: 268px; margin-bottom: 15px;"readonly="readonly" /><br>

<?php
}?>
<input class="btn btn-primary btn-block" type="submit" value="save" style="width: 268px;" />
</div>
</form>
<?php
}?>
      <!-- jQuery -->
      <script src="vendor/jquery/jquery.min.js"></script>

      <!-- Bootstrap Core JavaScript -->
      <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

      <!-- Metis Menu Plugin JavaScript -->
      <script src="vendor/metisMenu/metisMenu.min.js"></script>

      <!-- Custom Theme JavaScript -->
      <script src="dist/js/sb-admin-2.js"></script>

      <link href="vendor/chosen.min.css" rel="stylesheet" media="screen">
      <script src="vendor/chosen.jquery.min.js"></script>
      <script>
        $(function() {
          $(".chzn-select").chosen();

        });
      </script>
	  <script src="build/js/intlTelInput.js"></script>
	  <script>
    var input = document.querySelector("#phone");
    window.intlTelInput(input, {
		//window.intlTelInputGlobals.loadUtils("build/js/utils.js");
      // allowDropdown: false,
      // autoHideDialCode: false,
      // autoPlaceholder: "off",
      // dropdownContainer: document.body,
      // excludeCountries: ["us"],
      // formatOnDisplay: false,
      // geoIpLookup: function(callback) {
      //   $.get("http://ipinfo.io", function() {}, "jsonp").always(function(resp) {
      //     var countryCode = (resp && resp.country) ? resp.country : "";
      //     callback(countryCode);
      //   });
      // },
      // hiddenInput: "full_number",
      // initialCountry: "auto",
      // localizedCountries: { 'de': 'Deutschland' },
      // nationalMode: false,
       onlyCountries: ['ke'],
      // placeholderNumberType: "MOBILE",
      // preferredCountries: ['cn', 'jp'],
      // separateDialCode: true,
      utilsScript: "build/js/utils.js",
    });
  </script>
</body>
</html>