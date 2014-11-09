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
$category = isset($_POST['category']) ? $_POST['category'] : '';
$query_category = $category? "and job.Category_id = $category":"";

$city = isset($_POST['city']) ? $_POST['city'] : '';
$query_city = $city? "and job.Location = $city":"";

$keywords = isset($_POST['keywords']) ? $_POST['keywords'] : '';
$query_keywords = $keywords? "and Job_title LIKE '%$keywords%'":"";

mysqli_query($dbc, 'SET NAMES UTF8');
$sql = "SELECT `Job_id`, `Job_title`, `Category_Name`, (select count(*) from `job_applicants` where `job_applicants`.Job_Id = `job`.Job_id) as Applicants, `Start_Time`, `End_Time`, `City_Name`, `Maximum_Salary` FROM job, city, category WHERE job.Category_id = category.Category_Id and job.Location = city.City_Id and Is_Finished = 0 and Employer_id != '$User_id' $query_category $query_city $query_keywords order by `Date_created` asc";
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
