import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String notificationMessage = "Waiting for Notification";
  @override
  void initState() {
    super.initState();
    // Terminated state
    FirebaseMessaging.instance.getInitialMessage().then((event) => {
      setState(() {
           notificationMessage = "${event!.notification!.title} ${event.notification!.body} I am coming form terminated state";
      })
    });

    // Foreground state
    FirebaseMessaging.onMessage.listen((event) {
      setState(() {
           notificationMessage = "${event.notification!.title} ${event.notification!.body} I am coming form foreground";
      });
    });

    // Background state
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      setState(() {
           notificationMessage = "${event.notification!.title} ${event.notification!.body} I am coming form background";
      });
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Notification"),
        centerTitle: true,
      ),
      body:  Center(
        child: Text(
          notificationMessage,
          textAlign: TextAlign.center
        ),
      ),
    );
  }
}