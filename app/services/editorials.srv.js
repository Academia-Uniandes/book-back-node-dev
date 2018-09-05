'use strict';

var db = require('../../db.js');
const logger = require('../../logger');

/**
* Retrieves all the editorials in the Bookstore
* @param {*} success The function which handles a success request
* @param {*} error The function which handles the errors
*/
module.exports.getAllEditorials = function (success, error) {
    var query = 'SELECT * FROM editorial';
    
    db.connection.query(query, [], function (err, rows) {
        if (!err) {
            logger.info('The list of editorials was retrieved and sent to the controller');
            success(rows);
        } else {
            logger.error('The list of editorials could not be retrieved');
            error({ errorMessage: 'Try again later. There seems to be an error because we couldn\'t find the list of editorials.' });
        }
    });
}

/**
 * Retrieves an editorial by its id
 * @param {*} editorialId The editorial's id
 * @param {*} success The function which handles a success request
 * @param {*} error The function which handles the errors
 */
module.exports.getEditorialById = function(editorialId, success, error) {
    var query = 'SELECT * FROM editorial WHERE id = ?';
    
    db.connection.query(query, [editorialId], function (err, rows) {
        if (!err) {
            logger.info('The details of the editorial whose id is ' + editorialId + ' were retrieved and sent to the controller');
            success(rows[0]);
        } else {
            logger.error('The details of the editorial whose id is ' + editorialId + ' could not be retrieved');
            error({ errorMessage: 'Try again later. There seems to be an error because we couldn\'t find the details of this editorial.' });
        }
    });
}

/**
 * Retrieves the books published by an editorial by its id
 * @param {*} editorialId The editorial's id
 * @param {*} success The function which handles a success request
 * @param {*} error The function which handles the errors
 */
module.exports.getBooks = function (editorialId, success, error) {
    var query = 'SELECT * FROM book WHERE editorial_id = ?';
    
    db.connection.query(query, [editorialId], function (err, rows) {
        if (!err) {
            logger.info('The books of the editorial whose id is ' + editorialId + ' were retrieved and sent to the controller');
            success(rows);
        } else {
            logger.error('The books of the editorial whose id is ' + editorialId + ' could not be retrieved');
            error({ errorMessage: 'Try again later. There seems to be an error because we couldn\'t find the books of this editorial.' });
        }
    });
}