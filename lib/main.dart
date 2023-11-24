import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todooapp/pages/Homepage.dart';
import 'package:todooapp/services/todo_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Taskprovider>(
      create: (context) => Taskprovider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // useMaterial3: true,
            ),
        home: Homepage(),
      ),
    );
  }
}
