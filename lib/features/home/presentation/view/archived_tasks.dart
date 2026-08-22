import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/shared_widgets/custom_appbar.dart';
import 'package:todo/core/utils/app_texts.dart';
import 'package:todo/features/home/presentation/view/task_details.dart';
import 'package:todo/features/home/domain/entities/task_entity.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../login/presentation/controller/theme_controller.dart';
import '../controller/home_controller.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ArchivedTasks extends StatefulWidget {
  const ArchivedTasks({super.key});

  @override
  State<ArchivedTasks> createState() => _ArchivedTasksState();
}

class _ArchivedTasksState extends State<ArchivedTasks> {
  @override
  Widget build(BuildContext context) {
    List<TaskEntity> archivedList = Provider.of<HomeProvider>(context)
        .tasks
        .where(
          (element) => element.isArchived,
        )
        .toList();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.06),
        child: const CustomAppBar(title: AppTexts.archivedTasks),
      ),
      body: archivedList.isEmpty
          ? Center(
              child: Text(
                "No Archived Tasks",
                style: Theme.of(context).textTheme.displaySmall!.merge(
                      TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ),
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03,
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
              itemBuilder: (context, index) {
                final task = archivedList[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return TaskDetails(task: task);
                      }),
                    );
                  },
                  tileColor: Provider.of<ThemeProvider>(context).switchValue
                      ? AppColors.textField
                      : AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.04),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Provider.of<HomeProvider>(context, listen: false)
                          .updateArchive(task);
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
                      backgroundColor: task.isCompleted
                          ? AppColors.mainColor
                          : Provider.of<ThemeProvider>(context).switchValue
                              ? AppColors.textField
                              : AppColors.white,
                    ),
                    child: Text(
                      task.isArchived
                          ? AppTexts.unarchive
                          : AppTexts.archive,
                      style: GoogleFonts.lexendDeca(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: task.isCompleted
                              ? Provider.of<ThemeProvider>(context).switchValue
                                  ? AppColors.black
                                  : AppColors.white
                              : Provider.of<ThemeProvider>(context).switchValue
                                  ? AppColors.white
                                  : AppColors.mainColor,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    task.title,
                    style: GoogleFonts.lexendDeca(
                      fontWeight: FontWeight.w600,
                      color: Provider.of<ThemeProvider>(context).switchValue
                          ? AppColors.white
                          : AppColors.black,
                      fontSize: MediaQuery.of(context).size.height * 0.023,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat('h:mm a').format(task.deadline),
                    style: GoogleFonts.lexendDeca(
                      fontWeight: FontWeight.w400,
                      color: AppColors.mainColor,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                  leading: Image.asset(
                    AppImages.shop,
                  ),
                ).animate(delay: (index * 100).ms).fade(duration: 500.ms).slideY(begin: 0.2, end: 0, duration: 500.ms, curve: Curves.easeOutQuad);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                );
              },
              itemCount: archivedList.length,
            ),
    );
  }
}
