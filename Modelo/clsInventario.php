<?php

class clsInventario
{
    private $id;
    private $miligramos;
    private $nombre;
    private $descripcion;
    private $fecha_ingreso;
    private $fecha_vencimiento;
    private $lote;
    private $cantidad;
    private $precio;
    private $estante_id;
    private $laboratorio_id;
    private $tipo_producto_id;
    private $proveedor_id;

    function __construct($id,$miligramos,$nombre,$descripcion,$fecha_ingreso,$fecha_vencimiento,$lote,$cantidad,$precio,$estante_id,$laboratorio_id,$tipo_producto_id,$proveedor_id)
    {
        $this->id = $id;
        $this->miligramos = $miligramos;
        $this->nombre = $nombre;
        $this->descripcion = $descripcion;
        $this->fecha_ingreso = $fecha_ingreso;
        $this->fecha_vencimiento = $fecha_vencimiento;
        $this->lote = $lote;
        $this->cantidad = $cantidad;
        $this->precio = $precio;
        $this->estante_id = $estante_id;
        $this->laboratorio_id = $laboratorio_id;
        $this->tipo_producto_id = $tipo_producto_id;
        $this->proveedor_id = $proveedor_id;
    }

    public function getId(){
		return $this->id;
	}

	public function setId($id){
		$this->id = $id;
	}

	public function getMiligramos(){
		return $this->miligramos;
	}

	public function setMiligramos($miligramos){
		$this->miligramos = $miligramos;
	}

	public function getNombre(){
		return $this->nombre;
	}

	public function setNombre($nombre){
		$this->nombre = $nombre;
	}

	public function getDescripcion(){
		return $this->descripcion;
	}

	public function setDescripcion($descripcion){
		$this->descripcion = $descripcion;
	}

	public function getFecha_ingreso(){
		return $this->fecha_ingreso;
	}

	public function setFecha_ingreso($fecha_ingreso){
		$this->fecha_ingreso = $fecha_ingreso;
	}

	public function getFecha_vencimiento(){
		return $this->fecha_vencimiento;
	}

	public function setFecha_vencimiento($fecha_vencimiento){
		$this->fecha_vencimiento = $fecha_vencimiento;
	}

	public function getLote(){
		return $this->lote;
	}

	public function setLote($lote){
		$this->lote = $lote;
	}

	public function getCantidad(){
		return $this->cantidad;
	}

	public function setCantidad($cantidad){
		$this->cantidad = $cantidad;
	}

	public function getPrecio(){
		return $this->precio;
	}

	public function setPrecio($precio){
		$this->precio = $precio;
	}

	public function getEstante_id(){
		return $this->estante_id;
	}

	public function setEstante_id($estante_id){
		$this->estante_id = $estante_id;
	}

	public function getLaboratorio_id(){
		return $this->laboratorio_id;
	}

	public function setLaboratorio_id($laboratorio_id){
		$this->laboratorio_id = $laboratorio_id;
	}

	public function getTipo_producto_id(){
		return $this->tipo_producto_id;
	}

	public function setTipo_producto_id($tipo_producto_id){
		$this->tipo_producto_id = $tipo_producto_id;
	}

	public function getProveedor_id(){
		return $this->proveedor_id;
	}

	public function setProveedor_id($proveedor_id){
		$this->proveedor_id = $proveedor_id;
	}

}
