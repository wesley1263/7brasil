<?php
namespace Vendor\Library\Session;

class Session {

	public function __construct() {
		session_set_cookie_params(3600*3);
		session_start();
		session_regenerate_id();
	}

	public function setSession($key, $value) 
	{

		return $_SESSION[$key] = $value;

	}

	public function addSessionArray($name, array $data) {
		$return = null;
		if (is_array($data) && count($data) != 0) {
			foreach ($data as $key => $value) {
				$_SESSION[$name][$key] = $value;
			}
			$return = $_SESSION[$name];
		}

		return $return;
	}

	public function getSession($key) {
		return $_SESSION[$key];
	}

	public function delSession($key) {
		unset($_SESSION[$key]);
	}

	public function destroySession() {
		return session_destroy();
	}

	public function setFlashMessage($string, $key) {
		$_SESSION[$key] = $string;
	}

	public function getFlashMessage($key) {
		$var = self::getSession($key);
		self::delSession($key);
		return $var;
	}

}
