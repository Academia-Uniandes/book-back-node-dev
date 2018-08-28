'use strict';

var express = require('express');
var router = express.Router();
var editorialsService = require('../services/editorials.srv.js');

router.get('/editorials', (req, res) => {
    editorialsService.getAllEditorials(function(editorials){
        res.statusCode = 200;
        res.send(editorials);
    }, function (err){
        res.statusCode = 500;
        res.send(err);
    });
});

module.exports = router;