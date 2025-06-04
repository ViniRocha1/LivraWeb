var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

router.get("/buscarManhwaFav", function (req, res) {
    dashboardController.buscarManhwaFav(req, res);
});

router.get("/buscarResultado", function (req, res) {
    dashboardController.buscarResultado(req, res);
});

module.exports = router;