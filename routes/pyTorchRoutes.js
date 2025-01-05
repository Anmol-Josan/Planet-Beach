//Run Api stuff
const express = require("express");
const mongoose = require("mongoose");

//User schema
const objectId = require("mongodb").ObjectID;
const { authenticateToken, getToken } = require("../utils/authUtils");

const router = express.Router();

router.get("/analysis", async (req, res) => {
  res.send("Hello from PyTorch");
});

module.exports = router;