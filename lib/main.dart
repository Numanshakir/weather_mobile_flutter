import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_mobile_flutter/App/Home/ViewModel/home_view_model.dart';
import 'package:weather_mobile_flutter/App/Location/ViewModel/location_view_model.dart';
import 'package:weather_mobile_flutter/Routes/routes.dart';
import 'package:weather_mobile_flutter/Routes/routes_names.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomeViewModel()),
      ChangeNotifierProvider(create: (context) => LocationViewModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: RouteName.splash,
      onGenerateRoute: AppRoutes.genrateRoutes,
      title: 'Wearther',
    );
  }
}
