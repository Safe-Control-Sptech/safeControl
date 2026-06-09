var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/temperatura/:idSensor", function (req, res) {
    medidaController.buscarTemperatura(req, res);
});

router.get("/umidade/:idSensor", function (req, res) {
    medidaController.buscarUmidade(req, res);
});

router.get("/kpis", function (req, res) {
    medidaController.buscarKpis(req, res);
});

router.get("/dataMaiorTemp", function (req, res) {
    medidaController.buscarDataMaiorTemp(req, res);
});

router.get("/dataMaiorUmi", function (req, res) {
    medidaController.buscarDataMaiorUmi(req, res);
});

router.get("/sensores", function (req, res) {
    medidaController.buscarSensores(req, res);
});

router.get("/alertas", function (req, res) {
    medidaController.buscarAlertas(req, res);
});

router.get("/sensores", function (req, res) {
    medidaController.buscarSensores(req, res);
});

module.exports = router;