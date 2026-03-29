const db = require('better-sqlite3')('database.db');
const path = require('path');
const fs = require('fs');
const schema = fs.readFileSync(path.join(__dirname, 'schema.sql')).toString();
const db_setup = db.exec(schema);
db.pragma('journal_mode = WAL');
module.exports = db
