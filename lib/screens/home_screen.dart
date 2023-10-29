import 'package:flutter/material.dart';
import 'package:flutter_lazy_loader/controllers/api_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    Get.find<ApiController>().callUserDataApi();
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        Get.find<ApiController>().callUserDataApi();
      }
    });
  }

  late final ScrollController _scrollController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ApiController>(builder: (controller) {
        return controller.userData.isEmpty
            ? const Center(
                child: Text("No Data"),
              )
            : ListView.separated(
                shrinkWrap: true,
                controller: _scrollController,
                itemBuilder: (context, index) =>
                    index == (controller.userData.length)
                        ? controller.isLoading.value
                            ? const SizedBox()
                            : const Center(
                                child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: CircularProgressIndicator(),
                              ))
                        : ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                  controller.userData[index].picture.medium),
                            ),
                            title: Text(
                                "${controller.userData[index].name.first} ${controller.userData[index].name.first}"),
                            subtitle: Text(controller.userData[index].email),
                          ),
                separatorBuilder: (context, index) => Container(
                  height: 2,
                  color: Colors.red,
                ),
                itemCount: controller.userData.length + 1,
              );
      }),
    );
  }
}
