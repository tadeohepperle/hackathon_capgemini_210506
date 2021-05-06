async function recipeHandler(req, res) {
  console.log(req.body);
  res.json({ message: "recipe" });
}

module.exports.recipeHandler = recipeHandler;
