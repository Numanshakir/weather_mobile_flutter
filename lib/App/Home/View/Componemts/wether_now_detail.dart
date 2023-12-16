import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_mobile_flutter/App/Home/Model/weather_model.dart';
import 'package:weather_mobile_flutter/Common/AppText/AppTextView.dart';
import 'package:weather_mobile_flutter/Theme/colors.dart';

class WeatherNowDetails extends StatelessWidget {
  final WeatherModel weatherModel;
  WeatherNowDetails({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.primaryColor.withOpacity(0.5),
                AppColor.primaryColor,
              ]),
          color: AppColor.primaryColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      title: "Feel like",
                      color: AppColor.greyText,
                      size: 14,
                      fontWeight: FontWeights.medium,
                    ),
                    CustomText(
                      title: "${weatherModel.main.feelsLike}°C",
                      color: AppColor.darkText,
                      size: 16,
                      fontWeight: FontWeights.medium,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: VerticalDivider(
                    color: Colors.black,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      title: "Pressure",
                      color: AppColor.greyText,
                      size: 14,
                      fontWeight: FontWeights.medium,
                    ),
                    CustomText(
                      title: "${weatherModel.main.pressure}hPa",
                      color: AppColor.darkText,
                      size: 16,
                      fontWeight: FontWeights.medium,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: VerticalDivider(
                    color: Colors.black,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      title: "Humidity",
                      color: AppColor.greyText,
                      size: 14,
                      fontWeight: FontWeights.medium,
                    ),
                    CustomText(
                      title: "${weatherModel.main.humidity}%",
                      color: AppColor.darkText,
                      size: 16,
                      fontWeight: FontWeights.medium,
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      title: "Wind",
                      color: AppColor.greyText,
                      size: 14,
                      fontWeight: FontWeights.medium,
                    ),
                    CustomText(
                      title: "${weatherModel.wind.speed}m/s",
                      color: AppColor.darkText,
                      size: 16,
                      fontWeight: FontWeights.medium,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: VerticalDivider(
                    color: Colors.black,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      title: "Clouds",
                      color: AppColor.greyText,
                      size: 14,
                      fontWeight: FontWeights.medium,
                    ),
                    CustomText(
                      title: "${weatherModel.clouds.all}%",
                      color: AppColor.darkText,
                      size: 16,
                      fontWeight: FontWeights.medium,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: VerticalDivider(
                    color: Colors.black,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      title: "Visibility",
                      color: AppColor.greyText,
                      size: 14,
                      fontWeight: FontWeights.medium,
                    ),
                    CustomText(
                      title: "${weatherModel.visibility ~/ 1000}km",
                      color: AppColor.darkText,
                      size: 16,
                      fontWeight: FontWeights.medium,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
