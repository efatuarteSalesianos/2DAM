import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_meteo/models/forecast__daily_response.dart';
import 'package:flutter_meteo/models/forecast_hourly_response.dart';
import 'package:flutter_meteo/models/weather_response.dart';
import 'package:flutter_meteo/utils/constants.dart';
import 'package:flutter_meteo/utils/shared_preferences.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class MarsPage extends StatefulWidget {
  const MarsPage({Key? key}) : super(key: key);

  @override
  _MarsPageState createState() => _MarsPageState();
}

class _MarsPageState extends State<MarsPage> {
  late Future<WeatherResponse> weather;
  late Future<List<Hourly>> forecastHourly;
  late Future<List<Daily>> forecastDaily;

  String city = PreferenceUtils.getString(CITY) ?? '';
  double lat = PreferenceUtils.getDouble(LAT) ?? 37.3826;
  double lon = PreferenceUtils.getDouble(LON) ?? -5.99629;

  late String iconW = PreferenceUtils.getString(ICON) ?? '';

  @override
  void initState() {
    weather = fetchWeather();
    forecastHourly = fetchForecastHourly();
    forecastDaily = fetchForecastDaily();
    super.initState();
  }

  int getHour(int timestamp) {
    final int hour =
        DateTime.fromMillisecondsSinceEpoch((timestamp * 1000) + 3600000).hour;
    return hour;
  }

  String getHourWithMinutes(int timestamp) {
    final String time =
        DateTime.fromMillisecondsSinceEpoch((timestamp * 1000) + 3600000)
                .hour
                .toString() +
            ':' +
            DateTime.fromMillisecondsSinceEpoch((timestamp * 1000) + 3600000)
                .minute
                .toString();
    return time;
  }

  String getDay(int timestamp) {
    initializeDateFormatting();
    final String day = DateFormat('EEE', 'es_ES')
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000 + 3600));
    return day.toUpperCase().substring(0, 3);
  }

  Future<WeatherResponse> fetchWeather() async {
    const String opW = "2beafe38506bb5f857cd7f10e4e6f4eb";
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&lang=sp&appid=$opW'));
    if (response.statusCode == 200) {
      setState(() {
        iconW =
            WeatherResponse.fromJson(jsonDecode(response.body)).weather[0].icon;
        PreferenceUtils.setString(ICON, iconW);
      });
      return WeatherResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load city');
    }
  }

  Widget _weatherItem(WeatherResponse weatherResponse) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GlassmorphicContainer(
        width: 370,
        height: 535,
        borderRadius: 30,
        blur: 30,
        alignment: Alignment.bottomCenter,
        border: 0,
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFFEDEBE).withOpacity(0.6),
              const Color(0xFFFEDEBE).withOpacity(0.3),
            ],
            stops: const [
              0.1,
              1,
            ]),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFFEDEBE).withOpacity(0.0),
            const Color((0xFFFEDEBE)).withOpacity(0.0),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.place_outlined, size: 39, color: Colors.white),
                  Text(
                    'Marte',
                    style: TextStyle(
                        fontSize: 39,
                        color: Colors.white,
                        fontFamily: 'Proxima Nova Light'),
                  ),
                  Icon(Icons.edit_location_outlined,
                      size: 39, color: Colors.white)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 120,
                      child: Image.asset(
                        'assets/images/${weatherResponse.weather[0].icon}.png',
                        scale: 0.01,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              (weatherResponse.main.temp.round()).toString() +
                                  'º',
                              style: const TextStyle(
                                  fontSize: 90,
                                  color: Colors.white,
                                  fontFamily: 'Proxima Nova Light'),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            'Sensación Térmica: ' +
                                (weatherResponse.main.feelsLike.round())
                                    .toString() +
                                'º',
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: 'Proxima Nova Light'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/sunset.png',
                    width: 260,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 73),
                        child: Text(
                            getHourWithMinutes(weatherResponse.sys.sunrise),
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Proxima Nova Light',
                                fontSize: 24)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 54),
                        child: Text(
                            getHourWithMinutes(weatherResponse.sys.sunset),
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Proxima Nova Light',
                                fontSize: 24)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/temp_max.png',
                        width: 25,
                      ),
                      Text(
                        (weatherResponse.main.tempMax.round()).toString() + 'º',
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Proxima Nova Light',
                            fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/temp_min.png',
                        width: 25,
                      ),
                      Text(
                        (weatherResponse.main.tempMin.round()).toString() + 'º',
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Proxima Nova Light',
                            fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/humedad.png',
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                          getHour(weatherResponse.main.humidity).toString() +
                              '%',
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Proxima Nova Light',
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/wind_right.png',
                        width: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          weatherResponse.wind.speed.toString() + ' Km/h',
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Proxima Nova Light',
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Hourly>> fetchForecastHourly() async {
    const String opW = "2beafe38506bb5f857cd7f10e4e6f4eb";
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minutely,daily&units=metric&lang=sp&appid=$opW'));
    if (response.statusCode == 200) {
      return ForecastHourlyResponse.fromJson(jsonDecode(response.body)).hourly;
    } else {
      throw Exception('Failed to load city');
    }
  }

  Widget _forecastListHourly(List<Hourly> forecastList) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: forecastList.length,
        itemBuilder: (context, index) {
          return _forecastItemHourly(forecastList.elementAt(index));
        },
      ),
    );
  }

  Widget _forecastItemHourly(Hourly forecast) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GlassmorphicContainer(
        width: 150,
        height: 250,
        borderRadius: 25,
        blur: 30,
        alignment: Alignment.bottomCenter,
        border: 0,
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFFEDEBE).withOpacity(0.6),
              const Color(0xFFFEDEBE).withOpacity(0.3),
            ],
            stops: const [
              0.05,
              1,
            ]),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFFEDEBE).withOpacity(0.0),
            const Color((0xFFFEDEBE)).withOpacity(0.0),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(getHour(forecast.dt).toString() + ":00",
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Proxima Nova Light',
                      fontSize: 25)),
            ),
            Image.asset(
              'assets/images/${forecast.weather[0].icon}.png',
              width: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/temp.png',
                  width: 33,
                ),
                Text(
                  forecast.temp.round().toString() + "º",
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Proxima Nova Light',
                      fontSize: 25),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/humedad.png',
                  width: 21,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Text(
                    getHour(forecast.humidity).toString() + '%',
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Proxima Nova Light',
                        fontSize: 24),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Daily>> fetchForecastDaily() async {
    const String opW = "2beafe38506bb5f857cd7f10e4e6f4eb";
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minutely,hourly&units=metric&lang=sp&appid=$opW'));
    if (response.statusCode == 200) {
      return ForecastDailyResponse.fromJson(jsonDecode(response.body)).daily;
    } else {
      throw Exception('Failed to load city');
    }
  }

  Widget _forecastListDaily(List<Daily> forecastList) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: forecastList.length,
        itemBuilder: (context, index) {
          return _forecastItemDaily(forecastList.elementAt(index));
        },
      ),
    );
  }

  Widget _forecastItemDaily(Daily forecast) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GlassmorphicContainer(
        width: 150,
        height: 400,
        borderRadius: 25,
        blur: 30,
        alignment: Alignment.bottomCenter,
        border: 0,
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFFEDEBE).withOpacity(0.6),
              const Color(0xFFFEDEBE).withOpacity(0.3),
            ],
            stops: const [
              0.05,
              1,
            ]),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFFEDEBE).withOpacity(0.0),
            const Color((0xFFFEDEBE)).withOpacity(0.0),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(getDay(forecast.dt).toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Proxima Nova Light',
                      fontSize: 25)),
            ),
            Image.asset(
              'assets/images/${forecast.weather[0].icon}.png',
              width: 60,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/temp_max.png',
                    width: 25,
                  ),
                  Text(
                    forecast.temp.max.round().toString() + "º",
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Proxima Nova Light',
                        fontSize: 19),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/temp_min.png',
                      width: 25,
                    ),
                    Text(
                      forecast.temp.min.round().toString() + "º",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Proxima Nova Light',
                          fontSize: 19),
                    ),
                  ],
                ),
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/humedad.png',
                  width: 21,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Text(
                    getHour(forecast.humidity).toString() + '%',
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Proxima Nova Light',
                        fontSize: 24),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/${iconW}_background.jpg'),
                colorFilter: ColorFilter.mode(
                    Colors.deepOrange.withOpacity(1.0), BlendMode.multiply),
                fit: BoxFit.cover)),
        child: ListView(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      child: FutureBuilder<WeatherResponse>(
                          future: weather,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return _weatherItem(snapshot.data!);
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }
                            return const CircularProgressIndicator();
                          }),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 30, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Previsión por horas',
                                  style: TextStyle(
                                      fontSize: 21, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          FutureBuilder<List<Hourly>>(
                              future: forecastHourly,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return _forecastListHourly(snapshot.data!);
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                return const CircularProgressIndicator();
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 30, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Previsión para los próximos 7 días',
                                  style: TextStyle(
                                      fontSize: 21, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          FutureBuilder<List<Daily>>(
                              future: forecastDaily,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return _forecastListDaily(snapshot.data!);
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                return const CircularProgressIndicator();
                              }),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
