
/* SQL_PL de Laboratorio */

DELIMITER //

CREATE FUNCTION guardarLaboratorio(
  vnombre VARCHAR(45),
  vdescripcion VARCHAR(500)) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que almacena un laboratorio'
BEGIN
DECLARE res int DEFAULT 0;
IF NOT EXISTS(SELECT nombre FROM laboratorio WHERE nombre=vnombre)
THEN
INSERT INTO laboratorio(nombre,descripcion,estado) 
VALUES (vnombre,vdescripcion,"activo");
set res=1;
ELSEIF EXISTS(SELECT nombre,estado FROM laboratorio WHERE nombre=vnombre and estado="desactivo")
THEN
UPDATE laboratorio set estado="activo",descripcion=vdescripcion where nombre=vnombre;
set res=1;
END IF;
RETURN res;
END //

CREATE FUNCTION modificarLaboratorio (
  vid INT,
  vnombre VARCHAR(45) ,
  vdescripcion VARCHAR(500)) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que actualiza un laboratorio'
BEGIN
DECLARE res int DEFAULT 0;
IF EXISTS(SELECT id FROM laboratorio WHERE id=vid)
THEN
UPDATE laboratorio set nombre=vnombre,descripcion=vdescripcion where id=vid;
set res=1;
END IF;
RETURN res;
END //

CREATE PROCEDURE buscarLaboratorio (vid INT) 
COMMENT 'Procedimiento que busca un laboratorio'
BEGIN
SELECT id,nombre,descripcion from laboratorio where id=vid and estado="activo";
END //

CREATE FUNCTION eliminarLaboratorio (vid INT) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que elimina a un laboratorio'
BEGIN
DECLARE res int DEFAULT 0;
UPDATE laboratorio set estado="desactivo" where id=vid;
set res=1;
RETURN res;
END //

CREATE PROCEDURE listarLaboratorios (vid INT) 
COMMENT 'Procedimiento que lista laboratorios'
BEGIN
SELECT id,nombre,descripcion from laboratorio where estado="activo";
END //

DELIMITER ;


/* SQL_PL de Estante */

DELIMITER //

CREATE FUNCTION guardarEstante(
  vnombre VARCHAR(45),
  vdescripcion VARCHAR(500)) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que almacena un estante'
BEGIN
DECLARE res int DEFAULT 0;
IF NOT EXISTS(SELECT nombre FROM estante WHERE nombre=vnombre)
THEN
INSERT INTO estante(nombre,estado,descripcion) 
VALUES (vnombre,"activo",vdescripcion);
set res=1;
ELSEIF EXISTS(SELECT nombre,estado FROM estante WHERE nombre=vnombre and estado="desactivo")
THEN
UPDATE estante set estado="activo",descripcion=vdescripcion where nombre=vnombre;
set res=1;
END IF;
RETURN res;
END //

CREATE FUNCTION modificarEstante (
  vid INT,
  vnombre VARCHAR(45) ,
  vdescripcion VARCHAR(500)) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que actualiza un estante'
BEGIN
DECLARE res int DEFAULT 0;
IF EXISTS(SELECT id FROM estante WHERE id=vid and id<>1 and id<>2)
THEN
UPDATE estante set nombre=vnombre,descripcion=vdescripcion where id=vid;
set res=1;
END IF;
RETURN res;
END //

CREATE PROCEDURE buscarEstante (vid INT) 
COMMENT 'Procedimiento que busca un estante'
BEGIN
SELECT id,nombre,descripcion from estante where id=vid and estado="activo";
END //

CREATE FUNCTION eliminarEstante (vid INT) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que elimina a un estante'
BEGIN
DECLARE res int DEFAULT 0;
IF EXISTS(SELECT id FROM estante WHERE id=vid and id<>1 and id<>2)
THEN
UPDATE estante set estado="desactivo" where id=vid;
set res=1;
END IF;
RETURN res;
END //

CREATE PROCEDURE listarEstantes (vid INT) 
COMMENT 'Procedimiento que lista estantes'
BEGIN
SELECT id,nombre,descripcion from estante where estado="activo";
END //

DELIMITER ;


/* SQL_PL de Proveedor */

DELIMITER //

CREATE FUNCTION guardarProveedor(
  vnombre VARCHAR(45),
  vnit VARCHAR(45),
  vdireccion VARCHAR(45),
  vciudad_id INT,
  vcorreo VARCHAR(45)) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que almacena un proveedor'
BEGIN
DECLARE res int DEFAULT 0;
IF NOT EXISTS(SELECT nit FROM proveedor WHERE nit=vnit)
THEN
INSERT INTO proveedor(nombre,nit,direccion,estado,ciudad_id,correo) 
VALUES (vnombre,vnit,vdireccion,"activo",vciudad_id,vcorreo);
set res=1;
ELSEIF EXISTS(SELECT nombre,estado FROM proveedor WHERE nit=vnit and estado="desactivo")
THEN
UPDATE proveedor set estado="activo",nombre=vnombre,direccion=vdireccion,ciudad_id=vciudad_id,correo=vcorreo where nit=vnit;
set res=1;
END IF;
RETURN res;
END //

CREATE FUNCTION modificarProveedor (
  vid INT,
  vnombre VARCHAR(45),
  vnit VARCHAR(45),
  vdireccion VARCHAR(45),
  vciudad_id INT,
  vcorreo VARCHAR(45)) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que actualiza un proveedor'
BEGIN
DECLARE res int DEFAULT 0;
IF EXISTS(SELECT id FROM proveedor WHERE id=vid)
THEN
UPDATE proveedor set nombre=vnombre,nit=vnit,direccion=vdireccion,ciudad_id=vciudad_id,correo=vcorreo where id=vid;
set res=1;
END IF;
RETURN res;
END //

CREATE PROCEDURE buscarProveedor (vid INT) 
COMMENT 'Procedimiento que busca un proveedor'
BEGIN
SELECT id,nombre,nit,direccion,ciudad_id,correo from proveedor where id=vid and estado="activo";
END //

CREATE FUNCTION eliminarProveedor (vid INT) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que elimina a un proveedor'
BEGIN
DECLARE res int DEFAULT 0;
UPDATE proveedor set estado="desactivo" where id=vid;
set res=1;
RETURN res;
END //

CREATE PROCEDURE listarProveedores (vid INT) 
COMMENT 'Procedimiento que lista proveedores'
BEGIN
SELECT p.id,p.nombre,p.nit,p.direccion,c.nombre ciudad_nombre,p.correo from proveedor p INNER join ciudad  c  on c.id=p.ciudad_id where estado="activo";
END //

DELIMITER ;


/* SQL_PL de Empleado */

DELIMITER //

CREATE FUNCTION guardarEmpleado(
  vnombres VARCHAR(100),
  vapellidos VARCHAR(100),
  vtipo_documento_id INT,
  vnumero_documento VARCHAR(45),
  vfecha_ingreso DATE,
  vgenero_id INT,
  vcorreo VARCHAR(45),
  vusuario VARCHAR(45),
  vpassword VARCHAR(45)) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que almacena un empleado'
BEGIN
DECLARE res int DEFAULT 0;
IF NOT EXISTS(SELECT numero_documento FROM empleado  WHERE numero_documento=vnumero_documento)
THEN
INSERT INTO login(usuario,password,tipo_usuario_id,estado) VALUES (vusuario,vpassword,2,"activo");
INSERT INTO empleado(nombres,apellidos,tipo_documento_id,numero_documento,fecha_ingreso,genero_id,estado,login_id,correo) 
VALUES (vnombres,vapellidos,vtipo_documento_id,vnumero_documento,vfecha_ingreso,vgenero_id,"activo",(SELECT id FROM login where usuario=vusuario),vcorreo);
set res=1;
ELSEIF EXISTS(SELECT numero_documento,estado FROM empleado WHERE numero_documento=vnumero_documento and estado="desactivo")
THEN
UPDATE empleado set estado="activo",nombres=vnombres,apellidos=vapellidos,tipo_documento_id=vtipo_documento_id,fecha_ingreso=vfecha_ingreso,genero_id=vgenero_id,correo=vcorreo where numero_documento=vnumero_documento;
UPDATE login set estado="activo",usuario=vusuario,password=vpassword where id=(SELECT login_id FROM empleado where numero_documento=vnumero_documento);
set res=1;
END IF;
RETURN res;
END //

CREATE FUNCTION modificarEmpleado (
  vid INT,
  vnombres VARCHAR(100),
  vapellidos VARCHAR(100),
  vtipo_documento_id INT,
  vnumero_documento VARCHAR(45),
  vfecha_ingreso DATE,
  vgenero_id INT,
  vcorreo VARCHAR(45),
  vusuario VARCHAR(45),
  vpassword VARCHAR(45)) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que actualiza un empleado'
BEGIN
DECLARE res int DEFAULT 0;
IF EXISTS(SELECT id FROM empleado WHERE id=vid)
THEN
UPDATE empleado set nombres=vnombres,apellidos=vapellidos,tipo_documento_id=vtipo_documento_id,numero_documento=vnumero_documento,fecha_ingreso=vfecha_ingreso,genero_id=vgenero_id,correo=vcorreo where id=vid;
UPDATE login set usuario=vusuario,password=vpassword where id=(SELECT login_id FROM empleado where id=vid);
set res=1;
END IF;
RETURN res;
END //

CREATE PROCEDURE buscarEmpleado (vid INT) 
COMMENT 'Procedimiento que busca un empleado'
BEGIN
SELECT e.id,e.nombres,e.apellidos,e.tipo_documento_id,e.numero_documento,e.fecha_ingreso,e.genero_id,e.correo, l.usuario,l.password from empleado e INNER join login l on l.id=e.login_id WHERE e.id=vid and e.estado="activo";
END //

CREATE FUNCTION eliminarEmpleado (vid INT) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que elimina a un empleado'
BEGIN
DECLARE res int DEFAULT 0;
UPDATE empleado set estado="desactivo" where id=vid;
UPDATE login set estado="desactivo" where id=(SELECT login_id FROM empleado where id=vid);
set res=1;
RETURN res;
END //

CREATE PROCEDURE listarEmpleados (vid INT) 
COMMENT 'Procedimiento que lista empleados'
BEGIN
SELECT e.id,e.nombres,e.apellidos,td.nombre tipo_documento_nombre ,e.numero_documento,e.fecha_ingreso,g.nombre genero_nombre, e.correo, l.usuario from empleado e INNER join login l on l.id=e.login_id INNER join genero g on g.id=e.genero_id INNER join tipo_documento td on e.tipo_documento_id=td.id WHERE e.estado="activo";
END //

DELIMITER ;




/* SQL_PL de Administrador */

DELIMITER //

CREATE FUNCTION guardarAdministrador(
  vnombres VARCHAR(100),
  vapellidos VARCHAR(100),
  vtipo_documento_id INT,
  vnumero_documento VARCHAR(45),
  vgenero_id INT,
  vcorreo VARCHAR(45),
  vusuario VARCHAR(45),
  vpassword VARCHAR(45)) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que almacena un administrador'
BEGIN
DECLARE res int DEFAULT 0;
IF NOT EXISTS(SELECT numero_documento FROM administrador  WHERE numero_documento=vnumero_documento)
THEN
INSERT INTO login(usuario,password,tipo_usuario_id,estado) VALUES (vusuario,vpassword,1,"activo");
INSERT INTO administrador(nombres,apellidos,tipo_documento_id,numero_documento,genero_id,estado,login_id,correo) 
VALUES (vnombres,vapellidos,vtipo_documento_id,vnumero_documento,vgenero_id,"activo",(SELECT id FROM login where usuario=vusuario),vcorreo);
set res=1;
ELSEIF EXISTS(SELECT numero_documento,estado FROM administrador WHERE numero_documento=vnumero_documento and estado="desactivo")
THEN
UPDATE administrador set estado="activo",nombres=vnombres,apellidos=vapellidos,tipo_documento_id=vtipo_documento_id,genero_id=vgenero_id,correo=vcorreo where numero_documento=vnumero_documento;
UPDATE login set estado="activo",usuario=vusuario,password=vpassword where id=(SELECT login_id FROM administrador where numero_documento=vnumero_documento);
set res=1;
END IF;
RETURN res;
END //

CREATE FUNCTION modificarAdministrador(
  vid INT,
  vnombres VARCHAR(100),
  vapellidos VARCHAR(100),
  vtipo_documento_id INT,
  vnumero_documento VARCHAR(45),
  vgenero_id INT,
  vcorreo VARCHAR(45),
  vusuario VARCHAR(45),
  vpassword VARCHAR(45)) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que actualiza un administrador'
BEGIN
DECLARE res int DEFAULT 0;
IF EXISTS(SELECT id FROM administrador WHERE id=vid)
THEN
UPDATE administrador set nombres=vnombres,apellidos=vapellidos,tipo_documento_id=vtipo_documento_id,numero_documento=vnumero_documento,genero_id=vgenero_id,correo=vcorreo where id=vid;
UPDATE login set usuario=vusuario,password=vpassword where id=(SELECT login_id FROM administrador where id=vid);
set res=1;
END IF;
RETURN res;
END //

CREATE PROCEDURE buscarAdministrador (vid INT) 
COMMENT 'Procedimiento que busca un administrador'
BEGIN
SELECT a.id,a.nombres,a.apellidos,a.tipo_documento_id,a.numero_documento,a.genero_id,a.correo, l.usuario,l.password from administrador a INNER join login l on l.id=a.login_id WHERE a.id=vid and a.estado="activo";
END //

CREATE FUNCTION eliminarAdministrador (vid INT) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que elimina a un administrador'
BEGIN
DECLARE res int DEFAULT 0;
IF EXISTS(SELECT id FROM administrador WHERE id=vid and id<>1)
THEN
UPDATE administrador set estado="desactivo" where id=vid;
UPDATE login set estado="desactivo" where id=(SELECT login_id FROM administrador where id=vid);
set res=1;
END IF;
RETURN res;
END //

CREATE PROCEDURE listarAdministradores (vid INT) 
COMMENT 'Procedimiento que lista administradores'
BEGIN
SELECT a.id,a.nombres,a.apellidos,td.nombre tipo_documento_nombre,a.numero_documento,g.nombre genero_nombre,a.correo, l.usuario from administrador a INNER join login l on l.id=a.login_id INNER join genero g on g.id=a.genero_id INNER join tipo_documento td on a.tipo_documento_id=td.id WHERE a.estado="activo";
END //

DELIMITER ;


/* SQL_PL de Cliente */

DELIMITER //


CREATE FUNCTION guardarCliente(
  vnombres VARCHAR(100),
  vapellidos VARCHAR(100),
  vtipo_documento_id INT,
  vnumero_documento VARCHAR(45),
  vgenero_id INT,
  vcodigo_validacion INT,
  vciudad_id INT,
  vcorreo VARCHAR(45),
  vusuario VARCHAR(45),
  vpassword VARCHAR(45)) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que almacena un cliente'
BEGIN
DECLARE res int DEFAULT 0;
IF NOT EXISTS(SELECT numero_documento FROM cliente WHERE numero_documento=vnumero_documento)
THEN
INSERT INTO login(usuario,password,tipo_usuario_id,estado) VALUES (vusuario,vpassword,3,"activo");
INSERT INTO cliente(nombres,apellidos,tipo_documento_id,numero_documento,genero_id,codigo_validacion,ciudad_id,login_id,correo)
INSERT INTO puntos_redimibles (puntos, cliente_id) VALUES (0, (SELECT id FROM cliente where numero_documento=vnumero_documento));
VALUES (vnombres,vapellidos,vtipo_documento_id,vnumero_documento,vgenero_id,vcodigo_validacion,vciudad_id,(SELECT id FROM login where usuario=vusuario),vcorreo);
set res=1;
END IF;
RETURN res;
END //

CREATE FUNCTION modificarCliente(
  vid INT,
  vnombres VARCHAR(100),
  vapellidos VARCHAR(100),
  vtipo_documento_id INT,
  vnumero_documento VARCHAR(45),
  vgenero_id INT,
  vcodigo_validacion INT,
  vciudad_id INT,
  vcorreo VARCHAR(45),
  vusuario VARCHAR(45),
  vpassword VARCHAR(45)) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que actualiza un cliente'
BEGIN
DECLARE res int DEFAULT 0;
IF EXISTS(SELECT id FROM cliente WHERE id=vid and id<>1)
THEN
UPDATE cliente set nombres=vnombres,apellidos=vapellidos,tipo_documento_id=vtipo_documento_id,numero_documento=vnumero_documento,genero_id=vgenero_id,codigo_validacion=vcodigo_validacion,ciudad_id=vciudad_id,correo=vcorreo where id=vid;
UPDATE login set usuario=vusuario,password=vpassword where id=(SELECT login_id FROM cliente where id=vid);
set res=1;
END IF;
RETURN res;
END //

CREATE PROCEDURE buscarCliente (vid INT) 
COMMENT 'Procedimiento que busca un cliente'
BEGIN
SELECT c.id,c.nombres,c.apellidos,c.tipo_documento_id,c.numero_documento,c.genero_id,c.codigo_validacion,c.ciudad_id,c.correo,l.usuario,l.password from cliente c INNER join login l on l.id=c.login_id WHERE c.id=vid;
END //

CREATE PROCEDURE listarClientes (vid INT) 
COMMENT 'Procedimiento que lista clientes'
BEGIN
SELECT c.id,c.nombres,c.apellidos,td.nombre tipo_documento_nombre,c.numero_documento,g.nombre genero_nombre,c.codigo_validacion,ci.nombre ciudad_nombre,c.correo, l.usuario from cliente c INNER join login l on l.id=c.login_id INNER join genero g on g.id=c.genero_id INNER join tipo_documento td on c.tipo_documento_id=td.id INNER JOIN ciudad ci on ci.id=c.ciudad_id;
END //

DELIMITER ;




/* SQL_PL de Venta */

DELIMITER //

CREATE FUNCTION guardarVenta(
  vvalor_total DOUBLE,
  vempleado_id INT,
  vcliente_id INT,
  vestado VARCHAR(45)) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que almacena un venta'
BEGIN
DECLARE res int DEFAULT 0;
INSERT INTO venta(fecha_venta,hora,valor_total,estado,empleado_id,cliente_id) 
VALUES (now(),now(),vvalor_total,vestado,vempleado_id,vcliente_id);
set res=1;
RETURN res;
END //


CREATE PROCEDURE buscarVenta (vid INT) 
COMMENT 'Procedimiento que busca un venta'
BEGIN
SELECT id,fecha_venta,hora,valor_total,empleado_id,cliente_id from venta where id=vid and estado="activo" and estado="activo puntos";
END //

CREATE FUNCTION eliminarVenta (vid INT) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que elimina a un venta'
BEGIN
DECLARE res int DEFAULT 0;
UPDATE venta set estado="desactivo" where id=vid;
UPDATE detalle_venta set estado="desactivo" where venta_id=vid;
set res=1;
RETURN res;
END //

CREATE PROCEDURE listarVentas (vid INT) 
COMMENT 'Procedimiento que lista ventas'
BEGIN
SELECT v.id,v.fecha_venta,v.hora,v.valor_total,e.numero_documento empleado_numero_documento,c.numero_documento cliente_numero_documento from venta v INNER join empleado e on v.empleado_id=e.id INNER JOIN cliente c on v.cliente_id=c.id where v.estado="activo" or v.estado="activo puntos" ORDER by v.id DESC;
END //

DELIMITER ;



/* SQL_PL de Detalle Venta */

DELIMITER //

CREATE FUNCTION guardarDetallesVenta(
  vid_venta INT, 
  vcantidades VARCHAR(2000),
  vinventario VARCHAR(1000)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que agrega los detalles de una venta'
BEGIN
    DECLARE res INT DEFAULT 0;

    /*Variable que contendra el permiso a almacenar*/
    DECLARE vcantidad INT;    
    DECLARE vinventario_id INT; 
    /*Se borra todos los permisos existentes del usuario*/
    UPDATE detalle_venta set estado="desactivo" where venta_id=vid_venta;
  
    WHILE (LOCATE(',', vcantidades) > 0) DO

        /*Se saca el primer campo separado por coma del varchar*/
    SET vcantidad = ELT(1, vcantidades);
    SET vinventario_id = ELT(1, vinventario);
        /*Se elimina ese primer valor y se reemplaza en la cadena*/
    SET vcantidades = SUBSTRING(vcantidades, LOCATE(',',vcantidades) + 1);
    SET vinventario = SUBSTRING(vinventario, LOCATE(',',vinventario) + 1);
        /*Se almacena en la tabla, siempre y cuando tenga un dato para almacenar*/
IF vcantidad <> ',' THEN
    INSERT INTO detalle_venta(cantidad,inventario_id,venta_id,estado) VALUES (vcantidad,vinventario_id,vid_venta,"activo");
END IF;
    END WHILE;
    SET res = 1;
    RETURN res;
END //

CREATE FUNCTION guardarDetallesVentaPuntos(
  vid_venta INT, 
  vcantidades VARCHAR(2000),
  vinventario VARCHAR(1000)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que agrega los detalles de una venta'
BEGIN
    DECLARE res INT DEFAULT 0;

    /*Variable que contendra el permiso a almacenar*/
    DECLARE vcantidad INT;    
    DECLARE vinventario_id INT; 
    /*Se borra todos los permisos existentes del usuario*/
    UPDATE detalle_venta set estado="desactivo" where venta_id=vid_venta;
  
    WHILE (LOCATE(',', vcantidades) > 0) DO

        /*Se saca el primer campo separado por coma del varchar*/
    SET vcantidad = ELT(1, vcantidades);
    SET vinventario_id = ELT(1, vinventario);
        /*Se elimina ese primer valor y se reemplaza en la cadena*/
    SET vcantidades = SUBSTRING(vcantidades, LOCATE(',',vcantidades) + 1);
    SET vinventario = SUBSTRING(vinventario, LOCATE(',',vinventario) + 1);
        /*Se almacena en la tabla, siempre y cuando tenga un dato para almacenar*/
IF vcantidad <> ',' THEN
    INSERT INTO detalle_venta(cantidad,inventario_id,venta_id,estado) VALUES (vcantidad,vinventario_id,vid_venta,"activo");
END IF;
    END WHILE;
    SET res = 1;
    RETURN res;
END //


CREATE FUNCTION eliminarDetalleVenta (vid INT) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que elimina a un detalle de una venta'
BEGIN
DECLARE res int DEFAULT 0;
UPDATE detalle_venta set estado="desactivo" where id=vid;
set res=1;
RETURN res;
END //

CREATE PROCEDURE listarDetallesVenta (vid INT) 
COMMENT 'Procedimiento que lista los detalles de una venta'
BEGIN
SELECT dv.id,dv.cantidad,i.nombre inventario_nombre,i.precio*dv.cantidad subtotal from detalle_venta dv INNER join venta v on v.id=dv.venta_id INNER JOIN inventario i on i.id=dv.inventario_id where dv.venta_id=vid and dv.estado="activo";

END //

CREATE PROCEDURE listarTotalVenta (vid INT) 
COMMENT 'Procedimiento que lista los detalles de una venta'
BEGIN
SELECT dv.id,dv.cantidad,i.nombre inventario_nombre,i.precio*dv.cantidad subtotal from detalle_venta dv INNER join venta v on v.id=dv.venta_id INNER JOIN inventario i on i.id=dv.inventario_id where dv.venta_id=vid and dv.estado="activo";

END //




DELIMITER ;

DELIMITER //

CREATE PROCEDURE listarHitoricoCliente(vnumero_documento INT) 
COMMENT 'Procedimiento que lista historico de compras de un cliente'
BEGIN
SELECT v.fecha_venta,v.hora,v.valor_total,e.numero_documento empleado_numero_documento from venta v INNER join empleado e on v.empleado_id=e.id INNER JOIN cliente c on v.cliente_id=c.id where (v.estado="activo" or v.estado="activo puntos") and c.numero_documento=vnumero_documento ORDER by v.id;
END //

DELIMITER ;



/* 
CREATE FUNCTION modificarDetalleVenta (
  vid INT,
  vcantidad INT,
  vinventario_id INT) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que actualiza un detalle de una venta'
BEGIN
DECLARE res int DEFAULT 0;
IF EXISTS(SELECT id FROM detalle_venta WHERE id=vid)
THEN
UPDATE detalle_venta set cantidad=vcantidad,inventario_id=vinventario_id where id=vid;
set res=1;
END IF;
RETURN res;
END //


CREATE PROCEDURE buscarDetalleVenta (vid INT) 
COMMENT 'Procedimiento que busca un detalle de una venta'
BEGIN
SELECT id,cantidad,inventario_id from detalle_venta where id=vid and estado="activo";
END //



CREATE FUNCTION modificarVenta (
  vid INT,
  vcliente_id INT) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que actualiza un venta'
BEGIN
DECLARE res int DEFAULT 0;
IF EXISTS(SELECT id FROM venta WHERE id=vid)
THEN
UPDATE venta set cliente_id=vcliente_id where id=vid;
set res=1;
END IF;
RETURN res;
END // */















/* DELIMITER //

CREATE PROCEDURE login (
  vusuario varchar(45),
  vpassword varchar(45)) 
COMMENT 'Procedimiento para loguearse'
BEGIN
SELECT usuario,password,nombre,cedula,id FROM usuario WHERE usuario=vusuario AND password=vpassword;
END //

CREATE FUNCTION guardarCliente (
  vid INT,
  vnombre VARCHAR(45) ,
  vapellido VARCHAR(45),
  vcedula VARCHAR(15),
  vgenero CHAR(2) ,
  vfecha_nacimiento DATE) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que almacena un cliente'
BEGIN
DECLARE res int DEFAULT 0;
IF NOT EXISTS(SELECT id FROM cliente WHERE cedula=vcedula and id<>vid)
THEN
INSERT INTO cliente(id,nombre,apellido,cedula,genero,fecha_nacimiento) 
VALUES(vid,vnombre,vapellido,vcedula,vgenero,vfecha_nacimiento);
set res=1;
END IF;
RETURN res;
END //

CREATE FUNCTION guardarInventario (
  vid INT,
  vnombre VARCHAR(45) ,
  vdescripcion VARCHAR(500),
  vfecha_vencimiento DATE,
  vcantidad INT ,
  vfecha_fabricacion DATE,
  vprecio DOUBLE ,
  vusuario_id INT,
  vlaboratorio_id INT) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que almacena un medicamento'
BEGIN
DECLARE res int DEFAULT 0;
IF NOT EXISTS(SELECT id FROM inventario_medico WHERE id<>vid)
THEN
INSERT INTO inventario_medico(id,nombre, descripcion, fecha_vencimiento,cantidad, fecha_fabricacion, precio, usuario_id, laboratorio_id) 
VALUES (vid,vnombre, vdescripcion, vfecha_vencimiento,vcantidad, vfecha_fabricacion, vprecio, vusuario_id, vlaboratorio_id);
set res=1;
END IF;
RETURN res;
END //

CREATE FUNCTION guardarUsuario (
  vid INT,
  vcedula VARCHAR(15) ,
  vnombre VARCHAR(45),
  vapellido VARCHAR(45),
  vcorreo VARCHAR(45) ,
  vusuario VARCHAR(45),
  vpassword VARCHAR(45)) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que almacena un usuario'
BEGIN
DECLARE res int DEFAULT 0;
IF NOT EXISTS(SELECT id FROM usuario WHERE usuario=vusuario and cedula=vcedula and id<>vid)
THEN
INSERT INTO usuario(id,cedula,nombre,apellido,correo,usuario,password) 
VALUES (vid,vcedula,vnombre,vapellido,vcorreo,vusuario,vpassword);
set res=1;
END IF;
RETURN res;
END //

CREATE FUNCTION guardarLaboratorio(
  vid INT,
  vnombre VARCHAR(45),
  vdescripcion VARCHAR(500)) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que almacena un laboratorio'
BEGIN
DECLARE res int DEFAULT 0;
IF NOT EXISTS(SELECT id FROM laboratorio WHERE nombre=vnombre and id<>vid)
THEN
INSERT INTO laboratorio(id,nombre,descripcion) 
VALUES (vid,vnombre,vdescripcion);
set res=1;
END IF;
RETURN res;
END //

CREATE FUNCTION modificarCliente (
  vid INT,
  vnombre VARCHAR(45) ,
  vapellido VARCHAR(45),
  vcedula VARCHAR(15),
  vgenero CHAR(2) ,
  vfecha_nacimiento DATE) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que actualiza un cliente'
BEGIN
DECLARE res int DEFAULT 0;
IF NOT EXISTS(SELECT id FROM cliente WHERE cedula=vcedula and id<>vid)
THEN
UPDATE cliente set nombre=vnombre,apellido=vapellido,cedula=vcedula,genero=vgenero,fecha_nacimiento=vfecha_nacimiento where id=vid;
set res=1;
END IF;
RETURN res;
END //

CREATE FUNCTION modificarUsuario (
  vid INT,
  vcedula VARCHAR(15) ,
  vnombre VARCHAR(45),
  vapellido VARCHAR(45),
  vcorreo VARCHAR(45) ,
  vusuario VARCHAR(45),
  vpassword VARCHAR(45)) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que actualiza un usuario'
BEGIN
DECLARE res int DEFAULT 0;
IF NOT EXISTS(SELECT usuario FROM usuario WHERE usuario=vusuario and id<>vid)
THEN
UPDATE usuario set cedula=vcedula,nombre=vnombre,apellido=vapellido,correo=vcorreo,usuario=vusuario,password=vpassword where id=vid;
set res=1;
END IF;
RETURN res;
END //

CREATE FUNCTION modificarLaboratorio (
  vid INT,
  vnombre VARCHAR(45) ,
  vdescripcion VARCHAR(500)) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que actualiza un laboratorio'
BEGIN
DECLARE res int DEFAULT 0;
IF NOT EXISTS(SELECT id FROM laboratorio WHERE nombre=vnombre and id<>vid)
THEN
UPDATE laboratorio set nombre=vnombre,descripcion=vdescripcion where id=vid;
set res=1;
END IF;
RETURN res;
END //

CREATE FUNCTION modificarInventario (
  vid INT,
  vnombre VARCHAR(45) ,
  vdescripcion VARCHAR(500),
  vfecha_vencimiento DATE,
  vcantidad INT ,
  vfecha_fabricacion DATE,
  vprecio DOUBLE,
  vusuario_id INT,
  vlaboratorio_id INT) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que actualiza un inventario'
BEGIN
DECLARE res int DEFAULT 0;
IF NOT EXISTS(SELECT id FROM inventario_medico WHERE nombre=vnombre and id<>vid)
THEN
UPDATE inventario_medico set nombre=vnombre,descripcion=vdescripcion,fecha_vencimiento=vfecha_vencimiento
,cantidad=vcantidad,fecha_fabricacion=vfecha_fabricacion,precio=vprecio,usuario_id=vusuario_id,
laboratorio_id=vlaboratorio_id where id=vid;                                                                   
set res=1;
END IF;
RETURN res;
END //

CREATE FUNCTION eliminarCliente (vid INT) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que elimina a un cliente'
BEGIN
DECLARE res int DEFAULT 0;
DELETE from cliente where id=vid;
set res=1;
RETURN res;
END //

CREATE FUNCTION eliminarInventario (vid INT) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que elimina un inventario'
BEGIN
DECLARE res int DEFAULT 0;
DELETE from inventario_medico where id=vid;
set res=1;
RETURN res;
END //

CREATE FUNCTION eliminarLaboratorio (vid INT) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que elimina a un laboratorio'
BEGIN
DECLARE res int DEFAULT 0;
DELETE from laboratorio where id=vid;
set res=1;
RETURN res;
END //

CREATE FUNCTION eliminarUsuario (vid INT) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que elimina a un usuario'
BEGIN
DECLARE res int DEFAULT 0;
DELETE from usuario where id=vid;
set res=1;
RETURN res;
END //

CREATE PROCEDURE buscarCliente (vid INT) 
COMMENT 'Procedimiento que busca un cliente'
BEGIN
SELECT id,nombre,apellido,cedula,genero,fecha_nacimiento from cliente where id=vid;
END //

CREATE PROCEDURE buscarUsuario (vid INT) 
COMMENT 'Procedimiento que busca un usuario'
BEGIN
SELECT id,cedula,nombre,apellido,correo,usuario from usuario where id=vid;
END //

CREATE PROCEDURE buscarLaboratorio (vid INT) 
COMMENT 'Procedimiento que busca un laboratorio'
BEGIN
SELECT id,nombre,descripcion from laboratorio where id = vid ;
END //

CREATE PROCEDURE buscarInventario (vid INT) 
COMMENT 'Procedimiento que busca un producto'
BEGIN
SELECT id,nombre,descripcion,fecha_vencimiento,cantidad,fecha_fabricacion,precio,usuario_id,laboratorio_id from inventario_medico where id = vid;
END //

CREATE PROCEDURE listarClientes(vid INT) 
COMMENT 'Procedimiento que lista clientes'
BEGIN
SELECT id,cedula,nombre,apellido,genero,fecha_nacimiento from cliente ;
END //

CREATE PROCEDURE listarUsuarios (vid INT) 
COMMENT 'Procedimiento que lista usuarios'
BEGIN
SELECT id,cedula,nombre,apellido,correo,usuario from usuario;
END //

CREATE PROCEDURE listarLaboratorios (vid INT) 
COMMENT 'Procedimiento que lista laboratorios'
BEGIN
SELECT id,nombre,descripcion from laboratorio;
END //

CREATE PROCEDURE listarInventario (vid INT)
COMMENT 'Procedimiento que lista inventario'
BEGIN
SELECT im.id,im.nombre,im.cantidad,im.precio,im.fecha_fabricacion fabricacion,im.fecha_vencimiento vencimiento,l.nombre laboratorio,im.descripcion,u.cedula usuario from inventario_medico im inner join laboratorio l on im.laboratorio_id=l.id inner join usuario u on u.id=im.usuario_id ORDER by im.id;
END //


/*Se debe mostrar un informe de los clientes, ordenados del que más compras a realizado al que menos compras a realizado, mostrando el total de compras y el total de dinero invertido en la farmacia*//*

CREATE PROCEDURE clientesMayorCompras()
COMMENT 'Procedimiento que lista clientes ordenados por mayor compras'
BEGIN
SELECT c.id,c.nombre,c.apellido,c.cedula,count(v.id) total_compras, sum(v.valor_total) total_invertido from cliente c  join venta v on v.cliente_id=c.id GROUP BY c.id ORDER BY total_compras desc;
END //

/*Se debe mostrar un informe de todos los empleados, ordenados del empleado que más ventas ha realizado al que menos ventas ha realizado. Además, de cada empleado se debe mostrar cuantos ingresos por ventas ha generado a la farmacia*//*

CREATE PROCEDURE empleadosMayorVentas()
COMMENT 'Procedimiento que lista los empleados ordenados por mayor ventas'
BEGIN
SELECT u.id,u.cedula,u.nombre,u.apellido,u.correo,u.usuario,count(v.id) total_ventas ,sum(v.valor_total) total_ingresos  from usuario u  join venta v on v.usuario_id=u.id GROUP By u.id ORDER BY total_ventas desc;
END //

 /*Se debe mostrar un informe de los productos más vendidos al menos vendido. Indicando por cada producto la cantidad total que se ha vendido cada producto.*//*

CREATE PROCEDURE productosMayorVenta()
COMMENT 'Procedimiento que lista los productos ordenados por mayor venta'
BEGIN
SELECT im.id,im.nombre, im.descripcion ,im.cantidad, im.precio precio_unidad, l.nombre laboratorio ,sum(dv.cantidad) total_vendidos  from inventario_medico im  join detalle_venta dv on dv.inventario_medico_id=im.id JOIN laboratorio l on l.id=im.laboratorio_id GROUP By im.id ORDER BY total_vendidos desc;
END //


 /*Se debe mostrar un informe que indique por día, cuantas ventas se ha realizado, y el total de ingresos generados por día.*//*

CREATE PROCEDURE ventasIngresosPorDia()
COMMENT 'Procedimiento que lista ventas e ingresos realizadas por dia'
BEGIN
SELECT id,fecha_venta,valor_total, count(id) total_ventas ,sum(valor_total) total_ingresos  from venta GROUP By fecha_venta ORDER BY fecha_venta desc;
END //

 /*Se debe generar un gráfico que indique la cantidad de los productos y su distribución en porcentaje*//*

CREATE PROCEDURE cantidadProductosPorProducto()
COMMENT 'Procedimiento que lista la cantidad de productos por producto'
BEGIN
SELECT nombre, sum(cantidad) cantidad from inventario_medico GROUP By nombre ORDER BY cantidad;
END //

 /*Se debe mostrar un gráfico que indique la cantidad de productos vendidos por cada producto, y que además indique las ganancias generadas por cada producto en el mismo gráfico.*//*

CREATE PROCEDURE cantidadProductosVendidosPorProductoGanancias()
COMMENT 'Procedimiento que lista la cantidad de los productos vendidos por producto y sus respectivas ganacias'
BEGIN
SELECT im.nombre nombre, sum(dv.cantidad) cantidad, im.precio*sum(dv.cantidad) ganancia from inventario_medico im INNER JOIN detalle_venta dv on dv.inventario_medico_id=im.id GROUP By im.id ORDER BY ganancia desc;
END //

 /*Se debe generar un gráfico que indique el total de clientes hombres y mujeres y su distribución en porcentajes*//*

CREATE PROCEDURE clientesHombresMujeres()
COMMENT 'Procedimiento que lista el total de clientes hombres y mujeres'
BEGIN
SELECT genero, count(id) cantidad from cliente GROUP by genero ORDER BY cantidad desc;
END //

 /*Se debe mostrar un gráfico que indique por empleado la cantidad de ventas ha realizado al que menos ventas ha realizado. Además, de cada empleado se debe mostrar cuantos ingresos por ventas ha generado a la farmacia.*//*

CREATE PROCEDURE ventasPorEmpleadoIngresoso()
COMMENT 'Procedimiento que lista ventas por empleado ingresos'
BEGIN
SELECT u.usuario, COUNT(v.id) cantidad, sum(v.valor_total) ingresos  from venta v  join usuario u on u.id=v.usuario_id GROUP By usuario ORDER BY ingresos desc;
END //

 /*Se debe mostrar un gráfico que indique por día del mes, cuantas ventas se ha realizado, y el total de ingresos generados por día.*//*

CREATE PROCEDURE ventasPorDiaDelMesIngresosDiarios()
COMMENT 'Procedimiento que listar ventas por día del mes y sus ingresos diarios'
BEGIN
SELECT DAY(fecha_venta) dia, count(id) total_ventas ,sum(valor_total) total_ingresos from venta GROUP By dia ORDER BY dia;
END //


 /*Se debe mostrar un gráfico que indique por día de la semana, cuantas ventas se ha realizado, y el total de ingresos generados por día de la semana.*//*

CREATE PROCEDURE ventasPorDiaDeLaSemanaIngresosDia()
COMMENT 'Procedimiento que lista ventas por día de la semana y sus ingresos diarios'
BEGIN
SELECT weekday(fecha_venta) dia, count(id) total_ventas ,sum(valor_total) total_ingresos from venta GROUP By dia ORDER BY dia;
END //

DELIMITER ;



DELIMITER //

CREATE FUNCTION guardarVenta (
  vid INT,
  vfecha_venta DATE,
  vhora TIME,
  vvalor_total DOUBLE,
  vcliente_id INT,
  vusuario_id INT) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que almacena una venta'
BEGIN
DECLARE res int DEFAULT 0;
IF NOT EXISTS(SELECT id FROM venta WHERE id<>vid)
THEN
INSERT INTO venta(id,fecha_venta,hora,valor_total,cliente_id,usuario_id) 
VALUES (vid,vfecha_venta,vhora,vvalor_total,vcliente_id,vusuario_id);
set res=1;
END IF;
RETURN res;
END //

CREATE FUNCTION modificarVenta (
  vid INT,
  vfecha_venta DATE,
  vhora TIME,
  vvalor_total DOUBLE,
  vcliente_id INT,
  usuario_id INT) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que actualiza una Venta'
BEGIN
DECLARE res int DEFAULT 0;
IF NOT EXISTS(SELECT id FROM venta WHERE id<>vid)
THEN
UPDATE venta set fecha_venta=vfecha_venta,hora=vhora,valor_total=vvalor_total, cliente_id=vcliente_id, usuario_id=vusuario_id where id=vid;     
set res=1;
END IF;
RETURN res;
END //

CREATE FUNCTION eliminarVenta (vid INT) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que elimina una venta y sus detalles'
BEGIN
DECLARE res int DEFAULT 0;
DELETE from detalle_venta where venta_id=vid;
DELETE from venta where id=vid;
set res=1;
RETURN res;
END //

CREATE PROCEDURE buscarVenta (vid INT) 
COMMENT 'Procedimiento que busca una venta'
BEGIN
SELECT id,fecha_venta,hora,valor_total,cliente_id,usuario_id from venta where id = vid ;
END //

CREATE PROCEDURE listarVentas (vid INT)
COMMENT 'Procedimiento que lista ventas'
BEGIN
SELECT v.id,v.fecha_venta fecha,v.hora hora,v.valor_total,c.cedula cliente,u.cedula usuario from venta v inner join cliente c on v.cliente_id=c.id INNER JOIN usuario u on v.usuario_id=u.id ;
END //

CREATE PROCEDURE listarCarritoVenta (vid INT)
COMMENT 'Procedimiento que lista el carrito de una venta'
BEGIN
SELECT dv.id,dv.cantidad,im.nombre producto,dv.venta_id from detalle_venta dv inner join inventario_medico im on dv.inventario_medico_id=im.id where dv.venta_id=vid;
END //

CREATE FUNCTION eliminarDetalle (vid INT) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que elimina un detalle de la venta'
BEGIN
DECLARE res int DEFAULT 0;
DELETE from detalle_venta where id=vid;
set res=1;
RETURN res;
END //

CREATE FUNCTION eliminarItemCarrito (vid INT) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que elimina item del carrito'
BEGIN
DECLARE res int DEFAULT 0;
DELETE from carrito where id=vid;
set res=1;
RETURN res;
END //


CREATE PROCEDURE listarCarrito (vid INT)
COMMENT 'Procedimiento que lista el carrito'
BEGIN
SELECT c.id,c.cantidad,im.nombre producto,c.venta_id from carrito c inner join inventario_medico im on c.inventario_medico_id=im.id ORDER by c.id desc;
END //


CREATE FUNCTION guardarItemCarrito (
  vid INT,
  vcantidad INT,
  vinventario_medico_id INT,
  vventa_id INT) RETURNS int(1)
READS SQL DATA
DETERMINISTIC
COMMENT 'Funcion que almacena un item en carrito'
BEGIN
DECLARE res int DEFAULT 0;
IF NOT EXISTS(SELECT id FROM carrito WHERE id=vid)
THEN
INSERT INTO carrito (id,cantidad,inventario_medico_id,venta_id) 
VALUES (vid,vcantidad,vinventario_medico_id,vventa_id);
set res=1;
END IF;
RETURN res;
END //



CREATE PROCEDURE eliminarTodosLosItems (vid INT)
COMMENT 'Procedimiento que elimina todos los datos de la tabla carrito'
BEGIN
DELETE FROM carrito;
END //


CREATE PROCEDURE guardarItemsAVenta(vventa_id INT)
COMMENT 'Procedimiento guardar los items del carrito a la venta'
BEGIN
INSERT INTO detalle_venta SELECT 0,cantidad,inventario_medico_id,vventa_id from carrito;
DELETE FROM carrito;
END //




DELIMITER ;



CREATE PROCEDURE precioPorGrupoCarrito(vid INT)
COMMENT 'Procedimiento calcula el precio por grupo del carrito de compras'
BEGIN
SELECT c.id,im.nombre nombre,sum(c.cantidad) cantidad,im.precio*sum(c.cantidad) sub_total from inventario_medico im INNER JOIN carrito c on c.inventario_medico_id=im.id GROUP By im.id;
END //


 */