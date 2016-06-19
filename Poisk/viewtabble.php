<?php
include 'config.php'; /*Подключение к серверу */
$result = mysql_list_tables('Parser'); 
 while ($row = mysql_fetch_row($result)) 
     {  echo $row[0]."<br>";
      }
?>
