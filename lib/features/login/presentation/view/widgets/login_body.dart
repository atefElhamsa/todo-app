import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/core/utils/app_images.dart';
import 'package:todo/core/utils/app_texts.dart';
import 'package:todo/features/home/presentation/view/home_screen.dart';

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
    setState(() {

    });
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
                                          color: AppColors.labni1,
                                        ),
                                        Text(
                                          AppTexts.gallery,
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                            color: AppColors.grey1,
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
                                          color: AppColors.labni1,
                                        ),
                                        Text(
                                          AppTexts.camera,
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                            color: AppColors.grey1,
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
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.03),
                    border: Border.all(color: AppColors.labni2),
                  ),
                  child: image == null
                      ? Icon(
                          Icons.add_a_photo,
                          color: AppColors.labni1,
                          size: MediaQuery.of(context).size.height * 0.05,
                        )
                      : ClipRRect(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.03),
                        child: Image.file(
                            File(image!.path),
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
                                      color: AppColors.labni1,
                                    ),
                                    Text(
                                      AppTexts.gallery,
                                      style: TextStyle(
                                        fontSize: MediaQuery.of(context)
                                            .size
                                            .height *
                                            0.02,
                                        color: AppColors.grey1,
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
                                      color: AppColors.labni1,
                                    ),
                                    Text(
                                      AppTexts.camera,
                                      style: TextStyle(
                                        fontSize: MediaQuery.of(context)
                                            .size
                                            .height *
                                            0.02,
                                        color: AppColors.grey1,
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
                  color: AppColors.grey2,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.03),
                border: Border.all(color: AppColors.labni2),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppTexts.yourName,
                      style: GoogleFonts.lexendDeca(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey2,
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                        ),
                      ),
                    ),
                    Form(
                      key: nameFromKey,
                      child: TextFormField(
                        controller: name,
                        validator: (value) {
                          if(value == null || value.isEmpty == true){
                            return "Please Enter Your Name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: AppTexts.enterYourName,
                          hintStyle: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02),
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
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
            child: MaterialButton(
              onPressed: () {
                if(nameFromKey.currentState!.validate()){
                  FocusScope.of(context).requestFocus(
                    FocusNode(),
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return const HomeScreen();
                      }),
                  );
                }
              },
              color: AppColors.labni1,
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
                      style: GoogleFonts.lexendDeca(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.025,
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
