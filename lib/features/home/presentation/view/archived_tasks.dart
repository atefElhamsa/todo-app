import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/shared_widgets/custom_appbar.dart';
import 'package:todo/core/utils/app_texts.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../data/model/note_model.dart';

class ArchivedTasks extends StatefulWidget {
  const ArchivedTasks({super.key});

  @override
  State<ArchivedTasks> createState() => _ArchivedTasksState();
}

class _ArchivedTasksState extends State<ArchivedTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.06),
        child: const CustomAppBar(title: AppTexts.archivedTasks),
      ),
      body: Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.04),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  notes[index].doneOrNot = !notes[index].doneOrNot;
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.02),
                    side: BorderSide(
                      color: AppColors.mainColor,
                      width: MediaQuery.of(context).size.width * 0.005,
                    ),
                  ),
                  backgroundColor: notes[index].doneOrNot
                      ? AppColors.mainColor
                      : AppColors.white,
                ),
                child: Text(
                  AppTexts.done,
                  style: GoogleFonts.lexendDeca(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: notes[index].doneOrNot
                          ? AppColors.white
                          : AppColors.mainColor,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                ),
              ),
              title: Text(
                notes[index].title,
                style: GoogleFonts.lexendDeca(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  fontSize: MediaQuery.of(context).size.height * 0.023,
                ),
              ),
              subtitle: Text(
                notes[index].time,
                style: GoogleFonts.lexendDeca(
                  fontWeight: FontWeight.w400,
                  color: AppColors.mainColor,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
              leading: Image.asset(
                AppImages.shop,
              ),
            );
          },
          itemCount: notes.length,
        ),
      ),
    );
  }
}