import 'package:flutter/material.dart';

import '../AbstractPage.dart';

class GradePredict extends AbstractPage {
  GradePredict({Key key})
      : super(
          key: key,
          appBarTitle: 'Grade Prediction',
          navIcon: Icons.equalizer,
        );

  _GradePredictState createState() => _GradePredictState();
}

class _GradePredictState extends PageState<GradePredict> {
  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(15),
          height: 50,
          width: MediaQuery.of(context).size.width,
          color: Colors.lightBlue[50],
        ),
        Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.only(left: 30,bottom: 20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.lightBlue[50],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.0,),
                Text("NCO-04-02:",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue[600]
                    )
                ),
                SizedBox(height: 5.0,),
                Text("Artificial Intelligence",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue[600],
                        fontWeight: FontWeight.bold
                    )
                ),
                SizedBox(height: 2.0,),
                Text("Ioannis Vlahavas, Dimitris Vrakas",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.blue[600]
                    )
                ),
                SizedBox(height: 20.0,),
                Text("Grade Prediction: 9.5",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.blue[600]
                    )
                ),
                SizedBox(height: 5.0,),
                Text("Difficulty: HARD",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.blue[600]
                    )
                ),
                SizedBox(height: 20.0,),
                Text("This grade is above 69%(nice) of all students!",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.blue[600]
                    )
                )
              ],
            )
        ),
        SizedBox(height: 20.0,),
        Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Text("Grade Destribution",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue[600],
                  fontWeight: FontWeight.bold
              )
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Text("Based on 420 students so far",
            style: TextStyle(
                fontSize: 14,
                color: Colors.blue[600]
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 30.0,right: 30.0,top: 40),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  width: 10,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 1),
                      colors: [ Colors.blue, Colors.lightBlue[50],], // whitish to gray
                      tileMode: TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.all(1.0),
                  width: 10,
                  height: 70,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 1),
                      colors: [ Colors.blue, Colors.lightBlue[50],], // whitish to gray
                      tileMode: TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.all(1.0),
                  width: 10,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 1),
                      colors: [ Colors.blue, Colors.lightBlue[50],], // whitish to gray
                      tileMode: TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(1.0),
                  width: 10,
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 1),
                      colors: [ Colors.blue, Colors.lightBlue[50],], // whitish to gray
                      tileMode: TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(1.0),
                  width: 10,
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 1),
                      colors: [ Colors.blue, Colors.lightBlue[50],], // whitish to gray
                      tileMode: TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(1.0),
                  width: 10,
                  height: 190,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 1),
                      colors: [ Colors.blue, Colors.lightBlue[50],], // whitish to gray
                      tileMode: TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(1.0),
                  width: 10,
                  height: 160,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 1),
                      colors: [ Colors.blue, Colors.lightBlue[50],], // whitish to gray
                      tileMode: TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(1.0),
                  width: 10,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 1),
                      colors: [ Colors.blue, Colors.lightBlue[50],], // whitish to gray
                      tileMode: TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(1.0),
                  width: 10,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 1),
                      colors: [ Colors.blue, Colors.lightBlue[50],], // whitish to gray
                      tileMode: TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(1.0),
                  width: 10,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 1),
                      colors: [ Colors.blue, Colors.lightBlue[50],], // whitish to gray
                      tileMode: TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 30.0,right: 30.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  width: 10,
                  child: Text("1",
                    style:TextStyle(fontSize: 10.0,color: Colors.blue),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 10,
                  child: Text("2",
                      style:TextStyle(fontSize: 10.0,color: Colors.blue),
                      textAlign: TextAlign.center
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 10,
                  child: Text("3",
                      style:TextStyle(fontSize: 10.0,color: Colors.blue),
                      textAlign: TextAlign.center
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 10,
                  child: Text("4",
                      style:TextStyle(fontSize: 10.0,color: Colors.blue),
                      textAlign: TextAlign.center
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 10,
                  child: Text("5",
                      style:TextStyle(fontSize: 10.0,color: Colors.blue),
                      textAlign: TextAlign.center
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 10,
                  child: Text("6",
                      style:TextStyle(fontSize: 10.0,color: Colors.blue),
                      textAlign: TextAlign.center
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 10,
                  child: Text("7",
                      style:TextStyle(fontSize: 10.0,color: Colors.blue),
                      textAlign: TextAlign.center
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 10,
                  child: Text("8",
                      style:TextStyle(fontSize: 10.0,color: Colors.blue),
                      textAlign: TextAlign.center
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 10,
                  child: Text("9",
                      style:TextStyle(fontSize: 10.0,color: Colors.blue),
                      textAlign: TextAlign.center
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    width: 10,
                    child: Text("10",
                        style:TextStyle(fontSize: 10.0,color: Colors.blue),
                        textAlign: TextAlign.center
                    ),
                  )
              ),
            ],
          ),
        ),
        SizedBox(height: 20,)
      ],
    );
  }
}
