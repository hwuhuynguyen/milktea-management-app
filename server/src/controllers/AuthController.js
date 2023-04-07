const UserModel = require("../models/UserModel");

const AuthController = {};

AuthController.login = async (req, res) => {
  try {
    const { email, password } = req.body;
    console.log("====================================");
    console.log("test");
    console.log("====================================");
    const user = await UserModel.findOne({ email });

    if (!user) throw new Error("User not found");

    const isMatch = password == user.password;
    if (!isMatch) throw new Error("Invalid credentials");

    res.status(200).send({
      user: {
        _id: user._id,
        name: user.name,
        email: user.email,
      },
    });
  } catch (error) {
    res.status(400).send(error);
  }
};
AuthController.newUser = async (req, res) => {
  console.log(req.body);
  const user = new UserModel(req.body);
  await user.save();
  res.status(200).send(
    JSON.stringify({
      data: user,
      notice: "Create Success",
    }),
  );
};
module.exports = AuthController;
