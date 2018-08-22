'use strict';

var express = require('express');
var router = express.Router();
var editorialsService = require('../services/editorials.srv.js');
var booksService = require('../services/books.srv.js');

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
        for (let index = 0; index < books.length; index++) {
            const book = books[index];
            booksService.getBookAuthors(book.id, function(authors){
                book.authors = authors;
                if (index == books.length - 1) {
                    res.statusCode = 200;
                    res.send(books);
                }
            })
        }
    });
});

router.post('/editorials/create', (req, res) => {
    var editorial = req.body;
    editorialsService.create(editorial, function (){
        res.statusCode = 200;
        res.end();
    });
});

module.exports = router;