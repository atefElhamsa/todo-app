import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_texts.dart';
import '../../../../home/presentation/view/widgets/dayname.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.photo, required this.name});

  final String name;
  final File photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.mainColor,
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
                      color: AppColors.blue,
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
                      color: AppColors.blue,
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
              backgroundColor: AppColors.white,
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
