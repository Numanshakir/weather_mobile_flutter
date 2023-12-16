import 'package:flutter/material.dart';
import 'package:weather_mobile_flutter/App/Home/Model/weather_model.dart';
import 'package:weather_mobile_flutter/App/Home/View/Componemts/forcast_info_tile.dart';
import 'package:weather_mobile_flutter/Common/AppText/AppTextView.dart';

class ForcastinfoData extends StatelessWidget {
  final List<WeatherModel> forcastData;
  final ScrollPhysics? physics;
  ForcastinfoData({super.key, required this.forcastData, this.physics});

  @override
  Widget build(BuildContext context) {
    return forcastData.isEmpty
        ? Center(
            child: CustomText(title: "No Data"),
          )
        : ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: physics ?? AlwaysScrollableScrollPhysics(),
            itemCount: forcastData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ForcastInfoTile(weatherModel: forcastData[index]),
              );
            });
  }
}
