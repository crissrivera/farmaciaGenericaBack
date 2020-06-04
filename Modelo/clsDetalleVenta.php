<?php

class clsDetalleVenta
{

    private $id;
    private $cantidad;
    private $inventario_id;
    private $venta_id;

    function __construct($id, $cantidad, $inventario_id, $venta_id)
    {
        $this->id = $id;
        $this->cantidad = $cantidad;
        $this->inventario_id = $inventario_id;
        $this->venta_id = $venta_id;
    }

    function getId()
    {
        return $this->id;
    }

    function getCantidad()
    {
        return $this->cantidad;
    }

    function getInventario_id()
    {
        return $this->inventario_id;
    }

    function getVenta_id()
    {
        return $this->venta_id;
    }

    function setId($id)
    {
        $this->id = $id;
    }

    function setCantidad($cantidad)
    {
        $this->cantidad = $cantidad;
    }

    function setInventario_id($inventario_id)
    {
        $this->inventario_id = $inventario_id;
    }

    function setVenta_id($venta_id)
    {
        $this->venta_id = $venta_id;
    }
}
