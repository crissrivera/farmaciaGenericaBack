<?php

class estanteDAO
{
    private $dao;

    function __construct()
    {
        //Generico
        require '../DAO/genericoDAO.php';
        $this->dao = new genericoDAO();
    }

    public function guardar(clsEstante $obj)
    {
        $this->dao->crearConsulta("guardarEstante", array($obj->getNombre(), $obj->getDescripcion()), "funcion");
    }

    public function buscar(clsEstante $obj)
    {
        $this->dao->crearConsulta("buscarEstante", array($obj->getId()), "procedimiento");
    }

    public function eliminar(clsEstante $obj)
    {
        $this->dao->crearConsulta("eliminarEstante", array($obj->getId()), "funcion");
    }

    public function modificar(clsEstante $obj)
    {
        $this->dao->crearConsulta("modificarEstante", array( $obj->getId(),  $obj->getNombre(), $obj->getDescripcion()), "funcion");
    }

    public function listar()
    {
        $this->dao->crearConsulta("listarEstantes", array(0), "procedimiento");
    }
}
