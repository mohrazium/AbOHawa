import 'package:translator/translator.dart';

class WeatherData {
  int temp;
  int feelsLike;
  int tempMin;
  int tempMax;
  int humidity;
  int condition;
  String mainTitle;
  String description;
  String cityName;
  String _iconName;
  int pressure;
  double windSpeed;
  int windDegree;

  String backgroundImage;
  String iconImage;

  Future<void> readData(_weatherData) async {
    if (_weatherData != null) {
      // main.temp
      temp = (_weatherData['main']['temp']).toInt();
      // main.feels_like
      feelsLike = (_weatherData['main']['feels_like']).toInt();
      // main.temp_max
      tempMax = (_weatherData['main']['temp_max']).toInt();
      // main.temp_min
      tempMin = (_weatherData['main']['temp_min']).toInt();
      //main.humidity
      humidity = _weatherData['main']['humidity'];
      cityName = _weatherData['name'];
      //weather[0].id
      condition = _weatherData['weather'][0]['id'];
      //weather[0].main
      mainTitle = _weatherData['weather'][0]['main'];
      //weather[0].description
      description = _weatherData['weather'][0]['description'];
      //main.pressure
      pressure = _weatherData['main']['pressure'];
      // wind.speed
      windSpeed = _weatherData['wind']['speed'] as double;
      // wind.deg
      windDegree = _weatherData['wind']['deg'];
      // weather[0].icon
      _iconName = _weatherData['weather'][0]['icon'];

      iconImage = 'http://openweathermap.org/img/wn/$_iconName@2x.png';

      getBackgroundImage();
    }
  }

  Future<String> _translate(String input) async {
    final translator = GoogleTranslator();
    String res;
    await translator
        .translate(input.toString(), from: 'en', to: 'fa')
        .then((value) => res = value);
    return res;
  }

  void getBackgroundImage() {
    print('condition is $condition');
    if (condition >= 200 && condition < 300) {
      backgroundImage = 'assets/images/storm.jpg';
    } else if (condition >= 300 && condition < 400) {
      backgroundImage = 'assets/images/rainy.jpg';
    } else if (condition >= 500 && condition < 600) {
      backgroundImage = 'assets/images/rainy.jpg';
    } else if (condition >= 600 && condition < 700) {
      backgroundImage = 'assets/images/snow.jpg';
    } else if (condition >= 700 && condition < 800) {
      backgroundImage = 'assets/images/wind.jpg';
    } else if (condition >= 800 && condition < 900) {
      backgroundImage = 'assets/images/sunny.jpg';
    }
  }
}
/*
Group 2xx: Thunderstorm
ID	Main	Description	Icon
200	Thunderstorm	thunderstorm with light rain	 11d
201	Thunderstorm	thunderstorm with rain	 11d
202	Thunderstorm	thunderstorm with heavy rain	 11d
210	Thunderstorm	light thunderstorm	 11d
211	Thunderstorm	thunderstorm	 11d
212	Thunderstorm	heavy thunderstorm	 11d
221	Thunderstorm	ragged thunderstorm	 11d
230	Thunderstorm	thunderstorm with light drizzle	 11d
231	Thunderstorm	thunderstorm with drizzle	 11d
232	Thunderstorm	thunderstorm with heavy drizzle	 11d
Group 3xx: Drizzle
ID	Main	Description	Icon
300	Drizzle	light intensity drizzle	 09d
301	Drizzle	drizzle	 09d
302	Drizzle	heavy intensity drizzle	 09d
310	Drizzle	light intensity drizzle rain	 09d
311	Drizzle	drizzle rain	 09d
312	Drizzle	heavy intensity drizzle rain	 09d
313	Drizzle	shower rain and drizzle	 09d
314	Drizzle	heavy shower rain and drizzle	 09d
321	Drizzle	shower drizzle	 09d
Group 5xx: Rain
ID	Main	Description	Icon
500	Rain	light rain	 10d
501	Rain	moderate rain	 10d
502	Rain	heavy intensity rain	 10d
503	Rain	very heavy rain	 10d
504	Rain	extreme rain	 10d
511	Rain	freezing rain	 13d
520	Rain	light intensity shower rain	 09d
521	Rain	shower rain	 09d
522	Rain	heavy intensity shower rain	 09d
531	Rain	ragged shower rain	 09d
Group 6xx: Snow
ID	Main	Description	Icon
600	Snow	light snow	 13d
601	Snow	Snow	 13d
602	Snow	Heavy snow	 13d
611	Snow	Sleet	 13d
612	Snow	Light shower sleet	 13d
613	Snow	Shower sleet	 13d
615	Snow	Light rain and snow	 13d
616	Snow	Rain and snow	 13d
620	Snow	Light shower snow	 13d
621	Snow	Shower snow	 13d
622	Snow	Heavy shower snow	 13d
Group 7xx: Atmosphere
ID	Main	Description	Icon
701	Mist	mist	 50d
711	Smoke	Smoke	 50d
721	Haze	Haze	 50d
731	Dust	sand/ dust whirls	 50d
741	Fog	fog	 50d
751	Sand	sand	 50d
761	Dust	dust	 50d
762	Ash	volcanic ash	 50d
771	Squall	squalls	 50d
781	Tornado	tornado	 50d
Group 800: Clear
ID	Main	Description	Icon
800	Clear	clear sky	 01d
 01n
Group 80x: Clouds
ID	Main	Description	Icon
801	Clouds	few clouds: 11-25%	 02d
 02n
802	Clouds	scattered clouds: 25-50%	 03d
 03n
803	Clouds	broken clouds: 51-84%	 04d
 04n
804	Clouds	overcast clouds: 85-100%	 04d
 04n



Weather icons
Weather condition codes



 */
