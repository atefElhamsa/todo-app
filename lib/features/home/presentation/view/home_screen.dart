import 'dart:io';
import 'package:flutter/material.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/features/home/presentation/view/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.photo, required this.name});

  final String name;
  final File photo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width * 0.1),
          ),
          child: Icon(
            Icons.add,
            color: AppColors.white,
            size: MediaQuery.of(context).size.width * 0.08,
          ),
        ),
        drawer: Drawer(
          child: Text("Atef Elhamsa"),
        ),
        body: HomeBody(
          name: name,
          photo: photo,
        ),
      ),
    );
  }
}
