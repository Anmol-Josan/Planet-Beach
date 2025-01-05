const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const leaderboard= new Schema({
  name: { type: String, required: true },
  users: { type: Array, default: [] },
});

module.exports = mongoose.model("Leaderboard", leaderboard);