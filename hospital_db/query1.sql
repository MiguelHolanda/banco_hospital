USE hospital_db;
SELECT
    p.convenio,
    SUM(c.valor_consulta) AS total_consultas

FROM pacientes p

INNER JOIN consultas c
    ON p.id_paciente = c.id_paciente

WHERE p.convenio LIKE '%Saúde%'

GROUP BY p.convenio;