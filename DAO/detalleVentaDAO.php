<?php

class detalleVentaDAO
{
    private $dao;

    function __construct()
    {
        //Generico
        require '../DAO/genericoDAO.php';
        $this->dao = new genericoDAO();
    }

    public function guardar(clsDetalleVenta $obj)
    {
        $this->dao->crearConsulta("guardarDetalleVenta", array( $obj->getVenta_id(),$obj->getCantidad().",", $obj->getInventario_id().","), "funcion");
    }

    public function guardarConPuntos(clsDetalleVenta $obj)
    {
        $this->dao->crearConsulta("guardarDetalleVenta", array( $obj->getVenta_id(),$obj->getCantidad().",", $obj->getInventario_id().","), "funcion");
    }

/*     public function eliminar(clsDetalleVenta $obj)
    {
        $this->dao->crearConsulta("eliminarDetalleVenta", array($obj->getId()), "funcion");
    } */

    public function listar(clsDetalleVenta $obj)
    {
        $this->dao->crearConsulta("listarDetallesVenta", array($obj->getId()), "procedimiento");
    }

    /*     public function buscar(clsDetalleVenta $obj)
    {
        $this->dao->crearConsulta("buscarDetalleVenta", array($obj->getId()), "procedimiento");
    }

    public function modificar(clsDetalleVenta $obj)
    {
        $this->dao->crearConsulta("modificarDetalleVenta", array(
            $obj->getId(),$obj->getCantidad(), $obj->getInventario_id(), $obj->getVenta_id()), "funcion");
    } */


}
