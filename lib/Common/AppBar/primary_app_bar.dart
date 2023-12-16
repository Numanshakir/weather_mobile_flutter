import 'package:flutter/material.dart';
import 'package:weather_mobile_flutter/Common/AppText/AppTextView.dart';
import 'package:weather_mobile_flutter/Constant/AppConfig.dart';
import 'package:weather_mobile_flutter/Constant/custom_assets.dart';
import 'package:weather_mobile_flutter/Routes/routes_names.dart';
import 'package:weather_mobile_flutter/Theme/colors.dart';

class PrimaryAppBar extends StatelessWidget {
  final String title;

  const PrimaryAppBar({super.key, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Row(
        children: [
          const Spacer(),
          Gap.w50(),
          if (title.isNotEmpty)
            CustomText(
              title: title,
              size: 24,
              color: AppColor.black,
              fontWeight: FontWeights.semiBold,
            ),
          const Spacer(),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteName.searchWeatherView);
              },
              icon: Image(
                image: AssetImage(CustomAssets.search),
                height: 25,
                color: Colors.black,
                width: 25,
              )),
        ],
      ),
    );
  }
}
