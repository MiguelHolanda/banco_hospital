use hospital_db;
SELECT
    p.nome_paciente,
    SUM(c.valor_consulta) AS total_consultas,
    ROUND(AVG(c.valor_consulta), 2) AS media_consultas
FROM pacientes p
INNER JOIN consultas c
    ON p.id_paciente = c.id_paciente
WHERE p.nome_paciente LIKE 'M%'
GROUP BY p.id_paciente, p.nome_paciente;