import 'package:flutter/material.dart';
import 'package:quiz_wiz/constants/color_constant.dart';
import 'package:quiz_wiz/repository/user/user_repository.dart';

import '../../constants/app_constant.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        backgroundColor: ColorConstant.appBarColor,
        titleTextStyle:
            const TextStyle(color: ColorConstant.appFontColor, fontSize: 20),
        title: const Text(AppConstant.appTitle),
        iconTheme: const IconThemeData(color: ColorConstant.appSideBarColor),
      ),
      endDrawer: Drawer(
        backgroundColor: ColorConstant.appSideBarColor,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(UserRepository.currentUser.firstName + UserRepository.currentUser.lastName), 
              accountEmail: Text(UserRepository.currentUser.email),
              currentAccountPicture: const CircleAvatar(
                child: ClipOval(
                  child: Image(image: AssetImage('assets/images/dashboard.png'))
                ),
              ),
              decoration: const BoxDecoration(
                color: ColorConstant.appBarColor2,
                // background image can be added
              ),
            ),
            ListTile(
              leading: const Icon(Icons.cast_for_education),
              title: Text(UserRepository.currentUser.education),
              onTap: ()=>null,
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: Text(UserRepository.currentUser.email),
              onTap: ()=>null,
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorite'),
              onTap: ()=>null,
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorite'),
              onTap: ()=>null,
            )
          ],
        ),
      ),
      body: Container(
        //margin: const EdgeInsets.only(right: 10),
        decoration: const BoxDecoration(
          color: ColorConstant.appSideBarColor,
          image: DecorationImage(
            image: AssetImage('assets/images/dashboard.png'),
            fit: BoxFit.cover,
          ),
          //border: Border.all(width: .5, color: Colors.grey.shade400),
          // borderRadius: const BorderRadius.only(
          //   bottomRight: Radius.circular(10),
          //   topRight: Radius.circular(10),
          // ),
          // boxShadow: [
          // BoxShadow(
          //     color: Colors.grey.shade300,
          //     offset: const Offset(2.0, 2.0),
          //     blurRadius: 2.0,
          //     spreadRadius: 1.0,
          //   ),
          // ],
        ),
      ),
    );
  }
}
