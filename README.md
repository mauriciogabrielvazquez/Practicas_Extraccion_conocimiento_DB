Práctica 1 - Paso 1: Diagnóstico de Datos
Alumno: Mauricio Gabriel Vazquez
Matrícula: 2023371007

Para esta primera parte de la práctica, estuve explorando y analizando el archivo de ventas que descargamos de Kaggle. El archivo original trae poco más de 540,000 registros, pero al revisarlo a detalle encontré varios errores y "datos sucios" que tenemos que limpiar antes de armar nuestro modelo en estrella:

1. Faltan datos importantes (Valores nulos):
Lo primero que noté es que a unos 135,080 registros les falta el ID del cliente (CustomerID), o sea que de casi una cuarta parte de las ventas no sabemos quién las hizo. También vi que hay como 1,450 productos que vienen con la descripción en blanco.

2. Hay números que no cuadran (Anomalías):
Me encontré con cantidades de compra negativas (el campo Quantity llega a tener números como -80,995). Lo más seguro es que sean devoluciones o pedidos cancelados. Además, hay precios (UnitPrice) que están en $0.00 y otros que son negativos, lo cual parece más un ajuste contable del sistema que una venta real.

3. Detalles con los formatos:
Las fechas (InvoiceDate) no vienen en un formato de tiempo, sino como texto normal. Por otro lado, los IDs de los clientes vienen con formato decimal (por ejemplo, 17850.0) en lugar de ser números enteros o texto, y hay números de factura (InvoiceNo) que empiezan con la letra "C", indicando cancelaciones.

¿Qué pasa si no arreglamos esto?
Si meto estos datos tal cual a las nuevas tablas analíticas, los reportes finales van a salir mal. Los ingresos totales no van a cuadrar por culpa de los precios y cantidades negativas. Además, no voy a poder agrupar bien las ventas por cliente, y al crear la base de datos SQL me va a marcar error al intentar guardar los textos en los campos de fecha.

