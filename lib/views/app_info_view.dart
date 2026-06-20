import 'package:flutter/material.dart';

class AppInfoView extends StatelessWidget {
  const AppInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("App Info")),
      body: const Center(child: Text("App Information Page")),
    );
  }
}