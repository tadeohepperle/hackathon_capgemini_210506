const express = require("express");
const app = express();
const PORT = 3333;
app.use(cors());
app.use(express.json());
const { oneIngredientHandler } = require("./routes/oneIngredientHandler.js");
const { recipeHandler } = require("./routes/recipeHandler.js");

app.get("/", (req, res) => {
  res.send("Hello World!"); // never happens
});

app.get("/capgemini", (req, res) => {
  res.send("Hello World! Capgem");
});

app.post("/capgemini/ingredient", oneIngredientHandler);
app.post("/capgemini/recipe", recipeHandler);

app.listen(PORT, () => {
  console.log(`Example app listening at http://localhost:${PORT}`);
});
