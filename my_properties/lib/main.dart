import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_properties/constants/constants.dart';
import 'package:my_properties/pages/screens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Property',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: primaryColor,
        fontFamily: 'Poppins',
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: primaryColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
