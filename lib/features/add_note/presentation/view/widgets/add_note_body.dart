import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/shared_widgets/custom_field.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/core/utils/app_texts.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../home/presentation/controller/home_controller.dart';
import '../../../../home/domain/entities/task_entity.dart';
import '../../../../login/presentation/controller/theme_controller.dart';

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

  Widget _buildDatePickerCard(BuildContext context, String title, String subtitle, IconData icon, VoidCallback onTap, bool isDark) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
        decoration: BoxDecoration(
          color: isDark ? AppColors.textField : AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            if (!isDark)
              BoxShadow(
                color: AppColors.mainColor.withOpacity(0.05),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkMode : AppColors.labni2.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.mainColor, size: 24),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.lexendDeca(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: isDark ? AppColors.white : AppColors.black,
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.lexendDeca(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey1,
                        fontSize: MediaQuery.of(context).size.height * 0.016,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded, color: AppColors.grey1, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildPrioritySelector(BuildContext context, bool isDark) {
    final currentPriority = Provider.of<HomeProvider>(context).priority;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Priority",
          style: GoogleFonts.lexendDeca(
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.white : AppColors.black,
              fontSize: MediaQuery.of(context).size.height * 0.02,
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: TaskPriority.values.map((priority) {
            final isSelected = currentPriority == priority;
            Color pColor;
            if (priority == TaskPriority.high) pColor = AppColors.red;
            else if (priority == TaskPriority.medium) pColor = Colors.orange;
            else pColor = AppColors.archivedAndDone;

            return GestureDetector(
              onTap: () => Provider.of<HomeProvider>(context, listen: false).setPriority(priority),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: MediaQuery.of(context).size.width * 0.28,
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.015),
                decoration: BoxDecoration(
                  color: isSelected ? pColor.withOpacity(0.15) : (isDark ? AppColors.textField : AppColors.white),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: isSelected ? pColor : (isDark ? AppColors.deleteOrNot : AppColors.grey1.withOpacity(0.3)),
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    priority.name.toUpperCase(),
                    style: GoogleFonts.lexendDeca(
                      fontWeight: FontWeight.w600,
                      color: isSelected ? pColor : AppColors.grey1,
                      fontSize: MediaQuery.of(context).size.height * 0.016,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).switchValue;
    final homeProvider = Provider.of<HomeProvider>(context);

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04),
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        CustomTextField(
          controller: taskName,
          nameFromKey: nameFromKeyTask,
          title: AppTexts.taskName,
          subTitle: AppTexts.enterTaskName,
          borderColor: AppColors.transparent,
        ).animate().fade(duration: 400.ms).slideY(begin: 0.1, end: 0),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        CustomTextField(
          controller: descriptionName,
          nameFromKey: nameFromKeyDescription,
          title: AppTexts.description,
          subTitle: AppTexts.enterTaskDescription,
          borderColor: AppColors.transparent,
          minLines: 5,
          maxLines: 7,
        ).animate().fade(delay: 100.ms).slideY(begin: 0.1, end: 0),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),

        _buildDatePickerCard(
          context,
          AppTexts.startDate,
          homeProvider.startDate == null
              ? AppTexts.enterStartDate
              : homeProvider.convertDateString(homeProvider.startDate!),
          Icons.calendar_month_rounded,
          () => homeProvider.selectStartDate(context),
          isDark,
        ).animate().fade(delay: 200.ms).slideX(begin: -0.1, end: 0),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),

        _buildDatePickerCard(
          context,
          AppTexts.endDate,
          homeProvider.endDate == null
              ? AppTexts.enterEndDate
              : homeProvider.convertDateString(homeProvider.endDate!),
          Icons.edit_calendar_rounded,
          () => homeProvider.selectEndDate(context),
          isDark,
        ).animate().fade(delay: 300.ms).slideX(begin: -0.1, end: 0),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),

        _buildDatePickerCard(
          context,
          AppTexts.addTime,
          homeProvider.time == null
              ? AppTexts.setTimeForTask
              : homeProvider.time!.format(context),
          Icons.access_time_rounded,
          () => homeProvider.selectTime(context),
          isDark,
        ).animate().fade(delay: 400.ms).slideX(begin: -0.1, end: 0),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),

        _buildPrioritySelector(context, isDark).animate().fade(delay: 500.ms).slideY(begin: 0.1, end: 0),

        SizedBox(height: MediaQuery.of(context).size.height * 0.06),

        GestureDetector(
          onTap: () {
            if (taskName.text.isNotEmpty && descriptionName.text.isNotEmpty) {
              homeProvider.addNote(
                title: taskName.text.trim(),
                description: descriptionName.text.trim(),
                context: context,
              );
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                colors: [AppColors.mainColor, AppColors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blue.withOpacity(0.4),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppTexts.addTask,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lexendDeca(
                    textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.022,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                const Icon(Icons.add_task_rounded, color: Colors.white),
              ],
            ),
          ),
        ).animate().fade(delay: 600.ms).slideY(begin: 0.2, end: 0),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
      ],
    );
  }
}
