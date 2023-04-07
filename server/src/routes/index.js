const express = require("express");
const router = express.Router();
const product = require("./product");
const order = require("./order");
const auth = require("./auth");

router.use("/product", product);
router.use("/order", order);
router.use("/auth", auth);

module.exports = router;
