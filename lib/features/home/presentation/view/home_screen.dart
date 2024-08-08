import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/features/add_note/presentation/view/add_note_screen.dart';
import 'package:todo/features/home/presentation/view/widgets/home_body.dart';
import 'package:todo/features/home/presentation/view/widgets/home_drawer.dart';
import 'package:todo/features/login/presentation/controller/theme_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.photo, required this.name});

  final String name;
  final File photo;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const AddNoteScreen();
              }),
            );
          },
          backgroundColor: Provider.of<ThemeProvider>(context).switchValue
              ? AppColors.materialButton
              : AppColors.mainColor,
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
        drawer: HomeDrawer(
          name: widget.name,
          photo: widget.photo,
        ),
        body: HomeBody(
          name: widget.name,
          photo: widget.photo,
        ),
      ),
    );
  }
}
