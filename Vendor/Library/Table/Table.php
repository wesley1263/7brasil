<?php
namespace Vendor\Library\Table;

class Table {
	
	public $render;
	
	public function t_init($extra = null,$border = 0){
		$extra = ($extra != null ? $extra : null);
		return $this->render = "<table border=$border $extra>";
	}
	
	public function t_head(array $data){
		
		$table = "<thead>";
		foreach($data as $head){
		$table .= "<th>$head</th>";
		}
		$table .= "</thead>";
		
		return $this->render .= $table;
	}
	
	
	public function t_row(array $data,$colspan = 0){
		
		$table = "<tr>";
		foreach($data as $td){
		$table .= "<td colspan='$colspan'>$td</td>";
		}
		$table .= "</tr>";
		
		return $this->render .= $table;
	}
	
	
	public function generate(){
		$this->render .= "</table>";
		
		echo $this->render;
	}
	
}
