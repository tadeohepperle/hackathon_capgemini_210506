const {
  getAllFoods,
  mapFoodNameToClosestFood,
  mapRecipeToEmissionsData,
} = require("../data/dataProcessing.js");

const {
  checkIfURLwasAlreadyCalled,
  readDataForURLFromFile,
  writeDataForURLToFile,
  readAllCachedFilesAndReturnContent,
} = require("../data/cacher.js");

const { 
  checkIfNewUser,
  readUserDataFromFile,
  writeUserDataToFile,
  readTopTen,
} = require("../data/userdata.js");

const { chefkochURLToData } = require("../data/chefkochscraper.js");

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
      let recipeAndEmissionsData = mapRecipeToEmissionsData(req.body);
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
  res.json(getAllFoods());
}

async function allCachedRecipes(req, res) {
  allCachedContent = await readAllCachedFilesAndReturnContent(req.body.limit);
  res.json(allCachedContent);
}

async function chefkochURLHandler(req, res) {
  if (
    req.body &&
    req.body.url &&
    req.body.url.search &&
    req.body.url.search("chefkoch") != -1
  ) {
    try {
      let chefkochurl = req.body.url;
      // check if already cached:
      urlAlreadyCached = await checkIfURLwasAlreadyCalled(chefkochurl);
      if (urlAlreadyCached) {
        data = await readDataForURLFromFile(chefkochurl);
        res.json({ ...data, cached: true });
      } else {
        // get data from chefkoch url:
        let recipeDataFromChefkoch = await chefkochURLToData(chefkochurl);
        if (
          recipeDataFromChefkoch.error ||
          !recipeDataFromChefkoch.recipe ||
          recipeDataFromChefkoch.recipe.length == 0
        ) {
          throw new Error("this cant be good.");
        } else {
          let recipeAndEmissionsData = mapRecipeToEmissionsData(
            recipeDataFromChefkoch
          );
          res.json(recipeAndEmissionsData); // here we return the recipedata with the emission score.
          await writeDataForURLToFile(chefkochurl, recipeAndEmissionsData);
        }
      }
    } catch (ex) {
      console.log(ex);
      res
        .status(400)
        .send("Please provide 'url' as field of POST-Request Body!");
    }
  } else {
    res.status(400).send("Please provide 'url' as field of POST-Request Body!");
  }
}
async function cookingHandler(req,res){
  res.status(500).send("Route not ready yet!");
}


module.exports.oneIngredientHandler = oneIngredientHandler;
module.exports.recipeHandler = recipeHandler;
module.exports.allIngredients = allIngredients;
module.exports.chefkochURLHandler = chefkochURLHandler;
module.exports.allCachedRecipes = allCachedRecipes;
module.exports.cookingHandler = cookingHandler;
