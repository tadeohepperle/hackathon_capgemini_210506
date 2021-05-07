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
  let hashCodeForURL = hashCode(url);
  console.log("check", url, hashCodeForURL);
  // scan dir if file exists:
  let dirContent = await fs.promises.readdir("./cache");
  let found = dirContent.find((el) => el == `${hashCodeForURL}.json`);
  return found;
}

function shuffle(a) {
  var j, x, i;
  for (i = a.length - 1; i > 0; i--) {
    j = Math.floor(Math.random() * (i + 1));
    x = a[i];
    a[i] = a[j];
    a[j] = x;
  }
  return a;
}

async function readAllCachedFilesAndReturnContent(limit) {
  let dirContent = await fs.promises.readdir("./cache");
  dirContent = shuffle(dirContent);

  let allRecipes = [];
  for (let i = 0; i < dirContent.length; i++) {
    let file = await fs.promises.readFile(`./cache/${dirContent[i]}`, "utf8");
    let recipeData = JSON.parse(file);
    allRecipes.push(recipeData);
    if (limit && limit < i) break;
  }
  return allRecipes;
}

async function readDataForURLFromFile(url) {
  let hashCodeForURL = hashCode(url);
  console.log("read", url, hashCodeForURL);
  let file = await fs.promises.readFile(
    `./cache/${hashCodeForURL}.json`,
    "utf8"
  );
  let recipeData = JSON.parse(file);
  return recipeData;
}

async function writeDataForURLToFile(url, data) {
  let hashCodeForURL = hashCode(url);
  console.log("write", url, hashCodeForURL);
  await fs.promises.writeFile(
    `./cache/${hashCodeForURL}.json`,
    JSON.stringify(data),
    "utf8"
  );
}

module.exports.checkIfURLwasAlreadyCalled = checkIfURLwasAlreadyCalled;
module.exports.readDataForURLFromFile = readDataForURLFromFile;
module.exports.writeDataForURLToFile = writeDataForURLToFile;
module.exports.readAllCachedFilesAndReturnContent = readAllCachedFilesAndReturnContent;
