'use strict';

const authorsJson = require('../../assets/authors.json');

module.exports.getAllAuthors = function (success, error) {
    success(authorsJson);
}