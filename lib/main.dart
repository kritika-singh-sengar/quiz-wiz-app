import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_wiz/bloc/auth/auth_bloc.dart';
import 'package:quiz_wiz/bloc/auth/auth_state.dart';
import 'package:quiz_wiz/bloc/quiz/quiz_bloc.dart';
import 'package:quiz_wiz/bloc/quiz/quiz_event.dart';
import 'package:quiz_wiz/bloc/result/result_bloc.dart';
import 'package:quiz_wiz/bloc/result/result_event.dart';
import 'package:quiz_wiz/constants/color_constant.dart';
import 'package:quiz_wiz/constants/routes_constant.dart';
import 'package:quiz_wiz/enums/auth_status_enum.dart';
import 'package:quiz_wiz/repository/quiz/quiz_repository.dart';
import 'package:quiz_wiz/repository/result/result_repository.dart';
import 'package:quiz_wiz/repository/user/user_repository.dart';
import 'package:quiz_wiz/routes/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBiOJj-0Ayuxp2r69KcMBWpRqGWp2xJ1eE",
          appId: "1:417979019819:web:5ea2ebcd07803b4393306e",
          messagingSenderId: "G-PR3RGJ4HQJ",
          projectId: "quiz-wiz-app"));
  final userRepository = UserRepository();
  runApp(MyApp(userRepository: userRepository));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp({super.key, required this.userRepository});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              QuizBloc(quizRepository: QuizRepository())..add(LoadQuiz()),
        ),
        BlocProvider(
          create: (_) => ResultBloc(resultRepository: ResultRepository())
            ..add(LoadResult()),
        ),
        BlocProvider(
          create: (_) => AuthBloc(userRepository: UserRepository()),
        )
      ],
      child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return MaterialApp(
          title: 'QuizWiz',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: ColorConstant.appBarColor),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: state.authStatus == AuthStatus.authenticated
              ? AppUrls.mainDashboard
              : AppUrls.login,
          onGenerateRoute: AppRoute.generateRoute,
        );
      }),
    );
  }

  // RepositoryProvider.value(
  //   value: userRepository,
  //   child: BlocProvider(
  //     create: (_) => AuthBloc(userRepository: userRepository),
  //     child: MaterialApp(
  //       title: 'QuizWiz',
  //       theme: ThemeData(
  //         colorScheme: ColorScheme.fromSeed(seedColor: ColorConstant.appBarColor),
  //         useMaterial3: true,
  //       ),

  //       debugShowCheckedModeBanner: false,
  //       initialRoute: context.select((AuthBloc bloc) => bloc.state.authStatus == AuthStatus.authenticated ? AppUrls.mainDashboard : AppUrls.login),
  //       onGenerateRoute: AppRoute.generateRoute,
  //   ),
  //   ),
  // );
}
