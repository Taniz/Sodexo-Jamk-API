<?php
// db-init.php
$db = new PDO('mysql:host=mysql.labranet.jamk.fi;dbname=G3217_2;charset=utf8',
              'G3217', 'KL3xDWKFxN26IqHDB56jqetLwo7eHFhr');
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
?>