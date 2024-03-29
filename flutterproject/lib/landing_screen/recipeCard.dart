import 'package:flutter/material.dart';
import 'package:hackathon_capgemini_210506/dataService.dart';
import 'package:hackathon_capgemini_210506/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hackathon_capgemini_210506/data_screen/data_screen.dart';

class RecipeCard extends StatelessWidget {
  Recipe recipe;
  RecipeCard({this.recipe});

  @override
  Widget build(BuildContext context) {
    print(recipe.imageURL);

    void cardTapped() {
      Navigator.of(context, rootNavigator: true)
          .push(MaterialPageRoute(builder: (BuildContext c) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Settings'),
            ),
            body: DataScreen(recipe: recipe));
      }));
    }

    return GestureDetector(
        onTap: cardTapped,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            // padding: EdgeInsets.all(Constants.defaultPadding),
            child: Column(children: [
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  recipe.imageURL,
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                // margin: EdgeInsets.all(10),
              ),
              Container(
                  height: 200,
                  padding: EdgeInsets.symmetric(
                      vertical: Constants.defaultPadding / 2),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Constants.defaultPadding),
                            child: Text(recipe.title,
                                style: Constants.textStyleH2)),
                        Text('Rezept mit ${recipe.ingredients.length} Zutaten',
                            style: Constants.textStyleSmall),
                        RatingBarIndicator(
                          rating: recipe.rating,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 25.0,
                          unratedColor: Colors.amber.withAlpha(50),
                          direction: Axis.horizontal,
                        )
                      ]))
            ])));
  }
}
