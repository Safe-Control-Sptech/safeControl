var database = require("../database/config");

function buscarTemperatura(idSensor) {
    var instrucaoSql = `
        SELECT
            temperatura,
            dtCaptura
        FROM vw_dados_sensor
        WHERE idSensor = ${idSensor}
        ORDER BY idCaptura DESC
        LIMIT 10;
    `;

    return database.executar(instrucaoSql);
}

function buscarUmidade(idSensor) {
    var instrucaoSql = `
        SELECT
            umidade,
            dtCaptura
        FROM vw_dados_sensor
        WHERE idSensor = ${idSensor}
        ORDER BY idCaptura DESC
        LIMIT 10;
    `;

    return database.executar(instrucaoSql);
}

function buscarKpis() {

    var instrucaoSql = `
        SELECT
            MAX(temperatura) AS maiorTemp,
            MAX(umidade) AS maiorUmi
        FROM (
            SELECT temperatura, umidade
            FROM vw_dados_sensor
            ORDER BY idCaptura DESC
            LIMIT 10
        ) ultimasCapturas;
    `;

    return database.executar(instrucaoSql);

}

function buscarDataMaiorTemp() {

    var instrucaoSql = `
        SELECT
            temperatura,
            dtCaptura
        FROM (
            SELECT temperatura, dtCaptura
            FROM vw_dados_sensor
            ORDER BY idCaptura DESC
            LIMIT 10
        ) ultimasCapturas
        ORDER BY temperatura DESC
        LIMIT 1;
    `;

    return database.executar(instrucaoSql);
}

function buscarDataMaiorUmi() {

    var instrucaoSql = `
        SELECT
            umidade,
            dtCaptura
        FROM (
            SELECT umidade, dtCaptura
            FROM vw_dados_sensor
            ORDER BY idCaptura DESC
            LIMIT 10
        ) ultimasCapturas
        ORDER BY umidade DESC
        LIMIT 1;
    `;

    return database.executar(instrucaoSql);
}

function buscarSensores() {

    var instrucaoSql = `
        SELECT
            COUNT(*) AS totalSensores,
            SUM(fkStatus = 2) AS sensoresAtivos
        FROM sensor;
    `;

    return database.executar(instrucaoSql);

}

function buscarAlertas() {

    var instrucaoSql = `
        SELECT
            d.idSensor,
            d.temperatura,
            d.umidade
        FROM vw_dados_sensor d
        JOIN (
            SELECT
                idSensor,
                MAX(idCaptura) AS ultimaCaptura
            FROM vw_dados_sensor
            GROUP BY idSensor
        ) u
        ON d.idSensor = u.idSensor
        AND d.idCaptura = u.ultimaCaptura
        WHERE d.temperatura > 4
           OR d.temperatura < -4
           OR d.umidade > 85
           OR d.umidade < 70;
    `;

    return database.executar(instrucaoSql);
}

function buscarSensores() {

    var instrucaoSql = `
        SELECT
            s.idSensor,
            s.codigoRastreio,
            st.descricao AS statusSensor
        FROM sensor s
        JOIN statusSensor st
            ON st.idStatus = s.fkStatus;
    `;

    return database.executar(instrucaoSql);

}

module.exports = {
    buscarTemperatura,
    buscarUmidade,
    buscarKpis,
    buscarDataMaiorTemp,
    buscarDataMaiorUmi,
    buscarSensores,
    buscarAlertas,
    buscarSensores
}
