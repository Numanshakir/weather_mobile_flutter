import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_mobile_flutter/App/Location/ViewModel/location_view_model.dart';
import 'package:weather_mobile_flutter/App/Splash/ViewModel/splash_view_model.dart';

import 'package:weather_mobile_flutter/Common/AppText/AppTextView.dart';

import 'package:weather_mobile_flutter/Constant/AppConfig.dart';
import 'package:weather_mobile_flutter/Routes/routes_names.dart';
import 'package:weather_mobile_flutter/Theme/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final locationVM = Provider.of<LocationViewModel>(context, listen: false);
    Future.microtask(()async {
     await locationVM.onFetchMyLocaiton();
      if(locationVM.serviceEnabled){
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pushNamed(context, RouteName.homeView);
        });
      }
   
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: Platform.isIOS
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle(systemNavigationBarColor: Colors.white),
        child: Container(
          child: Center(
            child: CustomText(
              title: "Wearther",
              color: AppColor.black,
              size: 20,
              fontWeight: FontWeights.medium,
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColor.primaryColor.withOpacity(0.5),
                  AppColor.primaryColor,
                ]),
          ),
          height: AppConfig(context).height,
          width: AppConfig(context).width,
        ),
      ),
    );
  }
}
