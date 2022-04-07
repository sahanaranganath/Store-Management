<?php
include('include/config.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Report</title>

	 <!-- Required meta tags -->
	 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="css/theme.css" rel="stylesheet">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
	<script language="javascript" type="text/javascript">
var popUpWin=0;
function popUpWindow(URLStr, left, top, width, height)
{
 if(popUpWin)
{
if(!popUpWin.closed) popUpWin.close();
}
popUpWin = open(URLStr,'popUpWin', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=yes,width='+600+',height='+600+',left='+left+', top='+top+',screenX='+left+',screenY='+top+'');
}

</script>

<style>
    body{
        background-color:#f5f5f5;
        margin-left: 100px;
    }
    </style>
</head>
<body style=" topmargin=100px leftmargin=100px rightmargin=100px">


<div class="col-sm-9 mt-5">
<a class="btn text-success" href="todays-orders.php" style="background-color: #ADD8E6;">Back</a>
  <h2 class="text-center my-4" style=" background-color: #E6E6FA; font-weight: bold; font-size: 30px; margin-top: 20px">Check the order summary </h2>
      <form action="" method="POST" class="d-print-none">
        <div class="form-row">
          <div class="form-group col-md-2">
            <input type="date" class="form-control" id="startdate" name="startdate"  style="height:40px">
          </div> <span  style="height:40px ;font-weight: bold; font-size: 30px; margin-top: 20px"> to </span>
          <div class="form-group col-md-2">
            <input type="date" class="form-control" id="enddate" name="enddate"  style="height:40px">
          </div>
          <div class="form-group">
            <input type="submit" class="btn btn-success" name="searchsubmit" value="Search">
          </div>
        </div>
      </form>
      <?php
    if(isset($_REQUEST['searchsubmit'])){
      ?>  <div class="module-head">
                      <h3>Order Report</h3>
                    </div>
                    <?php
        $startdate = $_REQUEST['startdate'];
        $enddate = $_REQUEST['enddate'];
        // $sql = "SELECT * FROM courseorder WHERE order_date BETWEEN '2018-10-11' AND '2018-10-13'";
        $sql_sp = "CALL `report`('$startdate','$enddate')";
        $cnt=1;
      $total=0;
        if($res_sp = mysqli_query($con,$sql_sp)) { ?>


          <div class="wrapper">
          <div class="container">
            <div class="row">
            
            <div class="span9">
                <div class="content">
      
        <div class="module">
        <table cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped	 display table-responsive" >
                        <thead>
                          <tr>
                            <th>#</th>
                            <th> Customer</th>
                            <th width="50">Contact no</th>
                            
                            <th>Product </th>
                            <th>Qty </th>
                            <th>Amount </th>
                            <th>Order Date</th>
                            
                            
                          
                          </tr>
                        </thead>
                      
      <tbody>
          <?php
            while($row_sp = mysqli_fetch_row($res_sp)){
     ?>
         
                    
      
                  
                      
										
                          <tr>
                            <td><?php echo htmlentities($cnt);?></td>
                            <td><?php echo htmlentities($row_sp["0"]);?></td>
                            <td><?php echo htmlentities($row_sp["1"]);?></td>
                          
                            
                            <td><?php echo htmlentities($row_sp["2"]);?></td>
                            <td><?php echo htmlentities($row_sp["3"]);?></td>
                            <td><?php 
                            
                            echo htmlentities($row_sp["3"]*$row_sp["4"]+$row_sp["5"]);?></td>
                            <td><?php echo htmlentities($row_sp["6"]);?></td>
                            
                            </td>
                            </tr>
      
                          <?php $cnt=$cnt+1;
                          $total= $total+($row_sp["3"]*$row_sp["4"]+$row_sp["5"]);
                         } ?>
                          </tbody>
                      </table>
                    </div>
                  </div>						
                 <h1>The total income is: Rs. <?php echo htmlentities($total);?>/-</h1>
                  		
                  
                </div><!--/.content-->
              </div><!--/.span9-->
            </div>
          </div><!--/.container-->
        </div><!--/.wrapper-->
        <button class="btn btn-primary" onclick="javascript:window.print();">Print Receipt</button></td> <?php
      } else {
        echo "<div class='alert alert-warning col-sm-6 ml-5 mt-2' role='alert'> No Records Found ! </div>";
      }
    }
      ?>
        </div>
        </div>
  </div>
 
 
  </div>  <!-- div Row close from header -->
 </div>  <!-- div Conatiner-fluid close from header -->
 

 

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function() {
			$('.datatable-1').dataTable();
			$('.dataTables_paginate').addClass("btn-group datatable-pagination");
			$('.dataTables_paginate > a').wrapInner('<span />');
			$('.dataTables_paginate > a:first-child').append('<i class="icon-chevron-left shaded"></i>');
			$('.dataTables_paginate > a:last-child').append('<i class="icon-chevron-right shaded"></i>');
		} );
	</script>
</body>
