<?php

class clsPuntosRedimibles
{ 
    private $id;
    private $puntos;
    private $cliente_id;

    function __construct($id, $puntos, $cliente_id)
    {
        $this->id = $id;
        $this->puntos = $puntos;
        $this->cliente_id = $cliente_id;
    }

    public function getId(){
		return $this->id;
	}

	public function setId($id){
		$this->id = $id;
	}

	public function getPuntos(){
		return $this->puntos;
	}

	public function setPuntos($puntos){
		$this->puntos = $puntos;
	}

	public function getCliente_id(){
		return $this->cliente_id;
	}

	public function setCliente_id($cliente_id){
		$this->cliente_id = $cliente_id;
	}

}