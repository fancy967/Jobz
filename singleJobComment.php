<?php
include 'connect.php';

session_start();
$jobId = $_GET['jobId'];
$dbc = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

$sql = "SELECT user.name AS Name, rating.comment AS Comment FROM `rating` LEFT JOIN user ON user.Profile_Id = rating.Profile_Id WHERE rating.Profile_Id = '$jobId'";

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
