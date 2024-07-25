import 'package:flutter/material.dart';

import '../ApiServices/registrationApiServices.dart';
import '../widgets/fonts.dart';
import 'loginScreen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _isVisible = false;
  bool _isVisible1 = false;
  final _formKey = GlobalKey<FormState>();
  SignUpService signUpService = SignUpService();
  final _formkey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: deviceHeight * 0.1,
              ),
              Center(
                child: Image.asset(
                  'assets/logo/images.png', // replace with your logo asset path
                  height: deviceHeight * 0.25,
                ),
              ),
              SizedBox(height: deviceHeight * 0.02),
              Center(
                child: Text(
                  "Let's Begin!",
                  style: TextFont.bold_TextStyle.copyWith(
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(height: deviceHeight * 0.02),
              Center(
                child: Text(
                  'Please enter your credentials to proceed',
                  style: TextFont.normal_TextStyle.copyWith(
                    fontSize: 13,
                  ),
                ),
              ),
              Form(
                key: _formkey2,
                child: Column(
                  children: [
                    SizedBox(height: deviceHeight * 0.02),
                    TextFormField(
                      controller: signUpService.mail_controller,
                      decoration: InputDecoration(
                        labelText: "Your Email",
                        labelStyle: TextFont.bold_TextStyle.copyWith(
                          fontSize: 12,
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red, width: 2.0),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        contentPadding: const EdgeInsets.all(8.0),
                        prefixIcon: const Icon(Icons.email,
                            color: Colors
                                .red), // Changed to an email icon for better context
                      ),
                      style: const TextStyle(
                          color: Colors
                              .black), // Changed to black for better contrast
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: deviceHeight * 0.02),
                    TextFormField(
                      controller: signUpService.password_controller,
                      obscureText: !_isVisible,
                      decoration: InputDecoration(
                        labelText: "Creat Password",
                        labelStyle: TextFont.bold_TextStyle.copyWith(
                          fontSize: 12,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        contentPadding: EdgeInsets.all(8.0),
                        prefixIcon: Icon(Icons.lock, color: Colors.red),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isVisible ? Icons.visibility_off : Icons.visibility,
                            color: Colors.red,
                          ),
                          onPressed: () => setState(() {
                            _isVisible = !_isVisible;
                          }),
                        ),
                      ),
                      style: TextStyle(color: Colors.red),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter  password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: deviceHeight * 0.02),
                    TextFormField(
                      controller: signUpService.referalCode_controller,
                      obscureText: !_isVisible1,
                      decoration: InputDecoration(
                        labelText: "Referral Code(Optinal)",
                        labelStyle: TextFont.bold_TextStyle.copyWith(
                          fontSize: 12,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        contentPadding: EdgeInsets.all(8.0),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: deviceHeight * 0.03),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        elevation: 0,
                        minimumSize: Size(double.infinity, 40),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInScreen()));
                        // if (_formkey2.currentState != null &&
                        //     _formkey2.currentState!.validate() &&
                        //     !signUpService.isLoading) {
                        //   setState(() {
                        //     signUpService.isLoading = true;
                        //   });
                        // }
                      },
                      child: Text(
                        "SUBMIT",
                        style: TextFont.bold_TextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
