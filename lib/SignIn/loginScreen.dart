import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../buttonNavigationScreen.dart';
import '../widgets/fonts.dart';
import 'otpScreen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
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
              SizedBox(height: deviceHeight*0.1,),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo/images.png', // replace with your logo path
                      height: deviceHeight*0.2,
                    ),
                    const SizedBox(height: 10),
                    ToggleButtons(
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text("Phone"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text("Email"),
                        ),
                      ],
                      isSelected: [true, false], // initial selection state
                      borderColor: Colors.grey,
                      selectedBorderColor: Colors.red,
                      selectedColor: Colors.white,
                      fillColor: Colors.red,
                      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                      onPressed: (int index) {
                        // Handle button tap
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: deviceHeight*0.05,),
              Text(
                "Glad to see you!",
                style: TextFont.bold_TextStyle
                    .copyWith(fontSize: 18,),
              ),
              SizedBox(height: deviceHeight*0.02,),
              Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.red, width: 2.0),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      contentPadding: EdgeInsets.all(8.0),

                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    style: TextStyle(color: Colors.black),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter phone number';
                      } else if (value.length < 10) {
                        return 'Please enter 10-digit phone number';
                      }
                      return null;
                    },
                  ),

                ],
              ),
              SizedBox(height: deviceHeight*0.02,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.red,
                  elevation: 0,
                  minimumSize: Size(double.infinity, 40),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen()));
                },
                child: Text(
                  "SEND CODE",
                  style: TextFont.bold_TextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
