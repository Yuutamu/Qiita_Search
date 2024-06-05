// MEMO:開発中につき初期ページは、main.dart にしてある。

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // dotenv
import 'screens/search_screen.dart'; 

// dotenv の読み込み処理（非同期で処理する）
Future<void> main() async {
  await dotenv.load(fileName: '.env'); // .env 読み込み
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/search': (context) => SearchScreen(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/search');
          },
          child: Text('Go to Search Screen'),
        ),
      ),
    );
  }
}