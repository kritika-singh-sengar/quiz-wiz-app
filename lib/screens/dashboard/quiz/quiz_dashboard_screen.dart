import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_wiz/bloc/quiz/quiz_bloc.dart';
import 'package:quiz_wiz/bloc/quiz/quiz_state.dart';
import 'package:quiz_wiz/constants/color_constant.dart';
import 'package:quiz_wiz/constants/routes_constant.dart';
import 'package:quiz_wiz/models/quiz_model.dart';

class QuizDashBorad extends StatelessWidget {
  const QuizDashBorad({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.appBarColor2,
      body: Container(
        margin: const EdgeInsets.all(20),
        child: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            if (state is QuizLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is QuizLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.all(20),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: state.quiz.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: ColorConstant.appFontColor,
                    leading: const Icon(Icons.hourglass_full),
                    title: Text(
                      state.quiz[index].quizTopic,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        "Total Questions: ${state.quiz[index].totalNumberOfQuestions}"),
                    subtitleTextStyle:
                        const TextStyle(color: ColorConstant.appBarColor),
                    trailing: ElevatedButton(
                      child: const Text('Start Quiz'),
                      onPressed: () => Navigator.of(context).pushNamed(AppUrls.quiz, arguments: state.quiz[index]),
                    ),
                  );
                },
              );
              // );
            } else {
              return Text('something went wront');
            }
          },
        ),
      ),
    );
  }
}
