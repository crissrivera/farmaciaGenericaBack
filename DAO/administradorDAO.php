<?php

class administradorDAO
{
    private $dao;

    function __construct()
    {
        //Generico
        require '../DAO/genericoDAO.php';
        $this->dao = new genericoDAO();
    }

    public function guardar(clsAdministrador $obj)
    {
        $this->dao->crearConsulta("guardarAdministrador", array($obj->getNombres(),$obj->getApellidos(),$obj->getTipo_documento_id(),$obj->getNumero_documento(),$obj->getGenero_id(), $obj->getCorreo(), $obj->getUsuario(), md5($obj->getPassword())), "funcion");
    }

    public function buscar(clsAdministrador $obj)
    {
        $this->dao->crearConsulta("buscarAdministrador", array($obj->getId()), "procedimiento");
    }

    public function eliminar(clsAdministrador $obj)
    {
        $this->dao->crearConsulta("eliminarAdministrador", array($obj->getId()), "funcion");
    }

    public function modificar(clsAdministrador $obj)
    {
        $this->dao->crearConsulta("modificarAdministrador", array(
            $obj->getId(),$obj->getNombres(),$obj->getApellidos(),$obj->getTipo_documento_id(),$obj->getNumero_documento(),$obj->getGenero_id(), $obj->getCorreo(), $obj->getUsuario(), md5($obj->getPassword())), "funcion");
    }

    public function listar()
    {
        $this->dao->crearConsulta("listarAdministradores", array(0), "procedimiento");
    }

}
