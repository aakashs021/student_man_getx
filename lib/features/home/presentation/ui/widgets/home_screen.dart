import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:student_management/features/addpage/presentation/state/show_date_getx.dart';
import 'package:student_management/features/addpage/presentation/ui/widgets/add_screen1.dart';
import 'package:student_management/features/detail/presentation/ui/widgets/detail_screen.dart';
import 'package:student_management/features/home/presentation/state/homepage_getx.dart';

class HomeScreen extends StatelessWidget {
  final HomepageGetx controller = Get.find<HomepageGetx>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade900,
        onPressed: () {
          Get.find<ShowDateGetx>().dateTime = null;
          Get.to(() => const AddScreen1());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text('Student details'),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              controller: controller.searchcontroller,
              onChanged: (value) {
                controller.onSearch(value);
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(40),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.oncloseicon();
                  },
                  icon: const Icon(Icons.close),
                ),
                hintText: 'Search here',
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.filterlist.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lotties/empty.json',
                  width: double.infinity, height: 200),
              const Text('Nothing found'),
            ],
          );
        }
        return ListView.builder(
          itemCount: controller.filterlist.length,
          itemBuilder: (context, index) {
            final student = controller.filterlist[index];
            return InkWell(
              onTap: () {
                Get.to(() => DetailScreen(sd: student));
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.grey.shade200,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      radius: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: student.image != null
                            ? Image.file(
                                File(student.image!),
                                fit: BoxFit.cover,
                                width: 80,
                                height: 80,
                              )
                            : Image.asset(
                                'assets/images/no_image_found.png',
                                width: 80,
                                height: 80,
                              ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            student.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 30),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
