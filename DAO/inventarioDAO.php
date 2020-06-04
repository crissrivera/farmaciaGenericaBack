<?php

class inventarioDAO
{
    private $dao;

    function __construct()
    {
        //Generico
        require '../DAO/genericoDAO.php';
        $this->dao = new genericoDAO();
    }

    public function guardar(clsInventario $obj)
    {
        $this->dao->crearConsulta("guardarInventario", array($obj->getNombre(), $obj->getDescripcion(), $obj->getFecha_vencimiento(), $obj->getCantidad(), $obj->getFecha_fabricacion(), $obj->getPrecio(), $obj->getUsuario_id(), $obj->getLaboratorio_id()), "funcion");
    }

    public function buscar(clsInventario $obj)
    {
        $this->dao->crearConsulta("buscarInventario", array($obj->getId()), "procedimiento");
    }

    public function eliminar(clsInventario $obj)
    {
        $this->dao->crearConsulta("eliminarInventario", array($obj->getId()), "funcion");
    }

    public function modificar(clsInventario $obj)
    {
        $this->dao->crearConsulta("modificarInventario", array(
            $obj->getId(), $obj->getNombre(), $obj->getDescripcion(), $obj->getFecha_vencimiento(), $obj->getCantidad(), $obj->getFecha_fabricacion(), $obj->getPrecio(), $obj->getUsuario_id(), $obj->getLaboratorio_id()), "funcion");
    }

    public function listar()
    {
        $this->dao->crearConsulta("listarInventario", array(0), "procedimiento");
    }

    
}
