import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/app_images.dart';
import 'package:todo/core/utils/app_texts.dart';
import 'package:todo/features/home/presentation/view/archived_tasks.dart';
import 'package:todo/features/home/presentation/view/done_tasks.dart';
import 'package:todo/features/login/presentation/controller/theme_controller.dart';
import '../../../../../core/utils/app_colors.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key, required this.name, required this.photo});

  final String name;
  final File photo;

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Provider.of<ThemeProvider>(context).switchValue
          ? AppColors.darkMode
          : AppColors.white,
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
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.023),
            color: Provider.of<ThemeProvider>(context).switchValue
                ? AppColors.homeAppBar
                : AppColors.mainColor,
            child: Row(
              children: [
                Expanded(
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.065,
                    backgroundColor:
                        Provider.of<ThemeProvider>(context).switchValue
                            ? AppColors.transparent
                            : AppColors.white,
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.06,
                      backgroundImage: Image.file(
                        widget.photo,
                        fit: BoxFit.cover,
                      ).image,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.name.trim(),
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.06),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const ArchivedTasks();
                  }),
                ).then(
                  (value) {
                    setState(() {});
                  },
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight:
                      Radius.circular(MediaQuery.of(context).size.width * 0.03),
                  bottomRight:
                      Radius.circular(MediaQuery.of(context).size.width * 0.03),
                ),
              ),
              tileColor: AppColors.mainColor.withOpacity(0.1),
              title: Text(
                AppTexts.archivedTasks,
                style: GoogleFonts.lexendDeca(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Provider.of<ThemeProvider>(context).switchValue
                        ? AppColors.white
                        : AppColors.archivedAndDone,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                  ),
                ),
              ),
              leading: Image.asset(
                AppImages.archeviedTasks,
                color: Provider.of<ThemeProvider>(context).switchValue
                    ? AppColors.white
                    : AppColors.archivedAndDone,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.06),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const DoneTasks();
                  }),
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight:
                      Radius.circular(MediaQuery.of(context).size.width * 0.03),
                  bottomRight:
                      Radius.circular(MediaQuery.of(context).size.width * 0.03),
                ),
              ),
              tileColor: AppColors.mainColor.withOpacity(0.1),
              title: Text(
                AppTexts.doneTasks,
                style: GoogleFonts.lexendDeca(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Provider.of<ThemeProvider>(context).switchValue
                        ? AppColors.white
                        : AppColors.archivedAndDone,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                  ),
                ),
              ),
              leading: Image.asset(
                AppImages.doneTasks,
                color: Provider.of<ThemeProvider>(context).switchValue
                    ? AppColors.white
                    : AppColors.archivedAndDone,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
