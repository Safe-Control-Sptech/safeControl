var medidaModel = require("../models/medidaModel");

function buscarTemperatura(req, res) {
    var idSensor = req.params.idSensor;

    medidaModel.buscarTemperatura(idSensor)
        .then(resultado => res.json(resultado))
        .catch(erro => {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });
}

function buscarUmidade(req, res) {
    var idSensor = req.params.idSensor;

    medidaModel.buscarUmidade(idSensor)
        .then(resultado => res.json(resultado))
        .catch(erro => {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });
}

function buscarKpis(req, res) {
    medidaModel.buscarKpis()
        .then(resultado => res.json(resultado))
        .catch(erro => {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });
}

function buscarDataMaiorTemp(req, res) {

    medidaModel.buscarDataMaiorTemp()
        .then(resultado => {
            res.json(resultado);
        })
        .catch(erro => {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });

}

function buscarDataMaiorUmi(req, res) {

    medidaModel.buscarDataMaiorUmi()
        .then(resultado => {
            res.json(resultado);
        })
        .catch(erro => {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });

}

function buscarSensores(req, res) {

    medidaModel.buscarSensores()
        .then(resultado => {
            res.json(resultado);
        })
        .catch(erro => {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });

}

function buscarAlertas(req, res) {

    medidaModel.buscarAlertas()
        .then(resultado => {
            res.json(resultado);
        })
        .catch(erro => {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });

}

function buscarSensores(req, res) {

    medidaModel.buscarSensores()
        .then(resultado => {
            res.json(resultado);
        })
        .catch(erro => {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });

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