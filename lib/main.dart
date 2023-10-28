import 'package:flutter/material.dart';
import 'package:flutter_lazy_loader/controllers/api_controller.dart';
import 'package:get/get.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(
      // Get.put(ApiController());
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
