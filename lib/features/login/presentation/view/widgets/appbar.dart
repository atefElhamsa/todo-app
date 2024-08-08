import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/login/presentation/controller/theme_controller.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_texts.dart';
import '../../../../home/presentation/view/widgets/dayname.dart';

class AppBarLogin extends StatelessWidget {
  const AppBarLogin({super.key, required this.photo, required this.name});

  final String name;
  final File photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Provider.of<ThemeProvider>(context).switchValue
            ? AppColors.homeAppBar
            : AppColors.mainColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Image.asset(
                AppImages.menu,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppTexts.hello,
                  style: GoogleFonts.lexendDeca(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeProvider>(context).switchValue
                          ? AppColors.white
                          : AppColors.blue,
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.001,
                ),
                Text(
                  name.trim(),
                  style: GoogleFonts.lexendDeca(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Provider.of<ThemeProvider>(context).switchValue
                          ? AppColors.white
                          : AppColors.blue,
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  "${getDayName(DateTime.now().weekday)}, ${getMonthName(DateTime.now().month)} ${DateTime.now().day}th",
                  style: GoogleFonts.lexendDeca(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.065,
              backgroundColor: Provider.of<ThemeProvider>(context).switchValue
                  ? AppColors.transparent
                  : AppColors.white,
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.06,
                backgroundImage: Image.file(
                  photo,
                  fit: BoxFit.cover,
                ).image,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
