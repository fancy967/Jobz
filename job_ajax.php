<?php

session_start();
if (!isset($_SESSION['user_id']) || !isset($_SESSION['username']))
{
    echo - 1;
    exit;
}
require_once 'connect.php';
$dbc = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
if (isset($_POST['getID']))
{
    $jobID = mysqli_real_escape_string($dbc, trim($_POST['getID']));
    $obj= new StdClass;
    $obj->userID = $_SESSION["user_id"];
    mysqli_query($dbc, 'SET NAMES UTF8');
    $sql_job = "SELECT * FROM job, city, category, user WHERE job.Category_id = category.Category_Id and job.Location = city.City_Id and user.Profile_Id = job.Employer_id and Job_id = $jobID ORDER BY job.Date_created DESC";
    $sql_applicant = "SELECT * FROM job_applicants, user WHERE job_applicants.Person_Id = user.Profile_Id and Job_id = $jobID ORDER BY job_applicants.Date_Created DESC";
    $job_result = mysqli_query($dbc, $sql_job);
    $applicant_result = mysqli_query($dbc, $sql_applicant);

    if ($job_result === false || $applicant_result === false)
    {
        die(-999);
    }

    $rows = array();
    while ($r = mysqli_fetch_assoc($job_result))
    {
        $rows[] = $r;
    }
    $obj->jobDetail = $rows;

    $rows = array();
    while ($r = mysqli_fetch_assoc($applicant_result))
    {
        $rows[] = $r;
    }
    $obj->applicants = $rows;
    echo json_encode($obj);
}
?>
