<?php

require '../Infraestructura/CORS.php';
include "../Modelo/clsEstante.php";
include '../DAO/estanteDAO.php';

$id = isset($_REQUEST['id']) ? $_REQUEST['id'] : "";
$nombre = isset($_REQUEST['nombre']) ? $_REQUEST['nombre'] : "";
$descripcion = isset($_REQUEST['descripcion']) ? $_REQUEST['descripcion'] : "";
$type = isset($_REQUEST['type']) ? $_REQUEST['type'] : "";

$estante = new clsEstante($id, $nombre, $descripcion);
$conex = new estanteDAO();

switch ($type) {
    case "save":
        $conex->guardar($estante);
        break;
    case "search":
        $conex->buscar($estante);
        break;
    case "delete":
        $conex->eliminar($estante);
        break;
    case "update":
        $conex->modificar($estante);
        break;
    case "list":
        $conex->listar();
        break;
}
