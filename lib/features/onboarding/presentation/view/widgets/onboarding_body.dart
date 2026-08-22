import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/core/utils/app_images.dart';
import 'package:todo/core/utils/app_texts.dart';
import 'package:todo/features/login/presentation/controller/theme_controller.dart';
import 'package:todo/features/login/presentation/view/login_screen.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).switchValue;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.08),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 2),
          Image.asset(
            AppImages.onBoardingImages,
            height: MediaQuery.of(context).size.height * 0.3,
          ).animate().fade(duration: 600.ms).slideY(begin: -0.1, end: 0),
          Spacer(flex: 1),
          Text(
            AppTexts.toDoListDailyTask,
            textAlign: TextAlign.center,
            style: GoogleFonts.lexendDeca(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: isDark ? AppColors.white : AppColors.black,
                fontSize: MediaQuery.of(context).size.height * 0.035,
                height: 1.2,
              ),
            ),
          ).animate().fade(delay: 200.ms).slideY(begin: 0.1, end: 0),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Text(
            AppTexts.descriptionOnBoarding,
            textAlign: TextAlign.center,
            style: GoogleFonts.lexendDeca(
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.grey1,
                fontSize: MediaQuery.of(context).size.height * 0.018,
                height: 1.5,
              ),
            ),
          ).animate().fade(delay: 300.ms).slideY(begin: 0.1, end: 0),
          Spacer(flex: 2),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }),
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [AppColors.mainColor, AppColors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blue.withOpacity(0.4),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppTexts.letStart,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lexendDeca(
                      textStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  const Icon(Icons.arrow_forward_rounded, color: Colors.white),
                ],
              ),
            ),
          ).animate().fade(delay: 400.ms).slideY(begin: 0.2, end: 0),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
