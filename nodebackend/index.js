const express = require("express");
const cors = require("cors");
const app = express();
const PORT = 3333;
app.use(cors());
app.use(express.json());
const {
  oneIngredientHandler,
  recipeHandler,
  allIngredients,
  chefkochURLHandler,
} = require("./routes/routes.js");

app.get("/", (req, res) => {
  res.send("Hello World!"); // never happens
});

app.get("/capgemini", (req, res) => {
  res.send("Hello World! Capgem");
});

app.post("/capgemini/ingredient", oneIngredientHandler);
app.post("/capgemini/recipe", recipeHandler);
app.post("/capgemini/allingredients", allIngredients);
app.post("/capgemini/chefkochurl", chefkochURLHandler);

app.listen(PORT, () => {
  console.log(`Example app listening at http://localhost:${PORT}`);
});
