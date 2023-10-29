import 'dart:convert';

import 'package:flutter_lazy_loader/models/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController {
  RxInt currentPageIndex = 0.obs;
  RxBool isLoading = true.obs;
  final String baseUrl =
      "https://randomuser.me/api/?inc=name,email,picture&results=20";
  List<Result> _userData = <Result>[].obs;

  List<Result> get userData => _userData;

  Future<void> callUserDataApi() async {
    currentPageIndex.value++;
    try {
      isLoading.value = true;
      final http.Response response = await http.get(Uri.parse(baseUrl));
      UserModel temp = UserModel.fromJson(jsonDecode(response.body));
      _userData.addAll(temp.results);
    } catch (e) {
      Get.defaultDialog(
        title: e.toString(),
        onConfirm: () => Get.back(),
      );
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
