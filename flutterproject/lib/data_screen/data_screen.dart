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
    recipe = Recipe.example;
    // List<Ingredient> ingredients = [
    //   Ingredient("1TL", "nutella"),
    //   Ingredient("1TL", "nutella"),
    //   Ingredient("1TL", "nutella"),
    //   Ingredient("1 L", "Eier")
    // ];
    // if (recipe == null)
    //   return Container(child: Text("Recipe is null"));
    // else
    return ListView(children: [
      GaugeStack(6000),
      IngredientsTable(ingredients: recipe.ingredients),
    ]);
  }
}

class IngredientsTable extends StatelessWidget {
  List<Ingredient> ingredients;
  IngredientsTable({this.ingredients});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Menge',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
            label: Text(
          'Zutat',
          style: TextStyle(fontStyle: FontStyle.italic),
        ))
      ],
      rows: ingredients
          .map((ingr) => DataRow(
                cells: <DataCell>[
                  DataCell(Text(ingr.amount)),
                  DataCell(Text(ingr.foodNameGiven)),
                ],
              ))
          .toList(),
    ));
  }
}

class GaugeStack extends StatelessWidget {
  double _value;
  GaugeStack(double value) {
    this._value = value;
  }

  build(BuildContext context) {
    return Stack(children: [
      Container(
          height: MediaQuery.of(context).size.height * .50,
          padding: const EdgeInsets.only(top: 20.0),
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
                              child: Text(_value.toString(),
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold))),
                          angle: 90,
                          positionFactor: 0.5)
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(
                          value: _value,
                          enableAnimation: true,
                          //  needleStartWidth: 0,
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
              ])),
      MealImage(),
    ]);
  }
}

class MealImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      padding: new EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .40, right: 30, left: 30),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
              image: NetworkImage(
                  'https://img.chefkoch-cdn.de/rezepte/889601194503872/bilder/1080832/crop-600x400/knusprig-duenne-pizza-mit-chorizo-und-mozzarella.jpg'))),
    );
  }
}
