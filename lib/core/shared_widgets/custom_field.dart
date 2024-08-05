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
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04),
      child: Container(
        decoration: BoxDecoration(
          color: Provider.of<ThemeProvider>(context, listen: false).switchValue
              ? AppColors.textField
              : AppColors.white,
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.03),
          border: Border.all(color: borderColor),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.lexendDeca(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Provider.of<ThemeProvider>(context, listen: false)
                            .switchValue
                        ? AppColors.white.withOpacity(0.8)
                        : AppColors.black.withOpacity(0.7),
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                  ),
                ),
              ),
              Form(
                key: nameFromKey,
                child: TextFormField(
                  style: Theme.of(context).textTheme.displaySmall!.merge(
                        TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(
                      FocusNode(),
                    );
                  },
                  minLines: minLines,
                  maxLines: maxLines,
                  controller: controller,
                  validator: (value) {
                    if (value == null || value.isEmpty == true) {
                      return "Please Enter Name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: subTitle,
                    hintStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        color:
                            Provider.of<ThemeProvider>(context, listen: false)
                                    .switchValue
                                ? AppColors.white.withOpacity(0.4)
                                : AppColors.grey1),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
