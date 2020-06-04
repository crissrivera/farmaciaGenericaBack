<?php

class ventaDAO
{
    private $dao;

    function __construct()
    {
        //Generico
        require '../DAO/genericoDAO.php';
        $this->dao = new genericoDAO();
    }

    public function craerVenta(clsVenta $obj)
    {
        $this->dao->crearConsulta("guardarVenta", array($obj->getValor_total(), $obj->getEmpleado_id(), $obj->getCliente_id(),$obj->getEstado()), "funcion");
    }

    public function buscar(clsVenta $obj)
    {
        $this->dao->crearConsulta("buscarVenta", array($obj->getId()), "procedimiento");
    }

    public function eliminar(clsVenta $obj)
    {
        $this->dao->crearConsulta("eliminarVenta", array($obj->getId()), "funcion");
    }

    public function listar()
    {
        $this->dao->crearConsulta("listarVentas", array(0), "procedimiento");
    }

    public function listarTotalVenta()
    {
        $this->dao->crearConsulta("listarTotalVenta", array(0), "procedimiento");
    }

       /*  public function modificar(clsVenta $obj)
    {
        $this->dao->crearConsulta("modificarVenta", array(
            $obj->getId(),$obj->getCliente_id()), "funcion");
    }
 */
    
}
