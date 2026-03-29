const express = require("express");

const mainRouter = express.Router();

mainRouter.get('/', (req, res) => {
    res.render('index')
});

mainRouter.get('/PRD', (req, res) => {
    res.render('prd')
})

mainRouter.get('/desystem', (req, res) => {
    res.render('desystem')
})

module.exports = mainRouter;