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

import '../../controller/theme_controller.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController name = TextEditingController();
  var nameFromKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();

  XFile? image;

  pickPhoto(ImageSource imageSource) async {
    image = await picker.pickImage(source: imageSource);
    if (image != null) {
      Navigator.pop(context);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                AppImages.loginImage,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor:
                        Provider.of<ThemeProvider>(context, listen: false)
                                .switchValue
                            ? AppColors.darkMode
                            : AppColors.white,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.03,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  pickPhoto(ImageSource.gallery);
                                },
                                child: SizedBox(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.photo_size_select_actual,
                                        size:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        color: Provider.of<ThemeProvider>(
                                                    context,
                                                    listen: false)
                                                .switchValue
                                            ? AppColors.white
                                            : AppColors.mainColor,
                                      ),
                                      Text(
                                        AppTexts.gallery,
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          color: Provider.of<ThemeProvider>(
                                                      context,
                                                      listen: false)
                                                  .switchValue
                                              ? AppColors.white
                                              : AppColors.grey1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  pickPhoto(ImageSource.camera);
                                },
                                child: SizedBox(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.add_a_photo,
                                        size:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        color: Provider.of<ThemeProvider>(
                                                    context,
                                                    listen: false)
                                                .switchValue
                                            ? AppColors.white
                                            : AppColors.mainColor,
                                      ),
                                      Text(
                                        AppTexts.camera,
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          color: Provider.of<ThemeProvider>(
                                                      context,
                                                      listen: false)
                                                  .switchValue
                                              ? AppColors.white
                                              : AppColors.grey1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.03),
                    border: Border.all(
                      color: Provider.of<ThemeProvider>(context, listen: false)
                              .switchValue
                          ? AppColors.white.withOpacity(0.5)
                          : AppColors.labni2,
                    ),
                  ),
                  child: image == null
                      ? Icon(
                          Icons.add_a_photo,
                          color:
                              Provider.of<ThemeProvider>(context, listen: false)
                                      .switchValue
                                  ? AppColors.white
                                  : AppColors.mainColor,
                          size: MediaQuery.of(context).size.height * 0.05,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.03),
                          child: Image.file(
                            File(
                              image!.path,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  backgroundColor:
                      Provider.of<ThemeProvider>(context, listen: false)
                              .switchValue
                          ? AppColors.darkMode
                          : AppColors.white,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.03),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                pickPhoto(ImageSource.gallery);
                              },
                              child: SizedBox(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.photo_size_select_actual,
                                      size: MediaQuery.of(context).size.height *
                                          0.05,
                                      color: Provider.of<ThemeProvider>(context,
                                                  listen: false)
                                              .switchValue
                                          ? AppColors.white
                                          : AppColors.mainColor,
                                    ),
                                    Text(
                                      AppTexts.gallery,
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                        color: Provider.of<ThemeProvider>(
                                                    context,
                                                    listen: false)
                                                .switchValue
                                            ? AppColors.white
                                            : AppColors.grey1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                pickPhoto(ImageSource.camera);
                              },
                              child: SizedBox(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.add_a_photo,
                                      size: MediaQuery.of(context).size.height *
                                          0.05,
                                      color: Provider.of<ThemeProvider>(context,
                                                  listen: false)
                                              .switchValue
                                          ? AppColors.white
                                          : AppColors.mainColor,
                                    ),
                                    Text(
                                      AppTexts.camera,
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                        color: Provider.of<ThemeProvider>(
                                                    context,
                                                    listen: false)
                                                .switchValue
                                            ? AppColors.white
                                            : AppColors.grey1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Text(
              image == null ? AppTexts.addPhoto : AppTexts.updatePhoto,
              style: GoogleFonts.lexendDeca(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Provider.of<ThemeProvider>(context, listen: false)
                          .switchValue
                      ? AppColors.white
                      : AppColors.grey2,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          CustomTextField(
            nameFromKey: nameFromKey,
            controller: name,
            title: AppTexts.yourName,
            subTitle: AppTexts.enterYourName,
            borderColor:
                Provider.of<ThemeProvider>(context, listen: false).switchValue
                    ? AppColors.transparent
                    : AppColors.labni2,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
            child: MaterialButton(
              onPressed: () {
                if (nameFromKey.currentState!.validate()) {
                  FocusScope.of(context).requestFocus(
                    FocusNode(),
                  );
                  if (image == null) {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor:
                            Provider.of<ThemeProvider>(context, listen: false)
                                    .switchValue
                                ? AppColors.darkMode
                                : AppColors.white,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.03),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      pickPhoto(ImageSource.gallery);
                                    },
                                    child: SizedBox(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.photo_size_select_actual,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            color: Provider.of<ThemeProvider>(
                                                        context,
                                                        listen: false)
                                                    .switchValue
                                                ? AppColors.white
                                                : AppColors.mainColor,
                                          ),
                                          Text(
                                            AppTexts.gallery,
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                              color: Provider.of<ThemeProvider>(
                                                          context,
                                                          listen: false)
                                                      .switchValue
                                                  ? AppColors.white
                                                  : AppColors.grey1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      pickPhoto(ImageSource.camera);
                                    },
                                    child: SizedBox(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.add_a_photo,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            color: Provider.of<ThemeProvider>(
                                                        context,
                                                        listen: false)
                                                    .switchValue
                                                ? AppColors.white
                                                : AppColors.mainColor,
                                          ),
                                          Text(
                                            AppTexts.camera,
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                              color: Provider.of<ThemeProvider>(
                                                          context,
                                                          listen: false)
                                                      .switchValue
                                                  ? AppColors.white
                                                  : AppColors.grey1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return HomeScreen(
                          name: name.text.trim(),
                          photo: File(image!.path),
                        );
                      }),
                    );
                  }
                }
              },
              color: Provider.of<ThemeProvider>(context).switchValue
                  ? AppColors.materialButton
                  : AppColors.mainColor,
              height: MediaQuery.of(context).size.height * 0.06,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.03),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      AppTexts.getStarted,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayMedium!.merge(
                            TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
