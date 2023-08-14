import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_wiz/bloc/result/result_bloc.dart';
import 'package:quiz_wiz/bloc/result/result_state.dart';
import 'package:quiz_wiz/constants/color_constant.dart';

class ResultDashboard extends StatefulWidget {
  const ResultDashboard({super.key});

  @override
  State<ResultDashboard> createState() => _ResultDashboardState();
}

class _ResultDashboardState extends State<ResultDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.appBarColor2,
      body: Container(
        margin: const EdgeInsets.all(20),
        child: BlocBuilder<ResultBloc, ResultState>(
          builder: (context, state) {
            if (state is ResultLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ResultLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.all(20),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: state.result.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: ColorConstant.appFontColor,
                    //leading: const Icon(Icons.hourglass_full),
                    title: Text(
                      state.result[index].quizTopic,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Result Status : ${state.result[index].status}",
                              style: const TextStyle(
                                  color: ColorConstant.appBarColor),
                            ),
                            Text(
                              "Total Questions: ${state.result[index].totalNumberOfQuestion}",
                              style: const TextStyle(
                                  color: ColorConstant.appBarColor),
                            ),
                            Text(
                              "Questions Attempted: ${state.result[index].totalQuestionAttempted}",
                              style: const TextStyle(
                                  color: ColorConstant.appBarColor),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Questions not Attempted: ${state.result[index].questionNotAttempted}",
                              style: const TextStyle(
                                  color: ColorConstant.appBarColor),
                            ),
                            Text(
                                "Correct Answer: ${state.result[index].correctAnswers}",
                                style: const TextStyle(
                                  color: ColorConstant.appBarColor),
                            ),
                            Text(
                              "Incorrect Answer: ${state.result[index].totalNumberOfQuestion - state.result[index].correctAnswers}",
                              style: const TextStyle(
                                  color: ColorConstant.appBarColor),
                            ),
                          ],
                        )
                      ],
                    ),
                    // trailing: ElevatedButton(
                    //   child: const Text('Watch Result'),
                    //   onPressed: () => null,
                    // ),
                  );
                },
              );
              // );
            } else {
              // return Navigator.of(context).pushNamed(AppUrls.error);
              return Text('something went wront');
            }
          },
        ),
      ),
    );
  }
}
