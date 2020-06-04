<?php

require '../Infraestructura/CORS.php';
include "../Modelo/clsLaboratorio.php";
include '../DAO/laboratorioDAO.php';

$id = isset($_REQUEST['id']) ? $_REQUEST['id'] : "";
$nombre = isset($_REQUEST['nombre']) ? $_REQUEST['nombre'] : "";
$descripcion = isset($_REQUEST['descripcion']) ? $_REQUEST['descripcion'] : "";
$type = isset($_REQUEST['type']) ? $_REQUEST['type'] : "";

$laboratorio = new clsLaboratorio($id, $nombre, $descripcion);
$conex = new laboratorioDAO();

switch ($type) {
    case "save":
        $conex->guardar($laboratorio);
        break;
    case "search":
        $conex->buscar($laboratorio);
        break;
    case "delete":
        $conex->eliminar($laboratorio);
        break;
    case "update":
        $conex->modificar($laboratorio);
        break;
    case "list":
        $conex->listar();
        break;
}
