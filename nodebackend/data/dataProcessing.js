const fs = require("fs");
const foodData = JSON.parse(
  fs.readFileSync("./data/emissions_data_german.json")
);
const foodDataNames = foodData.map((el) => el.food_german);
const stringSimilarity = require("string-similarity");

function mapFoodNameToClosestFood(foodName) {
  let matches = stringSimilarity.findBestMatch(foodName, foodDataNames);
  let closestFoodName = matches.bestMatch.target;
  let food = foodData.find((el) => el.food_german == closestFoodName);
  return food;
}

function mapRecipeToEmissionsData(recipe) {
  // recipe is formatted like this:
  // recipe = [
  //   { amount: "3 TL", foodName: "Sonneblumenöl" },
  //   { amount: "100g", foodName: "Schokolade" },
  // ];

  let recipeWithAdditionalData = [];
  recipe.forEach((ingr) => {
    if (ingr.foodName && ingr.amount !== undefined) {
      let closestFood = mapFoodNameToClosestFood(ingr.foodName);
      let grams = convertAmountToGrams(ingr.amount, closestFood);
      let emissions_per_gram = parseFloat(closestFood.emissions_value);
      recipeWithAdditionalData.push({
        foodName: ingr.foodName,
        amount: ingr.amount,
        grams,
        emissions_per_gram,
      });
    }
  });
  let totalEmissions = 0;
  recipeWithAdditionalData.forEach((ingr) => {
    totalEmissions += ingr.grams * ingr.emissions_per_gram;
  });

  return {
    totalEmissions,
    recipe: recipeWithAdditionalData,
  };
}

function getAllFoods() {
  return foodData;
}

function convertAmountToGrams(amount, food) {
  // amount comes as a string i.e. "1 TL"
  let { serving_weight } = food;
  if (serving_weight == "0") serving_weight = 100;
  amount = amount.toLowerCase();
  amount = amount.replace("½", "0.5");
  amount = amount.replace("¼", "0.25");
  amount = amount.replace("¾", "0.75");
  amount = amount.replace("⅛", "0.125");
  const einheiten = [
    { symbol: "gramm", grams: 1 },
    { symbol: "gram", grams: 1 },
    { symbol: "oz", grams: 28.35 },
    { symbol: "etwas", grams: serving_weight / 3 },
    { symbol: "bisschen", grams: serving_weight / 4 },
    { symbol: "packung", grams: serving_weight },
    { symbol: "pck", grams: serving_weight },
    { symbol: "stange", grams: serving_weight },
    { symbol: "würfel", grams: serving_weight },
    { symbol: "kugel", grams: serving_weight },
    { symbol: "dose", grams: 400 },
    { symbol: "prise", grams: 0 },
    { symbol: "liter", grams: 1000 },
    { symbol: "flasche", grams: 500 },
    { symbol: "klein", grams: serving_weight / 2 },
    { symbol: "groß", grams: serving_weight * 2 },
    { symbol: "tasse", grams: 220 },
    { symbol: "n.b.", grams: 0 },
    { symbol: "zehe", grams: 5 },
    { symbol: "bund", grams: 50 },
    { symbol: "tl", grams: 5 },
    { symbol: "el", grams: 10 },
    { symbol: "kg", grams: 1000 },
    { symbol: "g", grams: 1 },
    { symbol: "ml", grams: 1 },
    { symbol: "l", grams: 1000 },
  ];

  let einheit = { symbol: "", grams: serving_weight };
  for (let i = 0; i < einheiten.length; i++) {
    if (amount.search(einheiten[i].symbol) != -1) {
      einheit = einheiten[i];
      break;
    }
  }
  let parsedValue = amount.length >= 1 ? parseFloat(amount) : 1; // falls gar nichts bei amount steht
  return parsedValue * einheit.grams;
}

module.exports.getAllFoods = getAllFoods;
module.exports.mapFoodNameToClosestFood = mapFoodNameToClosestFood;
module.exports.mapRecipeToEmissionsData = mapRecipeToEmissionsData;
