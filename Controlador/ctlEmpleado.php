<?php

require '../Infraestructura/CORS.php';
include "../Modelo/clsEmpleado.php";
include '../DAO/empleadoDAO.php';

$id = isset($_REQUEST['id']) ? $_REQUEST['id'] : "";
$nombres = isset($_REQUEST['nombres']) ? $_REQUEST['nombres'] : "";
$apellidos = isset($_REQUEST['apellidos']) ? $_REQUEST['apellidos'] : "";
$tipo_documento_id = isset($_REQUEST['tipo_documento_id']) ? $_REQUEST['tipo_documento_id'] : "";
$numero_documento = isset($_REQUEST['numero_documento']) ? $_REQUEST['numero_documento'] : "";
$fecha_ingreso = isset($_REQUEST['fecha_ingreso']) ? $_REQUEST['fecha_ingreso'] : "";
$genero_id = isset($_REQUEST['genero_id']) ? $_REQUEST['genero_id'] : "";
$correo = isset($_REQUEST['correo']) ? $_REQUEST['correo'] : "";
$usuario = isset($_REQUEST['usuario']) ? $_REQUEST['usuario'] : "";
$password = isset($_REQUEST['password']) ? $_REQUEST['password'] : "";
$type = isset($_REQUEST['type']) ? $_REQUEST['type'] : "";

$empleado = new clsEmpleado($id, $nombres, $apellidos, $tipo_documento_id, $numero_documento,$fecha_ingreso, $genero_id, $correo, $usuario, $password);
$conex = new empleadoDAO();

switch ($type) {
    case "save":
        $conex->guardar($empleado);
        break;
    case "search":
        $conex->buscar($empleado);
        break;
    case "delete":
        $conex->eliminar($empleado);
        break;
    case "update":
        $conex->modificar($empleado);
        break;
    case "list":
        $conex->listar();
        break;
}
