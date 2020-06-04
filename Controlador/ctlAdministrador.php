<?php

require '../Infraestructura/CORS.php';
include "../Modelo/clsAdministrador.php";
include '../DAO/administradorDAO.php';

$id = isset($_REQUEST['id']) ? $_REQUEST['id'] : "";
$nombres = isset($_REQUEST['nombres']) ? $_REQUEST['nombres'] : "";
$apellidos = isset($_REQUEST['apellidos']) ? $_REQUEST['apellidos'] : "";
$tipo_documento_id = isset($_REQUEST['tipo_documento_id']) ? $_REQUEST['tipo_documento_id'] : "";
$numero_documento = isset($_REQUEST['numero_documento']) ? $_REQUEST['numero_documento'] : "";
$genero_id = isset($_REQUEST['genero_id']) ? $_REQUEST['genero_id'] : "";
$correo = isset($_REQUEST['correo']) ? $_REQUEST['correo'] : "";
$usuario = isset($_REQUEST['usuario']) ? $_REQUEST['usuario'] : "";
$password = isset($_REQUEST['password']) ? $_REQUEST['password'] : "";
$type = isset($_REQUEST['type']) ? $_REQUEST['type'] : "";

$administrador = new clsAdministrador($id, $nombres, $apellidos, $tipo_documento_id, $numero_documento, $genero_id, $correo, $usuario, $password);
$conex = new administradorDAO();

switch ($type) {
    case "save":
        $conex->guardar($administrador);
        break;
    case "search":
        $conex->buscar($administrador);
        break;
    case "delete":
        $conex->eliminar($administrador);
        break;
    case "update":
        $conex->modificar($administrador);
        break;
    case "list":
        $conex->listar();
        break;
}
