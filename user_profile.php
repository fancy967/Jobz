<?php
  require_once 'connect.php';//include the connect page

  session_start();  //begin the session so as to recall the user's personal information

?>

<!DOCTYPE HTML>
<html>

<head>
  <title>User profile</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <script type = "text/javascript" src = "javascript/ecommerce.js"></script>
</head>

<body>
  <div id="main">
    <div id="header">
      <div id="logo">
        <div id="logo_text">
            <h1>Online<font color="green">Jobs</h1>
          <h2>Choose the job that fits you.</h2>
        </div>
      </div>
      <div id="menubar">
        <ul id="menu">
           <li><a href="index.html">Home</a></li>
           <li><a href="about.html">About</a></li>
           <li><a href="search.html">Find jobs</a></li>
           <li><a href="myjobs.html">My Jobs</a></li>
            <li><a href="#" onmouseover="contact('contactmenu')" onmouseout="mclosetime()">Contact</a>
                <div id="contactmenu" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
                    <a href="contact.html">Information</a>
                    <a href="contact_form.html">Form</a>
                    <a href="terms_of_use.html">Terms of Use</a>
               </div>
           </li>   
        </ul>
      </div>
    </div>
    <div id="content_header"></div>

<br />
<a href="edit_profile.html"> Edit </a> Profile &nbsp;&nbsp;||&nbsp;&nbsp;||<a href="delete_profile.php">Delete </a> Profile
    <?php

    echo '<h4>' . $_SESSION['username'] . '</h4>';
 $user_username = $_SESSION['username'];

    //select everything from the table book where the username is similar to the variable user_username
 $sql = "SELECT * FROM user WHERE Name= '".$user_username."'";
 
 //establish a connection
 $con = mysql_connect("localhost","root","", "job_seeker");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }

  //select a database
mysql_select_db("job_seeker", $con);

echo "<center>";
?>


<?php
//the table's information


//execute the statement
$data = mysql_query($sql, $con) or die(mysql_error());


while ($result = mysql_fetch_array($data)) {


echo "<tr>";
  //creation of variables to hold the values of the database items
  $name = $result ['Name'];
  $email = $result['Email'];
  $address = $result['Address'];
  $postal_code = $result['Postal_Code'];
  $numberOfJobs = $result ['Number_Of_Jobs'];
  $phone_number = $result ['Phone_Number'];
  $date_of_birth = $result ['Date_Of_Birth'];
  $user_username = $result ['Name'];
  $password = $result ['password'];


 echo "<center>";

 ?>
 <table width="400" height="347" border="1" bgcolor="#66CC99">
 <tr>
  <td align="center"width ="400"> <b>User profile </b></td>
   </tr> 
  <tr>
    <td><b>Name</b></td>
   <?php  echo "<td>" .  $name . "</td>"; ?>
  </tr>
  <tr>
    <td><b>E-mail</b></td>
    <?php echo "<td>" . $email . "</td>"; ?>
  </tr>
  <tr>
    <td><b>Address</b></td>
   <?php echo "<td>" . $address . "</td>"; ?>
  </tr>
  <tr>
    <td><b>Postal code</b></td>
    <?php  echo "<td>" .  $postal_code . "</td>"; ?>
  </tr>
  <tr>
    <td><b>Number of jobs</b></td>
   <?php echo "<td>" . $numberOfJobs . "</td>"; ?>
  </tr>
  <tr>
    <td><b>Phone number</b></td>
    <?php echo "<td>" . $phone_number . "</td>"; ?>
  </tr>
  <tr>
    <td><b>Date of birth</b></td>
   <?php echo "<td>" . $date_of_birth . "</td>"; ?>
  </tr>
  <tr>
    <td><b>username</b></td>
   <?php echo "<td>" . $user_username . "</td>"; ?>
  </tr>
  <tr>
    <td><b>password</b></td>
   <?php  echo "<td>" . $password . "</td>"; ?>
  </tr>
  <?php   } ?>
  
  </table>
</body>
</html>