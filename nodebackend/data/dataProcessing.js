const fs = require("fs");
const foodData = JSON.parse(
  fs.readFileSync("./data/emissions_data_german.json")
);
const stringSimilarity = require("string-similarity");

function mapFoodNameToClosestFood(foodName) {}

function getAllFoods() {
  return foodData;
}

module.exports.getAllFoods = getAllFoods;
module.exports.mapFoodNameToClosestFood = mapFoodNameToClosestFood;
