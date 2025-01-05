const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const userSchema = new Schema({
  nickname: { type: String, required: true },
  email: { type: String, required: true },
  cell: { type: String, default: "none" },
  power: { type: Number, default: 0 },
  tokens: { type: Number, default: 0 },
  trash: { type: Number, default: 0 },
  password: { type: String, required: true}
});

module.exports = mongoose.model("User", userSchema);