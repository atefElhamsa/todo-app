import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/core/utils/app_images.dart';
import 'package:todo/core/utils/app_texts.dart';
import 'package:todo/features/add_note/presentation/view/widgets/add_note_body.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppTexts.addTask,
            style: GoogleFonts.lexendDeca(
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.black,
                fontSize: MediaQuery.of(context).size.height * 0.03,
              ),
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              AppImages.arrowLeft,
            ),
          ),
        ),
        body: const AddNoteBody(),
      ),
    );
  }
}
