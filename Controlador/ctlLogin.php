<?php

require '../Infraestructura/CORS.php';
include '../Modelo/clsLogin.php';
include '../DAO/loginDAO.php';

$type = isset($_REQUEST['type']) ? $_REQUEST['type'] : "";
$usuario = isset($_REQUEST['usuario']) ? $_REQUEST['usuario'] : "";
$password = isset($_REQUEST['password']) ? $_REQUEST['password'] : "";
$tipo_usuario_id = isset($_REQUEST['tipo_usuario_id']) ? $_REQUEST['tipo_usuario_id'] : "";
session_start();

$login = new clsLogin($usuario, $password,$tipo_usuario_id);
$conex = new loginDAO;

switch ($type) {
    case "con":
        $conex->loguear($login);
        break;

    case "desc":
        session_destroy();
        
        $mensaje = "Session cerrada correctamente";
        header('location:../index.php?msjlogin=' . $mensaje);
        break;
}
