<?php
namespace Vendor\Library\FormStyle;

class FormStyle {
	
	private $_html;
	private $_button;
	private $_select;
	private $_hidden;
	private $_textarea;
	
	
	public function init($name, $action = '#', $method = 'post')
	{
		echo "<form name=\"$name\" method=\"$method\" action=\"$action\" id=\"$name\" role=\"form\" class=\"form-horizontal\" enctype=\"multipart/form-data\">";
	}
	
	
	public function input(array $data)
	{
		$required = null;
		if($data['required'] === true){
			$required = 'required';
		}
		
	   	$this->_html = '<label for="'.$data['name'].'" style="color: #797676;"  class="col-sm-'.$data['num_label'].' control-label">'.$data['label'].'</label>';
	    $this->_html .=	'<div class="col-sm-'.$data['num_input'].'">';
	    $this->_html .=	'<input type="'.$data['type'].'"  class="form-control" id="'.$data['name'].'"  '.$required.'  placeholder="'.$data['placeholder'].'" name="'.$data['name'].'" value="'.$data['value'].'">';
	    $this->_html .=	'</div>';
		echo $this->_html;
	}
	
	
	public function groupOpen()
	{
		echo  '<div class="form-group">';
	}
	
	public function groupClose()
	{
		echo  '</div>';
	}
	
	public function hidden($name,$value = '',$extra=null){
		$extra = ($extra != null ? $extra : null);
		$return = "<input type='hidden' name='$name' value='$value' $extra />";
		echo  $this->_hidden = $return;
	}
	
	public function submit($value, $extra = null, $num_sub = 5, $class_btn = 'btn-default')
	{
		$this-> _button = '<div class="col-sm-offset-5 col-sm-'.$num_sub.'">';
     	$this-> _button .= '<button type="submit" '.$extra.' class="btn '.$class_btn.'">'.$value.'</button>';
    	$this-> _button .= '</div>';
		echo $this-> _button;
	}
	
	public function select(array $data,$name, $label,$selected = null, $num_lab = 2 , $num_select= 2)
	{
		$this->_select = '<label for="id_classificacao" style="color: #797676;" class="col-sm-2 control-label">*Classificação</label>';
	    $this->_select .=' <div class="col-sm-2">';
	    $this->_select .= '<select class="form-control" name="id_classificacao">';
		foreach($data as $key => $value){
			if($selected == $key){
	     	$this->_select .= "<option value=\"$key\" selected >$value</option>";
			}else{
	     	$this->_select .= "<option value=\"$key\">$value</option>";
			}
		}
	     	
	    $this->_select .= '</select>';
	    $this->_select .='</div>';
		
		echo $this->_select;
	}
	
	
	public function textarea($name,$label,$value = null,$placeholder = null,$num_lab = 2,$num_tex = 9 )
	{
    	$this->_textarea = '<label for="'.$name.'" style="color: #797676;" class="col-sm-'.$num_lab.' control-label">'.$label.'</label>';
		$this->_textarea .= '<div class="col-sm-'.$num_tex.'">';
		$this->_textarea .= '<textarea class="form-control" name="'.$name.'" placeholder="'.$placeholder.'" rows="3">'.$value.'</textarea>';
		echo $this->_textarea;	
	}
	
	
	public function close()
	{
		echo '</form>';
	}
}
