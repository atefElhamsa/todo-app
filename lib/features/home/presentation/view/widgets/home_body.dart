import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/core/utils/app_images.dart';
import 'package:todo/core/utils/app_texts.dart';
import 'package:todo/features/home/presentation/controller/home_controller.dart';
import 'package:todo/features/home/presentation/view/task_details.dart';
import 'package:todo/features/login/presentation/view/widgets/appbar.dart';

import '../../../../login/presentation/controller/theme_controller.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key, required this.photo, required this.name});

  final String name;
  final File photo;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarLogin(photo: widget.photo, name: widget.name),
        Expanded(
          child: context.watch<HomeProvider>().notes.isEmpty
              ? Center(
                  child: Text(
                    "No Notes, Please Add Task",
                    style: Theme.of(context).textTheme.displaySmall!.merge(
                          TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                          ),
                        ),
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01,
                    vertical: MediaQuery.of(context).size.height * 0.01,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Dismissible(
                      background: Container(
                        color: AppColors.red,
                        child: const Icon(
                          Icons.delete,
                          color: AppColors.white,
                        ),
                      ),
                      key: GlobalKey(),
                      child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return TaskDetails(
                                    noteModel: context.watch<HomeProvider>().notes[index]);
                              }),
                            );
                          },
                          tileColor:
                              Provider.of<ThemeProvider>(context).switchValue
                                  ? AppColors.textField
                                  : AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.04),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              context.read<HomeProvider>().updateDone(index);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width * 0.02),
                                side: BorderSide(
                                  color: AppColors.mainColor,
                                  width:
                                      MediaQuery.of(context).size.width * 0.005,
                                ),
                              ),
                              backgroundColor: context.watch<HomeProvider>().notes[index].doneOrNot
                                  ? AppColors.mainColor
                                  : Provider.of<ThemeProvider>(context)
                                          .switchValue
                                      ? AppColors.textField
                                      : AppColors.white,
                            ),
                            child: Text(
                              AppTexts.done,
                              style: GoogleFonts.lexendDeca(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: context.watch<HomeProvider>().notes[index].doneOrNot
                                      ? Provider.of<ThemeProvider>(context)
                                              .switchValue
                                          ? AppColors.black
                                          : AppColors.white
                                      : Provider.of<ThemeProvider>(context)
                                              .switchValue
                                          ? AppColors.white
                                          : AppColors.mainColor,
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            context.watch<HomeProvider>().notes[index].title,
                            style: GoogleFonts.lexendDeca(
                              fontWeight: FontWeight.w600,
                              color: Provider.of<ThemeProvider>(context)
                                      .switchValue
                                  ? AppColors.white
                                  : AppColors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.023,
                            ),
                          ),
                          subtitle: Text(
                            context.watch<HomeProvider>().notes[index].time,
                            style: GoogleFonts.lexendDeca(
                              fontWeight: FontWeight.w400,
                              color: AppColors.mainColor,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                            ),
                          ),
                          leading: Image.asset(
                            AppImages.shop,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: context.watch<HomeProvider>().notes.length,
                ),
        ),
      ],
    );
  }
}
