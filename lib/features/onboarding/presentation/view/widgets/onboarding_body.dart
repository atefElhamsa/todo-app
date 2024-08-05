import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/core/utils/app_images.dart';
import 'package:todo/core/utils/app_texts.dart';
import 'package:todo/features/login/presentation/controller/theme_controller.dart';
import 'package:todo/features/login/presentation/view/login_screen.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                Provider.of<ThemeProvider>(context).switchValue
                    ? AppTexts.lightMode
                    : AppTexts.darkMode,
                style: GoogleFonts.lexendDeca(
                  textStyle: TextStyle(
                    color: Provider.of<ThemeProvider>(context).switchValue
                        ? AppColors.white
                        : AppColors.darkMode,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
              ),
              Switch(
                value: Provider.of<ThemeProvider>(context).switchValue,
                onChanged: (value) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .changeSwitchValue(value);
                },
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Image.asset(AppImages.onBoardingImages),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Text(
            AppTexts.toDoListDailyTask,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.merge(
                  TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.035,
                  ),
                ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Text(
            AppTexts.descriptionOnBoarding,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall!.merge(
                  TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.018,
                  ),
                ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }),
              );
            },
            color: Provider.of<ThemeProvider>(context).switchValue
                ? AppColors.materialButton
                : AppColors.mainColor,
            height: MediaQuery.of(context).size.height * 0.06,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.03),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    AppTexts.letStart,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium!.merge(
                          TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                          ),
                        ),
                  ),
                ),
                Image.asset(AppImages.arrowRight),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
