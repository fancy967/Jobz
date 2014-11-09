<?php
include 'connect.php';

session_start();
$profileId = $_GET['profileId'];
$dbc = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

$sql = "SELECT Name, Email, Address, Rating, Phone_Number, Date_Of_Birth  FROM `user` WHERE Profile_Id = '$profileId'" ;

$jobs_result = mysqli_query($dbc, $sql);

if ($jobs_result === FALSE) {
	die(mysqli_error());
	// TODO: better error handling
}

$rows = array();
while ($r = mysqli_fetch_assoc($jobs_result)) {
	$rows[] = $r;
}


echo json_encode($rows);

?>
