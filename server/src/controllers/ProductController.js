const ProductRepository = require("../repository/ProductRepository");

const ProductController = {};
ProductController.save = async (req, res) => {
  const product = await ProductRepository.save(req.body);
  res.status(200).send(
    JSON.stringify({
      data: product,
      notice: "Create Success!",
    }),
  );
};

ProductController.getAllProduct = async (req, res) => {
  const product = await ProductRepository.getAllProduct();
  const productNewest = await ProductRepository.getNewestProduct();
  const productPopular = await ProductRepository.getPopularProduct();
  res.status(200).send({
    data: {
      product: product,
      productNewest: productNewest,
      productPopular: productPopular,
    },
  });
};

module.exports = ProductController;
