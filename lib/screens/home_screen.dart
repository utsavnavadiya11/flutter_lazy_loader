import 'package:flutter/material.dart';
import 'package:flutter_lazy_loader/controllers/api_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ApiController>(builder: (controller) {
        return controller.userData.isEmpty
            ? const Center(
                child: Text("No Data"),
              )
            : ListView.separated(
                itemBuilder: (context, index) => const SizedBox(),
                separatorBuilder: (context, index) => Container(
                  height: 2,
                  color: Colors.red,
                ),
                itemCount: controller.userData.length,
              );
      }),
    );
  }
}
