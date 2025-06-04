var express = require("express");
var router = express.Router();

var votacaoController = require("../controllers/votacaoController");

router.post("/cadastrar", function(req, res) {
    votacaoController.cadastrarVoto(req, res);
});

router.post("/cadastrar", function(req, res) {
    votacaoController.cadastrarGenero(req, res);
});

module.exports = router;