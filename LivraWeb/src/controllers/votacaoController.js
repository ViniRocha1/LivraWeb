var votacaoModel = require("../models/votacaoModel");

function cadastrarVoto(req, res) {
    var id_usuario = req.body.id_usuario;
    var id_manhwa = req.body.id_manhwa;

    votacaoModel.cadastrarVoto(id_usuario, id_manhwa)
        .then(function(resultado){
            if(resultado.length > 0 || resultado.affectedRows > 0){
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhum resultado encontrado");
            }
        })
        .catch(function(erro){
            res.status(500).json(erro.sqlMessage);
            console.log(erro.sqlMessage);
        });
}

module.exports = {
    cadastrarVoto
};
