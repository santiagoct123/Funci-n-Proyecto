CREATE FUNCTION es_cupon_valido (
  @cupon VARCHAR(10)
)
RETURNS BIT
AS
BEGIN
  DECLARE @valido BIT
  SET @valido = 0

  -- Consulta a la tabla de cupones
  SELECT COUNT(*) INTO @valido
  FROM cupones
  WHERE codigo = @cupon
  AND fecha_vencimiento >= GETDATE()
  AND estado = 'activo'

  RETURN @valido
END
GO

-- Ejemplo de uso
SELECT es_cupon_valido('CUPON123') AS valido;
