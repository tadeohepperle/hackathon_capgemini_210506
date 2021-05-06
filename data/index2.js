const fs = require("fs");

file = fs.readFileSync("./emissions_data.json");
foodData = JSON.parse(file);

console.log(foodData);

let uebersetzungen = fs.readFileSync("./ubersetzungen.txt", "utf8");

let u = uebersetzungen.split("\r\n");
console.log(u);

for (let i = 0; i < foodData.length; i++) {
  foodData[i].food_german = u[i];
  foodData[i].synonyms = "";
}

fs.writeFileSync("./emissions_data_german.json", JSON.stringify(foodData));
