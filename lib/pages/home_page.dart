import 'package:dinacomapp/Components/custom_button.dart';
import 'package:dinacomapp/controller/home_controller.dart';
import 'package:dinacomapp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
HomePage({super.key});
final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonHome(onPressed: () {
                Get.toNamed(AppRoutes.categoryPage);
              }, icon: Icons.directions_run, title: "Ayo bermain!"),
              ButtonHome(onPressed: () {}, icon: Icons.description_outlined, title: "Ringkasan"),
              ButtonHome(onPressed: () {}, icon: Icons.emoji_events_outlined, title: "Penghargaan"),
            ],
          ),
        ),
      ),
    );
  }
}