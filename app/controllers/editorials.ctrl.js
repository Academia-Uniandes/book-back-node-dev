'use strict';

var express = require('express');
var router = express.Router();
var editorialsService = require('../services/editorials.srv.js');

router.get('/editorials', (req, res) => {
    editorialsService.getAllEditorials(function(editorials){
        res.statusCode = 200;
        res.send(editorials);
    });
});

module.exports = router;