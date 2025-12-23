import 'package:dinacomapp/Components/custom_button.dart';
import 'package:dinacomapp/Components/custom_teks.dart';
import 'package:flutter/material.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(myText: "Pilih level"),

              const SizedBox(height: 24,),

              GridView.count(
                shrinkWrap: true, 
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1,
                children: [
                  ButtonHome(
                    onPressed: () {},
                    level: 1,
                    title: "Level 1",
                  ),
                  ButtonHome(
                    onPressed: () {},
                    level: 2,
                    title: "Level 2",
                  ),
                  ButtonHome(
                    onPressed: () {},
                    level: 3,
                    title: "Level 3",
                  ),
                  ButtonHome(
                    onPressed: () {},
                    level: 4,
                    title: "Level 4",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}