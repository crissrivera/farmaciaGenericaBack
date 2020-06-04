<?php

class clsVenta
{ 
    private $id;
    private $fecha_venta;
    private $hora;
    private $valor_total;
    private $empleado_id;
	private $cliente_id;
	private $estado;

    function __construct($id,$fecha_venta,$hora,$valor_total,$empleado_id,$cliente_id,$estado)
    {
        $this->id = $id;
        $this->fecha_venta = $fecha_venta;
        $this->hora = $hora;
        $this->valor_total = $valor_total;
        $this->empleado_id = $empleado_id;
		$this->cliente_id = $cliente_id;
		$this->estado = $estado;
    }

    public function getId(){
		return $this->id;
	}

	public function setId($id){
		$this->id = $id;
	}

	public function getFecha_venta(){
		return $this->fecha_venta;
	}

	public function setFecha_venta($fecha_venta){
		$this->fecha_venta = $fecha_venta;
	}

	public function getHora(){
		return $this->hora;
	}

	public function setHora($hora){
		$this->hora = $hora;
	}

	public function getValor_total(){
		return $this->valor_total;
	}

	public function setValor_total($valor_total){
		$this->valor_total = $valor_total;
	}

	public function getEmpleado_id(){
		return $this->empleado_id;
	}

	public function setEmpleado_id($empleado_id){
		$this->empleado_id = $empleado_id;
	}

	public function getCliente_id(){
		return $this->cliente_id;
	}

	public function setCliente_id($cliente_id){
		$this->cliente_id = $cliente_id;
	}

	public function getEstado(){
		return $this->estado;
	}

	public function setEstado($estado){
		$this->estado = $estado;
	}

}