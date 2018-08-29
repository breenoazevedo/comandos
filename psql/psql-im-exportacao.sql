-- Exportar registros de uma tabela para um CSV com uma query

COPY product TO '/tmp/file.csv' CSV;

-- Exportar resultado de uma consulta para um arquivo csv

COPY (SELECT id, name FROM product) TO '/tmp/file.csv' CSV;

-- Importar dados para a tabela de um arquivo CSV

COPY product FROM '/tmp/file.csv' CSV;