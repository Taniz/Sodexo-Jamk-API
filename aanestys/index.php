<?php
require_once('../db-init.php');

// Alustukset
$user = "'";
$user = $user . $_POST['username'];
$user = $user . "'";
$date = "'";
$date = $date . $_POST['date'];
$date = $date . "'";
$date2 = $_POST['date'];
$arvosana = $_POST['arvosana'];
$ruokaid = $_POST['ruokaid'];
$pvm = "";

$string = "/^[a-äA-Ä0-9" . "'." . "]*$/";

if(preg_match($string, $user) && preg_match($string, $date) && preg_match($string, $arvosana) && preg_match($string, $ruokaid)){

	$sql = "INSERT INTO Aanestys (id) SELECT * FROM (SELECT " . $user . ") AS tmp WHERE NOT EXISTS (SELECT id FROM Aanestys WHERE id = " . $user . ");";
	$stmt = $db->prepare("$sql");
	$stmt->execute();


	$sql = "SELECT pvm FROM Aanestys WHERE id = " . $user . "";
	$stmt = $db->prepare("$sql");
	$stmt->execute();
	$results = $stmt->fetchAll(PDO::FETCH_ASSOC);

	foreach ($results as $row) 
	{
		$pvm = $row['pvm'];		
	}

	if(strcmp($pvm, $date2) !== 0)
	{
		$sql = "INSERT INTO Arvosana (arvosana, Ruoka_id, Aanestys_id) VALUES (" . $arvosana . ", " . $ruokaid . "," . $user . ");";
		$stmt = $db->prepare("$sql");		
		$stmt->execute();
		
		$sql = "UPDATE Aanestys SET pvm = " . $date . " WHERE id = " . $user . ";";
		$stmt = $db->prepare("$sql");
		$stmt->execute();
		
		$sql = "SELECT pvm FROM Aanestys WHERE id = " . $user . "";
		$stmt = $db->prepare("$sql");
		$stmt->execute();
		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
		
		echo "1";
		
		//For testing
		/*foreach ($results as $row) 
		{
			echo json_encode($row['pvm']);		
		}*/
	}

	else echo "0";
	// For testing
	//else echo json_encode("derp");

	}
?>