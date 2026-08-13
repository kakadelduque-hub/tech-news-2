// ============================================
// app.js — Servidor Express
// ============================================

const express = require('express');
const path = require('path');
require('dotenv').config();

// Importar a conexão com o MySQL
const db = require('./db');

const app = express();

// Configurar o EJS
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// Servir arquivos estáticos (CSS, imagens)
app.use(express.static(path.join(__dirname, 'public')));

// ============================================
// ROTAS
// ============================================

// Página inicial
app.get('/', (req, res) => {
    res.render('index', {
        titulo: 'TechNews - Início',
        pagina: 'home'
    });
});

// Página de notícias
app.get('/noticias', (req, res) => {

    const sql = 'SELECT * FROM noticias ORDER BY data_publicacao DESC';

    db.query(sql, (erro, resultados) => {

        if (erro) {
            console.error('Erro ao buscar notícias:', erro);
            return res.status(500).send('Erro no servidor');
        }

        res.render('noticias', {
            titulo: 'TechNews - Notícias',
            pagina: 'noticias',
            noticias: resultados
        });
    });
});

// Página de contato
app.get('/contato', (req, res) => {
    res.render('contato', {
        titulo: 'TechNews - Contato',
        pagina: 'contato'
    });
});

// ============================================
// INICIAR O SERVIDOR
// ============================================

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log(`🚀 Servidor rodando em: http://localhost:${PORT}`);
});