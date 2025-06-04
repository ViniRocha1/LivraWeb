var database = require("../database/config");

function cadastrarVoto(id_usuario, manhwa_favorito) {
    var instrucao = `
        INSERT INTO votos_manhwas (id_usuario, personagem_favorito) VALUES ('${id_usuario}', '${manhwa_favorito}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    cadastrarVoto
};