<?php

require '../Infraestructura/CORS.php';
include "../Modelo/clsDetalleVenta.php";
include '../DAO/detalleVentaDAO.php';


$id = isset($_REQUEST['id']) ? $_REQUEST['id'] : "";
$cantidad = isset($_REQUEST['cantidad']) ? $_REQUEST['cantidad'] : "";
$inventario_id = isset($_REQUEST['inventario_id']) ? $_REQUEST['inventario_id'] : "";
$venta_id = isset($_REQUEST['venta_id']) ? $_REQUEST['venta_id'] : "";
$type = isset($_REQUEST['type']) ? $_REQUEST['type'] : "";

$detalleVenta = new clsDetalleVenta($id, $cantidad, $inventario_id, $venta_id);
$conex = new detalleVentaDAO();

switch ($type) {

    case "save":
        $conex->guardar($detalleVenta);
        break;      
    case "save_points":
        $conex->guardarConPuntos($detalleVenta);
        break; 
    case "list":
        $conex->listar($detalleVenta);
        break;
/*     case "delete":
        $conex->eliminar($detalleVenta);
        break; */
        /*     case "search":
        $conex->buscar($detalleVenta);
        break;
    case "update":
        $conex->modificar($detalleVenta);
        break;  */ 
}
