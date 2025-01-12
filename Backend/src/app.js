const express = require("express");
const cors = require("cors");
const path = require('path');
const app = express();

// for cross origin resource sharing
app.use(
    cors({
        origin: process.env.CORS_ORIGIN,
        credentials: true,
    })
);

app.use(express.json()); // tell express to use json as the body parser
app.use(express.static(path.join(__dirname, "..", 'build'))); // tell express to use the build folder as the static folder

module.exports = { app };