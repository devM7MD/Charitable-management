const express = require("express");
const server = express();
const port = 3000;
const path = require('path');
require('./db/db');

server.use('/', require('./controllers/publicController.js'));
server.use('/users', require('./controllers/usersController'));
server.set('view engine', 'ejs');
server.set('viewss', path.join(__dirname, 'views'))

server.listen(port, () => {
  console.log(`Server started on http://localhost:${port}`);
})
