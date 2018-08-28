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