import 'package:flutter/material.dart';
import 'package:wae/constants.dart';

import '../services/networking.dart';
import 'location.dart';

class CityScreen extends StatefulWidget{
  @override
  _LocationCityScreen createState() => _LocationCityScreen();
}
class _LocationCityScreen extends State<CityScreen>{
  @override
  Widget build(BuildContext buildContext){

    var cityName;

    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/city_background.jpg'), fit: BoxFit.cover)
          ),
    constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child:  TextButton(
                      onPressed: (){
                        Navigator.pop(context as BuildContext);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 50.0,
                      ),
                )
                ),
                TextField(
                  onChanged: (value){
                    cityName = value;
                  },
                  style: TextStyle(
                    color: Colors.black
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    icon: Icon(Icons.location_city, color: Colors.white,),
                    hintText: 'Enter city name',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide.none
                    ),
                  ),
                ),
                TextButton(onPressed: () async {
                  Weather weather = Weather();
                  var w = await weather.getWeatherCity(cityName);
                  Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));

                  Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context){
                    return LocationScreen(locationWeather: w);
                  }));
                }, child: Text('Get Weather', style: TextStyle(fontSize: 36.0),),)
              ]
            )
            ),
          ),
    );

  }

}