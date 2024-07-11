import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/core/utils/app_images.dart';
import 'package:todo/core/utils/app_texts.dart';
import 'package:todo/features/login/presentation/view/login_screen.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
      child: Column(
        children: [
          Image.asset(AppImages.onBoardingImages),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Text(
            AppTexts.toDoListDailyTask,
            textAlign: TextAlign.center,
            style: GoogleFonts.lexendDeca(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.black,
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
            style: GoogleFonts.lexendDeca(
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.grey1,
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
                MaterialPageRoute(builder: (context){
                  return const LoginScreen();
                }),
              );
            },
            color: AppColors.labni1,
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
                    style: GoogleFonts.lexendDeca(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                      ),
                    ),
                  ),
                ),
                Image.asset(AppImages.arrowLeft),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
