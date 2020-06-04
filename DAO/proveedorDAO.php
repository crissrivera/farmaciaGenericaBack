<?php

class proveedorDAO
{
    private $dao;

    function __construct()
    {
        //Generico
        require '../DAO/genericoDAO.php';
        $this->dao = new genericoDAO();
    }

    public function guardar(clsProveedor $obj)
    {
        $this->dao->crearConsulta("guardarProveedor", array($obj->getNombre(), $obj->getNit(), $obj->getDireccion(), $obj->getCiudad_id(), $obj->getCorreo()), "funcion");
    }

    public function buscar(clsProveedor $obj)
    {
        $this->dao->crearConsulta("buscarProveedor", array($obj->getId()), "procedimiento");
    }

    public function eliminar(clsProveedor $obj)
    {
        $this->dao->crearConsulta("eliminarProveedor", array($obj->getId()), "funcion");
    }

    public function modificar(clsProveedor $obj)
    {
        $this->dao->crearConsulta("modificarProveedor", array( $obj->getId(), $obj->getNombre(), $obj->getNit(), $obj->getDireccion(), $obj->getCiudad_id(), $obj->getCorreo()), "funcion");
    }

    public function listar()
    {
        $this->dao->crearConsulta("listarProveedores", array(0), "procedimiento");
    }
}
