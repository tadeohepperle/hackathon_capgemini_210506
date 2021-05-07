import 'package:hackathon_capgemini_210506/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:hackathon_capgemini_210506/dataService.dart';

class DataScreen extends StatefulWidget {
  final Recipe recipe;
  DataScreen({Key key, this.recipe}) : super(key: key);

  @override
  _DataScreenState createState() => _DataScreenState(recipe: recipe);
}

class _DataScreenState extends State<DataScreen> {
  Recipe recipe;
  _DataScreenState({this.recipe});

  @override
  build(BuildContext context) {
    print(recipe.totalEmissions);
    return ListView(
        padding: EdgeInsets.all(Constants.defaultPadding),
        children: [
          Text('CO2 Äuquivalent für: ',
              style: TextStyle(fontSize: 20, color: Colors.green[400])),
          Container(
            padding: EdgeInsets.only(top: Constants.defaultPadding / 2),
            // decoration: Constants.boxDecoration,
            child: Center(
                child: Text('${recipe.title}', style: Constants.textStyleH1)),
          ),
          GaugeStack(recipe.totalEmissions, recipe.imageURL),
          Container(
              height: 100,
              padding: EdgeInsets.all(Constants.defaultPadding),
              // decoration: Constants.boxDecoration,
              child: Center(
                child: Text(
                    recipe.portions > 1
                        ? 'Rezept für ${recipe.portions} Portionen'
                        : 'Rezept für ${recipe.portions} Portion',
                    style: Constants.textStyleH2,
                    textAlign: TextAlign.center),
              )),
          IngredientsTable(ingredients: recipe.ingredients),
        ]);
  }
}

class IngredientsTable extends StatelessWidget {
  List<Ingredient> ingredients;
  IngredientsTable({this.ingredients});

  @override
  Widget build(BuildContext context) {
    ingredients.forEach((element) {
      print({element.amount, element.foodNameGiven});
    });
    return Container(
        child: DataTable(
      columns: <DataColumn>[
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
      ],
      rows: ingredients
          .map((ingr) => DataRow(
                cells: <DataCell>[
                  DataCell(Text(ingr.amount,
                      style: TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic))),
                  DataCell(Text(
                    ingr.foodNameGiven,
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  )),
                ],
              ))
          .toList(),
    ));
  }
}

class GaugeStack extends StatelessWidget {
  double _value;
  String _url;
  GaugeStack(double value, String url) {
    this._value = value;
    this._url = url;
  }

  build(BuildContext context) {
    return Stack(children: [Gauge(_value), MealImage(_url)]);
  }
}

class Gauge extends StatelessWidget {
  double _value;
  Gauge(double value) {
    this._value = value;
  }
  build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * .50,
        child: SfRadialGauge(
            enableLoadingAnimation: true,
            animationDuration: 1000,
            axes: <RadialAxis>[
              RadialAxis(
                  minimum: 0,
                  maximum: 12000,
                  startAngle: 180,
                  endAngle: 360,
                  showLabels: false,
                  showTicks: false,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.3,
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        widget: Container(
                            child: Text(
                                '${_value.toInt().toString()} g CO2 / Portion',
                                style: Constants.textStyleH2)),
                        angle: 90,
                        positionFactor: 0.5)
                  ],
                  pointers: <GaugePointer>[
                    NeedlePointer(
                        value: _value,
                        enableAnimation: true,
                        animationType: AnimationType.bounceOut),
                  ],
                  ranges: <GaugeRange>[
                    GaugeRange(
                        startValue: 0,
                        endValue: 2000,
                        color: Colors.green,
                        sizeUnit: GaugeSizeUnit.factor,
                        startWidth: 0.3,
                        endWidth: 0.3),
                    GaugeRange(
                        startValue: 2000,
                        endValue: 4000,
                        color: Colors.orange,
                        sizeUnit: GaugeSizeUnit.factor,
                        startWidth: 0.3,
                        endWidth: 0.3),
                    GaugeRange(
                        startValue: 4000,
                        endValue: 6000,
                        color: Colors.red,
                        sizeUnit: GaugeSizeUnit.factor,
                        startWidth: 0.3,
                        endWidth: 0.3),
                    GaugeRange(
                        startValue: 6000,
                        endValue: 8000,
                        color: Colors.red,
                        sizeUnit: GaugeSizeUnit.factor,
                        startWidth: 0.3,
                        endWidth: 0.3),
                    GaugeRange(
                        startValue: 8000,
                        endValue: 10000,
                        color: Colors.red,
                        sizeUnit: GaugeSizeUnit.factor,
                        startWidth: 0.3,
                        endWidth: 0.3),
                    GaugeRange(
                        startValue: 10000,
                        endValue: 12000,
                        color: Colors.red,
                        sizeUnit: GaugeSizeUnit.factor,
                        startWidth: 0.3,
                        endWidth: 0.3),
                  ])
            ]));
  }
}

class MealImage extends StatelessWidget {
  String _url;
  MealImage(String url) {
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
