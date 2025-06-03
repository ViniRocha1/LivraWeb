var database = require("../database/config");

function listarTenta(fkUsuario, fkQuiz) {
    console.log("ACESSEI O MODEL \n function listarTenta()");
    var instrucaoSql = `
        SELECT 
            COUNT(tentativa) AS tentativa
        FROM pontuacao 
        WHERE fkUsuario = ${fkUsuario} AND fkQuiz = ${fkQuiz};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function cadastrarQuiz(tentativa, fkQuiz, fkUsuario, pontuacao) {
    console.log("ACESSEI O MODEL \n function cadastrarQuiz():", tentativa, fkQuiz, fkUsuario, pontuacao);
    var instrucaoSql = `
        INSERT INTO pontuacao (tentativa, fkQuiz, fkUsuario, pontuacao) 
        VALUES (${tentativa}, ${fkQuiz}, ${fkUsuario}, ${pontuacao});
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    listarTenta,
    cadastrarQuiz
};
