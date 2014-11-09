<?php

require_once 'connect.php';
require_once 'notification.class.php';
//start a session
session_start();

if (!isset($_SESSION['user_id']))
{
    if (isset($_COOKIE['user_id']) && isset($_COOKIE['username']))
    {
        //set session using cookie
        $_SESSION['user_id'] = $_COOKIE['user_id'];
        $_SESSION['username'] = $_COOKIE['username'];
    } else
        if (isset($_POST['submit']))
        {
            $dbc = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
            $tbl_name = "user";
            $user_username = mysqli_real_escape_string($dbc, trim($_POST['email']));
            $user_password = mysqli_real_escape_string($dbc, trim($_POST['password']));

            if (!empty($user_username) && !empty($user_password))
            {
                $query = "SELECT Profile_Id, Name FROM $tbl_name WHERE Email = '$user_username' AND " .
                    "password = md5('$user_password')";
                $data = mysqli_query($dbc, $query);
                if (mysqli_num_rows($data) == 1)
                {
                    $row = mysqli_fetch_array($data);
                    $_SESSION['user_id'] = $row['Profile_Id'];
                    $_SESSION['username'] = $row['Name'];
                    setcookie('user_id', $row['Profile_Id'], time() + (60 * 60 * 24 * 30));
                    setcookie('username', $row['Name'], time() + (60 * 60 * 24 * 30));
                    $time = date("Y-m-d h:i:s");
                    Notification::generate(null,null,"You logged in at $time. If it's not your behavior, please change your password!",null);
                } else
                {
                    echo - 1;
                    exit;
                }
            } else
            {
                echo - 1;
                exit;
            }
        } else
        {
            echo 0;
            exit;
        }
}

if (isset($_SESSION['username']))
{
    $dbc = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
    $user_id = $_SESSION['user_id'];
    $tbl_name = "notification";
    $query = "SELECT COUNT(*) FROM $tbl_name where receiverID = $user_id and isRead = 0";
    $data = mysqli_query($dbc, $query);
    $row = mysqli_fetch_array($data);
    $count = $row['COUNT(*)'];
    echo '<h4>' . $_SESSION['username'] . '</h4>';
    if ($count>0)
    {
       echo "<a href=\"user_profile.php\">Edit Profile</a>&nbsp;|&nbsp;<a href=\"javascript:logOut()\">Log Out</a>&nbsp;|&nbsp;<a href=\"notification.html?getNew=1\" id=\"noti_new\">Inbox($count)</a>"; 
    }else
    {
        echo "<a href=\"user_profile.php\">Edit Profile</a>&nbsp;|&nbsp;<a href=\"javascript:logOut()\">Log Out</a>&nbsp;|&nbsp;<a href=\"notification.html\">Inbox($count)</a>";;
    }
} else
    if (isset($_COOKIE['username']))
    {
        $_SESSION['username'] = $_COOKIE['username'];
    } else
    {
        echo 0;
        exit;
    }
?>