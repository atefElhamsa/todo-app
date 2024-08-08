import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/shared_widgets/custom_field.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/core/utils/app_images.dart';
import 'package:todo/core/utils/app_texts.dart';

import '../../../../home/presentation/controller/home_controller.dart';
import '../../../../login/presentation/controller/theme_controller.dart';

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
          borderColor:
              Provider.of<ThemeProvider>(context, listen: false).switchValue
                  ? AppColors.transparent
                  : AppColors.labni2,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        CustomTextField(
          controller: descriptionName,
          nameFromKey: nameFromKeyDescription,
          title: AppTexts.description,
          subTitle: AppTexts.enterTaskDescription,
          borderColor:
              Provider.of<ThemeProvider>(context, listen: false).switchValue
                  ? AppColors.transparent
                  : AppColors.labni2,
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
            tileColor: Provider.of<ThemeProvider>(context).switchValue
                ? AppColors.textField
                : AppColors.white,
            title: Text(
              AppTexts.startDate,
              style: GoogleFonts.lexendDeca(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Provider.of<ThemeProvider>(context, listen: false)
                          .switchValue
                      ? AppColors.white
                      : AppColors.black,
                  fontSize: MediaQuery.of(context).size.height * 0.023,
                ),
              ),
            ),
            leading: Image.asset(AppImages.calendar),
            trailing: GestureDetector(
              onTap: () {
                Provider.of<HomeProvider>(context, listen: false)
                    .selectStartDate(context);
              },
              child: Image.asset(
                AppImages.arrowDown,
                color: Provider.of<ThemeProvider>(context, listen: false)
                        .switchValue
                    ? AppColors.white
                    : AppColors.black,
              ),
            ),
            subtitle: Text(
              Provider.of<HomeProvider>(context).startDate == null
                  ? AppTexts.enterStartDate
                  : Provider.of<HomeProvider>(context, listen: false)
                      .convertDateString(
                          Provider.of<HomeProvider>(context).startDate!),
              style: GoogleFonts.lexendDeca(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Provider.of<ThemeProvider>(context, listen: false)
                          .switchValue
                      ? AppColors.white.withOpacity(0.7)
                      : AppColors.grey1,
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
            tileColor: Provider.of<ThemeProvider>(context).switchValue
                ? AppColors.textField
                : AppColors.white,
            title: Text(
              AppTexts.endDate,
              style: GoogleFonts.lexendDeca(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Provider.of<ThemeProvider>(context, listen: false)
                          .switchValue
                      ? AppColors.white
                      : AppColors.black,
                  fontSize: MediaQuery.of(context).size.height * 0.023,
                ),
              ),
            ),
            leading: Image.asset(AppImages.calendar),
            trailing: GestureDetector(
              onTap: () {
                Provider.of<HomeProvider>(context, listen: false)
                    .selectEndDate(context);
              },
              child: Image.asset(
                AppImages.arrowDown,
                color: Provider.of<ThemeProvider>(context, listen: false)
                        .switchValue
                    ? AppColors.white
                    : AppColors.black,
              ),
            ),
            subtitle: Text(
              Provider.of<HomeProvider>(context).endDate == null
                  ? AppTexts.enterEndDate
                  : Provider.of<HomeProvider>(context, listen: false)
                      .convertDateString(
                          Provider.of<HomeProvider>(context).endDate!),
              style: GoogleFonts.lexendDeca(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Provider.of<ThemeProvider>(context, listen: false)
                          .switchValue
                      ? AppColors.white.withOpacity(0.7)
                      : AppColors.grey1,
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
            tileColor: Provider.of<ThemeProvider>(context).switchValue
                ? AppColors.textField
                : AppColors.white,
            title: Text(
              AppTexts.addTime,
              style: GoogleFonts.lexendDeca(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Provider.of<ThemeProvider>(context, listen: false)
                          .switchValue
                      ? AppColors.white
                      : AppColors.black,
                  fontSize: MediaQuery.of(context).size.height * 0.023,
                ),
              ),
            ),
            leading: Image.asset(AppImages.watch),
            trailing: GestureDetector(
              onTap: () {
                Provider.of<HomeProvider>(context, listen: false)
                    .selectTime(context);
              },
              child: Image.asset(
                AppImages.arrowDown,
                color: Provider.of<ThemeProvider>(context, listen: false)
                        .switchValue
                    ? AppColors.white
                    : AppColors.black,
              ),
            ),
            subtitle: Text(
              Provider.of<HomeProvider>(context).time == null
                  ? AppTexts.setTimeForTask
                  : Provider.of<HomeProvider>(context).time!.format(context),
              style: GoogleFonts.lexendDeca(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Provider.of<ThemeProvider>(context, listen: false)
                          .switchValue
                      ? AppColors.white.withOpacity(0.7)
                      : AppColors.grey1,
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
              if (taskName.text.isNotEmpty && descriptionName.text.isNotEmpty) {
                Provider.of<HomeProvider>(context, listen: false).addNote(
                  title: taskName.text.trim(),
                  description: descriptionName.text.trim(),
                  context: context,
                );
              }
            },
            color: Provider.of<ThemeProvider>(context).switchValue
                ? AppColors.materialButton
                : AppColors.mainColor,
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
                    style: Theme.of(context).textTheme.displayMedium!.merge(
                          TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
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
