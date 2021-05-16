import 'package:flutter/material.dart';
import 'package:hackathon_capgemini_210506/dataService.dart';
import 'package:hackathon_capgemini_210506/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hackathon_capgemini_210506/google_auth/widget/userData.dart';

class UserCard extends StatelessWidget {
  GoogleUser googleUser;
  UserCard({this.googleUser});

  @override
  Widget build(BuildContext context) {
    print(googleUser.imageURL);

    void cardTapped() {
      Navigator.of(context, rootNavigator: true)
          .push(MaterialPageRoute(builder: (BuildContext c) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Settings'),
            ),
            body: UserData(googleUser: googleUser));
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
            child: Row(children: [
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  googleUser.imageURL,
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                // margin: EdgeInsets.all(10),
              ),
              Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(
                      vertical: Constants.defaultPadding / 2),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Constants.defaultPadding),
                            child: Text(googleUser.username,
                                style: Constants.textStyleH2)),
                      ]))
            ])));
  }
}
