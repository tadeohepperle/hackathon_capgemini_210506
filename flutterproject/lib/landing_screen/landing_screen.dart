import 'package:hackathon_capgemini_210506/constants.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

//Das erste ist immer der Parametername

//Column gibt Widget zurück

class _LandingScreenState extends State<LandingScreen> {
  @override
  build(BuildContext context) {
    return Container(
        color: Constants.backgroundColor,
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 50,
              color: Constants.primaryColor,
              child: const Center(child: Text('Sag uns was du essen willst!')),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
            ),
            TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Link',
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
            ),
            FlatButton(
              focusColor: Colors.red,
              color: Constants.primaryColor,
              hoverColor: Colors.green,
              splashColor: Colors.white,
              onPressed: () {
                //Create new site with spinner!
              },
              child: Text('Los!'),
            ),
            /*Container(
                child: Image(
                    image: NetworkImage(
                        'https://media.giphy.com/media/3oEjI6SIIHBdRxXI40/giphy.gif'))), */
          ],
        ));
  }
}
