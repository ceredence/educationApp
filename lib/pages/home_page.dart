import 'package:dinacomapp/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class HomePage extends StatelessWidget {
HomePage({super.key});
final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearPercentIndicator(
          lineHeight: 40,
          
        ),
      
        ),
        
        );
  }
}