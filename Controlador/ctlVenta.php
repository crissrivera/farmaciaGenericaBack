<?php

require '../Infraestructura/CORS.php';
include "../Modelo/clsVenta.php";
include '../DAO/ventaDAO.php';

$id = isset($_REQUEST['id']) ? $_REQUEST['id'] : "";
$fecha_venta = isset($_REQUEST['fecha_venta']) ? $_REQUEST['fecha_venta'] : "";
$hora = isset($_REQUEST['hora']) ? $_REQUEST['hora'] : "";
$valor_total = isset($_REQUEST['valor_total']) ? $_REQUEST['valor_total'] : "";
$empleado_id = isset($_REQUEST['empleado_id']) ? $_REQUEST['empleado_id'] : "";
$cliente_id = isset($_REQUEST['cliente_id']) ? $_REQUEST['cliente_id'] : "";
$estado = isset($_REQUEST['estado']) ? $_REQUEST['estado'] : "";
$type = isset($_REQUEST['type']) ? $_REQUEST['type'] : "";

$venta = new clsVenta($id, $fecha_venta, $hora, $valor_total, $empleado_id,$cliente_id,$estado);

$conex = new ventaDAO();

switch ($type) {
    case "save":
        $conex->craerVenta($venta);
        break;
    case "search":
        $conex->buscar($venta);
        break;
    case "delete":
        $conex->eliminar($venta);
        break;
    case "list":
        $conex->listar();
        break;
    case "listTotal":
        $conex->listarTotalVenta();
        break;
        /*     case "update":
        $conex->modificar($venta);
        break; */
}
