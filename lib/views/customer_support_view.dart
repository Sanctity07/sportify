import 'package:flutter/material.dart';

class CustomerSupportView extends StatelessWidget {
  const CustomerSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Customer Support")),
      body: const Center(child: Text("Customer Support Page")),
    );
  }
}