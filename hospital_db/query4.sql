use hospital_db;
SELECT
    m.nome_medico,
    SUM(c.valor_consulta) AS total_consultas
FROM medicos m
INNER JOIN consultas c
    ON m.id_medico = c.id_medico
WHERE c.status_consulta IN ('Realizada', 'Finalizada')
GROUP BY m.id_medico, m.nome_medico;