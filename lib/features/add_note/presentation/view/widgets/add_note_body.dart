import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/shared_widgets/custom_field.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/core/utils/app_images.dart';
import 'package:todo/core/utils/app_texts.dart';

class AddNoteBody extends StatefulWidget {
  const AddNoteBody({super.key});

  @override
  State<AddNoteBody> createState() => _AddNoteBodyState();
}

class _AddNoteBodyState extends State<AddNoteBody> {
  TextEditingController taskName = TextEditingController();
  var nameFromKeyTask = GlobalKey<FormState>();
  TextEditingController descriptionName = TextEditingController();
  var nameFromKeyDescription = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        CustomTextField(
          controller: taskName,
          nameFromKey: nameFromKeyTask,
          title: AppTexts.taskName,
          subTitle: AppTexts.enterTaskName,
          borderColor: AppColors.white,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        CustomTextField(
          controller: descriptionName,
          nameFromKey: nameFromKeyDescription,
          title: AppTexts.description,
          subTitle: AppTexts.enterTaskDescription,
          borderColor: AppColors.white,
          minLines: 5,
          maxLines: 7,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04),
          child: ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.03)),
            tileColor: AppColors.white,
            title: Text(
              AppTexts.startDate,
              style: GoogleFonts.lexendDeca(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                  fontSize: MediaQuery.of(context).size.height * 0.023,
                ),
              ),
            ),
            leading: Image.asset(AppImages.calendar),
            trailing: GestureDetector(
              onTap: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now(),
                );
              },
              child: Image.asset(AppImages.arrowDown),
            ),
            subtitle: Text(
              AppTexts.enterStartDate,
              style: GoogleFonts.lexendDeca(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey1,
                  fontSize: MediaQuery.of(context).size.height * 0.016,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width * 0.03,
              ),
            ),
            tileColor: AppColors.white,
            title: Text(
              AppTexts.endDate,
              style: GoogleFonts.lexendDeca(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                  fontSize: MediaQuery.of(context).size.height * 0.023,
                ),
              ),
            ),
            leading: Image.asset(AppImages.calendar),
            trailing: GestureDetector(
              onTap: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(
                    const Duration(days: 365),
                  ),
                );
              },
              child: Image.asset(AppImages.arrowDown),
            ),
            subtitle: Text(
              AppTexts.enterEndDate,
              style: GoogleFonts.lexendDeca(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey1,
                  fontSize: MediaQuery.of(context).size.height * 0.016,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width * 0.03,
              ),
            ),
            tileColor: AppColors.white,
            title: Text(
              AppTexts.addTime,
              style: GoogleFonts.lexendDeca(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                  fontSize: MediaQuery.of(context).size.height * 0.023,
                ),
              ),
            ),
            leading: Image.asset(AppImages.watch),
            trailing: GestureDetector(
              onTap: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
              },
              child: Image.asset(AppImages.arrowDown),
            ),
            subtitle: Text(
              AppTexts.setTimeForTask,
              style: GoogleFonts.lexendDeca(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey1,
                  fontSize: MediaQuery.of(context).size.height * 0.016,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04),
          child: MaterialButton(
            onPressed: () {},
            color: AppColors.mainColor,
            height: MediaQuery.of(context).size.height * 0.06,
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.03),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    AppTexts.addTask,
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
