import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(7)
  final String userName;
  @HiveField(8)
  final File photo;
  UserModel({required this.userName, required this.photo});
}
