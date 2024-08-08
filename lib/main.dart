import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/theme.dart';
import 'package:todo/features/home/presentation/controller/home_controller.dart';
import 'package:todo/features/onboarding/presentation/view/onboarding_screen.dart';

import 'features/login/presentation/controller/theme_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().lightThemeData,
      themeMode: Provider.of<ThemeProvider>(context).switchValue
          ? ThemeMode.dark
          : ThemeMode.light,
      darkTheme: AppTheme().darkThemeData,
      debugShowCheckedModeBanner: false,
      home: const OnBoardingScreen(),
    );
  }
}
