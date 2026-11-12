use hospital_db;
SELECT
    p.convenio,
    m.especialidade,
    ROUND(AVG(c.valor_consulta), 1) AS media_consultas
FROM pacientes p
INNER JOIN consultas c
    ON p.id_paciente = c.id_paciente
INNER JOIN medicos m
    ON c.id_medico = m.id_medico
WHERE p.convenio LIKE '%Unimed%'
GROUP BY p.convenio, m.especialidade;