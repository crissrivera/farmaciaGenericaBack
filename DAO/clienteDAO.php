<?php

class clienteDAO
{
    private $dao;

    function __construct()
    {
        //Generico
        require '../DAO/genericoDAO.php';
        $this->dao = new genericoDAO();
    }

    public function guardar(clsCliente $obj)
    {
        $this->dao->crearConsulta("guardarCliente", array($obj->getNombres(),$obj->getApellidos(),$obj->getTipo_documento_id(),$obj->getNumero_documento(),$obj->getGenero_id(),$obj->getCodigo_validacion(),$obj->getCiudad_id(), $obj->getCorreo(), $obj->getUsuario(), md5($obj->getPassword())), "funcion");
    }

    public function buscar(clsCliente $obj)
    {
        $this->dao->crearConsulta("buscarCliente", array($obj->getId()), "procedimiento");
    }

    public function eliminar(clsCliente $obj)
    {
        $this->dao->crearConsulta("eliminarCliente", array($obj->getId()), "funcion");
    }

    public function modificar(clsCliente $obj)
    {
        $this->dao->crearConsulta("modificarCliente", array(
            $obj->getId(), $obj->getNombres(),$obj->getApellidos(),$obj->getTipo_documento_id(),$obj->getNumero_documento(),$obj->getGenero_id(),$obj->getCodigo_validacion(),$obj->getCiudad_id(), $obj->getCorreo(), $obj->getUsuario(), md5($obj->getPassword())), "funcion");
    }

    public function listar()
    {
        $this->dao->crearConsulta("listarClientes", array(0), "procedimiento");
    }

    public function histo(clsCliente $obj)
    {
        $this->dao->crearConsulta("listarHitoricoCliente", array($obj->getNumero_documento()), "procedimiento");
    }

}
