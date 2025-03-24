// import 'package:bmprogresshud/progresshud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text_Field.dart';
import 'chat_view.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  static const String id = 'signin_view';

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final _auth = FirebaseAuth.instance;
  late String email, password;
  // final GlobalKey<ProgressHudState> _hudKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        // child: ProgressHud(
        //   key: _hudKey,
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
              color: kDarkOrange,
              title: 'Sign in',
              onPressed: () async {
                // _showLoadingHud(context);

                try {
                  final user = await _auth.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  if (user != null) {
                    Navigator.pushNamed(context, ChatView.id);
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
      // ),
    );
  }

  // _showLoadingHud(BuildContext context) async {
  //   ProgressHud.of(context)?.show(ProgressHudType.loading, "loading...");
  //   await Future.delayed(const Duration(seconds: 1));
  //   _hudKey.currentState?.show(ProgressHudType.loading, "loading...");
  // }
}
