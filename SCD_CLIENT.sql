CREATE PROCEDURE SDC_CLIENT (
IN id_client varchar(20),
IN segmento varchar(128)
)
BEGIN
UPDATE Cliente
	SET 
		Segmento = segmento
WHERE 
		Id_cliente = id_client;

END
