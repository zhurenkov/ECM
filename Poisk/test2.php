<?php
system ('gnuplot');
system('set output "/tmp/outfile.png"')
system('plot"/var/www/html/1.txt"  using 1:2 with lines')
?>



