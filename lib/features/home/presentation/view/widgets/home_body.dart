import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/core/utils/app_images.dart';
import 'package:todo/core/utils/app_texts.dart';
import 'package:todo/features/home/data/model/note_model.dart';
import 'package:todo/features/login/presentation/view/widgets/appbar.dart';

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
          child: notes.isEmpty
              ? const Center(
                  child: Text("No Notes, Please Add Task"),
                )
              : ListView.builder(
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.04),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                notes[index].doneOrNot =
                                    !notes[index].doneOrNot;
                              });
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
                              backgroundColor: notes[index].doneOrNot
                                  ? AppColors.mainColor
                                  : AppColors.white,
                            ),
                            child: Text(
                              AppTexts.done,
                              style: GoogleFonts.lexendDeca(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: notes[index].doneOrNot
                                      ? AppColors.white
                                      : AppColors.mainColor,
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            notes[index].title,
                            style: GoogleFonts.lexendDeca(
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.023,
                            ),
                          ),
                          subtitle: Text(
                            notes[index].time,
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
                  itemCount: notes.length,
                ),
        ),
      ],
    );
  }
}
