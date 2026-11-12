use hospital_db;
SELECT
    m.nome_medico,
    COUNT(pr.id_prescricao) AS total_medicamentos
FROM medicos m
INNER JOIN consultas c
    ON m.id_medico = c.id_medico
INNER JOIN prescricoes pr
    ON c.id_consulta = pr.id_consulta
WHERE c.status_consulta = 'Realizada'
GROUP BY m.id_medico, m.nome_medico;