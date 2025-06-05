var database = require("../database/config");

function buscarManhwaFav() {
    var instrucaoSql = `
        select m.titulo,
        COUNT(mf.id_manhwa) qtd
        from manhwa_favorito mf
        join manhwa m on mf.id_manhwa = m.id
        group by m.titulo;
    `; 

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarGeneroFav() {
    var instrucaoSql = `
        select m.genero,
        COUNT(mf.id_manhwa) qtd
        from manhwa_favorito mf
        join manhwa m on mf.id_manhwa = m.id
        group by m.genero;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarResultado() {
    var instrucaoSql = `
        SELECT resultado, 
        COUNT(*) AS qtd 
        FROM quiz 
        GROUP BY resultado; 
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarManhwaFav,
    buscarGeneroFav,
    buscarResultado
};