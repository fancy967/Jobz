<?php

session_start();
if (!isset($_SESSION['user_id']) || !isset($_SESSION['username']))
{
    echo - 1;
    exit;
}
require_once 'connect.php';
$dbc = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
$User_id = $_SESSION["user_id"];
mysqli_query($dbc, 'SET NAMES UTF8');
$sql = "SELECT `Job_id`, `Job_title`, `Category_Name`, (select count(*) from `job_applicants` where `job_applicants`.Job_Id = `job`.Job_id) as Applicants, `Start_Time`, `End_Time`, `City_Name`, `Maximum_Salary`, `Is_Finished` FROM job, city, category WHERE job.Category_id = category.Category_Id and job.Location = city.City_Id and Employer_id = '$User_id' ORDER BY `job`.`Date_created` DESC";
$jobs_result = mysqli_query($dbc, $sql);

if ($jobs_result === false)
{
    die(mysqli_error($dbc));
    // TODO: better error handling
}

$rows = array();
while ($r = mysqli_fetch_assoc($jobs_result))
{
    $rows[] = $r;
}
echo json_encode($rows);

?>
