<?php

require '../Infraestructura/CORS.php';
include "../Modelo/clsInventario.php";
include '../DAO/inventario.php';

$id = isset($_REQUEST['id']) ? $_REQUEST['id'] : "";
$nombre = isset($_REQUEST['nombre']) ? $_REQUEST['nombre'] : "";
$descripcion = isset($_REQUEST['descripcion']) ? $_REQUEST['descripcion'] : "";
$fecha_vencimiento = isset($_REQUEST['fecha_vencimiento']) ? $_REQUEST['fecha_vencimiento'] : "";
$cantidad = isset($_REQUEST['cantidad']) ? $_REQUEST['cantidad'] : "";
$fecha_fabricacion = isset($_REQUEST['fecha_fabricacion']) ? $_REQUEST['fecha_fabricacion'] : "";
$precio = isset($_REQUEST['precio']) ? $_REQUEST['precio'] : "";
$usuario_id = isset($_REQUEST['usuario_id']) ? $_REQUEST['usuario_id'] : "";
$laboratorio_id = isset($_REQUEST['laboratorio_id']) ? $_REQUEST['laboratorio_id'] : "";
$type = isset($_REQUEST['type']) ? $_REQUEST['type'] : "";

$inventario = new clsInventario($id, $nombre, $descripcion, $fecha_vencimiento, $cantidad, $fecha_fabricacion, $precio, $usuario_id, $laboratorio_id);
$conex = new inventario();

switch ($type) {
    case "save":
        $conex->guardar($inventario);
        break;
    case "search":
        $conex->buscar($inventario);
        break;
    case "delete":
        $conex->eliminar($inventario);
        break;
    case "update":
        $conex->modificar($inventario);
        break;
    case "list":
        $conex->listar();
        break;
}
