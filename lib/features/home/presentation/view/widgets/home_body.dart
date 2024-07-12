import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/core/utils/app_images.dart';
import 'package:todo/core/utils/app_texts.dart';
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
        CustomAppBar(photo: widget.photo, name: widget.name),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Dismissible(
                background: Container(
                  color: AppColors.red,
                ),
                key: GlobalKey(),
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 0.04)),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.02),
                        ),
                        backgroundColor: AppColors.mainColor,
                      ),
                      child: Text(
                        AppTexts.done,
                        style: GoogleFonts.lexendDeca(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "Studying flutter",
                      style: GoogleFonts.lexendDeca(
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                        fontSize: MediaQuery.of(context).size.height * 0.023,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat("HH:mm:ss").format(DateTime.now()),
                      style: GoogleFonts.lexendDeca(
                        fontWeight: FontWeight.w400,
                        color: AppColors.mainColor,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                    leading: Image.asset(
                      AppImages.shop,
                    ),
                  ),
                ),
              );
            },
            itemCount: 8,
          ),
        ),
      ],
    );
  }
}
