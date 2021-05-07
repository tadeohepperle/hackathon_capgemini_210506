import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:hackathon_capgemini_210506/constants.dart';
import 'dart:convert';

class Recipe {
  Recipe(
      {this.title,
      this.imageURL,
      this.chefkochURL,
      this.ingredients,
      this.totalEmissions,
      this.rating,
      this.portions});

  static Recipe example = Recipe(
      title: "Paprika-Sahne-Hähnchen",
      imageURL:
          "https://img.chefkoch-cdn.de/rezepte/22771005725755/bilder/1061693/crop-600x400/paprika-sahne-haehnchen.jpg",
      chefkochURL:
          "https://www.chefkoch.de/rezepte/22771005725755/Paprika-Sahne-Haehnchen.html",
      ingredients: [
        Ingredient("1TL", "nutella", 12),
        Ingredient("1TL", "Milch", 12),
        Ingredient("1TL", "nutella", 12),
        Ingredient("1 L", "Eier", 12)
      ],
      totalEmissions: 4567.0,
      rating: 4.6,
      portions: 1);

  // Recipe.fromJSON(String json){
  //   return Recipe()
  // }
  String title = "";
  String imageURL = "";
  String chefkochURL = "";
  List<Ingredient> ingredients;
  double totalEmissions;
  double rating;
  int portions;
}

class Ingredient {
  Ingredient(this.amount, this.foodNameGiven, this.grams);
  String foodNameGiven;
  String foodNameGuessed;
  String amount;
  num grams;
}

Future<Recipe> getChefkochDataFromURL(String url) async {
  try {
    var backendURL = Uri.parse(Constants.backendURL + "/chefkochurl");

    http.Response response = await http.post(
      backendURL,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'url': url,
      }),
    );
    print(response.statusCode);
    var requestBody = jsonDecode(response.body);

    List<Ingredient> retrievedIngredients = [];
    requestBody["recipe"].forEach((el) {
      retrievedIngredients
          .add(Ingredient(el["amount"], el["foodNameGiven"], el["grams"]));
    });

    Recipe rettrievedRecipe = Recipe(
        title: requestBody["title"],
        chefkochURL: requestBody["url"],
        rating: double.parse(requestBody["rating"]),
        imageURL: requestBody["imageURL"],
        portions: int.parse(requestBody["portions"]),
        totalEmissions: requestBody["totalEmissions"],
        ingredients: retrievedIngredients);

    return rettrievedRecipe;
  } catch (exception) {
    return null;
  }

  // await Future.delayed(const Duration(seconds: 1), () => "1");
  // return new Recipe(
  //     title: "Rec Title",
  //     chefkochURL: url,
  //     imageURL:
  //         "https://img.chefkoch-cdn.de/rezepte/3033411456059781/bilder/1334968/crop-600x400/low-carb-bauerntopf.jpg");
}
