import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../features/login/presentation/controller/theme_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).switchValue;

    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: isDark ? AppColors.darkMode : AppColors.white,
      centerTitle: true,
      title: Text(
        widget.title,
        style: GoogleFonts.lexendDeca(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDark ? AppColors.white : AppColors.black,
            fontSize: MediaQuery.of(context).size.height * 0.025,
            letterSpacing: 0.5,
          ),
        ),
      ).animate().fade(duration: 400.ms).slideY(begin: -0.2, end: 0),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isDark ? AppColors.textField : AppColors.grey1.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              AppImages.arrowLeft,
              color: isDark ? AppColors.white : AppColors.black,
            ),
          ),
        ),
      ).animate().fade(duration: 400.ms).slideX(begin: -0.2, end: 0),
    );
  }
}
