use hospital_db;
SELECT
    c.status_consulta,
    COUNT(pr.id_prescricao) AS total_prescricoes
FROM consultas c
INNER JOIN prescricoes pr
    ON c.id_consulta = pr.id_consulta
WHERE pr.medicamento LIKE '%Dipirona%'
   OR pr.medicamento LIKE '%Paracetamol%'
GROUP BY c.status_consulta;