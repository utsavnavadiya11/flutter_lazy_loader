import 'package:flutter_lazy_loader/models/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController {
  final String baseUrl = "https://randomuser.me/api/?inc=name,email,picture";
  RxInt currentPageIndex = 0.obs;
  RxBool isLoading = true.obs;
  List<UserModel> _userData = <UserModel>[].obs;

  List<UserModel> get userData => _userData;

  Future<void> callUserDataApi() async {
    isLoading.value = true;
    currentPageIndex.value++;
    try {
      final http.Response response = await http.get(Uri.parse(baseUrl));
      final body = response.body;
    } catch (e) {
      Get.defaultDialog(
        title: e.toString(),
        onConfirm: () => Get.back(),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
