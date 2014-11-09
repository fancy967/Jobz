<?php

/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
require_once 'connect.php';

$dbc = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
$tbl_name = "user";
$user_name = mysqli_real_escape_string($dbc, trim($_POST['name']));
$user_email_reg = mysqli_real_escape_string($dbc, trim($_POST['email']));
$user_password_reg = mysqli_real_escape_string($dbc, trim($_POST['password']));
$city_id = $_POST['city'];
$user_password_reg = md5($user_password_reg);

if (!isset($_POST['submit']))
{
    echo - 2;
    exit;
}
if (!empty($user_name) && !empty($user_email_reg) && !empty($user_password_reg) &&
    !empty($city_id))
{
    $query = "INSERT INTO user (Name, Email,City_Id,Country_Id, password)
                            VALUES ('$user_name', '$user_email_reg',$city_id,1, '$user_password_reg')";
    if (!mysqli_query($dbc, $query))
    {
        die('-2');
    }
    echo 11;
    mysqli_close($dbc);
} else
{
    echo - 11;
    exit;
}
