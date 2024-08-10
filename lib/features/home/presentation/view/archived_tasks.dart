import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/shared_widgets/custom_appbar.dart';
import 'package:todo/core/utils/app_texts.dart';
import 'package:todo/features/home/presentation/view/task_details.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../login/presentation/controller/theme_controller.dart';
import '../../data/model/note_model.dart';
import '../controller/home_controller.dart';

class ArchivedTasks extends StatefulWidget {
  const ArchivedTasks({super.key});

  @override
  State<ArchivedTasks> createState() => _ArchivedTasksState();
}

class _ArchivedTasksState extends State<ArchivedTasks> {
  @override
  Widget build(BuildContext context) {
    List<NoteModel> archivedList = Provider.of<HomeProvider>(context)
        .notes
        .where(
          (element) => element.archiveOrNot == true,
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
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return TaskDetails(noteModel: archivedList[index]);
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
                          .updateArchive(
                        Provider.of<HomeProvider>(context, listen: false)
                            .notes
                            .indexOf(archivedList[index]),
                      );
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
                      backgroundColor: archivedList[index].doneOrNot
                          ? AppColors.mainColor
                          : Provider.of<ThemeProvider>(context).switchValue
                              ? AppColors.textField
                              : AppColors.white,
                    ),
                    child: Text(
                      archivedList[index].archiveOrNot
                          ? AppTexts.unarchive
                          : AppTexts.archive,
                      style: GoogleFonts.lexendDeca(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: archivedList[index].doneOrNot
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
                    archivedList[index].title,
                    style: GoogleFonts.lexendDeca(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      fontSize: MediaQuery.of(context).size.height * 0.023,
                    ),
                  ),
                  subtitle: Text(
                    archivedList[index].time,
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
