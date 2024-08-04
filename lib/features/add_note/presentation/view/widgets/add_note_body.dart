import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/shared_widgets/custom_field.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/core/utils/app_images.dart';
import 'package:todo/core/utils/app_texts.dart';
import 'package:todo/features/home/data/model/note_model.dart';

class AddNoteBody extends StatefulWidget {
  const AddNoteBody({
    super.key,
  });

  @override
  State<AddNoteBody> createState() => _AddNoteBodyState();
}

class _AddNoteBodyState extends State<AddNoteBody> {
  TextEditingController taskName = TextEditingController();
  var nameFromKeyTask = GlobalKey<FormState>();
  TextEditingController descriptionName = TextEditingController();
  var nameFromKeyDescription = GlobalKey<FormState>();
  DateTime dateTimeNow = DateTime.now();
  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? time;

  String convertDateString(DateTime date) {
    return date.toString().split(" ")[0];
  }

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
              onTap: () async {
                startDate = await showDatePicker(
                  context: context,
                  firstDate: dateTimeNow,
                  lastDate: dateTimeNow.add(
                    const Duration(days: 31),
                  ),
                );
                setState(() {});
              },
              child: Image.asset(AppImages.arrowDown),
            ),
            subtitle: Text(
              startDate == null
                  ? AppTexts.enterStartDate
                  : convertDateString(startDate!),
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
              onTap: () async {
                endDate = await showDatePicker(
                  context: context,
                  firstDate: dateTimeNow,
                  lastDate: dateTimeNow.add(
                    const Duration(days: 365),
                  ),
                );
                setState(() {});
              },
              child: Image.asset(AppImages.arrowDown),
            ),
            subtitle: Text(
              endDate == null
                  ? AppTexts.enterEndDate
                  : convertDateString(endDate!),
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
              onTap: () async {
                time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                setState(() {});
              },
              child: Image.asset(AppImages.arrowDown),
            ),
            subtitle: Text(
              time == null ? AppTexts.setTimeForTask : time!.format(context),
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
            onPressed: () {
              if (time != null &&
                  startDate != null &&
                  endDate != null &&
                  taskName.text.isNotEmpty &&
                  descriptionName.text.isNotEmpty) {
                notes.add(
                  NoteModel(
                    title: taskName.text.trim(),
                    description: descriptionName.text.trim(),
                    time: time!.format(context),
                    startDate: convertDateString(startDate!),
                    endDate: convertDateString(endDate!),
                  ),
                );
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Fill Data"),
                  ),
                );
              }
            },
            color: AppColors.mainColor,
            height: MediaQuery.of(context).size.height * 0.06,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.03),
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
