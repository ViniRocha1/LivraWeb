var database = require("../database/config");

function buscarManhwaFav() {
    var instrucaoSql = `
    SELECT livro_favorito 
    FROM questionario;`;  // Supondo que a coluna mudou de personagem_favorito para livro_favorito

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarResultado() {
    var instrucaoSql = `
    SELECT resultado 
    FROM quiz;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarManhwaFav
,
    buscarResultado
};