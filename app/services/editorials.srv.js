'use strict';

var db = require('../../db.js');

/**
 * Retrieves all the editorials in the Bookstore
 * @param {*} success The function which handles a success request
 * @param {*} error The function which handles the errors
 */
module.exports.getAllEditorials = function (success, error) {
    var query = 'SELECT * FROM editorial';
    
    db.connection.query(query, [], function (err, rows) {
        if (!err) {
            success(rows);
        } else {
            
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
            success(rows[0]);
        } else {
            
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
            success(rows);
        } else {

        }
    });
}
