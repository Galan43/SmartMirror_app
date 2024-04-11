import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smartmirror/pages/login_page.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAWI-Me4ykACp5PvpbChfdmNXfl6z8ZNOM',
      appId: '1:533779434166:web:af83dd060bf65f6a967417',
      messagingSenderId: '533779434166',
      projectId: 'smartmirror-4de0f',
      authDomain: 'smartmirror-4de0f.firebaseapp.com',
      storageBucket: 'smartmirror-4de0f.appspot.com',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Mirror',
      home: LoginPage(),
    );
  }
}
