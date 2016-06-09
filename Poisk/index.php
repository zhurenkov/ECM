<html>
<meta charset="UTF-8">
<head>
<title>Поиск</title>
</head>
<body>
<?php
include 'cut.php';
include 'get_web_page.php';
include 'bd.php';
include 'translit.php';
$mw = $_REQUEST['mw']; //Ключевое слово 1
$kw1 = $_REQUEST['kw1']; //Ключевое слово 2
$year1 = $_REQUEST['year1']; //Год поиска
$year2 = $_REQUEST['year2'];
$year = $year1;
$urlsys = "https://www.google.ru/search?"; //корень url
$urltip = "tbm=nws"; //указываем что поиск в новостях
$el=0;

$arrayKW = array($_REQUEST['kw1'],$_REQUEST['kw2'],$_REQUEST['kw3'],$_REQUEST['kw4'],$_REQUEST['kw5'],$_REQUEST['kw6'],$_REQUEST['kw7'],$_REQUEST['kw8'],$_REQUEST['kw9'],$_REQUEST['kw10'],$_REQUEST['kw11'],$_REQUEST['kw12'],$_REQUEST['kw13'],$_REQUEST['kw14']);
//echo $mw.'<br>';
$mwtrnsl = translit($mw);
//echo translit($mw);
$crttabble = createtabble ($mwtrnsl);
while($arrayKW[$el] != null) {
$year=$year1;	
while($year<=$year2) {
$urlq =  "q=".$mw."+".$arrayKW[$el]; //параметр запроса
$urldate = "tbs=cdr%3A1%2Ccd_min%3A".$year."%2Ccd_max%3A".$year; //задаем параметры поиска по дате
$urlall = $urlsys.$urlq.'&'.$urltip.'&'.$urldate; //собираем url вместе
$result = get_web_page( "$urlall" );

if (($result['errno'] != 0 )||($result['http_code'] != 200)) //проверка на ошибки
    {
	echo $result['errmsg'];
	echo 'УПС! Гугл решил что я робот :(';
	echo '<br>'.$urlall;
	}
else
	{
		
	$page = $result['content']; //задаем переменной $page контент со страницы
	//echo $page;
	$String = $page;
	$page = Cut($String, '<div id="resultStats">', '<nobr>'); //вырезаем часть с количеством результатов
	$rest = preg_replace("/[^0-9]/", '', $page); //оставляем только цифры
	echo 'Результат запроса по связке: '.$mw.' + '.$arrayKW[$el].' за: '.$year.' год:'.$rest.'<br>';
	$addbd = addtodb($mwtrnsl, $arrayKW[$el], $year, $rest);
	$year = $year + 1;
	//
}
}
$el++;
}

?>
</body>
</html>