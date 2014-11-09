<?php
include 'connect.php'; //establish database connection script
$dbc = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
$query = "SELECT Category_Id, Category_Name FROM Category";
mysqli_query($dbc, 'SET NAMES UTF8');
$result = mysqli_query($dbc, $query);
header("Content-type: text/html; charset=utf-8");
while ($row = mysqli_fetch_assoc($result))
{
    $id = $row["Category_Id"];
    $name = $row["Category_Name"];
    //here we display book name in drop down list and pass bookid value to insert.php
    print "<option value='$id'>$name</option>";
}
?>