import 'package:crud_local/ui/pages/add.dart';
import 'package:crud_local/ui/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Reto 4 Grupo 4 NSR 2290',
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
      home: const Home(),
      routes: {'/adicionar': (context) => const AddApunte()},
    );
  }
}
