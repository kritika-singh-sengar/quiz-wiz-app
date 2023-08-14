import 'package:flutter/material.dart';
import 'package:quiz_wiz/constants/color_constant.dart';
import 'package:quiz_wiz/constants/routes_constant.dart';
import 'package:quiz_wiz/models/user_model.dart';
import 'package:quiz_wiz/repository/user/user_repository.dart';
import 'package:quiz_wiz/services/startup.service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email = '';
  String _password = '';
  final _startUPService = StartUPService(userRepository: UserRepository());
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  Widget _buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Email",
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Email is required";
        }
        return null;
      },
      onSaved: (newValue) {
        _email = newValue!;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Password",
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Password is required";
        }
        return null;
      },
      onSaved: (newValue) {
        _password = newValue!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.all(100),
          decoration: BoxDecoration(
            color: ColorConstant.appBarColor2,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(4.0, 4.0),
                blurRadius: 4.0,
                spreadRadius: 1.0,
              )
            ],
          ),
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: Text('Login',
                    style: TextStyle(
                        color: ColorConstant.appSideBarColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  width: 400,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: ColorConstant.appFontColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Form(
                    key: _loginFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildEmail(),
                        _buildPassword(),
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      ColorConstant.appBarColor)),
                              onPressed: () {
                                if (!_loginFormKey.currentState!.validate()) {
                                  return;
                                }
                                _loginFormKey.currentState!.save();
                                LoginCredential credential = LoginCredential(email: _email, password: _password);
                                _startUPService.login(credential);
                              },
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    color: ColorConstant.appSideBarColor,
                                    fontSize: 16),
                              ),
                            ),
                            const SizedBox(width: 100),
                            const Text('Or'),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      ColorConstant.appBarColor)),
                              onPressed: () {
                                Navigator.of(context).pushNamed(AppUrls.signup);
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: ColorConstant.appSideBarColor,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
