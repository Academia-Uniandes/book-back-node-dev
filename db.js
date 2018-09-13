'use strict';

var mysql = require('mysql');
var conf = require('./config.js');

if (process.env.NODE_ENV === 'test') {
    var dbParams = conf.get('test');
} else {
    var dbParams = conf.get('db');
}


module.exports.connection = mysql.createConnection({
    host: dbParams.host,
    user: dbParams.user,
    password: dbParams.password,
    database: dbParams.database
});