import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:weatherapp_abbohawa/constants/constants.dart';
import 'package:weatherapp_abbohawa/pages/weather_page.dart';
import 'package:weatherapp_abbohawa/services/network_helper.dart';
import 'package:weatherapp_abbohawa/services/weather_data.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () async {
      final weatherModel = WeatherData();
      await weatherModel.readData(await NetworkHelper().getLocationData());
      print(' weather model ; ${weatherModel.cityName}');
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return WeatherPage(
          weatherModel: weatherModel,
        );
      }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(Constants.LOADING_IMAGE))),
      child: Center(
        child: LoadingBouncingGrid.square(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
