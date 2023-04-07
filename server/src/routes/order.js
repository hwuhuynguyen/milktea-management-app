const express = require("express");
const OrderController = require("../controllers/OrderController.js");
const router = express.Router();

router.post("/", async (req, res) => {
  OrderController.save(req, res);
});

router.get("/", async (req, res) => {
  OrderController.getAllOrders(req, res);
});

router.get("/detail", async (req, res) => {
  OrderController.getById(req, res);
});

module.exports = router;
