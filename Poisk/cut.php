<?php
function Cut($p1, $p2, $p3) { //функция вырезки нужного фрагмента
$num1 = strpos($p1, $p2);
if ($num1 === false) return 0;
$num2 = substr($p1, $num1);
return strip_tags(substr($num2, 0, strpos($num2, $p3)));
}
?>