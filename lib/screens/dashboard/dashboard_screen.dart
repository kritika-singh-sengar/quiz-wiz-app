import 'package:flutter/material.dart';
import 'package:quiz_wiz/constants/app_constant.dart';
import 'package:quiz_wiz/constants/color_constant.dart';
import 'package:quiz_wiz/screens/shared/nav_bar.dart';
import 'package:quiz_wiz/screens/shared/side_bar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        //first half
        Expanded(
          flex: 1,
          child: SideBar(),
        ),
        //second half
        Expanded(
          flex: 4,
          child: NavBar(),
        ),
      ],
    );
  }
}
