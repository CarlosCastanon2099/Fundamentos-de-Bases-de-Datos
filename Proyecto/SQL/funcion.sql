/** 
 * Funcion para poder obtener el numero de jaulas, cuidadores, veterinarios o animales.
 * @param consulta := 'jaulas' || 'cuidadores' || 'veterinarios' || 'animales'.
 */
CREATE OR REPLACE FUNCTION obtenerCalculados(consulta TEXT)
RETURNS TEXT AS $$
DECLARE
	contador INTEGER;
BEGIN
	IF consulta = 'jaulas' THEN
		SELECT COUNT(*) INTO contador from jaula;
	ELSIF consulta = 'cuidadores' THEN
		SELECT COUNT(*) INTO contador from cuidador;
	ELSIF consulta = 'veterinarios' THEN
		SELECT COUNT(*) INTO contador from veterinario;
	ELSIF consulta = 'animales' THEN 
		SELECT COUNT(*) INTO contador from animal;
	END IF;
	RETURN 'Numero de ' || consulta || ' = ' || contador::TEXT;
END;
$$ LANGUAGE plpgsql;

-- Sirve para llamar y obtener el numero de jaulas.
SELECT obtenerCalculados('jaulas');

-- Sirve para llamar y obtener el numero de cuidadores.
SELECT obtenerCalculados('cuidadores');

-- Sirve para llamar y obtener el numero de veterinarios.
SELECT obtenerCalculados('veterinarios');

-- Sirve para llamar y obtener el numero de animales.
SELECT obtenerCalculados('animales');