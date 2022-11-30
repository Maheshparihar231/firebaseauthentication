// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../provider/google_sign_in.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("Logged In"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
              child: FaIcon(FontAwesomeIcons.circleXmark),
            ),
          )
        ],
      ),
      body: Center(child: FutureBuilder(builder: (context, snapshot) {
        var showdata = json.decode(snapshot.data.toString());
        return ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(showdata[index]['username']),
              subtitle: Text(showdata[index]['email']),
            );
          },
        );
      },
      future: DefaultAssetBundle.of(context).loadString('assets/users.json'),
      )
      ),
    );
  }
}
