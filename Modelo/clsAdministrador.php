<?php

class clsAdministrador 
{
    private $id;
    private $nombres;
    private $apellidos;
    private $tipo_documento_id;
    private $numero_documento;
    private $genero_id;
    private $correo;
    private $usuario;
    private $password;

    function __construct($id, $nombres, $apellidos,$tipo_documento_id, $numero_documento, $genero_id, $correo, $usuario, $password)
    {
        $this->id = $id;
        $this->nombres = $nombres;
        $this->apellidos = $apellidos;
        $this->tipo_documento_id = $tipo_documento_id;
        $this->numero_documento = $numero_documento;
        $this->genero_id = $genero_id;
        $this->correo = $correo;
        $this->usuario = $usuario;
        $this->password = $password;
    }

    public function getId(){
		return $this->id;
	}

	public function setId($id){
		$this->id = $id;
	}

	public function getNombres(){
		return $this->nombres;
	}

	public function setNombres($nombres){
		$this->nombres = $nombres;
	}

	public function getApellidos(){
		return $this->apellidos;
	}

	public function setApellidos($apellidos){
		$this->apellidos = $apellidos;
	}

	public function getTipo_documento_id(){
		return $this->tipo_documento_id;
	}

	public function setTipo_documento_id($tipo_documento_id){
		$this->tipo_documento_id = $tipo_documento_id;
	}

	public function getNumero_documento(){
		return $this->numero_documento;
	}

	public function setNumero_documento($numero_documento){
		$this->numero_documento = $numero_documento;
	}

	public function getGenero_id(){
		return $this->genero_id;
	}

	public function setGenero_id($genero_id){
		$this->genero_id = $genero_id;
	}

	public function getCorreo(){
		return $this->correo;
	}

	public function setCorreo($correo){
		$this->correo = $correo;
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
 
}
