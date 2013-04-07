<?php

$con = mysql_connect("agrif004.mysql.guardedhost.com", "agrif004_iosgst", "Barney1OS");

if (!$con)
{
  die('Could not connect: ' . mysql_error());
}

mysql_select_db("agrif004_iOS", $con);

// Setters

if(isset($_POST['action']))
{
	$json = json_decode($_POST['action']);
	$columns = array("lights", "doors", "thermo", "garage");
	foreach($columns as $column)
	{
		if(isset($json->$column))
		{
			$value = ($column == "thermo") ? $json->$column : '"' . $json->$column . '"';
			mysql_query("UPDATE home_auto SET " . $column . " = " . $value);
		}
	}
}

// Getters

$to_json = array();
$result  = mysql_query("SELECT * FROM home_auto");
while($row = mysql_fetch_array($result))
{
  $to_json["lights"] = $row["lights"];
  $to_json["doors"]  = $row["doors"];
  $to_json["thermo"] = $row["thermo"];
  $to_json["garage"] = $row["garage"];
}
echo json_encode($to_json);

mysql_close($con);

?>