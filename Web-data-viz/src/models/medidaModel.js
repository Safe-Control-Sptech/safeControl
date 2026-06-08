var database = require("../database/config");

function UmidadeSensorSelecionado() {

    var instrucaoSql = `SELECT 
    c.idCaptura,
    c.umidade,
        um.simbolo AS unidadeUmidade
        FROM captura c
        JOIN unidadeMedida um ON um.idUnidade = c.fkUnidadeUmi
        WHERE c.fkSensor = 2
        ORDER BY c.idCaptura ASC;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function CapturaSensor() {

    var instrucaoSql = `SELECT 
    c.idCaptura,
    c.temperatura,
    um.simbolo AS unidadeTemperatura
    FROM captura c
    JOIN unidadeMedida um ON um.idUnidade = c.fkUnidadeTemp
    WHERE c.fkSensor = 2
    ORDER BY c.idCaptura ASC;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function EstadoSensor() {
    var instrucaoSql = `SELECT 
    s.idSensor,
    s.codigoRastreio,
    ss.idStatus,
    ss.descricao AS statusSensor
FROM sensor s
JOIN statusSensor ss ON ss.idStatus = s.fkStatus
JOIN transporte t ON t.fkSensor = s.idSensor
WHERE t.fkEmpresa = 2
GROUP BY s.idSensor, s.codigoRastreio, ss.idStatus, ss.descricao;`
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}
module.exports = {
    UmidadeSensorSelecionado,
    CapturaSensor,
    EstadoSensor
}
