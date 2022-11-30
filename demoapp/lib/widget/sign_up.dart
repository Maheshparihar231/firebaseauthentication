// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:demoapp/page/otp_in.dart';
import 'package:demoapp/provider/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class GoogleSignUp extends StatelessWidget {
  const GoogleSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black87,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, left: 25),
                  child: Column(
                    children: [
                      Text(
                        'Hello',
                        style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      padding:
                          const EdgeInsets.only(top: 25, left: 24, right: 24),
                      child: ElevatedButton.icon(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                        label: Text(
                          'OTP',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        icon: Icon(Icons.phone_android),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      padding:
                          const EdgeInsets.only(top: 25, left: 24, right: 24),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          provider.googleLogin();
                        },
                        icon: FaIcon(FontAwesomeIcons.google),
                        label: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ); 
  }
}