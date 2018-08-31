'use strict';

var express = require('express');
var router = express.Router();
var editorialsService = require('../services/editorials.srv.js');

router.get('/editorials', (req, res) => {
    editorialsService.getAllEditorials(function(editorials){
        res.statusCode = 200;
        res.send(editorials);
    }, function (err){
        sendServiceError(err, res);
    });
});

router.get('/editorials/:editorialId', (req, res) => {
    var editorialId = req.params.editorialId;
    
    editorialsService.getEditorialById(editorialId, function(editorial){
        res.statusCode = 200;
        res.send(editorial);
    }, function (err){
        sendServiceError(err, res);
    });
});

router.get('/editorials/:editorialId/books', (req, res) => {
    var editorialId = req.params.editorialId;
    
    editorialsService.getBooks(editorialId, function(books){
        res.statusCode = 200;
        res.send(books);
    }, function (err){
        sendServiceError(err, res);
    });
});

function sendServiceError(err, res) {
    res.statusCode = 500;
    res.send(err);
}

module.exports = router;