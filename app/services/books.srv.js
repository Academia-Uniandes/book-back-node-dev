'use strict';

var db = require('../../db.js');
const logger = require('../../logger');

/**
* Retrieves all the books in the Bookstore
* @param {*} success The function which handles a success request
* @param {*} error The function which handles the errors
*/
module.exports.getAllBooks = function (success, error) {
    var query = 'SELECT * FROM book';
    
    db.connection.query(query, [], function (err, rows) {
        if (!err) {
            logger.info('The list of books was retrieved and sent to the controller');
            success(rows);
        } else {
            logger.info('Error: the list of books could not be retrieved');
            error({ errorMessage: 'Try again later. There seems to be an error because we couldn\'t find the list of books.' });
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
            logger.info('The details of the book whose id is ' + bookId + ' were retrieved and sent to the controller');
            success(rows[0]);
        } else {
            logger.error('The details of the book whose id is ' + bookId + ' could not be retrieved');
            error({ errorMessage: 'Try again later. There seems to be an error because we couldn\'t find the details of this book.' });
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
            logger.info('The authors of the book whose id is ' + bookId + ' were retrieved and sent to the controller');
            success(rows);
        } else {
            logger.error('The authors of the book whose id is ' + bookId + ' could not be retrieved');
            error({ errorMessage: 'Try again later. There seems to be an error because we couldn\'t find the authors of this book.' });
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
            logger.info('The editorial of the book whose id is ' + bookId + ' was retrieved and sent to the controller');
            success(rows[0]);
        } else {
            logger.error('The editorial of the book whose id is ' + bookId + ' could not be retrieved');
            error({ errorMessage: 'Try again later. There seems to be an error because we couldn\'t find the editorial of this book.' });
        }
    });
}

/**
 * Retrieves the reviews of a book
 * @param {*} bookId The book's id
 * @param {*} success The function which handles a success request
 * @param {*} error The function which handles the errors
 */
module.exports.getReviews = function(bookId, success, error){
    var query = 'SELECT review.* FROM review WHERE book_id = ?';

    db.connection.query(query, [bookId], function (err, rows) {
        if (!err) {
            logger.info('The reviews of the book whose id is ' + bookId + ' was retrieved and sent to the controller');
            success(rows);
        } else {
            logger.error('The reviews of the book whose id is ' + bookId + ' could not be retrieved');
            error({ errorMessage: 'Try again later. There seems to be an error because we couldn\'t find the reviews of this book.' });
        }
    });
}