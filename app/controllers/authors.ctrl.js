'use strict';

var express = require('express');
var router = express.Router();
var authorsService = require('../services/authors.srv.js');

router.get('/authors', function(req, res){
    authorsService.getAllAuthors(function(authors){
        res.statusCode = 200;
        res.send(authors);
    }, function (err){
        res.statusCode = 500;
        res.send(err);
    });
});

module.exports = router;