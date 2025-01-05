const express = require("express");
const { v4: uuidv4 } = require("uuid");
const fs = require("fs");
const User = require("../schemas/User.model");
const jwt = require("jsonwebtoken");

const router = express.Router();
const {
  ensureNoToken,
  authenticateToken,
  getToken,
  comparePassword,
  comparePasswordHash,
  hashPassword,
  generateAccessToken,
  sendVerificationCode,
    checkIfTokenIsValid,
} = require("../utils/authUtils");

router.post("/signin", async (req, res) => {
    const { email, password } = req.body;

    if (!email || !password) {
        res.status(400).send("Please fill in all fields");
        return;
    }

    let user;
    try {
        user = await User.findOne({ email });
    } catch (err) {
        console.error("Error finding user with email: " + err);
        res.status(500).send("Internal server error, please try again");
        return;
    }

    if (!user) {
        res.status(401).send("Invalid email or password");
        return;
    }

    const validPassword = await comparePassword(password, user.email);

    if (!validPassword) {
        res.status(401).send("Invalid email or password");
        return;
    }

    const accessToken = generateAccessToken({ email });
    res.json({accessToken: accessToken});
});

router.post('/signup', async (req, res) => {
    const { email, password } = req.body;

    if (!email || !password) {
        res.redirect("/signup?err=Please fill in all fields");
        return;
    }

    let userCheckIfExist;
    try {
        userCheckIfExist = await User.findOne({
            email,
        });
    } catch (err) {
        console.error("Error finding user with email to check if email exists: " + err);
        res.status(500).send("Internal server error, please try again");
        return;
    }

    if (userCheckIfExist) {
        res.redirect("/signup?err=Email already exists");
        return;
    }

    const newUser = new User({
        email,
        password: hashPassword(password),
        nickname: email
    });

    newUser.save().catch((err) => {
        console.error("Error creating user: " + err);
        res.status(500).send("Internal server error, please try again");
        return;
    })

    const accessToken = generateAccessToken({ email });
    res.json({accessToken: accessToken});
})

router.post('/validate', (req, res) => {
    valid = checkIfTokenIsValid(req.body.accessToken);
    console.log(valid);
    // Make valid a string
    valid = valid.toString();
    res.json({isValid: valid});
});

module.exports = router;