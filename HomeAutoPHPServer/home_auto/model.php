<?php
	
class Database {
	private $dsn = 'mysql:host=localhost;dbname=gpio';
	private $username = 'gpio';
	private $password = 'charity';
	private $db;
	
	public function __construct() {
		if (!isset($this->db)) {
			try {
				$this->db = new PDO($this->dsn, $this->username, $this->password);
			} catch (PDOExcpetion $e){
				$error_message = $e->getMessage();
				echo $error_message;
				exit();
			}
		}
	}
	
	public function dq($query){ // returns array of results
		$stmt = $this->db->prepare($query);
		$stmt->execute();
		$results = $stmt->fetchAll();
		$stmt->closeCursor();
		return $results;
	}
	
	public function dq1($query){ // returns single matching result
		$stmt = $this->db->prepare($query);
		$stmt->execute();
		$results = $stmt->fetch();
		$stmt->closeCursor();
		return $results;
	}
	
	public function dc($query){ // executes command without results
		$res=false;
		$stmt = $this->db->prepare($query);
			if($stmt->execute()){
				$res=true;
			}
		$stmt->closeCursor();
		return $res;
	}
	
	public function dcParams($query, $params){ // executes command, binds parameters with no results
		$res=false;
		$stmt = $this->db->prepare($query);
		for($x=0; $x<sizeof($params); $x++){
			$stmt->bindParam($x+1, $params[$x]);
		}
		if($stmt->execute()){
			$res=true;
		}
		$stmt->closeCursor();
		return $res;
	}
}
	
?>