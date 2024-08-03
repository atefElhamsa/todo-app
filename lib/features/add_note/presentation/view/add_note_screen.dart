import 'dart:io';
import 'package:flutter/material.dart';
import 'package:todo/core/shared_widgets/custom_appbar.dart';
import 'package:todo/core/utils/app_texts.dart';
import 'package:todo/features/add_note/presentation/view/widgets/add_note_body.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key, required this.name, required this.image});

  final String name;
  final File image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.06),
          child: const CustomAppBar(title: AppTexts.addTask),
        ),
        body: AddNoteBody(name: name, image: image,),
      ),
    );
  }
}
