import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_mobile_flutter/App/Home/View/Componemts/forcast_data_list.dart';

import 'package:weather_mobile_flutter/App/SearchWeather/ViewModel/search_view_model.dart';
import 'package:weather_mobile_flutter/Base/View/base_view.dart';
import 'package:weather_mobile_flutter/Common/AppBar/secondary_app_bar.dart';
import 'package:weather_mobile_flutter/Common/FormFIelds/search_field.dart';

import 'package:weather_mobile_flutter/Constant/AppConfig.dart';
import 'package:weather_mobile_flutter/Theme/colors.dart';
import 'package:weather_mobile_flutter/Utils/loader.dart';

class SearchWeatherView extends StatelessWidget {
  const SearchWeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SearchViewModel>(
        vmBuilder: (context) => SearchViewModel(), builder: _buildScreen);
  }

  Widget _buildScreen(BuildContext context, SearchViewModel searchVM) {
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
            child: Column(
              children: [
                innerAppBar(
                  context: context,
                  title: "Search Weather",
                ),
                Gap.h10(),
                SearchField(
                  onSubmit: (value) async {
                    showLoadingIndicator(context: context);
                    await searchVM.onFetchWeatherForcastData();
                    hideOpenDialog(context: context);
                  },
                  hint: "Search by city name",
                  controller: searchVM.cityController,
                ),
                Gap.h10(),
                Expanded(
                    child: ForcastinfoData(forcastData: searchVM.forcastData))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
