<?php

require '../Infraestructura/CORS.php';
include "../Modelo/clsList.php";
include '../DAO/listDAO.php';

$id = isset($_REQUEST['id']) ? $_REQUEST['id'] : "";
$type = isset($_REQUEST['type']) ? $_REQUEST['type'] : "";

$select = new clsList($id);
$conex = new listDAO();

switch ($type) {

    case "listTipoDocumentos":
        $conex->listaTipoDocumentos();
        break;

    case "listGeneros":
        $conex->listaGeneros();
        break;

    case "listCiudad":
        $conex->listaCiudad();
        break;

    case "listEstantes":
        $conex->listaEstantes();
        break;

    case "listTipoProducto":
        $conex->listaTipoProducto();
        break;

    case "listTipoUsuario":
        $conex->listaTipoUsuario();
        break;
        
    case "listLaboratorios":
        $conex->listaLaboratorios();
        break;

    case "listProveedores":
        $conex->listaProveedores();
        break;

    case "listInventarioVenta":
        $conex->listaInventarioVenta($select);
        break;

    case "listInventario":
        $conex->listaInventario();
        break;

    case "listClientes":
        $conex->ListaClientes();
        break;

    case "listEmpleados":
        $conex->ListaEmpleados();
        break;


        
}
