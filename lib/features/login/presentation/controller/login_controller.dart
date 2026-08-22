import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/utils/app_texts.dart';
import '../../data/model/user_model.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider() {
    setUser();
  }

  final ImagePicker picker = ImagePicker();

  XFile? image;
  UserModel? userModel;
  var box = Hive.box(AppTexts.userBox);

  pickPhoto({required ImageSource imageSource, required context}) async {
    image = await picker.pickImage(source: imageSource);
    if (image != null) {
      Navigator.pop(context);
    }
    WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
        notifyListeners();
      },
    );
  }

  saveUser({required UserModel userModel}) async {
    await box.put('userName', userModel.userName);
    await box.put('photoPath', userModel.photo.path);
    setUser();
    WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
        notifyListeners();
      },
    );
  }

  setUser() {
    final name = box.get('userName');
    final path = box.get('photoPath');
    if (name != null && path != null) {
      userModel = UserModel(userName: name, photo: File(path));
    }
    WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
        notifyListeners();
      },
    );
  }
}
