<?php
if(!isset($_SESSION)){ 
  session_start(); 
}

include('include/config.php');

if(strlen($_SESSION['alogin'])==0)
	{	
header('location:index.php');
}
else{
date_default_timezone_set('Asia/Kolkata');// change according timezone
$currentTime = date( 'd-m-Y h:i:s A', time () );
$sql = "SELECT * FROM products";
$result = $con->query($sql);
$totalproducts = $result->num_rows;

 $sql = "SELECT * FROM category";
 $result = $con->query($sql);
 $totalcategory = $result->num_rows;

 $sql = "SELECT * FROM orders";
 $result = $con->query($sql);
 $totalorders = $result->num_rows;

 $sql = "SELECT * FROM users";
$result = $con->query($sql);
$totalusers = $result->num_rows;
?>


<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Dashboard</title>

    <style>
      body{
       
        margin-top: 20px;
        margin-right: 110px;
        background-color:#f5f5f5;
        margin-left: 100px;
      }
     </style> 
  </head>
  
  <body>
	<div class="wrapper">
		<div class="container">
			<div class="row">
			
			<div class="span9">
					<div class="content">

	<div class="module">
							<div class="module-head" >
   
 
  <a class="btn text-success" href="todays-orders.php" style="background-color: #ADD8E6; ">Back</a>
    <p style="font-size: 55px">Welcome to the Admin panel!</p>
  
    <div class="row mx-5 text-center">
  
      <div class="col-sm-4 mt-5">
        <div class="card text-black  mb-3 " style="max-width: 18rem; background-color: #ADD8E6;">
          <div class="card-header" style="font-weight: bold;">Products</div>
          <div class="card-body">
            <h4 class="card-title" style="color: white; font-size: 30px;">
              <?php echo $totalproducts; ?>
            </h4>
            <a class="btn text-black" href="manage-products.php">View</a>
          </div>
        </div>
      </div>
     
      <div class="col-sm-4 mt-5">
        <div class="card text-black  mb-3" style="max-width: 18rem; background-color: #90EE90;">
          <div class="card-header" style="font-weight: bold;">Category</div>
          <div class="card-body">
            <h4 class="card-title" style="color: white; font-size: 30px;">
              <?php echo $totalcategory; ?>
            </h4>
            <a class="btn text-black" href="category.php">View</a>
          </div>
        </div>
      </div>
      <div class="col-sm-4 mt-5">
        <div class="card text-black mb-3" style="max-width: 18rem;background-color: #E6E6FA;">
          <div class="card-header" style="font-weight: bold;">Total Orders</div>
          <div class="card-body">
            <h4 class="card-title" style="color: white; font-size: 30px;">
              <?php echo $totalorders; ?>
            </h4>
            <a class="btn text-black" href="report.php">View</a>
          </div>
        </div>
      </div>
      <div class="col-sm-4 mt-5">
        <div class="card text-black  mb-3" style="max-width: 18rem; background-color: #F0E68C; ">
          <div class="card-header" style="font-weight: bold;">Users</div>
          <div class="card-body">
            <h4 class="card-title" style="color: white; font-size: 30px;">
              <?php echo $totalusers; ?>
            </h4>
            <a class="btn text-black" href="manage-users.php">View</a>
          </div>
        </div>
      </div>
      
      

      
    </div>
    <div class="mx-5 mt-5 text-center">
      <!--Table-->
      <p class=" bg-dark text-white p-2">Number of products under each category</p>
      <?php
      $sql_sp = "CALL `countcategory`();";
        $cnt=1;
    
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
                            <th> Category Name</th>
                            <th width="50">Number of Products</th>
       
                          </tr>
                        </thead>
                      
      <tbody>
          <?php
            while($row_sp = mysqli_fetch_row($res_sp)){
     ?>
         
                    
      
                  
                      
										
                          <tr>
                            <td><?php echo htmlentities($cnt);?></td>
                            <td><?php echo htmlentities($row_sp["1"]);?></td>
                            <td><?php echo htmlentities($row_sp["2"]);?></td>
                          
                          
                            </tr>
      
                          <?php $cnt=$cnt+1;
                        
                         } ?>
                          </tbody>
                      </table>
                    </div>
                  </div>						
                 
                  		
                  
                </div><!--/.content-->
              </div><!--/.span9-->
            </div>
          </div><!--/.container-->
        </div><!--/.wrapper-->
         <?php
      } else {
        echo "<div class='alert alert-warning col-sm-6 ml-5 mt-2' role='alert'> No Records Found ! </div>";
      } 
 
  ?>
    </div>
  </div>
  </div>
  </div>
  
  </div>  <!-- div Row close from header -->
 </div>  <!-- div Conatiner-fluid close from header -->


<!-- Optional JavaScript; choose one of the two! -->

<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
-->
</body>
</html>
<?php } ?>
