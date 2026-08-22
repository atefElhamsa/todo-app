// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/shared_widgets/custom_field.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/core/utils/app_images.dart';
import 'package:todo/core/utils/app_texts.dart';
import 'package:todo/features/home/presentation/view/home_screen.dart';
import 'package:todo/features/login/data/model/user_model.dart';
import 'package:todo/features/login/presentation/controller/login_controller.dart';
import '../../controller/theme_controller.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController name = TextEditingController();
  var nameFromKey = GlobalKey<FormState>();

  void _showImagePickerModal(BuildContext context, bool isDark) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkMode : AppColors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.grey2 : AppColors.grey1.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildPickerOption(
                    context,
                    Icons.photo_library_rounded,
                    AppTexts.gallery,
                    isDark,
                    () => Provider.of<LoginProvider>(context, listen: false).pickPhoto(
                      imageSource: ImageSource.gallery,
                      context: context,
                    ),
                  ),
                  _buildPickerOption(
                    context,
                    Icons.camera_alt_rounded,
                    AppTexts.camera,
                    isDark,
                    () => Provider.of<LoginProvider>(context, listen: false).pickPhoto(
                      imageSource: ImageSource.camera,
                      context: context,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPickerOption(BuildContext context, IconData icon, String label, bool isDark, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
            decoration: BoxDecoration(
              color: isDark ? AppColors.textField : AppColors.labni2.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 30, color: AppColors.mainColor),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: GoogleFonts.lexendDeca(
              color: isDark ? AppColors.white : AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).switchValue;
    final loginProvider = Provider.of<LoginProvider>(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          // Beautiful Hero Image
          Image.asset(
            AppImages.loginImage,
            height: MediaQuery.of(context).size.height * 0.25,
          ).animate().fade(duration: 600.ms).slideY(begin: -0.1, end: 0),
          
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          
          // Profile Picture Avatar
          GestureDetector(
            onTap: () => _showImagePickerModal(context, isDark),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.35,
                  width: MediaQuery.of(context).size.width * 0.35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDark ? AppColors.textField : AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.mainColor.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                    border: Border.all(
                      color: AppColors.mainColor,
                      width: 3,
                    ),
                    image: loginProvider.image != null
                        ? DecorationImage(
                            image: FileImage(File(loginProvider.image!.path)),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: loginProvider.image == null
                      ? Center(
                          child: Icon(
                            Icons.person_outline_rounded,
                            size: 50,
                            color: AppColors.mainColor,
                          ),
                        )
                      : null,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: isDark ? AppColors.darkMode : AppColors.white, width: 3),
                  ),
                  child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 20),
                ).animate(onPlay: (controller) => controller.repeat(reverse: true)).scaleXY(begin: 1.0, end: 1.1, duration: 1.seconds),
              ],
            ),
          ).animate().fade(delay: 200.ms).scale(begin: const Offset(0.8, 0.8)),

          SizedBox(height: MediaQuery.of(context).size.height * 0.05),

          // Name Input Field
          CustomTextField(
            nameFromKey: nameFromKey,
            controller: name,
            title: AppTexts.yourName,
            subTitle: AppTexts.enterYourName,
            borderColor: AppColors.transparent,
          ).animate().fade(delay: 300.ms).slideX(begin: 0.1, end: 0),

          SizedBox(height: MediaQuery.of(context).size.height * 0.06),

          // Premium Get Started Button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04),
            child: GestureDetector(
              onTap: () async {
                if (nameFromKey.currentState!.validate()) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (loginProvider.image == null) {
                    _showImagePickerModal(context, isDark);
                  } else {
                    final user = UserModel(
                      userName: name.text.trim(),
                      photo: File(loginProvider.image!.path),
                    );
                    
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen(userModel: user)),
                    );
                    await Provider.of<LoginProvider>(context, listen: false).saveUser(userModel: user);
                  }
                }
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [AppColors.mainColor, AppColors.blue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.blue.withOpacity(0.4),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    AppTexts.getStarted,
                    style: GoogleFonts.lexendDeca(
                      textStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ).animate().fade(delay: 400.ms).slideY(begin: 0.2, end: 0),
          
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        ],
      ),
    );
  }
}
