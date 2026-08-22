import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/core/utils/app_images.dart';
import 'package:todo/features/home/domain/entities/task_entity.dart';
import 'package:todo/features/home/presentation/controller/home_controller.dart';
import 'package:todo/features/home/presentation/view/task_details.dart';
import 'package:todo/features/login/presentation/view/widgets/appbar.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../login/data/model/user_model.dart';
import '../../../../login/presentation/controller/theme_controller.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key, required this.userModel});

  final UserModel userModel;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).switchValue;

    return Column(
      children: [
        AppBarLogin(
          userModel: widget.userModel,
        ),
        Expanded(
          child: Provider.of<HomeProvider>(context).tasks.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.inbox_rounded,
                        size: MediaQuery.of(context).size.width * 0.2,
                        color: isDark ? AppColors.grey2 : AppColors.labni2,
                      ).animate().fade(duration: 500.ms).scale(delay: 200.ms),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Text(
                        "All caught up!",
                        style: GoogleFonts.lexendDeca(
                          textStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: isDark ? AppColors.white : AppColors.black,
                          ),
                        ),
                      )
                          .animate()
                          .fade(delay: 300.ms)
                          .slideY(begin: 0.5, end: 0),
                      Text(
                        "Time to add a new task.",
                        style: GoogleFonts.lexendDeca(
                          textStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey1,
                          ),
                        ),
                      )
                          .animate()
                          .fade(delay: 400.ms)
                          .slideY(begin: 0.5, end: 0),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04,
                    vertical: MediaQuery.of(context).size.height * 0.02,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final task = context.watch<HomeProvider>().tasks[index];

                    Color priorityColor;
                    if (task.priority == TaskPriority.high) {
                      priorityColor = AppColors.red;
                    } else if (task.priority == TaskPriority.medium) {
                      priorityColor = Colors.orange;
                    } else {
                      priorityColor = AppColors.archivedAndDone;
                    }

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return TaskDetails(task: task);
                          }),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.02),
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.04),
                        decoration: BoxDecoration(
                          color: isDark ? AppColors.textField : AppColors.white,
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.05),
                          boxShadow: [
                            if (!isDark)
                              BoxShadow(
                                color: AppColors.mainColor.withOpacity(0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            if (isDark)
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 15,
                                offset: const Offset(0, 8),
                              ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.width * 0.15,
                              width: MediaQuery.of(context).size.width * 0.15,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? AppColors.darkMode
                                    : AppColors.labni2.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(
                                  AppImages.shop,
                                  width:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.04),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    task.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.lexendDeca(
                                      fontWeight: FontWeight.w600,
                                      color: isDark
                                          ? AppColors.white
                                          : AppColors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.022,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.005),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_rounded,
                                        size:
                                            MediaQuery.of(context).size.height *
                                                0.018,
                                        color: AppColors.grey1,
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01),
                                      Text(
                                        DateFormat('h:mm a')
                                            .format(task.deadline),
                                        style: GoogleFonts.lexendDeca(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.grey1,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.018,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: priorityColor.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.circle,
                                          size: 8, color: priorityColor),
                                      SizedBox(width: 4),
                                      Text(
                                        task.priority.name.toUpperCase(),
                                        style: GoogleFonts.lexendDeca(
                                          fontWeight: FontWeight.w600,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.012,
                                          color: priorityColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                GestureDetector(
                                  onTap: () {
                                    context
                                        .read<HomeProvider>()
                                        .updateDone(task);
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.008,
                                    ),
                                    decoration: BoxDecoration(
                                      color: task.isCompleted
                                          ? AppColors.mainColor
                                          : (isDark
                                              ? AppColors.darkMode
                                              : AppColors.white),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: task.isCompleted
                                            ? AppColors.transparent
                                            : AppColors.mainColor,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Text(
                                      task.isCompleted ? "Completed" : "Done",
                                      style: GoogleFonts.lexendDeca(
                                        fontWeight: FontWeight.w600,
                                        color: task.isCompleted
                                            ? AppColors.white
                                            : AppColors.mainColor,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                        .animate(delay: (index * 100).ms)
                        .fade(duration: 500.ms)
                        .slideY(
                            begin: 0.1,
                            end: 0,
                            duration: 500.ms,
                            curve: Curves.easeOutQuad);
                  },
                  itemCount: context.watch<HomeProvider>().tasks.length,
                ),
        ),
      ],
    );
  }
}
