<?php

class empleadoDAO
{
    private $dao;

    function __construct()
    {
        //Generico
        require '../DAO/genericoDAO.php';
        $this->dao = new genericoDAO();
    }

    public function guardar(clsEmpleado $obj)
    {
        $this->dao->crearConsulta("guardarEmpleado", array($obj->getNombres(),$obj->getApellidos(),$obj->getTipo_documento_id(),$obj->getNumero_documento(),$obj->getFecha_ingreso(),$obj->getGenero_id(), $obj->getCorreo(), $obj->getUsuario(), md5($obj->getPassword())), "funcion");
    }

    public function buscar(clsEmpleado $obj)
    {
        $this->dao->crearConsulta("buscarEmpleado", array($obj->getId()), "procedimiento");
    }

    public function eliminar(clsEmpleado $obj)
    {
        $this->dao->crearConsulta("eliminarEmpleado", array($obj->getId()), "funcion");
    }

    public function modificar(clsEmpleado $obj)
    {
        $this->dao->crearConsulta("modificarEmpleado", array(
            $obj->getId(),$obj->getNombres(),$obj->getApellidos(),$obj->getTipo_documento_id(),$obj->getNumero_documento(),$obj->getFecha_ingreso(),$obj->getGenero_id(), $obj->getCorreo(), $obj->getUsuario(), md5($obj->getPassword())), "funcion");
    }

    public function listar()
    {
        $this->dao->crearConsulta("listarEmpleados", array(0), "procedimiento");
    }

}
