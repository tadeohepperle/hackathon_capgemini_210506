const { getAllFoods } = require("../data/dataProcessing.js");

async function oneIngredientHandler(req, res) {
  console.log(req.body);
  res.json({ message: "ingredient" });
}

async function recipeHandler(req, res) {
  let foodName = req.body.foodName;
  let food = mapFoodNameToClosestFood(foodName);
  res.json(food);
}

async function allIngredients(req, res) {
  console.log(req.body);
  res.json(getAllFoods());
}

module.exports.oneIngredientHandler = oneIngredientHandler;
module.exports.recipeHandler = recipeHandler;
module.exports.allIngredients = allIngredients;
