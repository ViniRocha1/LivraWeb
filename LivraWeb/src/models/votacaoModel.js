var database = require("../database/config");

function cadastrarVoto(id_usuario, id_manhwa) {
    var instrucao = `
        INSERT INTO manhwa_favorito (id_usuario, id_manhwa) VALUES ('${id_usuario}', '${id_manhwa}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}


function cadastrarGenero(genero) {
    var instrucao = `
        INSERT INTO manhwa_favorito (id_usuario, genero) VALUES ('${id_usuario}', '${genero}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    cadastrarVoto,
    cadastrarGenero
};