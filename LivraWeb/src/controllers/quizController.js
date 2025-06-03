var quizModel = require("../models/quizModel");

function cadastrarRespostas(req, res) {
    var id_usuario = req.body.id_usuarioServer;
    var resultado = req.body.resultadoServer;

    quizModel.cadastrarRespostas(id_usuario, resultado).then(function(resultado){
        if(resultado.length > 0){
            res.status(200).json(resultado)
        }
        else {
            res.status(204).send("Nenhum resultado encontrado")
        }
    })
    
    .catch(function(erro){
        res.status(500).json(erro.sqlMessage);
        console.log(erro)
    })
}

module.exports = {
    cadastrarRespostas
}