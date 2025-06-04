var votacaoModel = require("../models/votacaoModel");

function cadastrarVoto(req, res) {
    var id_usuario = req.body.id_usuario;
    var manhwa_favorito = req.body.manhwa_favorito;

    votacaoModel.cadastrarVoto(id_usuario, manhwa_favorito)
        .then(function(resultado){
            if(resultado.length > 0 || resultado.affectedRows > 0){
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhum resultado encontrado");
            }
        })
        .catch(function(erro){
            res.status(500).json(erro.sqlMessage);
            console.log(erro);
        });
}

module.exports = {
    cadastrarVoto
};
