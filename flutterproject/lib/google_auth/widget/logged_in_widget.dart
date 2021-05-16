import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_capgemini_210506/google_auth/provider/google_sign_in.dart';
import 'package:hackathon_capgemini_210506/google_auth/widget/userCard.dart';
import 'package:provider/provider.dart';
import 'package:hackathon_capgemini_210506/constants.dart';
import 'package:hackathon_capgemini_210506/dataService.dart';

class LoggedInWidget extends StatefulWidget {
  @override
  LoggedInWidget({Key key}) : super(key: key);

  @override
  _LoggedInWidget createState() => _LoggedInWidget();
}

class _LoggedInWidget extends State<LoggedInWidget> {
  List<GoogleUser> users = null;

  void initialisation() async {
    var result = await getLeaderboard(10);
    setState(() {
      users = result;
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
      users = null;
    });
    var result = await getLeaderboard(10);
    setState(() {
      users = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (users == null) {
      child = Center(
          child: Container(
              margin: EdgeInsets.only(top: Constants.defaultPadding * 2),
              width: 100,
              child: AspectRatio(
                  aspectRatio: 1,
                  child: CircularProgressIndicator(
                    strokeWidth: 20,
                    //color: Constants.primaryColor,
                  ))));
    } else {
      child = ListView(
          children: users
              .map((user) => Container(
                  padding: EdgeInsets.only(top: Constants.defaultPadding),
                  child: UserCard(
                    googleUser: user,
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
