<?php
class Notification
{
    public function generate($senderID, $receiverID, $message, $time)
    {
        $sID = $senderID ? $senderID : 9999;
        $rID = $receiverID ? $receiverID:$_SESSION['user_id'];
        if ($rID == null || $message == null)
        {
            return - 1;
        }
        $message = mysql_real_escape_string($message);
        $time = $time ? $time : date("Y-m-d h:i:s");
        require_once 'connect.php';
        $dbc = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
        $tbl_name = "notification";
        $query = "INSERT INTO $tbl_name (id, senderID,receiverID,message, time, isRead)
                            VALUES ('', '$sID','$rID', '$message', '$time','0')";
        if (!mysqli_query($dbc, $query))
        {
            return - 2;
        }
        return 0;
    }
}
?>