import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_mobile_flutter/App/Home/View/Componemts/forcast_data_list.dart';
import 'package:weather_mobile_flutter/App/Home/View/Componemts/wether_now_detail.dart';
import 'package:weather_mobile_flutter/App/Home/ViewModel/home_view_model.dart';
import 'package:weather_mobile_flutter/App/Location/ViewModel/location_view_model.dart';
import 'package:weather_mobile_flutter/Common/AppBar/primary_app_bar.dart';
import 'package:weather_mobile_flutter/Common/AppText/AppTextView.dart';

import 'package:weather_mobile_flutter/Constant/AppConfig.dart';
import 'package:weather_mobile_flutter/Network/api_url.dart';
import 'package:weather_mobile_flutter/Theme/colors.dart';
import 'package:weather_mobile_flutter/Utils/loader.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final homeVM = Provider.of<HomeViewModel>(context, listen: false);
    homeVM.onFecthWatherNow(context);
    homeVM.onFetchWeatherForcastData(context);
  }

  @override
  Widget build(BuildContext context) {
    final locationVM = Provider.of<LocationViewModel>(
      context,
    );

    final homeVM = Provider.of<HomeViewModel>(
      context,
    );

    final height = AppConfig(context).height;
    final width = AppConfig(context).width;
    return Scaffold(
      backgroundColor: AppColor.screenBG,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: Platform.isIOS
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle(systemNavigationBarColor: Colors.white),
        child: Container(
          height: height,
          width: width,
          child: SafeArea(
            child: homeVM.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      PrimaryAppBar(
                        title: "Today",
                      ),
                      Gap.h10(),
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            final homeVM = Provider.of<HomeViewModel>(context,
                                listen: false);
                            try {
                              showLoadingIndicator(context: context);
                              await homeVM.onFecthWatherNow(context);
                              await homeVM.onFetchWeatherForcastData(context);
                              hideOpenDialog(context: context);
                            } catch (e) {}
                          },
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CustomText(
                                            title:
                                                "${locationVM.locationModel.subAdministrativeArea}, ",
                                            color: AppColor.darkText,
                                            size: 18,
                                            fontWeight: FontWeights.medium,
                                          ),
                                          CustomText(
                                            title:
                                                "${locationVM.locationModel.country},",
                                            color: AppColor.darkText,
                                            size: 18,
                                            fontWeight: FontWeights.regular,
                                          ),
                                        ],
                                      ),
                                      CustomText(
                                        title: homeVM.getCurrentDateTime(),
                                        color: AppColor.greyText,
                                        size: 16,
                                        fontWeight: FontWeights.regular,
                                      ),
                                      Gap.h40(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomText(
                                                    title: double.parse(homeVM.weatherNow.main.temp.toString())
                                                        .toStringAsFixed(0),
                                                    
                                                                                       
                                                    color: AppColor.darkText,
                                                    size: 100,
                                                    fontWeight:
                                                        FontWeights.bold,
                                                  ),
                                                  CustomText(
                                                    title: "°C",
                                                    color: AppColor.darkText,
                                                    size: 40,
                                                    fontWeight:
                                                        FontWeights.medium,
                                                  ),
                                                ],
                                              ),
                                              CustomText(
                                                title: homeVM.weatherNow.weather
                                                    .first.description,
                                                color: AppColor.greyText,
                                                size: 20,
                                                fontWeight: FontWeights.regular,
                                              ),
                                            ],
                                          ),
                                          Gap.w40(),
                                          Image(
                                              height: 100,
                                              width: 100,
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  ApiUrl.getImageUrl(homeVM
                                                      .weatherNow
                                                      .weather
                                                      .first
                                                      .icon)))
                                        ],
                                      ),
                                      Gap.h20(),
                                      WeatherNowDetails(
                                          weatherModel: homeVM.weatherNow),
                                      Gap.h30(),
                                      CustomText(
                                        title: "7-day forecast",
                                        color: AppColor.darkText,
                                        size: 20,
                                        fontWeight: FontWeights.medium,
                                      ),
                                      Gap.h20(),
                                    ],
                                  ),
                                ),
                                ForcastinfoData(
                                    forcastData: homeVM.forcastData,
                                    physics: NeverScrollableScrollPhysics()),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
