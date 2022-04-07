<?php
if(!isset($_SESSION)){ 
  session_start(); 
}
define('TITLE', 'Courses');
define('PAGE', 'courses');

include('../dbConnection.php');



@$sql="SELECT co.order_id,co.order_date ,co.stu_email, c.course_id, c.course_name, c.course_duration, c.course_desc, c.course_img, c.course_author, c.course_original_price, c.course_price FROM courseorder AS co JOIN course AS c ON c.course_id = co.course_id AND c.course_id = {$_REQUEST['checkid']} ";
          @$result = $conn->query($sql);
          @$totalstu = $result->num_rows;
 
 ?>

 <head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <meta http-equiv="X-UA-Compatible" content="ie=edge">
 <title>
  <?php echo TITLE ?>
 </title>
 <!-- Bootstrap CSS -->
 <link rel="stylesheet" href="../css/bootstrap.min.css">

 <!-- Font Awesome CSS -->
 <link rel="stylesheet" href="../css/all.min.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">


  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">

 <!-- Custom CSS -->
 <link rel="stylesheet" href="../css/adminstyle.css">

</head>


<div class="col-sm-9 mt-5  mx-3">

<a class="btn text-danger" href="adminDashboard.php">Back</a>
<p class="  text-white p-2" style="background-color: #ADD8E6; font-weight: bold; font-size: 30px">Enrollment under each course</p>
  <form action="" class="mt-3 form-inline d-print-none">
    <div class="form-group mr-3">
      <label for="checkid">Enter Course ID: </label>
      <input type="text" class="form-control ml-3" id="checkid" name="checkid" onkeypress="isInputNumber(event)">
    </div>
    <button type="submit" class="btn btn-success">Search</button>
  </form>
  
  <div class="col-sm-4 mt-5">
        <div class="card text-black  mb-3" style="max-width: 18rem; background-color: #90EE90;">
          <div class="card-header" style="font-weight: bold;"> Total Entrollment </div>
          <div class="card-body">
            <h4 class="card-title" style="color: white; font-size: 30px;">
              <?php echo $totalstu; ?>
            </h4>
            
          </div>
        </div>
      </div>
  <?php
  $sql = "SELECT course_id FROM course";
  $result = $conn->query($sql);
  while($row = $result->fetch_assoc()){
    if(isset($_REQUEST['checkid']) && $_REQUEST['checkid'] == $row['course_id']){
      $sql = "SELECT * FROM course WHERE course_id = {$_REQUEST['checkid']}";
      $result = $conn->query($sql);
      $row = $result->fetch_assoc();
      if(($row['course_id']) == $_REQUEST['checkid']){ 
        $_SESSION['course_id'] = $row['course_id'];
        $_SESSION['course_name'] = $row['course_name'];
        
        ?>
        <h3 class="mt-5 bg-dark text-white p-2">Course ID : <?php if(isset($row['course_id'])) {echo $row['course_id']; } else {
          echo '<div class="alert alert-dark mt-4" role="alert">
          Course Not Found ! </div>';
          
        } ?> Course Name: <?php if(isset($row['course_name'])) {echo $row['course_name']; } ?></h3>
        <?php
          
          $sql="SELECT co.order_id,co.order_date ,co.stu_email, c.course_id, c.course_name, c.course_duration, c.course_desc, c.course_img, c.course_author, c.course_original_price, c.course_price FROM courseorder AS co JOIN course AS c ON c.course_id = co.course_id AND c.course_id = {$_REQUEST['checkid']} ";
          $result = $conn->query($sql);
          $totalstu = $result->num_rows;
          
          
          echo '<table class="table">
          <thead>
           <tr>
            <th scope="col">Course ID</th>
            <th scope="col">Name</th>
            <th scope="col">Student list</th>
            <th scope="col">Registration date</th>
            
           </tr>
          </thead>
          <tbody>';
           while($row = $result->fetch_assoc()){
             echo '<tr>';
             echo '<th scope="row">'.$row["course_id"].'</th>';
             echo '<td>'. $row["course_name"].'</td>';
             echo '<td>'.$row["stu_email"].'</td>';
             echo '<td>'.$row["order_date"].'</td>';
             echo '</tr>';
           }
   
           echo '</tbody>
           </table>';
         } else {
           echo "0 Result";
         }
   
        
     
   } 
   
   
  }?>
  
</div>
<!-- Only Number for input fields -->
<script>
  function isInputNumber(evt) {
    var ch = String.fromCharCode(evt.which);
    if (!(/[0-9]/.test(ch))) {
      evt.preventDefault();
    }
  }
</script>
 </div>  <!-- div Row close from header -->

 
</div>  <!-- div Conatiner-fluid close from header -->
<?php
include('./adminInclude/footer.php'); 
?>