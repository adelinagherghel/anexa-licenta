CREATE TABLE populatie (
    judet TEXT,
    cod_judet TEXT,
    an INT,
    populatie_totala INT,
    rata_urbanizare FLOAT,
    tineri INT,
    adulti INT,
    varstnici INT
);

CREATE TABLE migratie_neta (
    judet TEXT,
    cod_judet TEXT,
    an INT,
    migratie_neta INT
);

CREATE TABLE clima (
    judet TEXT,
    cod_judet TEXT,
    an INT,
    temp_medie FLOAT,
    seceta INT,
    indice_ariditate FLOAT,
    inundatii INT
);
