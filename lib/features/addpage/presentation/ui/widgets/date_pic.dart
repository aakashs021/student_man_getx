import 'package:flutter/material.dart';
import 'package:student_management/features/addpage/presentation/state/show_date_getx.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

Widget showdate({required BuildContext context, required DateTime? date}) {
  return GetBuilder<ShowDateGetx>(
    builder: (controller) {
      controller.setdatetime(date);
      date = null;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              showDatePicker(
                      context: context,
                      initialDate: controller.dateTime ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now())
                  .then((val) {
                if (val != null) {
                  controller.onpicked(val);
                }
              });
            },
            child: Container(
              width: 220,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                controller.dateTime == null
                    ? 'Select your date of birth'
                    : '${controller.dateTime!.day}-${controller.dateTime!.month}-${controller.dateTime!.year}',
                style: TextStyle(
                  fontSize: 17,
                  color: controller.dateTime == null
                      ? Colors.grey.shade600
                      : Colors.black,
                ),
              ),
            ),
          ),
          !controller.ispicked
              ? Text(
                  '   Please enter your date of birth',
                  style: TextStyle(fontSize: 11.5, color: Colors.red.shade900),
                )
              : const SizedBox(),
        ],
      );
    },
  );
}