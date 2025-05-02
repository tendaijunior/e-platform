<?php
require_once('../config.php');
Class Master extends DBConnection {
	private $settings;
	public function __construct(){
		global $_settings;
		$this->settings = $_settings;
		parent::__construct();
	}
	public function __destruct(){
		parent::__destruct();
	}
	function capture_err(){
		if(!$this->conn->error)
			return false;
		else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
			return json_encode($resp);
			exit;
		}
	}
	function save_ship(){
		extract($_POST);
		$data = "";
		foreach($_POST as $k =>$v){
			if(!in_array($k,array('id','description'))){
				if(!empty($data)) $data .=",";
				$data .= " `{$k}`='{$v}' ";
			}
		}
		if(isset($_POST['description'])){
			if(!empty($data)) $data .=",";
				$data .= " `description`='".addslashes(htmlentities($description))."' ";
		}
		$check = $this->conn->query("SELECT * FROM `ship_list` where `id_code` = '{$id_code}' ".(!empty($id) ? " and id != {$id} " : "")." ")->num_rows;
		if($this->capture_err())
			return $this->capture_err();
		if($check > 0){
			$resp['status'] = 'failed';
			$resp['msg'] = "Vessel's ID Code already exist.";
			return json_encode($resp);
			exit;
		}
		if(empty($id)){
			$sql = "INSERT INTO `ship_list` set {$data} ";
			$save = $this->conn->query($sql);
		}else{
			$sql = "UPDATE `ship_list` set {$data} where id = '{$id}' ";
			$save = $this->conn->query($sql);
		}
		if($save){
			$resp['status'] = 'success';
			if(empty($id))
				$this->settings->set_flashdata('success',"New Vessel successfully saved.");
			else
				$this->settings->set_flashdata('success',"Vessel successfully updated.");
		}else{
			$resp['status'] = 'failed';
			$resp['err'] = $this->conn->error."[{$sql}]";
		}
		return json_encode($resp);
	}
	function delete_ship(){
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `ship_list` where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success',"Vessel successfully deleted.");
		}else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);

	}
	function save_port(){
		extract($_POST);
		$data = "";
		foreach($_POST as $k =>$v){
			if(!in_array($k,array('id'))){
				$v = addslashes(trim($v));
				if(!empty($data)) $data .=",";
				$data .= " `{$k}`='{$v}' ";
			}
		}
		$check = $this->conn->query("SELECT * FROM `port_list` where `name` = '{$name}' ".(!empty($id) ? " and id != {$id} " : "")." ")->num_rows;
		if($this->capture_err())
			return $this->capture_err();
		if($check > 0){
			$resp['status'] = 'failed';
			$resp['msg'] = "Port Name already exist.";
			return json_encode($resp);
			exit;
		}
		if(empty($id)){
			$sql = "INSERT INTO `port_list` set {$data} ";
			$save = $this->conn->query($sql);
		}else{
			$sql = "UPDATE `port_list` set {$data} where id = '{$id}' ";
			$save = $this->conn->query($sql);
		}
		if($save){
			$resp['status'] = 'success';
			if(empty($id))
				$this->settings->set_flashdata('success',"New Port successfully saved.");
			else
				$this->settings->set_flashdata('success',"Port successfully updated.");
		}else{
			$resp['status'] = 'failed';
			$resp['err'] = $this->conn->error."[{$sql}]";
		}
		return json_encode($resp);
	}
	function delete_port(){
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `port_list` where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success',"Port successfully deleted.");
		}else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);

	}
	function save_accommodation(){
		extract($_POST);
		$data = "";
		foreach($_POST as $k =>$v){
			if(!in_array($k,array('id'))){
				$v = addslashes(trim($v));
				if(!empty($data)) $data .=",";
				$data .= " `{$k}`='{$v}' ";
			}
		}
		$check = $this->conn->query("SELECT * FROM `accommodations` where `accommodation` = '{$accommodation}' ".(!empty($id) ? " and id != {$id} " : "")." ")->num_rows;
		if($this->capture_err())
			return $this->capture_err();
		if($check > 0){
			$resp['status'] = 'failed';
			$resp['msg'] = "Accommodation Name already exist.";
			return json_encode($resp);
			exit;
		}
		if(empty($id)){
			$sql = "INSERT INTO `accommodations` set {$data} ";
			$save = $this->conn->query($sql);
		}else{
			$sql = "UPDATE `accommodations` set {$data} where id = '{$id}' ";
			$save = $this->conn->query($sql);
		}
		if($save){
			$resp['status'] = 'success';
			if(empty($id))
				$this->settings->set_flashdata('success',"New Accommodation successfully saved.");
			else
				$this->settings->set_flashdata('success',"Accommodation successfully updated.");
		}else{
			$resp['status'] = 'failed';
			$resp['err'] = $this->conn->error."[{$sql}]";
		}
		return json_encode($resp);
	}
	function delete_accommodation(){
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `accommodations` where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success',"Accommodation successfully deleted.");
		}else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);

	}
	function save_schedule(){
		extract($_POST);
		$data = "";
		foreach($_POST as $k =>$v){
			if(!in_array($k,array('id')) && !is_array($_POST[$k])){
				if(!empty($data)) $data .=",";
				$v = addslashes($v);
				$data .= " `{$k}`='{$v}' ";
			}
		}
		if(empty($id)){
			$sql = "INSERT INTO `schedules` set {$data} ";
		}else{
			$sql = "UPDATE `schedules` set {$data} where id = '{$id}' ";
		}
		$save = $this->conn->query($sql);
		if($save){
			$sched_id = empty($id) ? $this->conn->insert_id : $id;
			$data = "";
			foreach($accommodation_id as $k => $v){
				if(!empty($data)) $data .= ",";
				$data .= "('$sched_id','{$v}','{$net_fare[$k]}','{$max_passenger[$k]}')";
			}
			if(!empty($data)){
				$this->conn->query("DELETE FROM sched_accom where `schedule_id` = '{$sched_id}' ");
				$this->capture_err();
				$this->conn->query("INSERT INTO sched_accom (`schedule_id`,`accommodation_id`,`net_fare`,`max_passenger`) VALUES {$data}");
			}
			$resp['status'] = 'success';
			if(empty($id))
				$this->settings->set_flashdata('success',"New Schedule successfully saved.");
			else
				$this->settings->set_flashdata('success',"Schedule successfully updated.");
		}else{
			$resp['status'] = 'failed';
			$resp['err'] = $this->conn->error."[{$sql}]";
		}
		return json_encode($resp);
	}
	function delete_schedule(){
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `schedules` where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success',"Schedule successfully deleted.");
		}else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);

	}
	function delete_img(){
		extract($_POST);
		if(is_file($path)){
			if(unlink($path)){
				$resp['status'] = 'success';
			}else{
				$resp['status'] = 'failed';
				$resp['error'] = 'failed to delete '.$path;
			}
		}else{
			$resp['status'] = 'failed';
			$resp['error'] = 'Unkown '.$path.' path';
		}
		return json_encode($resp);
	}
	function save_reservation(){
		extract($_POST);
		$data = "";
		
		$max = $this->conn->query("SELECT max_passenger FROM `sched_accom` where schedule_id = '$schedule_id' and `accommodation_id` = '{$accommodation_id}' ")->fetch_array()['max_passenger'];
		$price = $this->conn->query("SELECT net_fare FROM `sched_accom` where schedule_id = '$schedule_id' and `accommodation_id` = '{$accommodation_id}' ")->fetch_array()['net_fare'];
		$check = $this->conn->query("SELECT count(id) as `reserved` FROM `reservations` where schedule_id = '$schedule_id' and `accommodation_id` = '{$accommodation_id}' and status in (0,1) ".(!empty($id) ? " and id != {$id} " : "")." ")->num_rows;
		if($this->capture_err())
			return $this->capture_err();
		if(($max - $check) < count($name)){
			$resp['status'] = 'failed';
			$resp['msg'] = "Sorry, Selected Accommodation have only ".($max - $check)." left availability.";
			return json_encode($resp);
			exit;
		}
		if(empty($id)){
			$taken_code = array();
			$query_code = $this->conn->query("SELECT id,ticket_number FROM `reservations`");
			$taken_code = array_column($query_code->fetch_all(MYSQLI_ASSOC),'ticket_number');
			foreach($name as $k=> $v){
				while(true){
					$code = mt_rand(2,99999999999999);
					$code = sprintf("%'.014d",$code);
					if(!in_array($code,$taken_code))
					break;
					$taken_code[] = $code;
				}
				if(!empty($data)) $data .= ",";
				$data .= "('{$code}','{$schedule_id}','{$accommodation_id}','{$price}','{$v}','{$gender[$k]}','{$dob[$k]}','{$contact[$k]}','{$address[$k]}','{$status}')";
			}
			$sql = "INSERT INTO `reservations` (`ticket_number`,`schedule_id`,`accommodation_id`,`ticket_price`,`name`,`gender`,`dob`,`contact`,`address`,`status`) VALUES {$data} ";
		}else{

			foreach($_POST as $k =>$v){
				if(!in_array($k,array('id'))){
					if(!empty($data)) $data .=",";
					if(!is_array($_POST[$k]))
						$data .= " `{$k}`='{$v}' ";
					else
						$data .= " `{$k}`='{$v[0]}' ";
				}
			}
			$data .= ", `ticket_price`='$price' ";


			$sql = "UPDATE `reservations` set {$data} where id = '{$id}' ";
		}
		$save = $this->conn->query($sql);
		if($save){
			$resp['status'] = 'success';
			if(empty($id))
				$this->settings->set_flashdata('success',"New Reservation successfully saved.");
			else
				$this->settings->set_flashdata('success',"Reservation successfully updated.");
		}else{
			$resp['status'] = 'failed';
			$resp['err'] = $this->conn->error."[{$sql}]";
		}
		return json_encode($resp);
	}
	function delete_reservation(){
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `reservations` where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success',"Reservation successfully deleted.");
		}else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);

	}
}

$Master = new Master();
$action = !isset($_GET['f']) ? 'none' : strtolower($_GET['f']);
$sysset = new SystemSettings();
switch ($action) {
	case 'save_ship':
		echo $Master->save_ship();
	break;
	case 'delete_ship':
		echo $Master->delete_ship();
	break;
	case 'save_port':
		echo $Master->save_port();
	break;
	case 'delete_port':
		echo $Master->delete_port();
	break;
	case 'save_accommodation':
		echo $Master->save_accommodation();
	break;
	case 'delete_accommodation':
		echo $Master->delete_accommodation();
	break;
	case 'save_schedule':
		echo $Master->save_schedule();
	break;
	case 'delete_schedule':
		echo $Master->delete_schedule();
	break;
	case 'save_reservation':
		echo $Master->save_reservation();
	break;
	case 'delete_reservation':
		echo $Master->delete_reservation();
	break;
	
	default:
		// echo $sysset->index();
		break;
}