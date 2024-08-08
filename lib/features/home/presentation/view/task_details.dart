import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/home/data/model/note_model.dart';
import '../../../../core/shared_widgets/custom_appbar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_texts.dart';
import '../../../login/presentation/controller/theme_controller.dart';
import '../controller/home_controller.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({
    super.key,
    required this.noteModel,
  });

  final NoteModel noteModel;

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.06),
        child: const CustomAppBar(title: AppTexts.taskDetails),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
            child: Container(
              decoration: BoxDecoration(
                color: Provider.of<ThemeProvider>(context).switchValue
                    ? AppColors.textField
                    : AppColors.white,
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.03),
                border: Border.all(
                  color: Provider.of<ThemeProvider>(context).switchValue
                      ? AppColors.transparent
                      : AppColors.labni2,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppTexts.taskName,
                      style: GoogleFonts.lexendDeca(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Provider.of<ThemeProvider>(context).switchValue
                              ? AppColors.white
                              : AppColors.black.withOpacity(0.7),
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                        ),
                      ),
                    ),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: widget.noteModel.title,
                        hintStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                          color: Provider.of<ThemeProvider>(context).switchValue
                              ? AppColors.white.withOpacity(0.7)
                              : AppColors.grey1,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
            child: Container(
              decoration: BoxDecoration(
                color: Provider.of<ThemeProvider>(context).switchValue
                    ? AppColors.textField
                    : AppColors.white,
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.03),
                border: Border.all(
                  color: Provider.of<ThemeProvider>(context).switchValue
                      ? AppColors.transparent
                      : AppColors.labni2,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppTexts.description,
                      style: GoogleFonts.lexendDeca(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Provider.of<ThemeProvider>(context).switchValue
                              ? AppColors.white
                              : AppColors.black.withOpacity(0.7),
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                        ),
                      ),
                    ),
                    TextFormField(
                      minLines: 5,
                      maxLines: 7,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: widget.noteModel.description,
                        hintStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                          color: Provider.of<ThemeProvider>(context).switchValue
                              ? AppColors.white.withOpacity(0.7)
                              : AppColors.grey1,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                    color: Provider.of<ThemeProvider>(context).switchValue
                        ? AppColors.white
                        : AppColors.black,
                    fontSize: MediaQuery.of(context).size.height * 0.023,
                  ),
                ),
              ),
              leading: Image.asset(AppImages.calendar),
              subtitle: Text(
                widget.noteModel.startDate,
                style: GoogleFonts.lexendDeca(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Provider.of<ThemeProvider>(context).switchValue
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
                    color: Provider.of<ThemeProvider>(context).switchValue
                        ? AppColors.white
                        : AppColors.black,
                    fontSize: MediaQuery.of(context).size.height * 0.023,
                  ),
                ),
              ),
              leading: Image.asset(AppImages.calendar),
              subtitle: Text(
                widget.noteModel.endDate,
                style: GoogleFonts.lexendDeca(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Provider.of<ThemeProvider>(context).switchValue
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
                    color: Provider.of<ThemeProvider>(context).switchValue
                        ? AppColors.white
                        : AppColors.black,
                    fontSize: MediaQuery.of(context).size.height * 0.023,
                  ),
                ),
              ),
              leading: Image.asset(AppImages.watch),
              subtitle: Text(
                widget.noteModel.time,
                style: GoogleFonts.lexendDeca(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Provider.of<ThemeProvider>(context).switchValue
                        ? AppColors.white.withOpacity(0.7)
                        : AppColors.grey1,
                    fontSize: MediaQuery.of(context).size.height * 0.016,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
            child: MaterialButton(
              onPressed: () {
                Provider.of<HomeProvider>(context, listen: false).updateArchive(
                  Provider.of<HomeProvider>(context, listen: false)
                      .notes
                      .indexOf(widget.noteModel),
                );
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Provider.of<HomeProvider>(context)
                            .notes[Provider.of<HomeProvider>(context)
                                .notes
                                .indexOf(widget.noteModel)]
                            .archiveOrNot
                        ? AppTexts.unarchive
                        : AppTexts.archive,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lexendDeca(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Icon(
                    Provider.of<HomeProvider>(context)
                            .notes[Provider.of<HomeProvider>(context)
                                .notes
                                .indexOf(widget.noteModel)]
                            .archiveOrNot
                        ? Icons.unarchive_rounded
                        : Icons.archive_rounded,
                    color: AppColors.white,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
            child: MaterialButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor:
                          Provider.of<ThemeProvider>(context).switchValue
                              ? AppColors.deleteOrNot
                              : AppColors.white,
                      title: Column(
                        children: [
                          Text(
                            AppTexts.titleAlertDialog,
                            style: GoogleFonts.lexendDeca(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.022,
                                color: Provider.of<ThemeProvider>(context)
                                        .switchValue
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  Provider.of<HomeProvider>(context,
                                          listen: false)
                                      .deleteNote(
                                          noteModel: widget.noteModel,
                                          context: context);
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width *
                                          0.015),
                                ),
                                color: AppColors.red,
                                child: Text(
                                  AppTexts.yes,
                                  style: GoogleFonts.lexendDeca(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                  ),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width *
                                          0.015),
                                ),
                                color: Provider.of<ThemeProvider>(context)
                                        .switchValue
                                    ? AppColors.materialButton
                                    : AppColors.mainColor,
                                child: Text(
                                  AppTexts.cancel,
                                  style: GoogleFonts.lexendDeca(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              color: AppColors.red,
              height: MediaQuery.of(context).size.height * 0.06,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.03),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppTexts.delete,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lexendDeca(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  const Icon(
                    Icons.delete_forever_rounded,
                    color: AppColors.white,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
