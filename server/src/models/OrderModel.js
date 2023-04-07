const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const OrderSchema = new Schema(
  {
    products: [
      {
        product: {
          type: Schema.Types.ObjectId,
          ref: "Product",
        },
        amount: {
          type: Number,
        },
      },
    ],
    amount: {
      type: Number,
    },
    price: {
      type: Number,
    },
  },
  { timestamps: true },
);

module.exports = mongoose.model("Order", OrderSchema);
