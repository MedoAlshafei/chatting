import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/my_button.dart';
import 'registration_view.dart';
import 'signin_view.dart';

class WelcomeHomeView extends StatefulWidget {
  const WelcomeHomeView({super.key});

  static const String id = 'welcome_home_views';

  @override
  State<WelcomeHomeView> createState() => _WelcomeHomeViewState();
}

class _WelcomeHomeViewState extends State<WelcomeHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 180,
                  child: const Icon(
                    Icons.message_rounded,
                    color: kPrimaryLightColor,
                    size: 120,
                  ),
                ),
                const Text(
                  'MessageMe',
                  style: TextStyle(
                    fontSize: 40,
                    color: kDarkBlue,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            MyButton(
              color: kDarkOrange,
              title: 'Sign in',
              onPressed: () {
                Navigator.pushNamed(context, SigninView.id);
              },
            ),
            MyButton(
              color: kDarkBlue,
              title: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationView.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
