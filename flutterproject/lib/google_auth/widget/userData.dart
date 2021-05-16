import 'package:flutter/rendering.dart';
import 'package:hackathon_capgemini_210506/constants.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_capgemini_210506/dataService.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UserData extends StatefulWidget {
  final GoogleUser googleUser;
  UserData({Key key, this.googleUser}) : super(key: key);

  @override
  _UserDataState createState() => _UserDataState(googleUser: googleUser);
}

class _UserDataState extends State<UserData> {
  GoogleUser googleUser;
  _UserDataState({this.googleUser});

  void _launchURL(String url) async {
    if (await canLaunch(url) || true) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  build(BuildContext context) {
    print(googleUser.username);
    return ListView(
        padding: EdgeInsets.all(Constants.defaultPadding),
        children: [
          Text('Stats',
              style: TextStyle(fontSize: 20, color: Colors.green[400])),
          Container(
            padding: EdgeInsets.only(top: Constants.defaultPadding / 2),
            alignment: Alignment.center,
          ),
          Container(
            child: Stats(
                mealsAmount: googleUser.mealsAmount,
                averageEmissions: googleUser.averageEmissions,
                totalEmissions: googleUser.totalEmissions),
          )
        ]);
  }
}

class Stats extends StatelessWidget {
  num mealsAmount;
  num averageEmissions;
  num totalEmissions;

  Stats({this.mealsAmount, this.averageEmissions, this.totalEmissions});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: Constants.defaultPadding),
        child: DataTable(columns: <DataColumn>[
          DataColumn(
            label: Text(
              'Menge',
              style: Constants.textStyleNormal,
            ),
          ),
          DataColumn(
              label: Text(
            'Zutat',
            style: Constants.textStyleNormal,
          ))
        ], rows: <DataRow>[
          DataRow(cells: <DataCell>[
            DataCell(Text('mealsCooked')),
            DataCell(Text(this.mealsAmount.toString()))
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('totalEmissions')),
            DataCell(Text(this.totalEmissions.toString()))
          ]),
        ]));
  }
}

class GaugeStack extends StatelessWidget {
  double _value;
  String _url;
  GaugeStack(this._value, this._url);

  build(BuildContext context) {
    return Stack(children: [ProfilePicture(_url)]);
  }
}

class ProfilePicture extends StatelessWidget {
  String _url;
  ProfilePicture(String url) {
    this._url = url;
  }
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(),
        padding: new EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .40, right: 0, left: 0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: NetworkImage(_url),
              fit: BoxFit.fill,
            )));
  }
}
