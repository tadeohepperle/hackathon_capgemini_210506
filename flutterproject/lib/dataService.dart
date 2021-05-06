import 'dart:async';

class Recipe {
  Recipe(
      {this.title,
      this.imageURL,
      this.chefkochURL,
      this.ingredients,
      this.rating});

  static Recipe example = Recipe(
      title: "Paprika-Sahne-Hähnchen",
      imageURL:
          "https://img.chefkoch-cdn.de/rezepte/22771005725755/bilder/1061693/crop-600x400/paprika-sahne-haehnchen.jpg",
      chefkochURL:
          "https://www.chefkoch.de/rezepte/22771005725755/Paprika-Sahne-Haehnchen.html",
      ingredients: [
        Ingredient("1TL", "nutella"),
        Ingredient("1TL", "Milch"),
        Ingredient("1TL", "nutella"),
        Ingredient("1 L", "Eier")
      ],
      rating: 4.6);
  // Recipe.fromJSON(String json){
  //   return Recipe()
  // }
  String title = "";
  String imageURL = "";
  String chefkochURL = "";
  List<Ingredient> ingredients;
  double rating = 0;
}

class Ingredient {
  Ingredient(this.amount, this.foodNameGiven);
  String foodNameGiven;
  String foodNameGuessed;
  String amount;
  double grams;
}

Future<Recipe> getChefkochDataFromURL(String url) async {
  // API Call

  //
  await Future.delayed(const Duration(seconds: 1), () => "1");
  return new Recipe(
      title: "Rec Title",
      chefkochURL: url,
      imageURL:
          "https://img.chefkoch-cdn.de/rezepte/3033411456059781/bilder/1334968/crop-600x400/low-carb-bauerntopf.jpg");
}
