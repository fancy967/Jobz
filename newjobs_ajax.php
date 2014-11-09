<?php
require_once 'connect.php';
            $dbc = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
            $cur_loca = isset($_COOKIE['location'])? $_COOKIE['location']: null;
            $query_loca = $cur_loca? "and city.City_Name = '$cur_loca'":'';
            $tbl_name[0] = "job";
            $tbl_name[1] = "city";
            $query = "SELECT `Job_title`, `Date_created`, `City_Name` FROM $tbl_name[0], $tbl_name[1] where job.`Location` = city.City_Id $query_loca order by `Date_created`desc limit 10";
mysqli_query($dbc, 'SET NAMES UTF8');
$result = mysqli_query($dbc, $query);

echo "<ul>";
while ($row = mysqli_fetch_assoc($result))
{
    $title = $row["Job_title"];
    $datetime = new DateTime($row["Date_created"]);
    $date = $datetime->format('Y-m-d');
    $location = $row["City_Name"];
    echo "<li><h4>$title</h4><h5>$location, $date</h5></li>";
}
echo "</ul>";
?>