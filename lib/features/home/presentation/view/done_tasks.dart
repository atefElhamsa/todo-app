import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/shared_widgets/custom_appbar.dart';
import 'package:todo/core/utils/app_texts.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../login/presentation/controller/theme_controller.dart';
import '../../data/model/note_model.dart';
import '../controller/home_controller.dart';

class DoneTasks extends StatefulWidget {
  const DoneTasks({super.key});

  @override
  State<DoneTasks> createState() => _DonTasksState();
}

class _DonTasksState extends State<DoneTasks> {
  @override
  Widget build(BuildContext context) {
    List<NoteModel> doneList = Provider.of<HomeProvider>(context)
        .notes
        .where(
          (element) => element.doneOrNot == true,
        )
        .toList();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.06),
        child: const CustomAppBar(title: AppTexts.doneTasks),
      ),
      body: Expanded(
        child: doneList.isEmpty
            ? Center(
                child: Text(
                  "No Done Tasks",
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.04),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          doneList[index].startDate,
                          style: GoogleFonts.lexendDeca(
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            color:
                                Provider.of<ThemeProvider>(context).switchValue
                                    ? AppColors.white.withOpacity(0.6)
                                    : AppColors.grey2,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          doneList[index].endDate,
                          style: GoogleFonts.lexendDeca(
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            color:
                                Provider.of<ThemeProvider>(context).switchValue
                                    ? AppColors.white.withOpacity(0.6)
                                    : AppColors.grey2,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    title: Text(
                      doneList[index].title,
                      style: GoogleFonts.lexendDeca(
                        fontWeight: FontWeight.w600,
                        color: Provider.of<ThemeProvider>(context).switchValue
                            ? AppColors.white
                            : AppColors.black,
                        fontSize: MediaQuery.of(context).size.height * 0.023,
                      ),
                    ),
                    subtitle: Text(
                      doneList[index].time,
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
                itemCount: doneList.length,
              ),
      ),
    );
  }
}
