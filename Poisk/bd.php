<?php
function createtabble ($mainwd) {
include 'config.php';/*Подключение к серверу */
mysql_select_db("Parser",$db); /*Подключение к базе данных на сервере*/	
$strSQL = "CREATE TABLE $mainwd (
KeyWord CHAR(25) NULL, 
Year CHAR(25) NULL, 
Result CHAR(25) NULL )";
mysql_query($strSQL) or die(mysql_error());
	mysql_close ();
}

function addtodb ( $mainw, $valkw, $valyear, $valresult ) 
{
include 'config.php'; /*Подключение к серверу */
mysql_select_db("Parser",$db); /*Подключение к базе данных на сервере*/
$mainwd = $mainw.(date("dmy"));
$strSQL = "INSERT INTO $mainwd (KeyWord, Year, Result) VALUES ('$valkw','$valyear','$valresult')";
mysql_query($strSQL) or die(mysql_error());
	mysql_close ();
}

function tabbleview($tabblename)
{
include 'config.php';
  mysql_select_db("Parser") or die (mysql_error());//выбор базы данных
  mysql_query('SET character_set_database = utf8'); 
  mysql_query ("SET NAMES 'utf8'");
 // error_reporting(E_ALL); 
 // ini_set("display_errors", 1);*/
  $select_qry = "SELECT * FROM $tabblename";
  $select_result = mysql_query($select_qry);
  $select_amt = mysql_num_rows($select_result); // Теперь знаем количество записей.
echo '
<TABLE border="1">';
echo '
<TR>
<TH>Ключевое слово</TH>
<TH>Год</TH>
<TH>Результат</TH>
</TR>';
for($i=0; $i<$select_amt; $i++)
{
$row = mysql_fetch_assoc($select_result);
echo '
<TR>
<TD>'.$row['KeyWord'].'</TD>
<TD>'.$row['Year'].'</TD>
<TD>'.$row['Result'].'</TD>
</TR>';
}
echo '
</TABLE>';
}
?>