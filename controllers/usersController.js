const express = require("express");
const db = require('../db/db');

const userRouter = express.Router();

userRouter.get('/', (req, res) => {
    res.send("Users Page")
    let users = db.prepare("SELECT * FROM Users").all();
    for(let i = 0; i < users.length; i++) {
        console.log(users[i]);
    }
    
});

module.exports = userRouter;