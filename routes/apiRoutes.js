//Run Api stuff
const express = require("express");
const mongoose = require("mongoose");

//User schema
const User = require("../schemas/User.model.js");
const objectId = require("mongodb").ObjectID;
const { authenticateToken, getToken } = require("../utils/authUtils");

const router = express.Router();

//Get user data
router.get("/users", getToken, authenticateToken, async (req, res) => {
  if (req.email != req.body.email) {
    res.status(401).json({ error: "Unauthorized" });
    return;
  }
  const user = await User.find({ email: req.query.email });
  console.log(user);
  res.json(user);
});

//Get sum of all user trash
router.get("/trash", async (req, res) => {
  // Get all users
  const users = await User.find({});
  // For each user get the total power and sum
  const leaderboard = users.map((user) => {
    return {
      email: user.email,
      power: user.power,
      trash: user.trash,
      tokens: user.tokens,
    };
  });

  //sum all the trash and return that
  let totalTrash = 0;
  leaderboard.forEach((user) => {
    totalTrash += user.trash;
  });
  req.body.trash = totalTrash;
  res.json(req.body);
});

//Update user data
router.post("/reward", async (req, res) => {
  const user = await User.findOne({ email: req.email });
  if (!user) {
    return res.status(404).json({ error: "User not found" });
  }
  user.tokens = req.body.reward;
  user.power = req.body.reward;
  user.trash = req.body.reward / 5;

  await user.save();
  console.log(user);
  res.json(user);
});

// Increase user tokens
router.post("/tokens", getToken, authenticateToken, async (req, res) => {
  try {
    var user = await User.findOne({ email: req.email });
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }
    user.tokens = req.tokens;
    await user.save();
    console.log(user);
    res.json(user);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal server error" });
  }
});

// Increase user power
router.post("/power", getToken, authenticateToken, async (req, res) => {
  try {
    var user = await User.findOne({ email: req.email });
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }
    user.power = req.query.power;
    await user.save();
    console.log(user);
    res.json(user);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal server error" });
  }
});

// Increase user trash
router.post("/trash", getToken, authenticateToken, async (req, res) => {
  try {
    var user = await User.findOne({ email: req.email });
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }
    user.trash = req.query.trash;
    await user.save();
    console.log(user);
    res.json(user);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal server error" });
  }
});

router.get("/world", async (req, res) => {
  // Get all users
  const users = await User.find({});
  // For each user get the total power and sum
  const leaderboard = users.map((user) => {
    return {
      email: user.email,
      power: user.power,
      trash: user.trash,
      tokens: user.tokens,
    };
  });

  // Sort the leaderboard by power
  leaderboard.sort((a, b) => b.trash - a.trash);

  // Return the leaderboard
  res.json(leaderboard);
});

module.exports = router;