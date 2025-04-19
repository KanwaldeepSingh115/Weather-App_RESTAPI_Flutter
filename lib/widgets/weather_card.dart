import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:new_weatherapp/models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;
  const WeatherCard({super.key, required this.weather});

  String formatTime(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('hh:mm a').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          // Suggested code may be subject to a license. Learn more: ~LicenseLog:780506812.
          decoration: BoxDecoration(color: Color.fromARGB(113, 255, 255, 255),
              borderRadius: BorderRadius.circular(20)),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Lottie.asset(
                weather.description.contains('rain')
                    ? 'assets/rain.json'
                    : weather.description.contains('clear')
                    ? 'assets/sunny.json'
                    : weather.description.contains('cloud')
                    ? 'assets/cloudy.json'
                    : 'assets/snowfall.json',
                width: 150,
                height: 150,
              ),

              Text(
                weather.cityName,
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              SizedBox(height: 10),

              Text(
                '${weather.temperature.toStringAsFixed(1)}`C',
                style: Theme.of(
                  context,
                ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),

              Text(
                weather.description,
                style: Theme.of(context).textTheme.titleMedium,
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Humidity: ${weather.humidity}%',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  Text(
                    'Wind Speed: ${weather.windSpeed} m/s',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.wb_sunny_outlined, color: Colors.orange),

                      Text(
                        'Sunrise',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      Text(
                        formatTime(weather.sunrise),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Icon(Icons.nights_stay_outlined, color: Colors.purple),

                      Text(
                        'Sunset',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      Text(
                        formatTime(weather.sunset),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}