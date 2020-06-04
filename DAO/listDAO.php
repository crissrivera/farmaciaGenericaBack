<?php
class listDAO
{
    private $objCon;

    function __construct()
    {
        require __DIR__ . '\..\Infraestructura\clsConexion.php';
        $this->objCon = new clsConexion();
        $this->con = $this->objCon->conectar();
    }

    public function listaTipoDocumentos()
    {
        $sql = "select id,nombre from tipo_documento";
        $this->objCon->Execute($sql);
    }

    public function listaGeneros()
    {
        $sql = "select id,nombre from genero";
        $this->objCon->Execute($sql);
    }

    public function listaCiudad()
    {
        $sql = "select id,nombre from ciudad";
        $this->objCon->Execute($sql);
    }

    public function listaEstantes()
    {
        $sql = "select id,nombre from estante";
        $this->objCon->Execute($sql);
    }

    public function listaTipoProducto()
    {
        $sql = "select id,nombre from tipo_producto";
        $this->objCon->Execute($sql);
    }

    public function listaTipoUsuario()
    {
        $sql = "select id,nombre from tipo_usuario";
        $this->objCon->Execute($sql);
    }

    public function listaLaboratorios()
    {
        $sql = "select id,nombre from laboratorio";
        $this->objCon->Execute($sql);
    }

    public function listaProveedores()
    {
        $sql = "select id,nombre from proveedor";
        $this->objCon->Execute($sql);
    }

    public function listaInventarioVenta(clsList $obj)
    {
        $sql = "select id,nombre from inventario where estante_id=".$obj->getId();
        $this->objCon->Execute($sql);
    }

    public function listaInventario()
    {
        $sql = "select id,nombre,precio,cantidad from inventario";
        $this->objCon->Execute($sql);
    }

    public function listaClientes()
    {
        $sql = "select id,numero_documento from cliente";
        $this->objCon->Execute($sql);
    }

    public function listaEmpleados()
    {
        $sql = "select id,numero_documento from empleado";
        $this->objCon->Execute($sql);
    }
}
