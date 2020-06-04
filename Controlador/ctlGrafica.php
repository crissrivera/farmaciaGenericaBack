<?php

require '../Infraestructura/CORS.php';
include '../DAO/reportesDAO.php';
$type = isset($_REQUEST['type']) ? $_REQUEST['type'] : "";
$conex = new reportesDAO();

switch ($type) {
    case "cantidadProductos":
        $conex->cantidadProductosPorProducto();
        break;
    case "cantidadGeneros":
        $conex->clientesHombresMujeres();
        break;
    case 'cantidadProductoVendidos':
        $conex->cantidadProductosVendidosGanancias();
    break;
    case 'ventasPorEmpleado':
        $conex->ventasPorEmpleadoIngresoso();    
    break;
    case 'ventasDiasDelMes':
        $conex->ventasPorDiaDelMesIngresosDiarios();
        break;
    case 'ventasDiasDeLaSemana':
            $conex->ventasPorDiaDeLaSemanaIngresosDia();
            break;
}