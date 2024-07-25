import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ModelClass/registrationModelClass.dart';
import '../Utils/urls.dart';



class SignUpService{
  bool isLoading=false;

  /// controller

  TextEditingController mail_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController referalCode_controller = TextEditingController();

  //TextEditingController passwordd_controller = TextEditingController();

  Future<void> Signups(BuildContext context,RegistraionModelClass SignUp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final String apiUrl =signUp;

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(SignUp.toJson()),
      );
      print('Add_to_cart ${response.statusCode}');
      print('addtocart xxssa------ ${response.body}');

      if (response.statusCode == 200) {


      }
      else if (response.statusCode == 202) {

      } else {
        print('Signup Failed');
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading = false;
    }
  }



}