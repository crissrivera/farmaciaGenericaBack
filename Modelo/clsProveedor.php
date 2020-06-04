<?php

class clsProveedor
{ 
    private $id;
    private $nombre;
    private $nit;
    private $direccion;
    private $ciudad_id;
    private $correo;

    function __construct($id,$nombre,$nit,$direccion,$ciudad_id,$correo)
    {
        $this->id = $id;
        $this->nombre = $nombre;
        $this->nit = $nit;
        $this->direccion = $direccion;
        $this->ciudad_id = $ciudad_id;
        $this->correo = $correo;
    }

    public function getId(){
		return $this->id;
	}

	public function setId($id){
		$this->id = $id;
	}

	public function getNombre(){
		return $this->nombre;
	}

	public function setNombre($nombre){
		$this->nombre = $nombre;
	}

	public function getNit(){
		return $this->nit;
	}

	public function setNit($nit){
		$this->nit = $nit;
	}

	public function getDireccion(){
		return $this->direccion;
	}

	public function setDireccion($direccion){
		$this->direccion = $direccion;
	}

	public function getCiudad_id(){
		return $this->ciudad_id;
	}

	public function setCiudad_id($ciudad_id){
		$this->ciudad_id = $ciudad_id;
	}

	public function getCorreo(){
		return $this->correo;
	}

	public function setCorreo($correo){
		$this->correo = $correo;
	}

}