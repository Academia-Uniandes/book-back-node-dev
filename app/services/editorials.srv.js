'use strict';

const editorialsJson = require('../../assets/editorials.json');

module.exports.getAllEditorials = function (success, error) {
    success(editorialsJson);
}