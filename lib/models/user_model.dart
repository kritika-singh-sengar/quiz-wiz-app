import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class User extends Equatable{
  
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String education;

  const User({
    required this.firstName, 
    required this.lastName, 
    required this.email, 
    required this.password, 
    required this.education
  });

  @override
  List<Object?> get props => [
    firstName,
    lastName,
    email,
    password,
    education
  ];

  static User fromSnapshot(DocumentSnapshot snapshot) {
    User user = User(
      firstName: snapshot['firstName'],
      lastName: snapshot['lastName'],
      email: snapshot['email'],
      password: snapshot['password'],
      education: snapshot['education'],
    );
    return user;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['education'] = education;
    return data;
  }

  static const empty = User(firstName: "", lastName: "", email: "", password: "", education: "");

  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;
}

class LoginCredential extends Equatable {
  final String email;
  final String password;

  const LoginCredential({
    required this.email,
    required this.password
  });

  @override
  List<Object?> get props => [
    email,
    password
  ];

  static const empty = LoginCredential(email: '', password: '');

}