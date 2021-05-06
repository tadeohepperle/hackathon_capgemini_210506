const {
  getAllFoods,
  mapFoodNameToClosestFood,
  mapRecipeToEmissionsData,
} = require("../data/dataProcessing.js");

async function oneIngredientHandler(req, res) {
  if (!req.body || !req.body.foodName) {
    res
      .status(400)
      .send("Please provide 'foodName' as field of POST-Request Body!");
  } else {
    try {
      let foodName = req.body.foodName;
      let food = mapFoodNameToClosestFood(foodName);
      res.json(food);
    } catch (ex) {
      res
        .status(400)
        .send("Please provide 'foodName' as field of POST-Request Body!");
    }
  }
}

async function recipeHandler(req, res) {
  if (
    req.body &&
    req.body.recipe &&
    Array.isArray(req.body.recipe) &&
    req.body.recipe.length > 0 &&
    req.body.recipe[0].amount !== undefined &&
    req.body.recipe[0].foodName !== undefined
  ) {
    try {
      let recipeAndEmissionsData = mapRecipeToEmissionsData(req.body.recipe);
      res.json(recipeAndEmissionsData);
    } catch (ex) {
      res
        .status(400)
        .send(
          "Please provide 'recipe' as field of POST-Request Body! It should contain objects with 'amount' and 'foodName' fields."
        );
    }
  } else {
    res
      .status(400)
      .send(
        "Please provide 'recipe' as field of POST-Request Body! It should contain objects with 'amount' and 'foodName' fields."
      );
  }
}

async function allIngredients(req, res) {
  console.log(req.body);
  res.json(getAllFoods());
}

module.exports.oneIngredientHandler = oneIngredientHandler;
module.exports.recipeHandler = recipeHandler;
module.exports.allIngredients = allIngredients;
