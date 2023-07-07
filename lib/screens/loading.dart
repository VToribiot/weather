import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wae/screens/location.dart';
import 'package:wae/services/locator.dart';
import 'package:wae/services/networking.dart';

class loadingPage extends StatefulWidget {
  const loadingPage({super.key});

  @override
  State<loadingPage> createState() => _loadingPageState();
}

class _loadingPageState extends State<loadingPage> {

  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() async {

    Weather weather = Weather();
    var w = await weather.getWeatherLocation();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));


    Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: w);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.black,
          size: 150,
        ),
      )
    );
  }
}
