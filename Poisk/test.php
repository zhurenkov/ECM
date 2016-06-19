<?php
include 'config.php';
mysql_select_db("Parser") or die (mysql_error());//выбор базы данных
mysql_query('SET character_set_database = utf8'); 
mysql_query ("SET NAMES 'utf8'");
//echo tabbleview(Kazahstan150616);
$select_qry = "SELECT Result,Year FROM Afganistan WHERE KeyWord='терроризм'";
$select_result = mysql_query($select_qry);
$select_amt = mysql_num_rows($select_result); // Теперь знаем количество записей.
fopen("Kazahstan150616.txt","w");
$fp = fopen("Kazahstan150616.txt","a+");//если существуем, открываем файл
for($i=0; $i<$select_amt; $i++)
{
$row = mysql_fetch_assoc($select_result);
/*echo $row['KeyWord'].'<br>'; 
echo $row['Year'].'<br>';
echo $row['Result'].'<br>';
echo '<br>';*/
//fwrite($fp, 'KeyWord'.' '.'Year'.' '.'Result'."\r");
fwrite($fp, $row['Year'].' '.$row['Result'].' '.$row['KeyWord']."\r");//записываем в файл
}

fclose($fp);//закрываем файл.
//echo $row['KeyWord'].'<br>'; 
?>