import 'package:flutter/material.dart';

import '../buttonNavigationScreen.dart';
import '../widgets/fonts.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
           Image.asset("assets/logo/one-time-password.png",height: 100,),
              SizedBox(height: deviceHeight*0.05,),
               Text(
                'OTP Verification',
                style: TextFont.bold_TextStyle.copyWith(

                  fontSize: 18,
                ),
              ),
              SizedBox(height: deviceHeight*0.02,),
            Text(
                'We have sent a unique OTP number to your mobile +91-97**********',
                textAlign: TextAlign.center,
              style: TextFont.normal_TextStyle.copyWith(

                fontSize: 14,
              ),
              ),
              SizedBox(height: deviceHeight*0.025,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 50,
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 24),
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: const InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: deviceHeight*0.03,),
              const Text(
                '01:57',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: deviceHeight*0.01,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  elevation: 0,
                  minimumSize: Size(double.infinity, 40),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ButtonNavigation()));
                },
                child: Text(
                  "SUBMIT",
                  style: TextFont.bold_TextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ButtonNavigation()));
                },
                child:  Text(
                  'SEND AGAIN',
                  style: TextFont.bold_TextStyle.copyWith(
                   color: Colors.red,
                    fontSize: 15,
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


