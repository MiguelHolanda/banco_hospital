use hospital_db;
SELECT
    p.convenio,
    ROUND(AVG(i.valor_diaria), 2) AS media_diaria
FROM pacientes p
INNER JOIN internacoes i
    ON p.id_paciente = i.id_paciente
INNER JOIN quartos q
    ON i.id_quarto = q.id_quarto
WHERE q.tipo_quarto = 'UTI'
GROUP BY p.convenio;