var dashboardModel = require("../models/dashboardModel");

function buscarManhwaFav(req, res) {
    dashboardModel.buscarManhwaFav().then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar o Manhwa favorito.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarGeneroFav(req, res) {
    dashboardModel.buscarGeneroFav().then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar o Manhwa favorito.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarResultado(req, res) {
    dashboardModel.buscarResultado().then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar o resultado do quiz.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    buscarManhwaFav,
    buscarGeneroFav,
    buscarResultado
}
