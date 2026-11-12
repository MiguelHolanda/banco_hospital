use hospital_db;
SELECT
    p.nome_paciente,
    SUM(i.valor_diaria) AS total_diarias
FROM pacientes p
INNER JOIN internacoes i
    ON p.id_paciente = i.id_paciente
WHERE p.nome_paciente LIKE '%Silva%'
GROUP BY p.id_paciente, p.nome_paciente;