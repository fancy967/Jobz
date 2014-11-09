<?php
  require_once 'connect.php';//include the connect page

  session_start();  //begin the session so as to recall the user's personal information

?>



<?php

   echo '<h4>' . $_SESSION['username'] . '</h4>';
 $user_username = $_SESSION['username'];


mysql_connect("localhost","root","") or die("Connection Failed");
mysql_select_db("job_seeker")or die("Connection Failed");
$name = $_POST['person_name'];
$email = $_POST['email'];
$address = $_POST['address'];
$postal_code = $_POST['postal_code'];
$numberOfJobs = $_POST['number_of_jobs'];
$phone_number = $_POST['phone_number'];
$date_of_birth = $_POST['date_of_birth'];
$username = $_POST['username'];
$password = $_POST['password'];

$query = "UPDATE user SET Name = '$name', Email ='$email', Address ='$address',
 Postal_Code ='$postal_code', Number_Of_Jobs ='$numberOfJobs', Phone_Number ='$phone_number', Date_Of_Birth ='$date_of_birth',
 username ='$username', password ='$password' WHERE Name = '$user_username'";
if(mysql_query($query)){
echo "Your profile has been updated";}
else{
echo "There was a problem in order to update profile information";}
?>