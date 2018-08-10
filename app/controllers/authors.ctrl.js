'use strict';

var express = require('express');
var router = express.Router();
var authorsService = require('../services/authors.srv.js');

router.get('/authors/allAuthors', function(req, res){
    authorsService.getAllAuthors(function(authors){
        res.statusCode = 200;
        res.send(authors);
    });
});

module.exports = router;