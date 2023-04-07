const OrderModel = require("../models/OrderModel");

const OrderController = {};
OrderController.save = async (req, res) => {
  const order = new OrderModel(req.body);
  await order.save();
  res.status(200).send(
    JSON.stringify({
      data: order,
      notice: "Create Success!",
    }),
  );
};
OrderController.getAllOrders = async (req, res) => {
  const orders = await OrderModel.find();

  res.status(200).send({
    orders: orders,
  });
};

OrderController.getById = async (req, res) => {
  await OrderModel.findById(req.query.id)
    .populate("products.product")
    .exec(function (err, order) {
      if (err) throw err;
      res.status(200).send({
        order: order,
      });
      // Lấy tên sản phẩm đầu tiên
    });
};
module.exports = OrderController;
