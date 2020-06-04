<?php

require '../Infraestructura/CORS.php';
include "../Modelo/clsProveedor.php";
include '../DAO/proveedorDAO.php';

$id = isset($_REQUEST['id']) ? $_REQUEST['id'] : "";
$nombre = isset($_REQUEST['nombre']) ? $_REQUEST['nombre'] : "";
$nit = isset($_REQUEST['nit']) ? $_REQUEST['nit'] : "";
$direccion = isset($_REQUEST['direccion']) ? $_REQUEST['direccion'] : "";
$ciudad_id = isset($_REQUEST['ciudad_id']) ? $_REQUEST['ciudad_id'] : "";
$correo = isset($_REQUEST['correo']) ? $_REQUEST['correo'] : "";
$type = isset($_REQUEST['type']) ? $_REQUEST['type'] : "";

$proveedor = new clsProveedor($id, $nombre, $nit, $direccion, $ciudad_id,$correo);
$conex = new proveedorDAO();

switch ($type) {
    case "save":
        $conex->guardar($proveedor);
        break;
    case "search":
        $conex->buscar($proveedor);
        break;
    case "delete":
        $conex->eliminar($proveedor);
        break;
    case "update":
        $conex->modificar($proveedor);
        break;
    case "list":
        $conex->listar();
        break;
}
