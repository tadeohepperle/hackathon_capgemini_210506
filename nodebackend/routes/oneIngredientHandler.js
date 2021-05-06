async function oneIngredientHandler(req, res) {
  console.log(req.body);
  res.json({ message: "ingredient" });
}

module.exports.oneIngredientHandler = oneIngredientHandler;
