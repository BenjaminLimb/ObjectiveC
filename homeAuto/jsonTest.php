<?php

$con = mysql_connect("agrif004.mysql.guardedhost.com", "agrif004_iosgst", "Barney1OS");

if (!$con)
{
  die('Could not connect: ' . mysql_error());
}

mysql_select_db("agrif004_iOS", $con);

// mysql_query("INSERT INTO home_auto (lights) VALUES ('on')");

if(isset($_POST['action']))
{
	$json = json_decode($_POST['action']);
}

// Setters

if(isset($json['set_lights']))
{
	mysql_query("UPDATE home_auto SET (lights = '" . ($json['set_lights']) ? "on" : "off" . "')");
}

if(isset($json['set_doors']))
{
	mysql_query("UPDATE home_auto SET (doors = '" . ($json['set_doors']) ? "locked" : "unlocked" . "')");
}

if(isset($json['set_thermo']))
{
	mysql_query("UPDATE home_auto SET (thermo = " . $json['set_thermo'] . ")");
}

if(isset($json['set_garage']))
{
	mysql_query("UPDATE home_auto SET (garage = '" . ($json['set_garage']) ? "open" : "closed" . "')");
}

// Getters

if(isset($_POST['select_lights']))
{
	$result = mysql_query("SELECT * FROM home_auto");
	$to_json = array();
	while($row = mysql_fetch_array($result))
  {
  	$to_json["lights"] = $row["lights"];
  	$to_json["doors"]  = $row["doors"];
  	$to_json["thermo"] = $row["thermo"];
  	$to_json["garage"] = $row["garage"];
  }
  echo json_encode($to_json);

} 

mysql_close($con);

?>