import 'package:flutter/material.dart';
import 'package:quiz_wiz/models/qna_model.dart';
import 'package:quiz_wiz/models/quiz_model.dart';

import '../../../constants/app_constant.dart';
import '../../../constants/color_constant.dart';

class QuizScreen extends StatelessWidget {
  final Quiz quiz;
  QuizScreen({super.key, required this.quiz});

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
      body: 
      // Column(children: [
        Container(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: ColorConstant.appFontColor,
                subtitle: Form(
                  key: _formkey,
                  child: RadioMenuButton(
                    value: null, 
                    groupValue: quiz.questions[index].runtimeType, 
                    onChanged: onChanged, 
                    child: Text(quiz.quizTopic),
                  ),
                ),
                subtitleTextStyle:
                        const TextStyle(color: ColorConstant.appBarColor),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: quiz.totalNumberOfQuestions,
          ),
        ),
    );
  }

  void onChanged(value) {}
}
