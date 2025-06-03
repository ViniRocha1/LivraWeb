var database = require("../database/config")

function cadastrarRespostas(id_usuario, resultado) {
    var instrucao = `
        INSERT INTO quiz (id_usuario, resultado) VALUES ('${id_usuario}', '${resultado}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    cadastrarRespostas
};