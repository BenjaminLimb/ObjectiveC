<?php
	//http://192.168.10.199/home_auto/?action={"lights":"off"}

	require_once('model.php');
	$db = new Database();
	
	$pinMap = array("17" => "lights", "4" => "doors");
	
	function setPin($pin, $val){
		global $db;
		$db->dc('UPDATE pinStatus SET pinStatus="'.$val.'" WHERE pinNumber="'.$pin.'"');
	}	
	
	if(isset($_REQUEST['action'])){
		$command = json_decode($_REQUEST['action'], true);
		
		if(isset($command['lights'])){
			$status = ($command['lights']=='on') ? 0 : 1;
			setPin(17, $status);
		}
		
		if(isset($command['doors'])){
			$status = ($command['doors']=='unlock') ? 1 : 0;
			setPin(4, $status);
		}		
	}
	
	$request = $db->dq('SELECT pinStatus, pinNumber FROM pinStatus WHERE pinNumber IN (17, 4)');
	
	$curStatus = array();
	
	foreach($request as $r){
		$idx = $pinMap[$r['pinNumber']];
		if($idx=='lights'){
			$status = ($r['pinStatus']=='0') ? 'on': 'off';
		}else if($idx=='doors'){
			$status = ($r['pinStatus']=='0') ? 'locked': 'unlocked';
		}
		
		$curStatus[$idx] = $status;
	}
	
	echo json_encode($curStatus);	
?>