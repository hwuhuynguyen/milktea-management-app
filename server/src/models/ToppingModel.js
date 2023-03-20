const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const ToppingSchema = new Schema({
  name: {
    type: String,
  },
  price: {
    type: Schema.Types.Double,
  },
});
module.exports = mongoose.model("Topping", ToppingSchema);
