<?php

class clsLogin
{
    private $id;
    private $usuario;
    private $password;
    private $tipo_usuario_id;

    function __construct($id,$usuario,$password,$tipo_usuario_id)
    {
        $this->id = $id;
        $this->usuario = $usuario;
        $this->password = $password;
        $this->tipo_usuario_id = $tipo_usuario_id;
    }

    public function getId(){
		return $this->id;
	}

	public function setId($id){
		$this->id = $id;
	}

	public function getUsuario(){
		return $this->usuario;
	}

	public function setUsuario($usuario){
		$this->usuario = $usuario;
	}

	public function getPassword(){
		return $this->password;
	}

	public function setPassword($password){
		$this->password = $password;
	}

	public function getTipo_usuario_id(){
		return $this->tipo_usuario_id;
	}

	public function setTipo_usuario_id($tipo_usuario_id){
		$this->tipo_usuario_id = $tipo_usuario_id;
	}
}
