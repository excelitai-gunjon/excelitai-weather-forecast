import 'package:excelitai_weather_forecast/src/model/five_days_data.dart';
import 'package:excelitai_weather_forecast/src/ui/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:weather_app/src/model/five_days_data.dart';
// import 'package:weather_app/src/ui/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  String convertTime(int millis) {
    var dt = DateTime.fromMillisecondsSinceEpoch(millis);
    var d12 = DateFormat('hh:mm a').format(dt); // 12/31/2000, 10:00 PM
    var d24 = DateFormat('HH:mm').format(dt); // 31/12/2000, 22:00
    return d12.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<HomeController>(
        builder: (controller) => Column(
          children: <Widget>[
            Expanded(
              flex: 32,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cloud-in-blue-sky.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                      child: TextField(
                        onChanged: (value) => controller.city = value,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) => controller.updateWeather(),
                        decoration: InputDecoration(
                          suffix: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: 'Search'.toUpperCase(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.0, 1.0),
                      child: SizedBox(
                        height: 10,
                        width: 10,
                        child: OverflowBox(
                          minWidth: 0.0,
                          maxWidth: MediaQuery.of(context).size.width,
                          minHeight: 0.0,
                          maxHeight: (MediaQuery.of(context).size.height / 4),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                width: double.infinity,
                                height: double.infinity,
                                child: SingleChildScrollView(
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 15, left: 20, right: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Center(
                                                child: Text(
                                                  (controller.currentWeatherData !=
                                                          null)
                                                      ? '${controller.currentWeatherData.name}'
                                                          .toUpperCase()
                                                      : '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                        color: Colors.black45,
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'flutterfonts',
                                                      ),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  DateFormat()
                                                      .add_MMMMEEEEd()
                                                      .format(DateTime.now()),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                        color: Colors.black45,
                                                        fontSize: 16,
                                                        fontFamily:
                                                            'flutterfonts',
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(left: 50),
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    (controller.currentWeatherData
                                                                .weather !=
                                                            null)
                                                        ? '${controller.currentWeatherData.weather![0].description}'
                                                        : '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption!
                                                        .copyWith(
                                                          color: Colors.black45,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'flutterfonts',
                                                        ),
                                                  ),
                                                  SizedBox(height: 0),
                                                  Text(
                                                    (controller.currentWeatherData
                                                                .main !=
                                                            null)
                                                        ? '${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103'
                                                        : '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline3!
                                                        .copyWith(
                                                            color: Colors.black45,
                                                            fontFamily:
                                                                'flutterfonts'),
                                                  ),
                                                  Text(
                                                    (controller.currentWeatherData
                                                                .main !=
                                                            null)
                                                        ? 'min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103'
                                                        : '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption!
                                                        .copyWith(
                                                          color: Colors.black45,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'flutterfonts',
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(right: 20),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    width: 80,
                                                    height: 80,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            'http://openweathermap.org/img/wn/${controller.currentWeatherData.weather![0].icon}@2x.png'),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      (controller.currentWeatherData
                                                                  .wind !=
                                                              null)
                                                          ? 'wind ${controller.currentWeatherData.wind!.speed!} m/s'
                                                          : '',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption!
                                                          .copyWith(
                                                            color: Colors.black45,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'flutterfonts',
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 50,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 110,
                      left: 15,
                      right: 15,
                      bottom: 0,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'forcast next 5 days'.toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                      ),
                                ),
                                const Icon(
                                  Icons.next_plan_outlined,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 223,
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: SfCartesianChart(
                                primaryXAxis: CategoryAxis(),
                                series: <ChartSeries<FiveDayData, String>>[
                                  SplineSeries<FiveDayData, String>(
                                    dataSource: controller.fiveDaysData,
                                    xValueMapper: (FiveDayData f, _) =>
                                        f.dateTime,
                                    yValueMapper: (FiveDayData f, _) => f.temp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 30,
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: DataTable(
                    dataTextStyle: Theme.of(context).textTheme.caption!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Daily Detail',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          '',
                          textAlign: TextAlign.center,
                          style: TextStyle(),
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(
                          Text(
                            "Today's sunrise",
                          ),
                        ),
                        DataCell(
                          Text(
                            "${convertTime(controller.currentWeatherData.sys!.sunrise!)}",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Text(
                            "Today's sunset",
                          ),
                        ),
                        DataCell(
                          Text(
                            "${convertTime(controller.currentWeatherData.sys!.sunset!)}",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Text(
                            "Tempuerture Feels like",
                          ),
                        ),
                        DataCell(
                          Text(
                            "${(controller.currentWeatherData.main!.feelsLike! - 273.15).round().toString()}\u2103",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Text(
                            "Pressure",
                          ),
                        ),
                        DataCell(
                          Text(
                            "${(controller.currentWeatherData.main!.pressure!)} hPa",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
