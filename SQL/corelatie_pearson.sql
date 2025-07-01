-- Calculează coeficientul de corelație Pearson pe județ
SELECT
  c.judet,
  corr(c.temp_medie, m.migratie_neta) AS corelatie_pearson
FROM
  clima c
JOIN
  migratie_neta m
  ON c.judet = m.judet AND c.an = m.an
WHERE
  c.judet IN ('Olt', 'Teleorman', 'Calarasi')
GROUP BY
  c.judet;
