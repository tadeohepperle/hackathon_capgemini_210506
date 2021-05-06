const fs = require("fs");

file = fs.readFileSync("./emissions_data_german.json");
const stringSimilarity = require("string-similarity");
foodData = JSON.parse(file);

// console.log(matches);

function getResultsForFood(food_name) {
  var matches = stringSimilarity.findBestMatch(
    food_name,
    foodData.map((el) => el.food_german)
  );
  let { ratings } = matches;
  let sorted_ratings = ratings.sort((a, b) => b.rating - a.rating);
  let result = sorted_ratings.filter((el, i) => i < 3);
  console.log(`Wort: ${food_name}`);
  console.log(result);
  console.log("----------------------------------");
}

[
  "Fleisch",
  "Käse, gerieben",
  "Chilipulver",
  "Gemüsebrühepulver",
  "Kräuterfrischkäse, ca. 100 g",
  "Zwiebel(n)",
  "Blattspinat, TK, mit Rahm",
  "süße Sahne",
].forEach((el) => getResultsForFood(el));
