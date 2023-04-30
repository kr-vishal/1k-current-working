"use strict";

const express = require("express");

// Constants
const PORT = 8080;
const HOST = "0.0.0.0";

// App
const app = express();
const cors = require("cors");
const mysql = require("mysql");
const { HTTP_STATUS } = require("./constants");
require("./constants");

const con = mysql.createConnection({
  host: process.env.MYSQL_DB_HOST || "services-racing-mysql-app",
  user: process.env.MYSQL_DB_USER || "root",
  password: process.env.MYSQL_DB_PASSWORD || "root",
  database: process.env.MYSQL_DB || "racing",
  port: process.env.MYSQL_DB_PORT || 3306,
});

con.connect(function (err) {
  if (err) throw err;
  console.log("Connected!");
});

app.use(express.json());

app.use(
  cors({
    origin: [
      "http://localhost:3000",
      "http://localhost",
      "http://localhost:3001",
    ],
  })
);

app.get("/", (req, res) => {
  res.send("Hello World, I have been updated");
});

app.get("/races", (req, res) => {
  const sql = "select * FROM races";

  con.query(sql, function (err, result) {
    try {
      if (err) throw err;
      console.log("Number of records inserted: " + result.affectedRows);
      res.status(HTTP_STATUS.OK);
      res.send({
        status: true,
        data: result,
      });
    } catch (error) {
      res.status(HTTP_STATUS.SERVER_ERROR);
      res.send({
        status: `Request Failed Error ${err.message}`,
      });
    }
  });
});

app.get("/top-racers", (req, res) => {
  const sql = "select * FROM racers ORDER BY `rank` ASC";

  con.query(sql, [], function (err, result) {
    try {
      if (err) throw err;

      console.log("Number of records inserted: " + result.affectedRows);
      res.status(HTTP_STATUS.OK);
      res.send({
        status: true,
        data: result,
      });
    } catch (error) {
      res.status(HTTP_STATUS.SERVER_ERROR);
      res.send({
        status: `Request Failed Error ${err.message}`,
      });
    }
  });
});

app.post("/submit-contact", (req, res) => {
  let ip = req.headers["x-forwarded-for"] || req.socket.remoteAddress || null;

  const sql = "INSERT INTO contacts (payload, user_ip) VALUES ?";
  const values = [[JSON.stringify(req.body), ip]];

  con.query(sql, [values], function (err, result) {
    try {
      if (err) throw err;

      console.log("Number of records inserted: " + result.affectedRows);
      res.status(HTTP_STATUS.OK);
      res.send({
        status: "Contact Created !!",
      });
    } catch (error) {
      res.status(HTTP_STATUS.SERVER_ERROR);
      res.send({
        status: `Request Failed Error ${err.message}`,
      });
    }
  });
});

app.post("/capture-analytics", (req, res) => {
  let ip = req.headers["x-forwarded-for"] || req.socket.remoteAddress || null;
  const isoDate = new Date();
  const mySQLDateString = isoDate.toJSON().slice(0, 19).replace("T", " ");
  const sql = "INSERT INTO analytics (data, user_ip, created_at) VALUES ?";
  const values = [[JSON.stringify(req.body), ip, mySQLDateString]];

  con.query(sql, [values], function (err, result) {
    try {
      if (err) throw err;

      res.status(HTTP_STATUS.OK);
      res.send({
        status: "Analytics data saved !!",
      });
    } catch (error) {
      res.status(HTTP_STATUS.SERVER_ERROR);
      res.send({
        status: `Request Failed Error ${err.message}`,
      });
    }
  });
});

app.listen(PORT, HOST, () => {
  console.log(`Running on http://${HOST}:${PORT}`);
});
