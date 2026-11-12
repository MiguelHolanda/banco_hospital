USE hospital_db;
SELECT
    m.especialidade,
    ROUND(AVG(c.valor_consulta), 2) AS media_consultas

FROM medicos m

INNER JOIN consultas c ON m.id_medico = c.id_medico

WHERE m.especialidade LIKE '%Cardiologia%'

GROUP BY m.especialidade;