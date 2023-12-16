import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_mobile_flutter/App/Home/Model/weather_model.dart';
import 'package:weather_mobile_flutter/Common/AppText/AppTextView.dart';
import 'package:weather_mobile_flutter/Constant/AppConfig.dart';
import 'package:weather_mobile_flutter/Network/api_url.dart';
import 'package:weather_mobile_flutter/Theme/colors.dart';

class ForcastInfoTile extends StatelessWidget {
  final WeatherModel weatherModel;

  ForcastInfoTile({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200, spreadRadius: 1, blurRadius: 1)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: DateFormat('EEEE').format(
                        DateTime.fromMillisecondsSinceEpoch(
                            weatherModel.dt * 1000)),
                    color: AppColor.darkText,
                    size: 14,
                    fontWeight: FontWeights.medium,
                  ),
                  Gap.h10(),
                  CustomText(
                    title: DateFormat('MMM dd, yyyy h:mm a').format(
                        DateTime.fromMillisecondsSinceEpoch(
                            weatherModel.dt * 1000)),
                    color: AppColor.greyText,
                    size: 10,
                    fontWeight: FontWeights.regular,
                  ),
                ],
              ),
              Column(
                children: [
                  Image(
                      height: 50,
                      width: 50,
                      image: NetworkImage(
                          ApiUrl.getImageUrl(weatherModel.weather.first.icon))),
                  CustomText(
                    title: weatherModel.weather.first.description,
                    color: AppColor.greyText,
                    size: 10,
                    fontWeight: FontWeights.regular,
                  ),
                ],
              ),
              CustomText(
                title:
                    "${(double.parse(weatherModel.main.temp.toString())).toStringAsFixed(0)}°C / ${(double.parse(weatherModel.main.feelsLike.toString())).toStringAsFixed(0)}°C",
                color: AppColor.darkText,
                size: 14,
                fontWeight: FontWeights.medium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
