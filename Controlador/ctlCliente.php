<?php

require '../Infraestructura/CORS.php';
include "../Modelo/clsCliente.php";
include '../DAO/clienteDAO.php';

$id = isset($_REQUEST['id']) ? $_REQUEST['id'] : "";
$nombres = isset($_REQUEST['nombres']) ? $_REQUEST['nombres'] : "";
$apellidos = isset($_REQUEST['apellidos']) ? $_REQUEST['apellidos'] : "";
$tipo_documento_id = isset($_REQUEST['tipo_documento_id']) ? $_REQUEST['tipo_documento_id'] : "";
$numero_documento = isset($_REQUEST['numero_documento']) ? $_REQUEST['numero_documento'] : "";
$genero_id = isset($_REQUEST['genero_id']) ? $_REQUEST['genero_id'] : "";
$codigo_validacion = isset($_REQUEST['codigo_validacion']) ? $_REQUEST['codigo_validacion'] : "";
$ciudad_id = isset($_REQUEST['ciudad_id']) ? $_REQUEST['ciudad_id'] : "";
$correo = isset($_REQUEST['correo']) ? $_REQUEST['correo'] : "";
$usuario = isset($_REQUEST['usuario']) ? $_REQUEST['usuario'] : "";
$password = isset($_REQUEST['password']) ? $_REQUEST['password'] : "";
$type = isset($_REQUEST['type']) ? $_REQUEST['type'] : "";

$cliente = new clsCliente($id, $nombres, $apellidos, $tipo_documento_id, $numero_documento, $genero_id, $codigo_validacion, $ciudad_id, $correo, $usuario, $password);
$conex = new clienteDAO();

switch ($type) {
    case "save":
        $conex->guardar($cliente);
        break;
    case "search":
        $conex->buscar($cliente);
        break;
    case "delete":
        $conex->eliminar($cliente);
        break;
    case "update":
        $conex->modificar($cliente);
        break;
    case "list":
        $conex->listar();
        break;
    case "histo":
        $conex->histo($cliente);
        break;
}
