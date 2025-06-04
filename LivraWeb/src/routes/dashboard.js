var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

router.get("/buscarManhwaFav", function (req, res) {
    dashboardController.buscarManhwaFav(req, res);
});

router.get("/buscargeneroFav", function (req, res) {
    dashboardController.buscarGeneroFav(req, res);
});

module.exports = router;