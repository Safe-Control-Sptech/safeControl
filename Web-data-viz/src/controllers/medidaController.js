var medidaModel = require("../models/medidaModel");

function UmidadeSensorSelecionado(req, res) {

    console.log(`Recuperando as ultimas ${limite_linhas} medidas`);

    medidaModel.UmidadeSensorSelecionado().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


function CapturaSensor(req, res) {


    console.log(`Recuperando medidas em tempo real`);

    medidaModel.CapturaSensor().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function EstadoSensor(req, res) {


    console.log(`Recuperando estado do sensor`);

    medidaModel.EstadoSensor().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    UmidadeSensorSelecionado,
    CapturaSensor,
    EstadoSensor
}