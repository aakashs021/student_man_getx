
import 'package:flutter/material.dart';
import 'package:student_management/features/addpage/presentation/ui/widgets/date_pic.dart';
import 'package:student_management/features/addpage/presentation/ui/widgets/drop.dart';
import 'package:student_management/features/addpage/presentation/ui/widgets/image_pic.dart';
import 'package:student_management/features/addpage/presentation/ui/widgets/location_textfield.dart';
import 'package:student_management/features/addpage/presentation/ui/widgets/name_textfield.dart';
import 'package:student_management/features/addpage/presentation/ui/widgets/phone_textfield.dart';
import 'package:student_management/features/addpage/presentation/ui/widgets/radiio_but.dart';
import 'package:student_management/features/addpage/presentation/ui/widgets/submit_button.dart';
import 'package:student_management/features/detail/presentation/ui/widgets/popup_button.dart';

class AddScreen1 extends StatelessWidget {
  final int? id;
  final String? name;
  final String? location;
  final String? phonenumber;
  final String? standard;
  final String? gender;
  final String? image;
  final DateTime? dateTime;
  const AddScreen1({
    super.key,
    this.id,
    this.name = 'no',
    this.location = 'no',
    this.phonenumber = 'no',
    this.standard = 'no',
    this.gender = 'Male',
    this.image = 'no',
    this.dateTime,
  });
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF43C6AC),
              Color(0xFFF8FFAE),
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Form(
              key: formKey,
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  imagepickwidget(image),
                  const SizedBox(height: 20),
                  nametextfeild(name),
                  const SizedBox(height: 20),
                  locationtextfeild(location),
                  const SizedBox(height: 20),
                  phonetextfeild(phonenumber),
                  const SizedBox(height: 20),
                  drop(standard),
                  const SizedBox(height: 20),
                  showdate(context: context, date: dateTime),
                  const SizedBox(height: 20),
                  radio(context: context, gender: gender),
                  const SizedBox(height: 20),
                  submitbutton(formKey, name, id),
                ],
              ),
            ),
            popupbutton()
          ],
        ),
      )),
    );
  }
}
