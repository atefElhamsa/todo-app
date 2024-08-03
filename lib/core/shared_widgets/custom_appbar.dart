import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        widget.title,
        style: GoogleFonts.lexendDeca(
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.black,
            fontSize: MediaQuery.of(context).size.height * 0.03,
          ),
        ),
      ),
      leading: GestureDetector(
        onTap: () {
          setState(() {
            Navigator.pop(context);
          });
        },
        child: Image.asset(
          AppImages.arrowLeft,
        ),
      ),
    );
  }
}
