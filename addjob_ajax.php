<?php
require_once 'notification.class.php';
//start a session
session_start();
if (!isset($_SESSION['user_id']) || !isset($_SESSION['username']))
{
    echo - 1;
    exit;
}
if (!isset($_POST['submit']))
{
    echo - 2;
    exit;
}

require_once 'connect.php';
$dbc = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
$tbl_name = "job";
$user_id = $_SESSION['user_id'];
$title = mysqli_real_escape_string($dbc,$_POST['title']);
$category = $_POST['category'];
$location = $_POST['city'];
$salary = mysqli_real_escape_string($dbc,$_POST['salary']);
$start_time = $_POST['start_time'];
$end_time = $_POST['end_time'];;
$description = mysqli_real_escape_string($dbc,$_POST['message']);
$now=date( "Y-m-d H:i:s");

if (!empty($title) && !empty($category) && !empty($location) &&
    !empty($salary) && !empty($start_time) && !empty($end_time) && !empty($description))
{
    $query = $query = "INSERT INTO `job`(`Job_title`, `Category_id`, `Description`, `Start_Time`, `End_Time`, `Employer_id`,
            `Location`, `Maximum_Salary`, `Date_created`) VALUES ('$title',$category,'$description','$start_time','$end_time','$user_id','$location','$salary','$now')";
    if (!mysqli_query($dbc, $query))
    {
        echo -2;
        exit;
    }
    echo 0;
    mysqli_close($dbc);
    $time = date("Y-m-d h:i:s");
    Notification::generate(null,null,"You post a job [$title] at $time.",null);
    
} else
{
    echo - 3;
    exit;
}
?>