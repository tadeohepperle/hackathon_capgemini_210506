const { has } = require("cheerio/lib/api/traversing");
const fs = require("fs");

const hashCode = function (string) {
  var hash = 0;
  for (var i = 0; i < string.length; i++) {
    var character = string.charCodeAt(i);
    hash = (hash << 5) - hash + character;
    hash = hash & hash; // Convert to 32bit integer
  }
  return hash;
};

async function checkIfURLwasAlreadyCalled(url) {
  hashCodeForURL = hashCode(url);
  // scan dir if file exists:
  dirContent = await fs.promises.readdir("./cache");
  found = dirContent.find((el) => el == `${hashCodeForURL}.json`);
  if (found) {
    let file = fs.promises.readFile(`./cache/${hashCodeForURL}.json`, "utf8");
    recipeData = JSON.parse(file);
    console.log(recipeData);
  }
}
checkIfURLwasAlreadyCalled("ulrsfds");
