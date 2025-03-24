import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text_Field.dart';
import 'chat_view.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  static const String id = 'registration_view';

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  late String email, password;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 180,
              child: const Icon(
                Icons.message_rounded,
                color: kPrimaryLightColor,
                size: 120,
              ),
            ),
            const SizedBox(height: 50),
            MyTextField(
              hintText: 'Enter your email',
              onChanged: (value) {
                email = value;
              },
              showText: false,
            ),
            const SizedBox(height: 16),
            MyTextField(
              hintText: 'Enter your password',
              onChanged: (value) {
                password = value;
              },
              showText: true,
            ),
            const SizedBox(height: 16),
            MyButton(
              color: kDarkBlue,
              title: 'Register',
              onPressed: () async {
                // print(email);
                // print(password);
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  Navigator.pushNamed(context, ChatView.id);
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
