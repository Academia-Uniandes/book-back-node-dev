var assert = require('chai').assert;
var authorsService = require('../app/services/authors.srv.js');

var authors = [];
var author_1;
var author_2;

describe('Author\'s service unit tests', function () {

    describe('Initial state', function () {
        it('should return the list of authors', function (done) {
            authorsService.getAllAuthors(function (list) {
                assert.equal(list.length, 0);
                done();
            }, function (err) {
                done(err);
            });
        });
    });

    describe('Adding authors', function () {
        before(function () {
            author_1 = {
                id: undefined,
                name: 'J.K. Rowling',
                birthdate: '1967-07-31',
                description: 'A very good author',
                image: 'https://myimage.com'
            };

            author_2 = {
                id: undefined,
                name: 'JRR Tolkien',
                birthdate: '1923-12-12',
                description: 'A very good author',
                image: 'https://myimage.com'
            }
        });

        it('should add a first author', function (done) {
            authorsService.createAuthor(author_1, function (id) {
                author_1.id = id;
                authors.push(author_1);
                done();
            }, function (err) {
                done(err);
            });
        });

        it('should add a second author', function (done) {
            authorsService.createAuthor(author_2, function (id) {
                author_2.id = id;
                authors.push(author_2);
                done();
            }, function (err) {
                done(err);
            });
        });

        it('should be a list with one author in it', function (done) {
            authorsService.getAllAuthors(function (list) {
                assert.equal(list.length, authors.length);
                done();
            }, function (err) {
                done(err);
            });
        });

        it('should not add twice the first author', function (done) {
            authorsService.createAuthor(author_1, function () {
                assert.isNotOk(true,'This author should not have been added');
                done();
            }, function () {
                done();
            });
        });

        it('should not add twice the second author', function (done) {
            authorsService.createAuthor(author_2, function () {
                assert.isNotOk(true,'This author should not have been added');
                done();
            }, function () {
                done();
            });
        });

        it('should edit the first author', function (done) {
            let original_name = author_1.name;
            author_1.name = author_1.name.substring(0, author_1.name.length - 1);
            authorsService.updateAuthor(author_1, function () {
                authorsService.getAuthorById(author_1.id, function (edited_auhor) {
                    assert.equal(author_1.name, edited_auhor.name);
                    assert.notEqual(original_name, edited_auhor.name);
                    done();
                }, function (err) {
                    done(err);
                })
            }, function (err) {
                done(err);
            });
        });

        after(function () {
            authorsService.deleteAllAuthors();
        });
    });
});