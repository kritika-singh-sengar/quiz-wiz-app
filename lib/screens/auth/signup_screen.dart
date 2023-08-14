import 'package:flutter/material.dart';

import '../../constants/color_constant.dart';

class SignUp extends StatefulWidget {
  
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();

}

class _SignUpState extends State<SignUp> {

  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _password = '';
  String _education = "";
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Email",
      ),
      validator: (value) {
        if(value!.isEmpty) {
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
        if(value!.isEmpty) {
          return "Password is required";
        }
        return null;
      },
      onSaved: (newValue) {
        _password = newValue!;
      },
    );
  }

  Widget _buildFirstName(){
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "First Name",
      ),
      validator: (value) {
        if(value!.isEmpty) {
          return "First Name is required";
        }
        return null;
      },
      onSaved: (newValue) {
        _firstName = newValue!;
      },
    );
  }
  Widget _buildLastName(){
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Last Name",
      ),
      validator: (value) {
        if(value!.isEmpty) {
          return "Last Name is required";
        }
        return null;
      },
      onSaved: (newValue) {
        _lastName = newValue!;
      },
    );
  }
  Widget _buildEducation(){
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Education",
      ),
      validator: (value) {
        if(value!.isEmpty) {
          return "Education is required";
        }
        return null;
      },
      onSaved: (newValue) {
        _education = newValue!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.all(50),
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
                child: Text('Sign Up',
                    style: TextStyle(
                        color: ColorConstant.appSideBarColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  width: 600,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ColorConstant.appFontColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Form(
                    key: _formKey, 
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildFirstName(),
                        _buildLastName(),
                        _buildEmail(),
                        _buildPassword(),
                        _buildEducation(),
                        const SizedBox(height: 25),
                        ElevatedButton(
                          style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(ColorConstant.appBarColor)),
                          onPressed: () {
                            if(!_formKey.currentState!.validate()){
                                return ;
                              }
                              _formKey.currentState!.save();
                              print(_email);
                              print(_password);
                          },
                          child: const Text(
                            "Submit", style: TextStyle(color: ColorConstant.appSideBarColor, fontSize: 16),
                          ),
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