import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wae/locator.dart';

class loadingPage extends StatefulWidget {
  const loadingPage({super.key});

  @override
  State<loadingPage> createState() => _loadingPageState();
}

class _loadingPageState extends State<loadingPage> {
  late Location oLocation = new Location();
  var position;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    position = await oLocation.getLocation();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    print("Altitude: ${position.altitude}, longitude: ${position.longitude}");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: position == null
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(position.latitude.toString()),
          Text(position.longitude.toString()),
        ],
      ),
    );
  }
}
