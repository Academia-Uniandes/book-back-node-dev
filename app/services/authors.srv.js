'use strict';

var db = require('../../db.js');

/**
 * Retrieves all the authors in the Bookstore
 * @param {*} success The function which handles a success request
 * @param {*} error The function which handles the errors
 */
module.exports.getAllAuthors = function (success, error) {
    var query = 'SELECT * FROM author';
    
    db.connection.query(query, [], function (err, rows) {
        if (!err) {
            success(rows);
        } else {
            error(err);
        }
    });
}

/**
 * Retrieves an author based on its id
 * @param {*} authorId The author's id
 * @param {*} success The function which handles a success request
 * @param {*} error The function which handles the errors
 */
module.exports.getAuthorById = function (authorId, success, error) {
    var query = 'SELECT * FROM author WHERE id = ?';
    
    db.connection.query(query, [authorId], function (err, rows) {
        if (!err) {
            success(rows[0]);
        } else {
            error(err);
        }
    });
}

/**
 * Rerieves the books of an author
 * @param {*} authorId The author's id
 * @param {*} success The function which handles a success request
 * @param {*} error The function which handles the errors
 */
module.exports.getBooks = function (authorId, success, error) {
    var query = 'SELECT book.* FROM book ' +
                'INNER JOIN author_book ab ON ab.book_id = book.id ' +
                'INNER JOIN author ON ab.author_id = author.id ' +
                'WHERE author.id = ?';
    
    db.connection.query(query, [authorId], function (err, rows) {
        if (!err) {
            success(rows);
        } else {
            error(err);
        }
    });
}