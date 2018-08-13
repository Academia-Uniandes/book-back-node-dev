'use strict';

var db = require('../../db.js');

/**
 * Retrieves all the books in the Bookstore
 * @param {*} success The function which handles a success request
 * @param {*} error The function which handles the errors
 */
module.exports.getAllBooks = function (success, error) {
    var query = 'SELECT * FROM book';
    
    db.connection.query(query, [], function (err, rows) {
        if (!err) {
            success(rows);
        } else {
            
        }
    });
}

/**
 * Retrieves a book by its id
 * @param {*} bookId The book's id
 * @param {*} success The function which handles a success request
 * @param {*} error The function which handles the errors
 */
module.exports.getBookById = function(bookId, success, error) {
    var query = 'SELECT * FROM book WHERE id = ?';
    
    db.connection.query(query, [bookId], function (err, rows) {
        if (!err) {
            success(rows[0]);
        } else {
            error(err);
        }
    });
}

/**
 * Retrieves the authors of a book
 * @param {*} bookId The book's id
 * @param {*} success The function which handles a success request
 * @param {*} error The function which handles the errors
 */
module.exports.getBookAuthors = function(bookId, success, error){
    var query = 'SELECT author.* FROM author_book ab ' +
    'INNER JOIN author ON ab.author_id = author.id ' +
    'WHERE ab.book_id = ?';

    db.connection.query(query, [bookId], function (err, rows) {
        if (!err) {
            success(rows);
        } else {
            error(err);
        }
    });
}

/**
 * Retrieves the editorial of a book
 * @param {*} bookId The book's id
 * @param {*} success The function which handles a success request
 * @param {*} error The function which handles the errors
 */
module.exports.getBookEditorial = function(bookId, success, error){
    var query = 'SELECT editorial.* FROM editorial ' +
    'INNER JOIN book ON book.editorial_id = editorial.id ' +
    'WHERE book.id = ?';

    db.connection.query(query, [bookId], function (err, rows) {
        if (!err) {
            success(rows[0]);
        } else {
            error(err);
        }
    });
}