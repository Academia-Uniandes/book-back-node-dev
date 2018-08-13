'use strict';

var express = require('express');
var router = express.Router();
var editorialsService = require('../services/editorials.srv.js');

router.get('/editorials/allEditorials', (req, res) => {
    editorialsService.getAllEditorials(function(editorials){
        res.statusCode = 200;
        res.send(editorials);
    });
});

router.get('/editorials/getEditorial/:editorialId', (req, res) => {
    var editorialId = req.params.editorialId;

    editorialsService.getEditorialById(editorialId, function(editorial){
        res.statusCode = 200;
        res.send(editorial);
    });
});

router.get('/editorials/getBooks/:editorialId', (req, res) => {
    var editorialId = req.params.editorialId;

    editorialsService.getBooks(editorialId, function(books){
        res.statusCode = 200;
        res.send(books);
    });
});

module.exports = router;