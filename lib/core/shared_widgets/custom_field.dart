import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../features/login/presentation/controller/theme_controller.dart';
import '../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.nameFromKey,
    required this.title,
    required this.subTitle,
    required this.borderColor,
    this.minLines = 1,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final GlobalKey nameFromKey;
  final String title;
  final String subTitle;
  final Color borderColor;
  final int minLines;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).switchValue;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.lexendDeca(
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.white : AppColors.black,
                fontSize: MediaQuery.of(context).size.height * 0.02,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Form(
            key: nameFromKey,
            child: TextFormField(
              style: GoogleFonts.lexendDeca(
                textStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  color: isDark ? AppColors.white : AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              minLines: minLines,
              maxLines: maxLines,
              controller: controller,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter a value";
                }
                return null;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: isDark ? AppColors.darkMode : AppColors.grey1.withOpacity(0.1),
                hintText: subTitle,
                hintStyle: GoogleFonts.lexendDeca(
                  textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.018,
                    color: isDark ? AppColors.grey2 : AppColors.grey1,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.02,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(minLines > 1 ? 20 : 30),
                  borderSide: BorderSide(
                    color: borderColor == AppColors.transparent
                        ? (isDark ? AppColors.deleteOrNot : Colors.transparent)
                        : borderColor,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(minLines > 1 ? 20 : 30),
                  borderSide: BorderSide(color: AppColors.mainColor, width: 2),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(minLines > 1 ? 20 : 30),
                  borderSide: BorderSide(color: AppColors.red, width: 1.5),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(minLines > 1 ? 20 : 30),
                  borderSide: BorderSide(color: AppColors.red, width: 2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
