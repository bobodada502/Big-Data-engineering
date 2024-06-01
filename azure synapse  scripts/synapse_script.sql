SELECT
    TOP 5 *
FROM
    OPENROWSET(
        BULK 'https://primumstorage01.blob.core.windows.net/bd-project/BI/ml_result.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE
    ) AS [result]
