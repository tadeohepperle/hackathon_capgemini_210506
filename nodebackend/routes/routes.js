const {
  getAllFoods,
  mapFoodNameToClosestFood,
} = require("../data/dataProcessing.js");

async function oneIngredientHandler(req, res) {
  if (!req.body || !req.body.foodName) {
    res
      .status(400)
      .send("Please provide 'foodName' as field of POST-Request Body!");
  } else {
    let foodName = req.body.foodName;
    let food = mapFoodNameToClosestFood(foodName);
    console.log(foodName);
    console.log(food);
    res.json(food);
  }
}

async function recipeHandler(req, res) {
  res.json({ message: "recipe" });
}

async function allIngredients(req, res) {
  console.log(req.body);
  res.json(getAllFoods());
}

module.exports.oneIngredientHandler = oneIngredientHandler;
module.exports.recipeHandler = recipeHandler;
module.exports.allIngredients = allIngredients;
