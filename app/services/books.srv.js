'use strict';

const booksJson = require('../../assets/books.json');

module.exports.getAllBooks = function (success, error) {
    success(booksJson);
}