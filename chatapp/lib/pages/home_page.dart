import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/components/my_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body:const MyDrawer(),
    );
  }
}