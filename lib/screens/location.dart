import 'package:flutter/material.dart';
import 'package:wae/screens/city.dart';
import '../services/networking.dart';
import '../services/weatherModel.dart';
import 'package:wae/constants.dart';

class LocationScreen extends StatefulWidget{
  LocationScreen({super.key, required this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}
class _LocationScreenState extends State<LocationScreen>{
  WeatherModel weather = WeatherModel();
  var temperature;
  String? weatherIcon;
  String? weatherTxt;
  var cityName;

  Weather w = Weather();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData)
  {
    setState(() {
      if(weatherData == null){
        temperature = 0;
        cityName = 'No city';
        weatherIcon = 'Error';
        weatherTxt = 'Unable to get weather Data';
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherTxt = weather.getMessage(temp.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
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
                    onPressed: () async {
                      Weather weather = Weather();
                      var w = await weather.getWeatherLocation();

                      updateUI(w);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var result = await Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context){
                        return CityScreen();
                      }));
                      if (result != null){
                        var cityWeather = await w.getWeatherCity(result);
                        updateUI(cityWeather);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      //'32°',
                      style: KTempTextStyle
                    ),
                    Text(
                      weatherIcon.toString(),
                      //'☀️',
                      style: TextStyle(
                        fontSize: 100.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherTxt! in $cityName",
                  textAlign: TextAlign.right,
                  style: KMessageTextStyle
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}