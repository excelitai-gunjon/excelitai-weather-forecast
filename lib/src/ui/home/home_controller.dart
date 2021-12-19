import 'package:excelitai_weather_forecast/src/model/current_weather_data.dart';
import 'package:excelitai_weather_forecast/src/model/five_days_data.dart';
import 'package:excelitai_weather_forecast/src/service/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:weather_app/src/model/current_weather_data.dart';
// import 'package:weather_app/src/model/five_days_data.dart';
// import 'package:weather_app/src/service/weather_service.dart';

class HomeController extends GetxController {
  String? city;
  String? searchText;

  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<CurrentWeatherData> dataList = [];
  List<FiveDayData> fiveDaysData = [];

  HomeController({ this.city});

  @override
  void onInit() {
    initState();
    //getTopFiveCities();
    super.onInit();
  }

  void updateWeather() {
    initState();
  }

  void initState() {
    getCurrentWeatherData();
    getFiveDaysData();
  }

  void getCurrentWeatherData() {
    WeatherService(city: '$city').getCurrentWeatherData(
        onSuccess: (data) {
          currentWeatherData = data;
          update();
        },
        onError: (error) => {
              print(error),
              update(),
            });
  }

  void getFiveDaysData() {
    WeatherService(city: '$city').getFiveDaysThreeHoursForcastData(
      onSuccess: (data) {
        fiveDaysData = data;
        update();
      },
      onError: (error) {
        print(error);
        update();
      },
    );
  }
}
