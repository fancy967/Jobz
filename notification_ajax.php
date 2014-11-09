<?php

//start a session
session_start();
if (!isset($_SESSION['user_id']) || !isset($_SESSION['username']))
{
    echo - 1;
    exit;
}

require_once 'connect.php';
$dbc = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
$tbl_name[0] = "notification";
$tbl_name[1] = "user";
$user_id = $_SESSION['user_id'];

if (isset($_GET['getNew']) && $_GET['getNew'] == 1)
{
    $query = "SELECT Name, message, time FROM $tbl_name[0] left outer join $tbl_name[1] on $tbl_name[0].senderID=$tbl_name[1].Profile_Id where receiverID = $user_id and isRead = 0";
} else
{
    $query = "SELECT Name, message, time FROM $tbl_name[0] left outer join $tbl_name[1] on $tbl_name[0].senderID=$tbl_name[1].Profile_Id where receiverID = $user_id";
}
$result = mysqli_query($dbc, $query);

if (mysqli_num_rows($result) == 0)
{
    echo "<tr><td colspan='3' style='text-align: center;'>No message!</td></tr>";
    exit;
}

$obj = new StdClass;
$obj->records = array();

while ($row = mysqli_fetch_assoc($result))
{
    $sender = $row["Name"] ? $row["Name"] : "System";
    $message = $row["message"];
    $time = $row["time"];
    echo "<tr><td>$sender</td><td class='ellipsis'>$message</td><td>$time</td></tr>";
}

if (isset($_GET['getNew']) && $_GET['getNew'] == 1)
{
    $query = "UPDATE $tbl_name[0] SET isRead = 1 WHERE receiverID = $user_id";
    $result = mysqli_query($dbc, $query);
}

?>