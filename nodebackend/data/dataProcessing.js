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

function getAllFoods() {
  return foodData;
}

module.exports.getAllFoods = getAllFoods;
module.exports.mapFoodNameToClosestFood = mapFoodNameToClosestFood;
