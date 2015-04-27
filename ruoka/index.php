<?php
header('Content-Type: text/html; charset=utf-8');
require_once('../db-init.php');

// Alustukset
$user = "'";
$user = $user . $_POST['username'];
$paikka = $_POST['paikka'];
$user = $user . "'";
$arvosana;
$nro;
$userarvo = array();
$id = array();
$id2 = array();
$arvo = array();
$nimi = array();
$nimien = array();
$lisaen = array();
$lisa = array();
$kategoria = array();
$aller = array();
$all = array();

$ruoka = array();

array_map('utf8_encode', $all);
$day = $_POST['day'];
$month = $_POST['month'];
$year = $_POST['year'];
/*$day = date("d");
$month = date("m");
$year = 2000 + date("y");
*/
//JSON
$url = "http://www.sodexo.fi/ruokalistat/output/daily_json/" . $paikka . "/" . $year . "/" . $month . "/" . $day . "/fi";
$json = @file_get_contents($url, true);
$data = json_decode($json, true);
//var_dump($data);
//echo $data['meta']['ref_title'];
//echo $data['courses']['0']['title_fi'];


//Taulukoiden täyttäminen ja ruoan id haku
foreach ($data['courses'] as $value)
{	
	if(isset($value['title_fi']))
		array_push($nimi, $value['title_fi']);
	else
		array_push($nimi, '');
	
	if(isset($value['desc_fi']))
		array_push($lisa, $value['desc_fi']);
	else
		array_push($lisa, '');
		
	if(isset($value['title_en']))
		array_push($nimien, $value['title_en']);
	else
		array_push($nimien, '');
		
	if(isset($value['desc_en']))
		array_push($lisaen, $value['desc_en']);
	else
		array_push($lisaen, '');
		
	if(isset($value['category']))
		array_push($kategoria, $value['category']);
	else
		array_push($kategoria, '');
		
	if(isset($value['properties']))
		array_push($aller, $value['properties']);
	else
		array_push($aller, '');

	$asd = "'";
	$asd = $asd . $value['title_fi'];
	$asd = $asd . "'";
	$sql = "INSERT INTO Ruoka (nimi) SELECT * FROM (SELECT " . $asd . ") AS tmp WHERE NOT EXISTS (SELECT nimi FROM Ruoka WHERE nimi =" . $asd . ");";
	$stmt = $db->prepare("$sql");
	$stmt->execute();
	//$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
	
	$sql = "SELECT id FROM Ruoka WHERE nimi = " . $asd . ";";
	$stmt = $db->prepare("$sql");
	$stmt->execute();
	$results = $stmt->fetchAll(PDO::FETCH_ASSOC);

	foreach ($results as $row) 
	{
		array_push($id2, array('id' => $row['id']));	
		array_push($id, $row['id']);
	}
}

foreach ($nimi as $value)
{
	//echo $value;
}

//Yleis ja käyttäjän arvosanan hakeminen
foreach($id as $result)
{
	$nro = 0;
	$arvosana = 0;
	$nro2 = 0;
	$arvosana2 = 0;

	$sql = "SELECT arvosana, Aanestys_id FROM Arvosana WHERE Ruoka_id = " . $result . ";";
	$stmt = $db->prepare("$sql");
	$stmt->execute();
	$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
	foreach ($results as $row) 
	{
		if($row['Aanestys_id'] != null)
		{
			$arvosana += $row['arvosana'];
			$nro++;
		}
	}
	if($nro == 0)
		$nro = 1;
		
	array_push($arvo, $arvosana/$nro);
	
	
	
	$sql = "SELECT arvosana FROM Arvosana WHERE Ruoka_id = " . $result . " AND Aanestys_id = " . $user . ";";
	$stmt = $db->prepare("$sql");
	$stmt->execute();
	$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
	foreach ($results as $row) 
	{
		$arvosana2 += $row['arvosana'];
		$nro2++;
	}
	if($nro2 == 0)
		array_push($userarvo, -1);
	else
		array_push($userarvo, $arvosana2/$nro2);
}

//Testi tulostus
/*array_walk_recursive($nimi, function(&$item, $key){
        $item = utf8_encode($item);
    });*/
for($i = 0; $i < count($id); $i++)
{
	array_push($ruoka, array('id' => $id[$i], 'nimi' => $nimi[$i], 'nimien' => $nimien[$i], 'lisa' => $lisa[$i], 'lisan' => $lisaen[$i], 'kategoria' => $kategoria[$i], 'aller' => $aller[$i], 'arvo' => $arvo[$i], 'userarvo' => $userarvo[$i]));
}
//$all = array('id' => $id2, 'nimi' => $nimi, 'nimien' => $nimien,'lisa' => $lisa, 'lisaen' => $lisaen ,'kategoria' => $kategoria, 'aller' => $aller, 'arvo' => $arvo, 'userarvo' => $userarvo);
//$all = array_map('utf8_encode', $all);
//echo json_encode($all);
echo json_encode($ruoka);
//echo json_encode($all);

?>