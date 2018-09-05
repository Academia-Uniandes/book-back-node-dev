'use strict';

var db = require('../../db.js');
const logger = require('../../logger');

/**
 * Retrieves all the authors in the Bookstore
 * @param {*} success The function which handles a success request
 * @param {*} error The function which handles the errors
 */
module.exports.getAllAuthors = function (success, error) {
    var query = 'SELECT * FROM author';
    
    db.connection.query(query, [], function (err, rows) {
        if (!err) {
            logger.info('The list of authors was retrieved and sent to the controller');
            success(rows);
        } else {
            logger.error('The list of authors could not be retrieved');
            error({ errorMessage: 'Try again later. There seems to be an error because we couldn\'t find the list of authors.' });
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
            logger.info('The details of the author whose id is ' + authorId + ' were retrieved and sent to the controller');
            success(rows[0]);
        } else {
            logger.error('The details of the author whose id is ' + authorId + ' could not be retrieved');
            error({ errorMessage: 'Try again later. There seems to be an error because we couldn\'t find the details of this author.' });
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
            logger.info('The books of the author whose id is ' + authorId + ' were retrieved and sent to the controller');
            success(rows);
        } else {
            logger.error('The books of the author whose id is ' + authorId + ' could not be retrieved');
            error({ errorMessage: 'Try again later. There seems to be an error because we couldn\'t find the books written by this author.' });
        }
    });
}