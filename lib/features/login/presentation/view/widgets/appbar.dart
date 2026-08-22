import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/login/data/model/user_model.dart';
import 'package:todo/features/login/presentation/controller/theme_controller.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_texts.dart';
import '../../../../home/presentation/view/widgets/dayname.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppBarLogin extends StatelessWidget {
  const AppBarLogin({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).switchValue;

    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10,
        bottom: 20,
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkMode : AppColors.white,
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Drawer Icon
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isDark ? AppColors.textField : AppColors.grey1.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                AppImages.menu,
                color: isDark ? AppColors.white : AppColors.black,
                height: 20,
              ),
            ),
          ).animate().fade(duration: 400.ms).slideX(begin: -0.2, end: 0),

          // User Greeting
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${AppTexts.hello} ${userModel.userName.trim()} 👋",
                    style: GoogleFonts.lexendDeca(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isDark ? AppColors.white : AppColors.black,
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${getDayName(DateTime.now().weekday)}, ${getMonthName(DateTime.now().month)} ${DateTime.now().day}",
                    style: GoogleFonts.lexendDeca(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: isDark ? AppColors.grey2 : AppColors.grey1,
                        fontSize: MediaQuery.of(context).size.height * 0.016,
                      ),
                    ),
                  ),
                ],
              ),
            ).animate().fade(delay: 200.ms).slideY(begin: 0.2, end: 0),
          ),

          // Avatar
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.mainColor, width: 2),
            ),
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.06,
              backgroundColor: isDark ? AppColors.textField : AppColors.labni2.withOpacity(0.3),
              backgroundImage: Image.file(
                userModel.photo,
                fit: BoxFit.cover,
              ).image,
            ),
          ).animate().fade(delay: 300.ms).scale(begin: const Offset(0.8, 0.8)),
        ],
      ),
    );
  }
}
