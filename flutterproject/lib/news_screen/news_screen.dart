import 'package:flutter/material.dart';
import 'package:hackathon_capgemini_210506/dataService.dart';
import 'package:hackathon_capgemini_210506/constants.dart';
import 'package:hackathon_capgemini_210506/landing_screen/recipeCard.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({Key key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<Recipe> recipes = null;

  void initialisation() async {
    var result = await getCachedChefkochDataFromURL(10);
    setState(() {
      recipes = result;
    });
  }

  @override
  void initState() {
    print("hallo");
    super.initState();
    initialisation();
  }

  void onReloadPress() async {
    setState(() {
      recipes = null;
    });
    var result = await getCachedChefkochDataFromURL(10);
    setState(() {
      recipes = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (recipes == null) {
      child = Center(
          child: Container(
              margin: EdgeInsets.only(top: Constants.defaultPadding * 2),
              width: 100,
              child: AspectRatio(
                  aspectRatio: 1,
                  child: CircularProgressIndicator(
                    strokeWidth: 20,
                    color: Constants.primaryColor,
                  ))));
    } else {
      child = ListView(
          children: recipes
              .map((recipe) => Container(
                  padding: EdgeInsets.only(top: Constants.defaultPadding),
                  child: RecipeCard(
                    recipe: recipe,
                  )))
              .toList());
    }
    return Stack(
      children: [
        child,
        Positioned(
            bottom: 30,
            right: 20,
            child: FloatingActionButton(
                onPressed: onReloadPress, child: Icon(Icons.refresh)))
      ],
    );
  }
}
