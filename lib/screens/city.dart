import 'package:flutter/material.dart';
import 'package:wae/constants.dart';

class CityScreen extends StatefulWidget{
  @override
  _LocationCityScreen createState() => _LocationCityScreen();
}
class _LocationCityScreen extends State<CityScreen>{
  @override
  Widget build(BuildContext buildContext){
    return Scaffold(
        body: Container(
    constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child:  TextButton(
                      onPressed: (){},
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 50.0,
                      ),
                )
                )
              ]
            )
            ),
          ),
    );

  }

}