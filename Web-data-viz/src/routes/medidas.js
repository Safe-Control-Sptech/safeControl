var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

// router.get("/ultimas/:idAquario", function (req, res) {
//     medidaController.buscarUltimasMedidas(req, res);
// });

// router.get("/tempo-real/:idAquario", function (req, res) {
//     medidaController.buscarMedidasEmTempoReal(req, res);
// })

router.get("/UmidadeSensorSelecionado", function (req, res) {
    medidaController.UmidadeSensorSelecionado(req, res);
})

router.get("/CapturaSensor", function (req, res) {
    medidaController.CapturaSensor(req, res);
})

router.get("/EstadoSensor", function (req, res) {
    medidaController.EstadoSensor(req, res);
})  

module.exports = router;