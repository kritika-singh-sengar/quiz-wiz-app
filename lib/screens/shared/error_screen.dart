import 'package:flutter/material.dart';
import 'package:quiz_wiz/constants/color_constant.dart';

class ErrorScreen extends StatelessWidget{
  const ErrorScreen({super.key, required this.errorMessage});
  
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
             const ClipRRect(
              child: Icon(Icons.no_encryption_gmailerrorred, color: ColorConstant.appBarColor,size: 30), 
            ),
            Text(errorMessage),
          ],
        )
      ),
    );
  }

}