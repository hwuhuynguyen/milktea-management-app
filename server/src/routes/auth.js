const express = require("express");
const router = express.Router();
const AuthController = require("../controllers/AuthController.js");

router.post("/login", async (req, res) => {
  AuthController.login(req, res);
});
router.post("/register", AuthController.newUser);

module.exports = router;
