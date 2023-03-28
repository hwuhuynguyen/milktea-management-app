const express = require("express");
const router = express.Router();
const ProductController = require("../controllers/ProductController.js");

router.get("/", async (req, res) => {
  ProductController.getAllProduct(req, res);
}); //cda

router.post("/", async (req, res) => {
  ProductController.save(req, res);
});

module.exports = router;
