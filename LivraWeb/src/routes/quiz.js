var express = require("express");
var router = express.Router();

var quizController = require("../controllers/quizController");

router.post("/cadastrarRespostas/", function (req, res) {
    // função a ser chamada quando acessar /quiz/cadastrarRespostas
    quizController.cadastrarRespostas(req, res);
});

module.exports = router;