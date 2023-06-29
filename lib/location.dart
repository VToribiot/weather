import 'package:flutter/material.dart';
import 'package:wae/constants.dart';

class LocationScreen extends StatefulWidget{
  @override
  _LocationScreenState createState() => _LocationScreenState();
}
class _LocationScreenState extends State<LocationScreen>{
  @override
  Widget build(BuildContext buildContext){
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/background.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.dstATop),
                ),
              ),
              constraints: BoxConstraints.expand(),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextButton(
                            onPressed: (){},
                            child: Icon(
                              Icons.near_me,
                              size: 50.0,
                            ),

                          ),
                          TextButton(
                            onPressed: (){},
                            child: Icon(
                              Icons.location_city,
                              size: 50.0,
                            ),

                          )
                        ]
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "30°",
                            style: KTempTextStyle,
                          ),
                          Text(
                            "🌞",
                            style: KConditionTextStyle,
                          )
                        ],
                      ),

                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Its 🍨 time in San Francisco!",
                            style: KMessageTextStyle,
                            textAlign: TextAlign.right,
                          ),

                        ],
                      ),

                    )
                  ],
                ),
              ),
            )
          );


  }

}