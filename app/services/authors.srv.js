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