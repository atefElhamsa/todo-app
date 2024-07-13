import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/utils/app_images.dart';
import 'package:todo/core/utils/app_texts.dart';
import '../../../../../core/utils/app_colors.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.name, required this.photo});

  final String name;
  final File photo;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(MediaQuery.of(context).size.width * 0),
          topRight: Radius.circular(MediaQuery.of(context).size.width * 0.15),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.022),
            color: AppColors.mainColor,
            child: Row(
              children: [
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
                Expanded(
                  child: Text(
                    name.trim(),
                    style: GoogleFonts.lexendDeca(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
          Padding(
            padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.06),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(MediaQuery.of(context).size.width * 0.03),
                  bottomRight: Radius.circular(MediaQuery.of(context).size.width * 0.03),
                ),
              ),
              tileColor: AppColors.mainColor.withOpacity(0.1),
              title: Text(
                AppTexts.archivedTasks,
                style: GoogleFonts.lexendDeca(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.archivedAndDone,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                  ),
                ),
              ),
              leading: Image.asset(AppImages.archeviedTasks),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
          Padding(
            padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.06),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(MediaQuery.of(context).size.width * 0.03),
                  bottomRight: Radius.circular(MediaQuery.of(context).size.width * 0.03),
                ),
              ),
              tileColor: AppColors.mainColor.withOpacity(0.1),
              title: Text(
                AppTexts.doneTasks,
                style: GoogleFonts.lexendDeca(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.archivedAndDone,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                  ),
                ),
              ),
              leading: Image.asset(AppImages.doneTasks),
            ),
          ),
        ],
      ),
    );
  }
}