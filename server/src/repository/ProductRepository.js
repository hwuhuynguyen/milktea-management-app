const ProductModel = require("../models/ProductModel");
const ProductRepository = {};

ProductRepository.save = async (payload) => {
  const Product = new ProductModel(payload);

  return await Product.save();
};

ProductRepository.getAllProduct = async () => {
  return await ProductModel.find();
};
ProductRepository.getNewestProduct = async () => {
  return await ProductModel.find().sort({ createdAt: -1 });
};

ProductRepository.getPopularProduct = async () => {
  return await ProductModel.find({ isPopular: true });
};
module.exports = ProductRepository; //cda
