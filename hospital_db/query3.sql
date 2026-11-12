USE hospital_db;
SELECT
    q.tipo_quarto,
    ROUND(AVG(i.valor_diaria), 1) AS media_diaria

FROM quartos q

INNER JOIN internacoes i ON q.id_quarto = i.id_quarto

WHERE q.tipo_quarto IN ('Apartamento', 'UTI')

GROUP BY q.tipo_quarto;