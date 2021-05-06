import 'dart:async';

class Recipe {
  Recipe(
      {this.title,
      this.imageURL,
      this.chefkochURL,
      this.ingredients,
      this.bewertung});
  // Recipe.fromJSON(String json){
  //   return Recipe()
  // }
  String title = "Title";
  String imageURL = "";
  String chefkochURL = "";
  List<Ingredient> ingredients;
  double bewertung = 0;
}

class Ingredient {
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
