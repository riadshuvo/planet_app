import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _weightController = new TextEditingController();

  int radiodValue = 0;
  double _finalWeight = 0.0;
  String formatText = '';

  void handleRadioValueChanged(int value){
    setState(() {
      radiodValue = value;
      switch(radiodValue){
        case 0:
          _finalWeight = calculateWeight(_weightController.text, 0.06); //weight in pluto
          formatText = "your weight on Pluto is ${_finalWeight.toStringAsFixed(1)}";
          break;

        case 1:
          _finalWeight = calculateWeight(_weightController.text, 0.38); //weight in Marse
          formatText = "your weight on Marse is ${_finalWeight.toStringAsFixed(1)}";

          break;

        case 2:
          _finalWeight = calculateWeight(_weightController.text, 0.91); //weight in Venus
          formatText = "your weight on Venus is ${_finalWeight.toStringAsFixed(1)}";

          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight on Planate X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,

      body: new Container(
        alignment: Alignment.bottomCenter,
        child: new ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[

            new Image.asset('images/planet.png',
            height: 133.0,
                width: 200.0,),

            new Container(
              padding: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[

                  new TextField(
                    controller: _weightController   ,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Your Weight on Earth",
                      hintText: "In pounds",
                      icon: Icon(Icons.person_outline)
                    ),
                  ),

                  new Padding(padding: new EdgeInsets.all(5.0)),

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      new Radio<int>(
                        activeColor: Colors.brown,
                          value: 0, groupValue: radiodValue, onChanged: handleRadioValueChanged),
                      
                      new Text("Pluto",
                      style: new TextStyle(color: Colors.white30),),

                      new Radio<int>(
                          activeColor: Colors.red,
                          value: 1, groupValue: radiodValue, onChanged: handleRadioValueChanged),

                      new Text("Marse",
                        style: new TextStyle(color: Colors.white30),),

                      new Radio<int>(
                          activeColor: Colors.orange,
                          value: 2, groupValue: radiodValue, onChanged: handleRadioValueChanged),

                      new Text("Venus",
                        style: new TextStyle(color: Colors.white30),),
                    ],
                  ),

                  new Padding(padding: new EdgeInsets.all(10.0)),

                  new Text( _weightController.text.isEmpty ? "please enter your weight" : formatText +' lbs',
                    style: new TextStyle(color: Colors.white, fontSize: 15.0),),

                ],
              ),
            )


          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {

    if(int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0){
      return int.parse(weight) * multiplier;
    }else{
      print("Wrong!");

      return int.parse('180') * 0.38;
    }

  }
}
