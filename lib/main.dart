import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/app_texts.dart';
import 'package:todo/core/utils/theme.dart';
import 'package:todo/features/home/presentation/controller/home_controller.dart';
import 'package:todo/features/home/presentation/view/home_screen.dart';
import 'package:todo/features/login/presentation/controller/login_controller.dart';
import 'package:todo/features/onboarding/presentation/view/onboarding_screen.dart';
import 'features/home/data/model/note_model.dart';
import 'features/login/presentation/controller/theme_controller.dart';

import 'core/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox(AppTexts.settingsBox);
  await Hive.openBox<NoteModel>(AppTexts.notesBox);
  await Hive.openBox(AppTexts.userBox);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context, listen: false).setSwitchValueFromHive();
    Provider.of<HomeProvider>(context, listen: false).fetchNotesFromBox();
    return MaterialApp(
      title: "Todo",
      theme: AppTheme().lightThemeData,
      themeMode: Provider.of<ThemeProvider>(context).switchValue
          ? ThemeMode.dark
          : ThemeMode.light,
      darkTheme: AppTheme().darkThemeData,
      debugShowCheckedModeBanner: false,
      home: Provider.of<LoginProvider>(context).userModel == null
          ? OnBoardingScreen()
          : HomeScreen(
              userModel: Provider.of<LoginProvider>(context).userModel!,
            ),
    );
  }
}
