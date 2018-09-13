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
            error({
                errorCode: 500,
                errorMessage: 'Try again later. We can process your request at the moment.'
            });
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
    var query = 'SELECT id, name, description, image, DATE_FORMAT(birthdate, "%Y-%m-%d") as birthdate FROM author WHERE id = ?';

    db.connection.query(query, [authorId], function (err, rows) {
        if (!err) {
            logger.info('The details of the author whose id is ' + authorId + ' were retrieved and sent to the controller');
            success(rows[0]);
        } else {
            logger.error('The details of the author whose id is ' + authorId + ' could not be retrieved');
            error({
                errorCode: 500,
                errorMessage: 'Try again later. We can process your request at the moment.'
            });
        }
    });
}

/**
* Creates an author 
* @param {*} author The author's information
* @param {*} success The function which handles a success request
* @param {*} error The function which handles the errors
*/
module.exports.createAuthor = function (author, success, error) {
    var query = 'INSERT INTO author (name, description, image, birthdate) VALUES (?, ?, ?, ?)';

    this.validateAuthor(author, function () {
        db.connection.query(query, [author.name, author.description, author.image, author.birthdate], function (err, rows) {
            if (!err) {
                logger.info('The author was created');
                success(rows.insertId);
            } else {
                logger.error('The author could not be created');
                error({
                    errorCode: 500,
                    errorMessage: 'Try again later. We can process your request at the moment.'
                });
            }
        });
    }, function (err) {
        error(err);
    });
}

/**
* Updates an author based on its id
* @param {*} author The author's information
* @param {*} success The function which handles a success request
* @param {*} error The function which handles the errors
*/
module.exports.updateAuthor = function (author, success, error) {
    var query = 'UPDATE author SET name = ?, description = ?, image = ?, birthdate = ? WHERE id = ?';

    this.validateAuthor(author, function () {
        db.connection.query(query, [author.name, author.description, author.image, author.birthdate, author.id], function (err, rows) {
            if (!err) {
                logger.info('The details of the author whose id is ' + author.id + ' were updated');
                success();
            } else {
                logger.error('The details of the author whose id is ' + author.id + ' could not be updated');
                error({
                    errorCode: 500,
                    errorMessage: 'Try again later. We can process your request at the moment.'
                });
            }
        });
    }, function (err) {
        error(err);
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
            error({
                errorCode: 500,
                errorMessage: 'Try again later. We can process your request at the moment.'
            });
        }
    });
}

/**
* Business rules validation functions
*/

/**
* Validates the business rules to create an author.
* Business rule: two authors can't have the same name and birth date
* @param {*} author The author's information
* @param {*} success The function which handles a success request
* @param {*} error The function which handles the errors
*/
this.validateAuthor = function (author, success, error) {
    var query = 'SELECT * FROM author WHERE name = ? AND birthdate = STR_TO_DATE(?, \'%Y-%m-%d\')';

    db.connection.query(query, [author.name, author.birthdate], function (err, rows) {
        if (!err) {
            if (rows.length > 0) {
                logger.error('There\'s already an author with that name and birth date');
                error({
                    errorCode: 405,
                    errorMessage: 'There\'s already an author in the system with that name and birthdate. Check and try again.'
                });
            } else {
                logger.info('There\'s no existing author corresponding to that name and birthdate. Proceeding to creation');
                success();
            }
        } else {
            logger.error('There was an error with the database and we couldn\'t check if the author can or can not be created');
            error({
                errorCode: 500,
                errorMessage: 'Try again later. We can process your request at the moment.'
            });
        }
    });
}

/**
* Test functions
*/

/**
 * Clears the author's table in the database
 */
module.exports.deleteAllAuthors = function () {
    var query = 'DELETE FROM author';

    db.connection.query(query, []);
}