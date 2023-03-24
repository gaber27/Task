import 'package:bhi/constants/color.dart';
import 'package:bhi/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,

      // To Make App Responsive For All Screen
      builder:(context,child)=>ResponsiveWrapper.builder(
        child,
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(480,name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
        backgroundColor: mainColor,
      ),
      title: 'Task',
      theme: ThemeData(
        scaffoldBackgroundColor: mainColor,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black,
            // For Stuts Bar
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.black,
              statusBarIconBrightness: Brightness.light,

            )
        ),
      useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
  }


