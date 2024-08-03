import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.color,
    this.onPressed,
    this.icon,
  });

  final String title;
  final Color color;
  final void Function()? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      height: MediaQuery.of(context).size.height * 0.06,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width * 0.03),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.lexendDeca(
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.white,
                fontSize: MediaQuery.of(context).size.height * 0.025,
              ),
            ),
          ),
          icon == null ? const SizedBox() : Icon(icon),
        ],
      ),
    );
  }
}
