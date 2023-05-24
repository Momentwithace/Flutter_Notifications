import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';


Future<void> backgroundHandler(RemoteMessage message) async {
  debugPrint("This message is from background");
  debugPrint(message.notification!.title);
  debugPrint(message.notification!.body);
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();

 FirebaseMessaging.onBackgroundMessage(backgroundHandler);
      runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

