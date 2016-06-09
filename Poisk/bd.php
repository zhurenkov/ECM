
<?php

function viewlisttable() {
$db = mysql_connect("localhost","Parser","parser") or die(mysql_error()); /*Подключение к серверу */
$result = mysql_list_tables('Parser'); 
 while ($row = mysql_fetch_row($result)) 
     {  echo $row[0]."<br>";}
}
function createtabble ($mainw) {
$db = mysql_connect("localhost","Parser","parser") or die(mysql_error()); /*Подключение к серверу */
mysql_select_db("Parser",$db); /*Подключение к базе данных на сервере*/	
$strSQL = "CREATE TABLE $mainw (
KeyWord CHAR(25) NULL, 
Year CHAR(25) NULL, 
Result CHAR(25) NULL )";
mysql_query($strSQL) or die(mysql_error());
	mysql_close ();
}

function addtodb ( $mainw, $valkw, $valyear, $valresult ) 
{
$db = mysql_connect("localhost","Parser","parser") or die(mysql_error()); /*Подключение к серверу */
mysql_select_db("Parser",$db); /*Подключение к базе данных на сервере*/
$strSQL = "INSERT INTO $mainw (KeyWord, Year, Result) VALUES ('$valkw','$valyear','$valresult')";
mysql_query($strSQL) or die(mysql_error());
	mysql_close ();
}
?>