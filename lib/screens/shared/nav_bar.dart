import 'package:flutter/material.dart';
import 'package:quiz_wiz/screens/dashboard/quiz/quiz_dashboard_screen.dart';
import 'package:quiz_wiz/screens/dashboard/results/result_dashboard_screen.dart';

import '../../constants/app_constant.dart';
import '../../constants/color_constant.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorConstant.appSideBarColor,
        appBar: TabBar(
          tabs: [
            Tab(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.hourglass_full),
                Text(AppConstant.quiz,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            )),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bookmarks),
                  Text(AppConstant.results,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: ColorConstant.appBarColor,
          labelColor: ColorConstant.appBarColor,
          unselectedLabelColor: ColorConstant.appBarColor,
          mouseCursor: MaterialStateMouseCursor.clickable,
        ),
        body: TabBarView(
          children: [
            Center(
              child: QuizDashBorad(),
            ),
            Center(
              child: ResultDashboard(),
            )
          ],
        ),
      ),
    );
  }
}
