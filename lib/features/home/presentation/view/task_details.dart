import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/task_entity.dart';
import '../../../../core/shared_widgets/custom_appbar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_texts.dart';
import '../../../login/presentation/controller/theme_controller.dart';
import '../controller/home_controller.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({
    super.key,
    required this.task,
  });

  final TaskEntity task;

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  Widget _buildDetailCard(BuildContext context, String title, String content,
      IconData icon, bool isDark,
      {bool isLarge = false}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.darkMode
                      : AppColors.labni2.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: AppColors.mainColor, size: 20),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              Text(
                title,
                style: GoogleFonts.lexendDeca(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppColors.white : AppColors.black,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            content,
            style: GoogleFonts.lexendDeca(
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: isDark ? AppColors.grey2 : AppColors.grey1,
                fontSize: MediaQuery.of(context).size.height * 0.018,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).switchValue;

    Color priorityColor;
    if (widget.task.priority == TaskPriority.high)
      priorityColor = AppColors.red;
    else if (widget.task.priority == TaskPriority.medium)
      priorityColor = Colors.orange;
    else
      priorityColor = AppColors.archivedAndDone;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: const CustomAppBar(title: AppTexts.taskDetails),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04),
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),

          // Header Card
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.mainColor, AppColors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blue.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.circle, size: 10, color: priorityColor),
                      SizedBox(width: 8),
                      Text(
                        "${widget.task.priority.name.toUpperCase()} PRIORITY",
                        style: GoogleFonts.lexendDeca(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  widget.task.title,
                  style: GoogleFonts.lexendDeca(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
              ],
            ),
          ).animate().fade(duration: 400.ms).slideY(begin: 0.1, end: 0),

          SizedBox(height: MediaQuery.of(context).size.height * 0.03),

          _buildDetailCard(
            context,
            "Description",
            widget.task.description,
            Icons.description_rounded,
            isDark,
          ).animate().fade(delay: 100.ms).slideY(begin: 0.1, end: 0),

          SizedBox(height: MediaQuery.of(context).size.height * 0.02),

          Row(
            children: [
              Expanded(
                child: _buildDetailCard(
                  context,
                  "Date",
                  DateFormat('MMM dd, yyyy').format(widget.task.deadline),
                  Icons.calendar_today_rounded,
                  isDark,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.04),
              Expanded(
                child: _buildDetailCard(
                  context,
                  "Time",
                  DateFormat('h:mm a').format(widget.task.deadline),
                  Icons.access_time_rounded,
                  isDark,
                ),
              ),
            ],
          ).animate().fade(delay: 200.ms).slideY(begin: 0.1, end: 0),

          SizedBox(height: MediaQuery.of(context).size.height * 0.04),

          // Actions
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    context.read<HomeProvider>().updateArchive(widget.task);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.textField : AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.mainColor, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        widget.task.isArchived
                            ? AppTexts.unarchive
                            : AppTexts.archive,
                        style: GoogleFonts.lexendDeca(
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainColor,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.04),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    context.read<HomeProvider>().updateDone(widget.task);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.mainColor, AppColors.blue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blue.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        widget.task.isCompleted ? "Unmark Done" : "Mark Done",
                        style: GoogleFonts.lexendDeca(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ).animate().fade(delay: 300.ms).slideY(begin: 0.2, end: 0),

          SizedBox(height: MediaQuery.of(context).size.height * 0.02),

          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor:
                        isDark ? AppColors.darkMode : AppColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    title: Text(
                      AppTexts.titleAlertDialog,
                      style: GoogleFonts.lexendDeca(
                        fontWeight: FontWeight.bold,
                        color: isDark ? AppColors.white : AppColors.black,
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Cancel",
                            style: TextStyle(color: AppColors.grey1)),
                      ),
                      TextButton(
                        onPressed: () {
                          context
                              .read<HomeProvider>()
                              .deleteNote(task: widget.task, context: context);
                        },
                        child: Text("Delete",
                            style: TextStyle(
                                color: AppColors.red,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                color: AppColors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  AppTexts.delete,
                  style: GoogleFonts.lexendDeca(
                    fontWeight: FontWeight.bold,
                    color: AppColors.red,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
              ),
            ),
          ).animate().fade(delay: 400.ms).slideY(begin: 0.2, end: 0),

          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        ],
      ),
    );
  }
}
