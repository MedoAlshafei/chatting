import 'package:chatting/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'views/chat_view.dart';
import 'views/registration_view.dart';
import 'views/signin_view.dart';
import 'views/welcome_home_views.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ChattingApp());
}

class ChattingApp extends StatelessWidget {
  const ChattingApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatting',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      // home: ChatView(),
      initialRoute: WelcomeHomeView.id,
      routes: {
        WelcomeHomeView.id: (context) => WelcomeHomeView(),
        SigninView.id: (context) => SigninView(),
        RegistrationView.id: (context) => RegistrationView(),
        ChatView.id: (context) => ChatView(),
      },
    );
  }
}
